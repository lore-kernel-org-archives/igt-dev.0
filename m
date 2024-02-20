Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97343C48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA9510E510;
	Tue, 20 Feb 2024 18:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZUo1o3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143B910E513
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708452633; x=1739988633;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CFGgxPeJ7rGgIbHfWP/wLxhpLmFy7IFdoowWHV254hA=;
 b=HZUo1o3Z/yoaJeMG3z/OSvw/gYe3kyb3lc0WrgMVjCjW761r6NnFqhhY
 YoL5Sf/rYoo62BT2JdIi3yNWaH4M20MUyreGnemPStLzmynysGiKgzrl3
 tFr+qovAbG6CouvzrS5s2Zao5sDSqo+R8eCCiC6OLB1BAH17Twg21HCNX
 KArAIEmoLTQr9BdpGFpTFcFrgyyOkPizkUlVrprQFabm9xqIIT4cKkoBD
 nGqDVzUEgDIGryVSU/ohk9q7IQUm/29ub09plejRlfsupu19NB/IyvOxI
 Niv8fkmWAth9+hjZ+dEjK7mGPKakxCtDtjfm3WbyZXgXBs6JuUT3Gjskg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13694443"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13694443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4817211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 10:10:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 10:10:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 10:10:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 10:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV6/PKaQpj+KrE/VOg5O2ikh3AhUZEpsILJp/hiiF43RdaIAapA+8HAPqZ+OlNwshY1itkZsruVX4fi8x+FJgZI7tUgpJPnoMP2p7zSVEb2M+m+lC46weE4Mi2lYoNNLkje5eOwU0r5sR096qXiT2s3iDI7PzSz2uGwoXhEXnsJ367Jn3BBNcpg83eKamNPvGy0rTyrmphJO5fQL/zj/RU/YJ0Hv7jjI6jf5SndSg7ficGHY7BfaiGjAEoLvuueOkA85Drv9d1hb5VkX3Z8GjVJRD1ZN2OO0F5tWdB4P6xJ21TJWtKoS+dLXfSFuTY7CcyhWOarSCqBMP89zkDsPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkYjirunfNCfThCGdlxrhptO0EqzkWW8TsZPTBMoxe0=;
 b=PIgv6WlKp3LSrnv2cfnE8Cbqg1XErBx06Aumqfu+gpbTuE0m0046+3gsqCMx4yPOWB1B3YSQ8Rfgb3SsUU0xQet65UY4xnwElvGJgi8cDtRfXINY6s5R24Gcj7OxwoSMfZIa0SAGlJAyjEourbrVE8B7WnJuLGXxsuXAweNySMuJC2Oa0/bQt3RXsqt7BFBcvWNbUkTFFj3FFUsDb9gnUy7m65/xwXMSf7wS76H3+d19maMmPKl8alfHKt0tmemuKJk6VnKQlaN8ZXiPoWtmsaBmQPs/XTdTFrJzi58w9/1oVXs0k72E+8d4tCQd0noSovUbaxfq9MzfwAs0Ro3g8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.39; Tue, 20 Feb 2024 18:10:30 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::d14c:c9b8:75b8:6add]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::d14c:c9b8:75b8:6add%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 18:10:29 +0000
Message-ID: <cf373084-45f3-4c85-aed0-9fa97d84a3e3@intel.com>
Date: Tue, 20 Feb 2024 23:40:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Invalidate
 cached stuff
