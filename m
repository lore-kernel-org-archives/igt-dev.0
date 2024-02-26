Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFB1C54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 11:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFD510F068;
	Mon, 26 Feb 2024 11:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWH+i58i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AAE10F068
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945723; x=1740481723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/hxOjGYadMtNnxhFGUKz92sms0C/bkFfGWHuE4FJkU=;
 b=SWH+i58i0M6F8ZqFoFXDM+iL99372wLYIilWdOLzwr5aPEomeGWmLIhr
 kwStoWbx/vnDbfZ7qm9eKgstSV57Caj4vpw7qhkfd2FYlOkpkwZWKxCBO
 z+vThB/qjiQG7lSrjiN6ce2tQpG0N//gNb0FVsrb8rXZXhPNNI4zc7dfl
 Dsu6DO14wowzRO9xe68joXjg11MLtvymJENjamLzxT48+1tc6dLKDwCHW
 nBQaJ5hYJG94eECD+sGP1glCBRf5dy5jHRs/x9MrIvyCxDIPIVzs/Vpgf
 IBzROp3LqCUHVAyu9w1+ngwiL7BnwqLahPLLtvRCymVWoC5+2UQXnTJmt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="7038617"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7038617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6977619"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 03:08:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 03:08:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 03:08:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 03:08:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 03:08:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4/UUcNfA1Zj7+nwG4pi97o+FbZ2ujGNUflnaaoH3fZX5A/AARrE59IU0hju9z6jh1bF2wnQnzGBtmVGyL/X/6AZvUMlolZJ2UzpwREZTrJIEuJUGqThbuUYCkQf3a0wU0JGmrZS40Xc2OwKzRVKx0rs+umSkLJYq+06nWrX5PJwIThqfFJ6o/3Z2xFnP3yUJPbnRNYlcMQZSK0LFKEXQKM0JEL5sq0sYW5yebKavgm/J4/ztX/AKBwqAgiG3tmTF3sACaPjWzGH/5N1vq4Tgna0HMbzNpAD4kK+dWY/hhmDiY2hgffAZnPB4nbl9dfp6/pslT35IhFvm5pdPdPIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTZiDyztg1IWO0ofGnrOeK2VECcWcMYfKPYPmvV5Ur4=;
 b=Fw4f77pPZqluQTnaPEqzXGDgHnutPYbo57wV+CMOb6L1Kpck0aX7+e0OTgGVikdhyrAtKg0Gsxt3Ea9eSM7Rxo4RMLDaWwZ78Lh81L0e5fDO3A3+AJy09uWeDMhwaN8YtObfv+XDyM6mXuk5LD2dsLiQ0xLQSbjakC9wypy4bvpy5KOoaInJHsKHpO1H1mLnD0xFkbu6o6TDlJqOdJ+OsS9ar4Yb8nVtZqRUb0ilRiRbZGlzNYELG43+u8qth4RwEo2I5Zf8kENFJoeBnj5VhGGToyQBD5V3nGU+V9tLIuud7vY/fFmYgUVRdGgawkeCsuSo4KXZIoyoVxSi7NxlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.25; Mon, 26 Feb 2024 11:08:33 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3%6]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 11:08:33 +0000
Message-ID: <48378e1d-5eff-4dbf-b4df-92048f168e30@intel.com>
Date: Mon, 26 Feb 2024 16:38:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_gt_freq: re-introduce exec tests of
 xe_gt_freq
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@intel.com>,
 <badal.nilawar@intel.com>
