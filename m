Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77DBC54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 08:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1E10F9AB;
	Thu, 14 Mar 2024 08:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4RCdM2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A3E10F9AB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710405835; x=1741941835;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o/hq2cYNO8R9n2e2w1OIQwMj/QeaOdBUUYeV0CgqCKQ=;
 b=K4RCdM2nZm5Hc0DvJr2D7irA8NwMnD3yFrnaf9ihRGcRyHOXrKwX62L0
 J+y86H1S+k5AEW1/Er6rEeTqNQ92HEYbgEgmowujaj6spcqwtRbbsN1JK
 iOQp2kTtqjuHzgIbs3vCkrIq+kHusSUkoBzTm1TFTCpyCMb3ENrg0OOXT
 kjotEQ6TeogxMcq9DLoNGSQn4pTWuopzfI21W7x6h5IAXLcJNdRwgA9Mq
 yZYxdcQ8Tq20JDlyBJZRLPiSGQVZhW1HGJp26IuyQpOkj0uMX+4io2vcA
 J6nrSqotJPb6+X9C45mAup7l3A7OZIrHge2aqReMCX8HKuQzMQA6rxpmk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5064904"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5064904"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 01:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16687752"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 01:43:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 01:43:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 01:43:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 01:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCiMOuzXWDcri19xd0yJIXmZzztEzVDgFkL/d++ZXtEAR8ICgwsb9XrTpgoiDdKTJTRoA2x5fmT1jfGZJSNFSfeNXcC4wz6tYMhYon/1LWWZVqVU89EIkee9ysNEPOKee5gp/EzqW/0RFFsjw2Us1/wD4X6XTpsNR0GFuFk9MWS87rpWaKLLr6ttibmU8yRmOIjy5sEV3Cq8LOE82967go0vbfTrfHlY1k/qKCVcZLGDOKT/jUZq7gWyWhroVRP8HFqwRLjgxZR6qXiC21KgL1NHDNUnPLXhLD3tI+C1Pqv1oOSmVqDi5FyTM+DwrxSP64J3wtCOGQ0Y0CLG/3Jjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UOoZIW0j0FQYpml4rS5PDSKO+qCNL4akCPMvjRvM6g=;
 b=S7LdYe17A/YP8T+/hTDJ9xnzlkK0DGFwrTOmkZe5k/4Z0u94fX4W1eviJCjM29Bsvgi2werfioBbFWhEJrKPv4tVyFhp9BBwU9GmhxuoElE1MuG1Ig774xT7e3FQFkNTA2Bnyf0DcsqG2PjhLaMId9bEvUslWwvhyxXhW6n51b321ou4qC5VJ/1eX4iFuUUWXj3yXQzD/EWs1S/CCXxwj0EV1RVfvnRNMCrtkQdHjqEivhu6hgL00hJBiGZ/93LzI85wlGOVvJ7k6wZSLtGz7jYJWbqSMOPUxcSyoSn3kkvDuOfNrhLoXjOCHT4h5SOEGAvos7i0Nz2a6f3QYB+4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 08:43:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 08:43:46 +0000