To: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240209135526.135380-2-gustavo.sousa@intel.com>
 <170845211015.44184.10125779397878338003@gjsousa-mobl2>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <170845211015.44184.10125779397878338003@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::18) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad33f4b-423c-463f-db58-08dc323f383b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JspDA5QIiQD6MeVRrLoqB7ONDHNHHNq5M/EsdrWr2xWPD6u9gHZVbB8z/Qd92FpWq28hXBIfDoI73vdV9Ey6McjZuS627JWC7ezz0ORkOyOkFpVxwb0STnYdMqGsydTxdu8fNxbpBv9qeL5utUCx3fnB6EB9lPaEn+aUiueTPMiy9x9BL02ric2Q3lZnDxxBMNegHGNBc3WuA+XvI3j71/PGAttu8+jdA450ppCNCv17HcOVGgidsvtRz/UxR9OAz3dKqCXzXSwUuNRJWqEcrqenZpurtLwz7/xEPr1DzD7XAsmWIQ3Q+KJN/TSYyAF8ou4561YhZ/v/KvUa/mK9xIStR9swaWooGCYpNT8FjTIFaaVSGSO8m8oZkqcjmihlakxQYQWerM2eSHVuu5L12nLAuL2D3ixeLjtZghygr/mB+HlNU2X1UV247W6cUcg+IvZDbFBpy2OZ+Ti+wm+k6p+YqORjJx/jmFvWSmNYIp3A2Mxpk4hyz3wmB80MtH82Rxmbw8wNtx04rwIPheo6NNrnV6S6AOy9GyHMzzMR/Io=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy9qaFJqKzJKSzRuUzlBQTg4dTFQd2dGTHhReXJFRk5zYUJrMkpuSy84aytE?=
 =?utf-8?B?RVJsa0ZMNytkQXp2Vzl1Z3U0cWtJeGRpd3V3dVczT2JyZG9MTkxqbmd6TkZp?=
 =?utf-8?B?Zm5zTVpYWE9UY0hmSHgyc3IxV0VCeHJETzZxbTBKYzZYSmNlcnF3eUcvbjBj?=
 =?utf-8?B?YmNUQlJocmN5d2pwZjlNSXJkQWpCUWR6UklkMTRVR3dCMFNJU0RYOGNWaS8r?=
 =?utf-8?B?RFhoczcxYnI3NU4vWXNudVBUVC9Ha3llQkx5YzJEYy9JSDZZSE5yeEZlT3lO?=
 =?utf-8?B?YkQvbTNkczVSeHUvQURiN1NZN1lXeFVhN09HRW5FTnoxR0EvRFJzeGJpREdM?=
 =?utf-8?B?T05QMUNBQ0pSRkNJSzN4OUYyYklCZEpVNTgzK2ZlUytWUlgxTEl5d2p2cGF6?=
 =?utf-8?B?SUROcGtyMEFvWjdKUXdhaTBTOEowUitGYXJvckc3M2RYWkY4clpqQUNjUndu?=
 =?utf-8?B?ZTN1Q0VmZjl1RjdQVlQ5Zk5mZUQ2cnNiSTFPRnpTSVBiRFQvbFJHRUlaZ1RQ?=
 =?utf-8?B?Uks0VWJkejFtMVRaK2hra3hWcm5JRUVFL0RhQUN0SEhJY0RsUXZUSkNPK2Fy?=
 =?utf-8?B?MHBEREd5ZzlWM2JTYWpMV2VPa3ZpZUoyZkRVMThNM3hub0hNaTZzdVZBb3ZZ?=
 =?utf-8?B?NmMwV3hKeVpFWXZvOUI5Sk12UjZOdHpzY3REUmhQVHpLWVhCMHpDWE8ySzlZ?=
 =?utf-8?B?WEYwYU9HL0tOb3FscFVJUGxtUVkwaUE3RGpZSnlwNWVkNHF4TFhMeEpWbFNx?=
 =?utf-8?B?RTBHaUc5UmZOaUtoT3Z4VHZBeG5yT01FbnRRcWI0TnNCTmVpbkFOMjFRRE9W?=
 =?utf-8?B?M1ZUYnppSXdFZkdmQnRka2kxYWpBR0dKQVh1cEVsVmE2emhGMjJSOEZhejRl?=
 =?utf-8?B?N2pkREs4bzZ3UDMrNzJteUlRLzNGWTM4SldpZmJibGY3NDFyU0ZTRGVHbE5l?=
 =?utf-8?B?dW1Md2NEazZOblJWOVdtZkM0MmUrYmNNS0hYbWliNFY5SE5qK3UxZ25DYlFT?=
 =?utf-8?B?K0xmNFRyclI1dEl5c2tmdWRtSTI3ekJHaTlGOVhKMHpNblhKU3ZTWGVzYjBD?=
 =?utf-8?B?U0t3NzdPOEQwaUFlT2pwemRGZzhOWFg2UGp0VVl6ZjhjM1FpbzFqZE14NExT?=
 =?utf-8?B?dW5kRnduQTZhUzdkOXV0WVJ3cjVKVFhLVERrcG1zYWJkVkcyc3c5eW1PWlJT?=
 =?utf-8?B?ZDYrSjFuSVZrT0dqL2Q4ZzZXLzlzMGR3aFpuZzdKRTN1SUsyaTgwMHNSMUJp?=
 =?utf-8?B?TlNjUmFxaEg3MGQzaS9kWU8rVFRRSTBSc0NOSlNOWm1ReEsraXdhWWlxUlBN?=
 =?utf-8?B?SHF6UVJKSmJjSXVOL0xjWTNsa1lnM3hIVTROQTNJZHVUcWZLdGxLMjFCUlJy?=
 =?utf-8?B?U1hZQXc4L0REMjhBNEdCcmRxbzBjaDBaNkpBZUpYVWQwM0M0eHdTVGxEY1lk?=
 =?utf-8?B?QThMalZuZ1hRZXFaVTN6QzEyMmRzcmdoNFFlTjlBbStvLzE0bUVmNnVycy82?=
 =?utf-8?B?aEEyYnM5OUxVcWtyUmxLNnhUU0RlOXFxWGRIb0JoUkRLMHFJL1JpVXBqYXQ2?=
 =?utf-8?B?UzFJNEtIVW1iU0p1SWt6Y0dWMDB1dSt4SXY2TGk3YjJPRzdwdCtzazlSWk5w?=
 =?utf-8?B?eFgxOGRmamRkZFUyYVZnWGpETWJoWi92ODFUUG5UL2dUL0dvN05rcmM2Y3BS?=
 =?utf-8?B?eXo0RWNFUWRmRUd4bDBoN2gzYndMaWpQU3dLRGVzb0FBNmxpbFF4aVpwR1Ix?=
 =?utf-8?B?MWpTNndycG9xRWdIcHpOZGhCR1pwV3VRY0NRM0g4cDd6UW11dHh4Yy9CZU04?=
 =?utf-8?B?czdlNXdmdDk5RklUVEdkUGNKaTRXcG5mNzlEM3BsQWllZ1JOUjZ6TDdaSUZo?=
 =?utf-8?B?RXhRbkVabTRmUHJWOUx5bU9CTS9FZUlZRmRlaEVJaFNoc0ZZSzhOOXkxZCsy?=
 =?utf-8?B?WmRQREh6d3A2R012dUduWTU4Y2NDd1BKRkN5SFNvTkdzUTFuSXNzektOQis1?=
 =?utf-8?B?RzhhSi8rakwvaC9RTDg5bXV2dEdZcEhOZTI1ZHhFY1RqRzBZazZjZThVV1Ew?=
 =?utf-8?B?SDk4RU83UEUycERES0J3akZqOUdyRHVaWHZ5SGJXU3R6L1FPa1BQTkpIRkYz?=
 =?utf-8?B?ZGp3bzhTajlHU3dPOStPTWJ6RUdyZW9HWjRieXBObGhjK0ZMT01VQXVXS0xC?=
 =?utf-8?Q?kmFOT4Pv4StEy0/Rrlc8+RI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad33f4b-423c-463f-db58-08dc323f383b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 18:10:29.1153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q+gJZe0TfwIDthX4ArtLamhXIUr7DyKqy7HzY9XpcFfWBcqNtIosvCzXtSeXeV4mkBQmM0lBOMnAbfIsIsDOIX43HckF8+DR80funnbZNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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