References: <20240222054532.454378-1-riana.tauro@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240222054532.454378-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::17) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CY8PR11MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb826d7-ebbd-4218-d1c5-08dc36bb459f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j99rzD8PN5p6w+5jeC21N2F8y/mrwa7N6xWlppcsti4n7DO354S7nfN4prJvn992g5glnWVEtGqe2L2+JkAkJXzsLAHETy3BOCsgguKYkaJM/jssqnwH/oY+rhF2wgB4CjGqSGx1ZX5pjjQdUN7vepX9dKGFkf74t5Sa6glzDyEunlxC/tWtbLwanZKewdVnwaeBREKGnXUMtadFgS2TnyR1+v+BCuSxqsAyGHl7w0EI4JiNP8Go8qOTHkv9H/DCea7/fUMvT0Rbc9FOQCuEqWxjW9h20ImibHCVw9dSCQJHIbRaXwgssDi+4Wa/Kkowae3xxUOtOAjqiWXb24woykWJZYwXme1iT5GJKuRkEaDTXdwJtn8AOeoJi4c8bsU4TIc8Gsr2+YxdmJE+Mh0CYxwhtVAv5n3LjGgDWnfkK5imi/dfa4DRmI8wJ56tarr3lJy55N9VYXuUsengQD+jNLCMoeX3MzQH/GLwWJPDx9dLf2/t61xPgcT6y97pB7JXxiqR7Oerf/1ezWQyh0Ajt3ej+qolP7njHiQAGfYsT5lUsW6by77KygpYfEykh4fFclGfnxOXCYLVuzfGpIodwIr9HPEkqQJyrWk15d5TkjDKx8mqa5ULgwl1/sm5G4LRDbYZWljKxCCajLicwq4+5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T24ra3MrN2Zob0FMblFJaExxbVU2TWc3Z3ZIWEFlQ2NwNXhkOS9KQWF4NGJo?=
 =?utf-8?B?SnI2dVkxQTN3MDdHVFFzNkRVR1lFQ3QzZk9ReEJvMWFhdk5HZGtaOWM0aWtR?=
 =?utf-8?B?SHBrS3NFemUzS3A0cmw4eU9iamk2NlpQNmxrOGtXWWpHNDEyRkJhQ3c3d05M?=
 =?utf-8?B?bTBKVzVwQ2NWTkZvNEJsZzBkNHlRNGlyOGlYZkgvR3Z0OTJ4bHVvbUlwL1FC?=
 =?utf-8?B?YUlQcDJrbGJGMVo0Z1NOTERrbk9YZDNNdFdRdlpnNk9JRTZ6cldVWVZLTWM1?=
 =?utf-8?B?ZktXa056MW5oNjlFTU8wR1ZXVE5kSVBIWTlLblYva01Dd3NYbUVxWXAwY1dK?=
 =?utf-8?B?Z1dJSHdWWmc3MU5nWnVNNDQvRVovNkVWdHhxNTBYMnU3elVBUHlCeTRCU2U1?=
 =?utf-8?B?bHFzTXZRekdyOWdRZHFzYnJZcHFwZ0MyYllkK1JxUXI2T2pNbEZYaGtkNnY5?=
 =?utf-8?B?RW0zTmVrcjlIQnU3M0pta2dFUUFGa2U0M0ZRNlNJOW1iNmx2WGNsNjhiUVJ3?=
 =?utf-8?B?K01sUnhxalpoZit2YjZJV3p2eTY2dkFlUVIxT0RPQmRxUFBOSWFJN2NMeEZK?=
 =?utf-8?B?R1drL3J5WVA3aWJGcXNHUzVrRFBtcUZWc1dqZDlFVFN0bU9SRWZINk1odG84?=
 =?utf-8?B?MVZrOWNQRTdtdDNVekpySzFqNjNXTndtVE84eE5yZlg3clFLWEpCejJqM0l1?=
 =?utf-8?B?KzVDa2I5RkVVSjE3YlVrZ2JDSHQ3Y1A5enhYb2Z6a1RoZDh3Wm1Ibm1xNlJD?=
 =?utf-8?B?MzV3aExVa09qUHlRc1grZFFYRDNtUlQ2TysrWnh6TmFZM1Avd0NXM1NzaFRR?=
 =?utf-8?B?aVVsU2dzUERDT0VxbGVaNmFRQXd4RzdVTTRjN01UZWNIbVVNbHdvME91Y0NC?=
 =?utf-8?B?eVNyNlFYdVlGazJneXBkc01WT05GOHgrZXVPVVBNZ2EwTmRCS0VBcXlKTm94?=
 =?utf-8?B?elJoWHpxa2RnUE5NRXJIZW92TTNmVFZObnBSb2d3cW5Dc09vKyszS0h0NnB3?=
 =?utf-8?B?M3YwV1VtaGlRb3I2cDEwbzBpTEl1MzgyMU40ZGtVc1pFOHlyOElTTHFPRWdu?=
 =?utf-8?B?NzJBQmJpM2dyYStLL1FIYXNPS1BkaWlmU2twTDdMUGZIbkQvTFJLRklWSS9p?=
 =?utf-8?B?R3NCM0RvZVE2blF0U3ZOZlVZdzJwbGtmVDFqNXVNKzJRWXJmZFFFUy90MG9Z?=
 =?utf-8?B?QmQzb2pTb0VPRlljTi9SWkI0ZkVqeWUwSWhZdHJ6UzJTNFhGMEtkYVQyVlpE?=
 =?utf-8?B?YTV0MnJyWFhZL3RHbUhRMGVadWJpNjZKOHJmd05ZSnUydk0veG9XZ1hEKzVC?=
 =?utf-8?B?RFBRUEJYZVd0UmdFcVRETnlwaFdxOWMxOXVxeGpxWFZGZ2JPMEFFcWkvOWhE?=
 =?utf-8?B?aUpTa21zNk9yb21pSEY5NHd5azFQcUVWaEVnT2NNVWp1ZFVuQnRNNjE3aDN6?=
 =?utf-8?B?RitGN2ZINnREZlA3VVNYdVkxajN2ZVQ2eDcxdEhIRk01MkpldW5HOVQvRXNG?=
 =?utf-8?B?TUdGMzJLcEFkYjF1MVdHbW5BK0NEbTF4OEF4Qkp6UWF2dEU2NHRaZVdMVWdR?=
 =?utf-8?B?RHdZOEZNRkJCN1dSbW5ad3FYc2lOOFdSQml3MmRNMnBtelRGOWE2a1dya0xp?=
 =?utf-8?B?eFpVK0RQOU9MZVY3OFd2ajJQU1AxeEpoSmluZWpvWWl5U2xkd2Q1K0hOd1FW?=
 =?utf-8?B?cWhuMWp5M0xiV1hhdlYwV0M2cHg3M0R0aE5DY0NZQm1jODRURE5PVVBvRnF0?=
 =?utf-8?B?QlJmdXpNeHhHVSt3YW5hSWlpMXV6a1plVmUrOElHc3k5WUJIY1hRMERESGlU?=
 =?utf-8?B?YjJIb2MyQmdXeDljcXVtUlZhcmZBZUZjYXNZR2hVdTJJemVXbmIvSFFKR29F?=
 =?utf-8?B?dk1mV2RueW44b0FKMkZIWUJXdmNiYm4xQm1VS3prQ2o2ZXJnb1BmbmFpVHg0?=
 =?utf-8?B?WmdwbFRlK2p4a2JpamUwREZnNjltUUlhUzBFYmJybDZQTEpBTlA3MWtxakdi?=
 =?utf-8?B?MVJ3S1QzdzU3bXJxYnhlbmkzVmFLR1BJeDdqTSs2M2lvdFNaaDJnMEJsY3Fr?=
 =?utf-8?B?ckdoYmkrRnR2Ykh4UUkveXdvUEYyUHhTVjZSVGFQQVJUUnp6WXYrZnBLRWEx?=
 =?utf-8?B?ZElYVUNoT01DMDFkK2RNL09jbWtDRkx5ZFh2UVhvUEY0UjRYV1JKM3VES2gy?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb826d7-ebbd-4218-d1c5-08dc36bb459f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 11:08:33.7983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DO2/0X12poVKMfV6+DTYBlS5/n1Y3w7VJU0ztbW9BWetcVwXDu5XenvnQp5vJHc9aYLb6svgADUip1Mgjk1fBGAJuYdiYBZxKOxq9lV+Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
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