Message-ID: <1f851af4-6634-490b-9535-d8297c0f3624@intel.com>
Date: Thu, 14 Mar 2024 14:13:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_big_joiner: revamp bigjoiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240310142721.874315-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5aa158-7162-484c-561a-08dc4402dccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrJtvrYr9C7PkAlZJgWZH53AZT8uNlv/IOF0xAzM5T/rq1heyzaoTW4HlS4jzTKhEXqlv6hl9wqjIOLkrld6fdfuHmAmosz0Km+F4IqnNuGiDCOlk2j30AYdXAKbScvnvruoDc6EZtwDMcSMUfQzthFhUNqDeKZMiZmZzjA3z6NNmd+eNhB0/j9yAmm3rJHJ6sPeNTm6AMgZA1AwOfmiY8SDp4DyrG9QSzRoyBQHqP03OkOESq+J6FpbvUMeUfvMDYQl1FH+rN5A6eJ3ufGdt2hLZXTTNPIz/0VI+F3gALNYvenj8tsylM9DI0EpWc65fOTEOLKm3v8n/R1XYGWzG2rVKRZsPfwtZXvFWtsPAVyh5eLd1GbOijO4eapmW4obxxqc9VCcM6beE6uBLWZB8F3OkGFSvEnrvrbqDRGzjIC6RizxU7vdsZQCTi+AwHvRLxPjDRvVZ9GC3Jv/DnvNyFCnMj7blfOdJXKrZtUPs3CHEPDSJ+Gb4PMoZhIqJi9200ug9rH4n8iUdf4UreK0S6zxFWyzUHEb3ZtyQw6E2XGNnjfDqWVVzyvtgnUaze1TVxKA4w5BuIg3EAmWR5+jTq4JTaKk1Dp2F5aHEm3NmVa/UG/xGIaKalacr2xtIz9QqNZ0EXA2mf3+YY9H1lH24UMC+FgOnEUc10E55LkhNPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWFNOGhsTkFWT1FJaEhjV2xVTVBMZ2E5MHhxL3hPUTdocnR6OHpLanltUnJO?=
 =?utf-8?B?eFo2OHNHQzdMV2JxNTArc0xUNUV6UjNOQ2Rnd1MwSTBCYzJ1OVRQZzc4aUtL?=
 =?utf-8?B?TGN4U0gzUmdKcHhSOHVOckcyTU4zQkRmbWFiMm1LLzQ3RlNtc2I2bnQwVVhH?=
 =?utf-8?B?V1hxSkpveXZaUmNad3p4SVEzYXB6bkcwM21NS2d3LzZvd1FuODJ1bFN6cEZ5?=
 =?utf-8?B?WnBsUkVTSk0vWGd2SGVmQVdsajlzajVWVjVoVzE0UGIwTVVSNVVVdTk5V1hP?=
 =?utf-8?B?WTBlSVlXNTIwcnhkTFo5U010T2pwdC8wMkhiLzF6ejhXZ1Y0dWpBaWg3aG9x?=
 =?utf-8?B?emZhY282aFVhVXQwYkFmM0xNVzdPSGdRWmQwTWNaSmhMekY5blJDTTkycnFy?=
 =?utf-8?B?SUJ5RTI0K04vYkVRNStSVUpuV1c2Z1N3UUFNa3M3VTJ0UDFiUWlpbVdDUWtF?=
 =?utf-8?B?VWhmWGhpWXo4aHplQ2VMUmxEY1VhSGtvRk1pTzNpcnMvRzBtWVJ1UVpCUGNS?=
 =?utf-8?B?T0pIcWZ6SUxvbXlZWXQzT3dqTHdnMkZML3VPOG5kdlltOEYyVzF5VGFnZ0FN?=
 =?utf-8?B?ZzBPVDBUSDdtS04wWU5zK2JLYTFKL0RNRktOS3JyRzk3UHl4aDgrS1puZFJ2?=
 =?utf-8?B?WjRPT04yMjlibGNyREFHVXRWVTBwajFvRlhNTUI5eXFpYUN0UXJ6WWQ5NEtl?=
 =?utf-8?B?ZjRwUGRYU1FKUnRzM1liYnFwRHlmYmQySzdZQWpHak9vMXgzdjBKWUwrS2lq?=
 =?utf-8?B?MHdrR2ZzN1RBekoyeXBnVEorSG10WG9MSkQ1M0k5UkRuVFJCS0ZVRCtTblQr?=
 =?utf-8?B?US9nS1Y4L1FPUm9JVENOUlY1emU1MmxIYUQzZEdMNEJoaGZ1VE9BcXBqVmEy?=
 =?utf-8?B?WmpXSEtCMGM5ZGFJQ0Rjby9SRGQvYm1aellsWXdBZGMwVjdDd1crNW1mZUNR?=
 =?utf-8?B?azYrL0VmaEhHS05PYUZyQVh3WWRPNWZJN2FXZkxKU01nTzhreXBha1Q4US9K?=
 =?utf-8?B?dk14S2JwLzZabjdWUEhPYmc2MjhOeVNTYXltUXY3bFNhT1duS01adzdXaURa?=
 =?utf-8?B?NWtaR0FZOXc0MEdqVFc1anlndkFvRlIvaFl4R0xXNFBUTkY5N0RSN2hZSThF?=
 =?utf-8?B?RTlXTlhHQjZ3anVncm5Kbk4rWjh5R3ZtUFpFTnozUHBxUHVrMFVyYUMwTHM5?=
 =?utf-8?B?SXVOSTFvc0ROY2FjTXkyZ2FTaUt6WVRla3B4NXRIVm0xYXpRVU9QVzZPQVpX?=
 =?utf-8?B?eXdXL0xVVG1DOW9YSGFaYVc1OWo5S0lUOEc1R0RrelRhbmZRai92dElLc1JB?=
 =?utf-8?B?aUdyM056RVlKaUFUTGdvN3dJdmxXdEJEQ0wxWVZIVmV6ZnpqdmdrbHlWRzEy?=
 =?utf-8?B?a2pialUxVTBnZVN2clZGemtoN1dEdGdMR1BVbnV5V2VJVG50TzFQamVDeG1G?=
 =?utf-8?B?dkFkQ2lKK09qQlc0OVVSSzZadDN3MWF1ZnhOWFRkRWxSaEt2dU92KzV1THdz?=
 =?utf-8?B?U0IvN0xCNzJJTkVoOC9RNWRsazh3cFF5bStqQ0huR1JaUEs0VFBsQ252YmJj?=
 =?utf-8?B?enJxQUtQS3pQdkVVcDRFdk1UeUtYSFJpZkI0Nm9WdzFFWUpuMElNUVJpYmZP?=
 =?utf-8?B?N2h1SlM3cjZ3RGVwZHliWVBYYkNnY1JrbUF0V0NseXpXSWFqUDJPYjZkUm5k?=
 =?utf-8?B?UHV1bVdYd0R4OWlDemhWdGZWbGVYNWFGYTJzTmFBQzB6b002b3lSK2JYeG9B?=
 =?utf-8?B?VU1sQnJOZlIxRE5QL0hRRTRVTFhtaFE2UUpLSG9jTzV2YlpWSXU0RzkyWmhC?=
 =?utf-8?B?OWoyWXVDN2dVdHdMOHNGcUlHSEsvN3Bxc2ZxVGxVR05SUUZ6WEI1Y2RLajU4?=
 =?utf-8?B?UmJIL2N5VmZuTmE1c3FGTmJqc0VjTTZoZGovaHNwV3hrYStTZUlldisybEk1?=
 =?utf-8?B?T2dSNXBmZEdOZEtjYUM1NjZYQ0FWWnNFREU4N2Z6a0Vpc1ZXUzBOaVdKRXc1?=
 =?utf-8?B?QXRXM2M1RDZTVzNuRmc5OWtPajM5L3NUVVhkbDI3OEt3S0E1TTRGZUdBdUc1?=
 =?utf-8?B?VFp3S2RXZ0pEU09oaVp0Yjd0ME82VkgwVDNtRDd3K3ZlcUhFbklDUnQyQVJy?=
 =?utf-8?B?T3JFcmhybmYwT0dkU3dtQk5wMzJuOWQ5VDM1UnQ2dDhtVWZmQWdnQmVWbWlS?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5aa158-7162-484c-561a-08dc4402dccb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 08:43:46.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWj/ruyQ95ZIR4UJV+0qwtYkeVSQ2rM2wE54qbiYeGbXM19l8YMf4kisBQQs4BPu9OJr9aBvZkI5YGhl/ux93I855Z/b0MDz/ElSn78XBSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
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