Hi Gustavo,

Below my inline comments

On 2/20/2024 11:31 PM, Gustavo Sousa wrote:
> +cc Ravi.
>
> Quoting Gustavo Sousa (2024-02-09 10:55:27-03:00)
>> The test pipe-fbc-rte updates the primary mode parameters for each valid
>> dynamic test case. Because of that, we might endup with invalid cached
>> data due to differences between the initial state of prim_mode_params
>> defined from the beginning of the test program and the possibly changed
>> state after pipe-fbc-rte.
>>
>> As an example, in a specific environment, the command
>>
>>   ./build/tests/kms_frontbuffer_tracking \
>>       --run-subtest pipe-fbc-rte,fbc-1p-primscrn-pri-indfb-draw-mmap-wc
>>
>> would result in fbc-1p-primscrn-pri-indfb-draw-mmap-wc failing because
>> it would try to read CRC from pipe B while the test was being actually
>> done in pipe A.
>>
>> Another potential issue worth noting is that even pipe-fbc-rte could
>> similarly fail if the set of dynamic subtests spanned across multiple
>> pipes.
>>
>> Let's fix that by making sure that cached stuff that would depend on the
>> primary mode parameters gets properly invalidated when prim_mode_params
>> is the target of init_mode_params(). This should fix the issues
>> mentioned above and also future-proof the code for any future test that
>> would need to modify the prim_mode_params.
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>> tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index 912cca3f8d45..17f74990979e 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -1484,6 +1484,7 @@ static drmModeModeInfo *connector_get_mode(igt_output_t *output)
>> static void init_mode_params(struct modeset_params *params,
>>                               igt_output_t *output, enum pipe pipe)
>> {
>> +        int i;
can you rename variable i to cnt or any meaning full name to that the 
variable is used
>>          drmModeModeInfo *mode;
>>
>>          igt_output_override_mode(output, NULL);
>> @@ -1515,6 +1516,18 @@ static void init_mode_params(struct modeset_params *params,
>>          params->sprite.w = 64;
>>          params->sprite.h = 64;
>>
>> +        /* If we endup changing the primary mode parameters, we need to
>> +         * invalidate any existing cached stuff from a previous configuration. */
>> +        if (params == &prim_mode_params) {
>> +                if (pipe_crc) {
>> +                        igt_pipe_crc_free(pipe_crc);
>> +                        pipe_crc = NULL;
>> +                }
>> +
>> +                for (i = 0; i < FORMAT_COUNT; i++)
>> +                        blue_crcs[i].initialized = false;
>> +        }
>> +
>>          free(mode);
>> }
>> -- 
>> 2.43.0
>>
Thanks,
Ravi kumar V