On 2/22/2024 11:15 AM, Riana Tauro wrote:
> The tests freq_range_exec, freq_fixed_exec were removed due
> to a design flaw which caused failure in tests. The workload execution
> finished earlier before the frequency validation when gt was set to
> run at a higher frequency.
>
> These tests are being reintroduced with a spinner based approach
> in this patch to avoid such failures.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 106 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 105 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index bf63e4298..f0de341cb 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -17,6 +17,7 @@
>   
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_spin.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_util.h"
>   
> @@ -153,6 +154,9 @@ static void test_freq_basic_api(int fd, int gt_id)
>   /**
>    * SUBTEST: freq_fixed_idle
>    * Description: Test fixed frequency request with exec_queue in idle state
> + *
> + * SUBTEST: freq_fixed_exec
> + * Description: Test fixed frequency request when spinner is run
>    */
>   
>   static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
> @@ -217,8 +221,10 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   /**
>    * SUBTEST: freq_range_idle
>    * Description: Test range frequency request with exec_queue in idle state
> + *
> + * SUBTEST: freq_range_exec
> + * Description: Test range frequency request when spinner is run
>    */
> -
>   static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   {
>   	uint32_t rpn = get_freq(fd, gt_id, "rpn");
> @@ -319,10 +325,88 @@ static void test_reset(int fd, int gt_id, int cycles)
>   	}
>   }
>   
> +static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fixed)
> +{
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint64_t addr = 0x1a0000;
> +	struct xe_spin_opts spin_opts = {
> +		.addr = addr,
> +		.preempt = false
> +	};
> +	struct xe_spin *spin;
> +	uint32_t exec_queue;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	uint32_t bo;
> +	uint32_t vm;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*spin);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id), 0);
> +	spin = xe_bo_map(fd, bo, bo_size);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	syncobj = syncobj_create(fd, 0);
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +
> +	xe_spin_init(spin, &spin_opts);
> +
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].handle = syncobj;
> +
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr;
> +	xe_exec(fd, &exec);
> +
> +	xe_spin_wait_started(spin);
> +	usleep(50000);
> +	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
> +
> +	igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
> +
> +	if (fixed)
> +		test_freq_fixed(fd, eci->gt_id, false);
> +	else
> +		test_freq_range(fd, eci->gt_id, false);
> +
> +	xe_spin_end(spin);
> +
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobj);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +
> +	munmap(spin, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   igt_main
>   {
>   	int fd;
>   	int gt;
> +	struct drm_xe_engine_class_instance *hwe;
>   	uint32_t stash_min;
>   	uint32_t stash_max;
>   
> @@ -352,6 +436,16 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest("freq_fixed_exec") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->gt_id != gt)
> +					continue;
> +				test_spin(fd, hwe, true);
> +			}
> +		}
> +	}
> +
>   	igt_subtest("freq_range_idle") {
>   		xe_for_each_gt(fd, gt) {
>   			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
> @@ -360,6 +454,16 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest("freq_range_exec") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->gt_id != gt)
> +					continue;
> +				test_spin(fd, hwe, false);
> +			}
> +		}
> +	}
> +
>   	igt_subtest("freq_low_max") {
>   		xe_for_each_gt(fd, gt) {
>   			test_freq_low_max(fd, gt);

Functionally lgtm. This test had to be revised due to existing design 
flaws.

I'm not sure but there were some naming suggestions for the subtests 
during the initial discussions.

Do we have the tests passing in pre-merge ?

Thanks,

Suja