On 3/10/2024 7:57 PM, Kunal Joshi wrote:
> modify test to support simultaneously testing multiple bigjoiner
> output and ignoring fused off pipes.

I think there are a lot of changes in the patch, changing the basic 
test, removing the 2x test, adding multiple bigjoiner tests in one go.

Imho, this should be broken into smaller patches.

>
> v2: Don't change license (Bhanu)
>      Print the pipe name (Bhanu)
>      Remove unwanted commit (Bhanu)
>      Move combine output logic to igt_fixture (Bhanu)
>      split revamp and force joiner (Bhanu)
>
> v3: Ignored fused pipes (Stan)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 398 +++++++++++++++++------------------
>   1 file changed, 195 insertions(+), 203 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 28678b958..d4b0d1100 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -37,184 +37,227 @@
>   #include "igt.h"
>   
>   /**
> - * SUBTEST: invalid-modeset
> + * SUBTEST: invalid-modeset-bigjoiner

I think this can be retained, this doesn't seem necessary.


>    * Description: Verify if the modeset on the adjoining pipe is rejected when
>    *              the pipe is active with a big joiner modeset
>    *
> - * SUBTEST: basic
> + * SUBTEST: basic-bigjoiner

Same as above, also it already has subtests with single joiner, multi 
joiner.


>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> - * SUBTEST: 2x-modeset
> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>    */
>   
>   IGT_TEST_DESCRIPTION("Test big joiner");
>   
> -struct bigjoiner_output {
> -	uint32_t output_id;
> -	drmModeModeInfo mode;
> -};
> +#define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
>   	int drm_fd;
> -	igt_display_t display;
> -	struct igt_fb fb;
> +	int big_joiner_output_count;
> +	int non_big_joiner_output_count;
> +	int combined_output_count;
> +	int output_count;
>   	int n_pipes;
> -	enum pipe pipe1;
> -	enum pipe pipe2;
> -	struct bigjoiner_output output[2];
> +	int master_pipes;
> +	uint64_t big_joiner_output[IGT_MAX_PIPES];
> +	uint64_t non_big_joiner_output[IGT_MAX_PIPES];
> +	uint64_t combined_output[IGT_MAX_PIPES];
> +	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	igt_display_t display;
>   } data_t;
>   
>   static int max_dotclock;
>   
> -static void test_invalid_modeset(data_t *data)
> +static void set_all_master_pipes_for_platform(data_t *data)
>   {
> -	igt_output_t *output;
> -	igt_display_t *display = &data->display;
> -	int ret;
> -
> -	igt_info("Bigjoiner test on ");
> -	for_each_connected_output(display, output){
> -		enum pipe p = output->pending_pipe;
> -		drmModeModeInfo *mode;
> -		igt_pipe_t *pipe;
> -		igt_plane_t *plane;
> +	enum pipe pipe;
>   
> -		if (p == PIPE_NONE)
> -			continue;
> -
> -		mode = igt_output_get_mode(output);
> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
> -		kmstest_dump_mode(mode);
> +	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES; pipe++)
> +		if (data->display.pipes[pipe].enabled) {
> +			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> +			data->master_pipes |= BIT(pipe);
> +		}
> +}
>   
> -		pipe = &display->pipes[p];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t id)
> +{
> +	igt_output_t *output;
>   
> -		igt_plane_set_fb(plane, &data->fb);
> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	for_each_connected_output(&data->display, output) {
> +		if (output->id == id)
> +			return output;
>   	}
> +	igt_assert_f(false, "Output not found\n");
> +	return NULL;
> +}
>   
> -	igt_assert(!igt_check_bigjoiner_support(display));
> -
> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -
> -	igt_display_reset(&data->display);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
> +{
> +	if ((data->master_pipes & available_pipe_mask) == 0)
> +		return PIPE_NONE;
>   
> -	igt_assert_lt(ret, 0);
> +	return ffs(data->master_pipes & available_pipe_mask) - 1;
>   }
>   
> -static void test_basic_modeset(data_t *data)
> +static void test_single_joiner(data_t *data, int output_count)
>   {
> +	int i, ret;
> +	enum pipe pipe, master_pipe;
> +	unsigned int available_pipe_mask = BIT(data->n_pipes) - 1;
> +	unsigned int attempt_mask;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	uint64_t *outputs;
> +	igt_fb_t fb;
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output = NULL;
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
>   
> -	igt_display_reset(display);
> +	outputs = data->big_joiner_output;
>   
> -	for_each_connected_output(display, output) {
> -		if (data->output[0].output_id == output->id) {
> -			bigjoiner_output = output;
> -			break;
> +	for (i = 0; i < output_count; i++) {
> +		output = get_output_by_id_or_assert(data, outputs[i]);
> +		for (pipe = 0; pipe < data->n_pipes-1; pipe++) {
> +			igt_display_reset(&data->display);
> +			attempt_mask = BIT(pipe);
> +
> +			master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);

In case a pipe is fused off we are ignoring it for master pipe, but 
since we cannot have it as slave also, we need to ignore pipe-1 also as 
master.

I think similar thing is mentioned by Bhanu too in last version.

So we need to change set_all_master_pipes_for_platform accordingly.


> +			igt_output_set_pipe(output, pipe);
> +			mode = igt_output_get_mode(output);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_assert_f(ret == 0, "Commit should have passed\n");

Do we need try commit here? We can directly use igt_display_commit_atomic.

Same in other places.


>   		}
>   	}
> +}
>   
> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
> +static void test_multi_joiner(data_t *data, int output_count)
> +{
> +	int i, ret;
> +	unsigned int available_pipe_mask;
> +	enum pipe pipe, master_pipe;
> +	uint64_t *outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[output_count];
> +	igt_fb_t fb[output_count];
> +	drmModeModeInfo *mode;
>   
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output, mode);
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = data->big_joiner_output;
>   
> -	pipe = &display->pipes[data->pipe1];
> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_display_reset(&data->display);
> +	for (i = 0; i < output_count; i++) {
> +		output = get_output_by_id_or_assert(data, outputs[i]);
> +		for (pipe = 0; pipe < data->n_pipes; pipe++) {
> +			unsigned int attempt_mask = BIT(pipe);
>   
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +			master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_info("Using pipe %s as master %s slave for %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);
> +			igt_output_set_pipe(output, pipe);
> +			mode = igt_output_get_mode(output);
> +			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb[i]);
> +			igt_plane_set_fb(primary[i], &fb[i]);
>   
> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
> -	igt_plane_set_fb(plane, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +			available_pipe_mask &= ~BIT(master_pipe);
> +			available_pipe_mask &= ~BIT(master_pipe + 1);
> +			break;
> +		}
> +	}
> +	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_assert_f(ret == 0, "Commit should have passed\n");
>   }
>   
> -static void test_dual_display(data_t *data)
> +static void test_invalid_modeset_two_joiner(data_t *data,
> +					    bool combined)
>   {
> +	int i, j, ret;
> +	uint64_t *outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output[2];
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane1, *plane2;
> -	int count = 0;
> -
> -	igt_display_reset(display);
> -
> -	for_each_connected_output(display, output) {
> -		if (data->output[count].output_id == output->id) {
> -			bigjoiner_output[count] = output;
> -			count++;
> -		}
>   
> -		if (count > 1)
> -			break;
> +	outputs = combined ? data->combined_output : data->big_joiner_output;
> +
> +	for (i = 0; i < data->n_pipes-1; i++) {
> +		igt_display_reset(&data->display);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			output = get_output_by_id_or_assert(data, outputs[j]);
> +			igt_assert(output);
> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> +			mode = igt_output_get_mode(output);
> +			igt_info(" Assigning pipe %s to %s with mode %dx%d@%d%s",
> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh,
> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
> +			igt_plane_set_fb(primary[j], &fb[j]);
> +		}
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>   	}
> +}
>   
> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
> -
> -	/* Set up first big joiner output on Pipe A*/
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output[0], mode);
> -
> -	pipe = &display->pipes[data->pipe1];
> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -	igt_plane_set_fb(plane1, &data->fb);
> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
> -
> -	/* Set up second big joiner output on Pipe C*/
> -	mode = &data->output[1].mode;
> -	igt_output_override_mode(bigjoiner_output[1], mode);
> -
> -	pipe = &display->pipes[data->pipe2];
> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -	igt_plane_set_fb(plane2, &data->fb);
> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
> +static void tets_big_joiner_on_last_pipe(data_t *data)

Typo: test


> +{
> +	int i, len, ret;
> +	uint64_t *outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +	drmModeModeInfo *mode;
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	len = data->big_joiner_output_count;
> +	outputs = data->big_joiner_output;
>   
> -	/* Clean up */
> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
> -	igt_plane_set_fb(plane1, NULL);
> -	igt_plane_set_fb(plane2, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	for (i = 0; i < len; i++) {
> +		igt_display_reset(&data->display);
> +		output = get_output_by_id_or_assert(data, outputs[i]);
> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +		mode = igt_output_get_mode(output);
> +		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh);
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +							  DRM_FORMAT_MOD_LINEAR, &fb);
> +		igt_plane_set_fb(primary, &fb);
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
>   }
>   
> +
>   igt_main
>   {
> -	data_t data;
> +	int i, j;
>   	igt_output_t *output;
> -	drmModeModeInfo mode;
> -	int valid_output = 0, i, count = 0, j = 0;
> -	uint16_t width = 0, height = 0;
> -	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	data_t data;
>   
>   	igt_fixture {
> +		data.big_joiner_output_count = 0;
> +		data.non_big_joiner_output_count = 0;
> +		data.combined_output_count = 0;
> +		data.output_count = 0;
> +		j = 0;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
> -
>   		igt_display_require(&data.display, data.drm_fd);
> +		set_all_master_pipes_for_platform(&data);
>   		igt_require(data.display.is_atomic);
> -
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		for_each_connected_output(&data.display, output) {
> @@ -228,105 +271,54 @@ igt_main
>   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
>   
>   			if (found) {
> -				data.output[count].output_id = output->id;
> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
> -				count++;
> -
> -				width = max(width, mode.hdisplay);
> -				height = max(height, mode.vdisplay);
> +				data.big_joiner_output[data.big_joiner_output_count++] = output->config.connector->connector_id;
> +				igt_output_override_mode(output, &connector->modes[0]);
> +			} else {
> +				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
>   			}
> -			valid_output++;
> +			data.output_count++;
> +		}
> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> +			data.combined_output[data.combined_output_count++] = data.big_joiner_output[0];
> +			data.combined_output[data.combined_output_count++] = data.non_big_joiner_output[0];
>   		}
> -
>   		data.n_pipes = 0;
>   		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> -			pipe_seq[j] = i;
> +			data.pipe_seq[j] = i;
>   			j++;
>   		}
> -
> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> -
> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic") {
> -		for (i = 0; i < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> -				test_basic_modeset(&data);
> -		}
> -	}
> +	igt_subtest_with_dynamic("basic-bigjoiner") {
> +			igt_require_f(data.big_joiner_output_count > 0,
> +				      "No bigjoiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_single_joiner(&data, data.big_joiner_output_count);
> +			if (data.big_joiner_output_count > 1)
> +				igt_dynamic_f("multi-joiner")
> +					test_multi_joiner(&data, data.big_joiner_output_count);
>   
> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> -		     "when the pipe is active with a big joiner modeset");
> -	igt_subtest_with_dynamic("invalid-modeset") {
> -		data.pipe1 = pipe_seq[j - 1];
> -
> -		igt_display_reset(&data.display);
> -		for_each_connected_output(&data.display, output) {
> -			if (data.output[0].output_id != output->id)
> -				continue;
> -
> -			mode = data.output[0].mode;
> -			igt_output_set_pipe(output, data.pipe1);
> -			igt_output_override_mode(output, &mode);
> -
> -			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(data.pipe1),
> -				      igt_output_name(output))
> -				test_invalid_modeset(&data);
> -		}
> -
> -		if(valid_output > 1) {
> -			for (i = 0; i < data.n_pipes - 1; i++) {
> -				igt_output_t *first_output = NULL, *second_output = NULL;
> -
> -				data.pipe1 = pipe_seq[i];
> -				data.pipe2 = pipe_seq[i + 1];
> -
> -				igt_display_reset(&data.display);
> -				for_each_connected_output(&data.display, output) {
> -					if (data.output[0].output_id == output->id) {
> -						first_output = output;
> -						mode = data.output[0].mode;
> -
> -						igt_output_set_pipe(output, data.pipe1);
> -						igt_output_override_mode(output, &mode);
> -					} else if (second_output == NULL) {
> -						second_output = output;
> -						igt_output_set_pipe(output, data.pipe2);
> -
> -						break;
> -					}
> -				}
> -
> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
> -					      kmstest_pipe_name(data.pipe1),
> -					      igt_output_name(first_output),
> -					      kmstest_pipe_name(data.pipe2),
> -					      igt_output_name(second_output))
> -					test_invalid_modeset(&data);
> -			}
> -		}
>   	}
>   
> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> -	igt_subtest_with_dynamic("2x-modeset") {
> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			data.pipe2 = pipe_seq[i + 2];
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
> -				test_dual_display(&data);
> -		}
> +	igt_subtest_with_dynamic("invalid-modeset-bigjoiner") {
> +		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");

I think we just need to check if there are 2 outputs or not.


Regards,

Ankit

> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		if (data.big_joiner_output_count >= 1)
> +			igt_dynamic_f("big_joiner_on_last_pipe")
> +				tets_big_joiner_on_last_pipe(&data);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("invalid_combinations")
> +				test_invalid_modeset_two_joiner(&data, false);
> +		if (data.combined_output_count)
> +			igt_dynamic_f("combined_output")
> +				test_invalid_modeset_two_joiner(&data, true);
>   	}
>   
>   	igt_fixture {
> -		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
