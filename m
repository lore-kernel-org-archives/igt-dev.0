Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D18FC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 10:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA195113032;
	Wed,  6 Mar 2024 10:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/JOlWQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4EA113031
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709721690; x=1741257690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=SKCMClns/3efm/f3THrY2xga95D0QWvUJQ3yDMzlxlU=;
 b=T/JOlWQjCj/9Mm7ybU3fcBoID2nYJLNElD99hd5wjkTMRKJoas94C+3X
 xWXBrgtjVusn573upZPCjJOZl9NbqVgd5JmMLrAZB/l4wGP3BcSxx2+Gb
 GeZFHus9wYpLVJSyFy4mf4RfJUzlLP7fpJpRoSAn5Ri0UPhUeK24kjlCw
 tPad1ALLBPN/m057+xO79Bax5UIynhRdAjF93bgyo7ftXwz7djpjpKUC2
 GBQ9BnEhLj57GZkrv6I/iY8z1gpWl6+3DviKfCPAyhfLc/O+R8IOTOEJK
 qChcqLAIe860h1aP2/aGTSaIUT0O2PKyqIK9iLNVIqqlyKH4xmeD1VkRS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="26794319"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208,217";a="26794319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208,217";a="14206217"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 02:41:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 02:41:28 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 02:41:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 02:41:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 02:41:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oyx07MifuRtCYgyv67YwhRBUT6fM3dkcWVoCeJ76fnmSMbmnrQU08Up2hmT78T37nJHArc7C3uRRKdK4vUOJKdnpVaSVZvtyv9BvLMiRd9bU4UAEXx7/kFtun2i3OLHavshtkMc+Euza/Fdc7L/KiZuk4CgT32GL4EFPCrrMfKShPhrhCjpYOakyfJzJhwjVkFCO4lsVdou9nwE1phDnuVTp9QRoM+nZ4Mkk4aDy73h5tsNEoGIF9D0GD6CRMOFTlnmToonw0LhZ8n3a2MWqLvbh77AhHCxZonrXFUPCKZu7GHwljVMQLjHjjzMTxjcQ8dzDs2ohc4vsucsZmfQ8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Xl5MnXuRIqmQou5FF8126dxW1pbuWOdndh9vtUDPkI=;
 b=gTRIu5/4Tf9ZjLlbdEEpRh7l/OYplJnUAh3ZiImjsxdMil44NhPdto9r3XLXmQnj3f6fY6dyOuQ0o2YCIj8LxAaxM79NI1glIBxY0HdQsXJkCdrtHKgpworiH5ubjBhKP/mLucTzdfxumXdMzQmc+f+sMJJrlFyrrZvCvvbt5MF1u7fwlaTJni7gbihi07gfE6eADIcVy7mT5ZPIq9YIodjvIkiQDqaSgi4t9c7RRyp3G/bq8qZsIembso/5H6CTI07G51H4JdjdglJgUrLNKMTqwowjjvjWcTrfJF3Z/codUQeacYY0yiLo6b6BaaN/TOkCkjyz3bG5JWQRgadTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by DS0PR11MB8685.namprd11.prod.outlook.com (2603:10b6:8:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 10:41:20 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:41:20 +0000
Content-Type: multipart/alternative;
 boundary="------------HIZzukB3VtiWTqTGDIeF9zc3"
Message-ID: <68466e6d-81af-46ce-ba10-ec38bdb06392@intel.com>
Date: Wed, 6 Mar 2024 16:11:03 +0530
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
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <ZehGg6Vkqv06MbzN@intel.com>
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|DS0PR11MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 862e73e3-3bd0-4808-70a5-08dc3dc9f586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3qDJcHCivak7A3o2OMmDg70jb4MSRaz1iXwRr4iLIeIHNEqG7J2a0op9Hn3jEpKxXKlSfIPCqrkxlc2+tvbjof3236vqTi+nnryc8V6f/sw6uDekssoaDFrDQPWlcFu1PvFh4J07PQh9H2MNJecUxqMqGZlkU5g3Y5m9285BFWGfLqkmojE3rPoadIB00S9TfGXQqwNkhdfp/4r3NlMLkkWMN4slrCh8WlPoRXn9ykVBydmvUR3wKQ5RsvWR4UQ1131D7Qjr6qN1Sto9efek0R9UR8CKKaUVyCBCxciaBnvf7mDKV3cdnWtnNztt2JlWTyXq9kbWHyDkGGmv1JP4FAPe2tCyQcP88+eiJO7E7uF9SsPABi9tvhSx3ZqTzDKPvEfo5NRYRIcQ0dZ203gTcOBkOP93XI0pXnsmgQkyYCjqx9gdBEnLWRo9ZH5a40RTitP5DWhSnzxWqdMzflYAPr59D8fRa9nyzBbSaE3dIFsWcztvXiznVhYESxa545K64UreoUlKO5uYeSMDTmwXSkIlf4NCyaffkZ7TQoQ1qT6/A6YGynttMZB57Lkm+jXMPkHS7WVdQcOgRj6KbW0001Qz/kqugJIy0Irxp1ESQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aElZRitLdTNvdmUrZ1dlQ1NKMFVHTll1VFROZmRjRThnZnJtUFgwcnQxS3Nh?=
 =?utf-8?B?QU16YUlsdXl6bUJSOENUclhTcCtpMTBSQ0hHcSsrOWwyMWppR2dpK0RoUTNM?=
 =?utf-8?B?T1JSRnk4RVdhVjR2bkVkRFJtdGJLL09OR3BxbklYSDJtNVRXQ0U3VUNrdmZr?=
 =?utf-8?B?WUFEZGYvUS9sQzJOMzBHTnp3TlhtYThQRmQ0RmVXaFI5Nm9YeEpyaTlNaFp6?=
 =?utf-8?B?M1EvcXdDSzN0U1IwUm0rdVIyM1NhdnovaVhtVi9CZjVZWjVMNllKTkgxS2U1?=
 =?utf-8?B?STJadkV0a1B4bnRhWENONWpSWDBTd3piRUdJOFpiTmlieHVhMEpuVUE0ektU?=
 =?utf-8?B?K0g5dEZsSmRRd2hDbHdiQXlabk9Ia2VzY1lOTnR5N1lCQXI0U3hHMDlkY2R3?=
 =?utf-8?B?Rzl1SVZXYjB1U1BFZllCK0k2K2V4R2FMZkpDbVFyYjBOMUg3d3hGeXB5ekls?=
 =?utf-8?B?RWVTUno3SnpJTjNyRzJLVVZ1OTFZZHpTSkkwNXExVS9WTHBoYmYrdjU2UG5R?=
 =?utf-8?B?K0lVUEJqSTI0ZkJha2hKNjV5d2FMRTA4UjRkeFpXUEZZRVhhdGxFSzRrdU1t?=
 =?utf-8?B?STFESWRQS1dPdDNmNk5UYTRWVmM1YmFmY1Z6NWxnb1JzOFpSNk9mZWRnZldu?=
 =?utf-8?B?QVNCRXVXaHRVSW1sVkFQeXJTY0tkenNvam9zeUtDMmdhU3ZoWnMxOTJQalRD?=
 =?utf-8?B?clF1VFNVYXpEL0hwTUlXc2VvR0txTi80NENrZU1yZkJydGVZSkZpZUxzTmVL?=
 =?utf-8?B?TDNUc2hzM05lNkw1ekpqRys1V2wvRE5vMHg2VVl6SXZtWWtTRHg5WGNoNkRv?=
 =?utf-8?B?YmpZNk5QdDlManFsUk9GaWJnM2N5V1FJZ1dPYklrZ2tGcjlDYXhnb1Y5Y3FG?=
 =?utf-8?B?cnFIdFpJcElDTE1JMEpSUytpbEg5ZmFYUURwMG9KR29KeWJrOWw4azFmMk1L?=
 =?utf-8?B?VTdiMXNHYWhoS3o3aFRZRWhnVi93eEhmQW05K2ZFQkYrT1o5cHNVdFdIQVh3?=
 =?utf-8?B?SEVvMk1WY1VKTmNNWDF4a1YxKzYyVDRaZXArN1hXWTFnbHloT01Xejc1Risw?=
 =?utf-8?B?c1dodkkrVFRoRC91azFaMjZyUnh6TkpWTWpPWmV1UXRLMFBiSWtJSDE4ZHRw?=
 =?utf-8?B?Szd0SFFSTHdQeHFyaEJZTTlnWmVlZ0c5SDRIZ3Z2VDJmTlFpYkxjNHhndG1r?=
 =?utf-8?B?ZnNjeHppaEdlVmo3dTFWMmtza0NLdUVZZERNaDU1T1YvcE4ycVZGeWZuY3hU?=
 =?utf-8?B?ejlINjJuTHRyQUFPWXNJTS9MdmNoUXNqWW1KaXVtVEZnTFpkc0RQRzB6YUVO?=
 =?utf-8?B?NkRYSjJzazZDdWZKbHJQbDhzOERNa0xlMytaUENuU3FxWE9ZNWgwNlE1WDRG?=
 =?utf-8?B?R2YwQzd5R2trdS83VzZVVVZLZk1lSWkrNUVhaUVxYXpPWnZSeS9yMFZkMUcx?=
 =?utf-8?B?VGk0eExmNXAxbGFIbS8zd3RTMWdGcnlDUVdCbHFsaG5tWVUrQXpzR3ZjWHBi?=
 =?utf-8?B?U1RXcDNENDZ0Y2R2U0MxV2tDS3IxM2RRUVlJRmRiRlBQV1VyMkNVb3VjUmlj?=
 =?utf-8?B?ZGl1TUVndm5aZU1vYU9Fc2lVZUdtMzFXdHFyeHp4eHJyaFJuMkdqc3BTckh3?=
 =?utf-8?B?dTB4RjJTM3FoWkttNTNDdWk3ZUJXemlvYjVLM1cwOEdoRlByUjBia3k0TUt0?=
 =?utf-8?B?czlpdW4zZFpzbzV2NDA2cktiSnhRMXpNZzExVGNRMlZkZjRkUkdHSkJRMkJq?=
 =?utf-8?B?aFJzQ3o4cVRGR0dlZlBiSVVmTDZ5TGlZTFFoNVBRQTRxbTk0VzBDRlI3UjZz?=
 =?utf-8?B?Y1JXRXRtRUhjbm5pREpOYk5Zdzh0WHhXMFUyOVFuM1E2ODBKamp4b1lMcVJy?=
 =?utf-8?B?MFRyenQrRCticE45WTFrUHkwUCtBQXd1OFFUelk5R1lzNWplSEtMekl2bWdq?=
 =?utf-8?B?Vy84emljZHJzQmx0VFdhMWl4Q1JGeFV6anZXWlJUUlRna3I2YURKeW9LNFcy?=
 =?utf-8?B?S3pDakxMeDA1eXp1dmpaNnFBdDQ4K0pjTU9RUFZCRGZEQ1c4aUp4ZEppKzZM?=
 =?utf-8?B?ejIxQ0dEaEdxQkZBZG9DZDZpSnI5SkJ0bnRXUGVsbkFFU0FJbmJZaVBRZDVi?=
 =?utf-8?Q?AiSVKnUmg6MKqZh2XV19/I6kZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 862e73e3-3bd0-4808-70a5-08dc3dc9f586
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:41:19.9921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/w1oCz859uQiJ4hJgJphYGjlvHpBj7SCLx94I/D3zG2ID/ub1KsC1HArsZEiWwIzPo8kulV7/1urCk6piwHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8685
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

--------------HIZzukB3VtiWTqTGDIeF9zc3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stan,

On 3/6/2024 4:03 PM, Lisovskiy, Stanislav wrote:
> On Wed, Mar 06, 2024 at 03:41:26PM +0530, Joshi, Kunal1 wrote:
>> Hello Stan,
>>
>> On 3/6/2024 3:23 PM, Lisovskiy, Stanislav wrote:
>>> On Wed, Mar 06, 2024 at 10:55:09AM +0530, Kunal Joshi wrote:
>>>> big joiner outputs are statically assigned to pipe,
>>>> rewrite to assign dynamically
>>>>
>>>> v2: Don't change license (Bhanu)
>>>>       Add documentation for generate_combinations (Bhanu)
>>>>       Print the pipe name (Bhanu)
>>>>       Remove unwanted commit (Bhanu)
>>>>       Move combine output logic to igt_fixture (Bhanu)
>>>>       split revamp and force joiner (Bhanu)
>>>>
>>>> Cc: Karthik B S<karthik.b.s@intel.com>
>>>> Cc: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>>>> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
>>>> ---
>>>>    tests/intel/kms_big_joiner.c | 391 +++++++++++++++++------------------
>>>>    1 file changed, 187 insertions(+), 204 deletions(-)
>>>>
>>>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>>>> index 28678b958..ba4097d8b 100644
>>>> --- a/tests/intel/kms_big_joiner.c
>>>> +++ b/tests/intel/kms_big_joiner.c
>>>> @@ -43,16 +43,19 @@
>>>>     *
>>>>     * SUBTEST: basic
>>>>     * Description: Verify the basic modeset on big joiner mode on all pipes
>>>> - *
>>>> - * SUBTEST: 2x-modeset
>>>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>>>>     */
>>>> -
>>>>    IGT_TEST_DESCRIPTION("Test big joiner");
>>>> -struct bigjoiner_output {
>>>> -	uint32_t output_id;
>>>> -	drmModeModeInfo mode;
>>>> +#define MAX_OUTPUTS 256
>>>> +#define MAX_COMBINATIONS 1000
>>>> +#define INVALID_TEST_OUTPUT 2
>>>> +typedef struct {
>>>> +    int combination[MAX_OUTPUTS];
>>>> +} Combination;
>>>> +
>>>> +enum joiner_type {
>>>> +	BIG_JOINER = 1 << 1,
>>>> +	INVALID_JOINER = -1,
>>>>    };
>>>>    typedef struct {
>>>> @@ -60,273 +63,253 @@ typedef struct {
>>>>    	igt_display_t display;
>>>>    	struct igt_fb fb;
>>>>    	int n_pipes;
>>>> -	enum pipe pipe1;
>>>> -	enum pipe pipe2;
>>>> -	struct bigjoiner_output output[2];
>>>> +	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
>>>> +	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
>>>> +	uint64_t combined_outputs[IGT_MAX_PIPES];
>>>> +	int big_joiner_output_count;
>>>> +	int non_big_joiner_output_count;
>>>> +	int combined_output_count;
>>>> +	int output_count;
>>>> +	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>>    } data_t;
>>>>    static int max_dotclock;
>>>> -static void test_invalid_modeset(data_t *data)
>>>> +/*
>>>> + * The generate_combinations function generates combinations of pipe allocations
>>>> + * for a given number of outputs
>>>> + *
>>>> + * @output_count: Number of outputs to allocate pipes for.
>>>> + * @pipe_count: Total number of available pipes.
>>>> + * @pipes_per_output: Number of pipes to be allocated for a single output.
>>>> + * @combinations: Array to store generated combinations.
>>>> + * @num_combinations: Pointer to a variable that stores the number of generated combinations.
>>>> + *
>>>> + * Example (output_count=2, pipe_count=4, pipes_per_output=2):
>>>> + * Combination 1: 0 2
>>>> + * Combination 2: 1 3
>>> I think this might be a bit overcomplicated - just for your information, we can't deliberately
>>> choose which pipes can be used for bigjoiner. On some platforms even only certain pipes, can be
>>> used for bigjoiner.
>>> Moreover the way how driver decides, which pipes are going to be used for bigjoiner is basically
>>> this code in intel_dp.c:
>>>
>>> if (intel_dp_need_bigjoiner(intel_dp, adjusted_mode->crtc_hdisplay,
>>> 			    adjusted_mode->crtc_clock))
>>>            pipe_config->bigjoiner_pipes = GENMASK(crtc->pipe + 1, crtc->pipe);
>>>
>>> Means if you try to do a modeset with resolution > 5K or exceed max_dot_clock on crtc->pipe,
>>> then _always_ pipe + 1, going to be used for bigjoiner.
>>>
>>>
>>> Stan
>>>
>> Thanks for the inputs,
>> Goal here is to try various combination possible,
>> Suppose a platform supports 5 pipes(A-E) and we have 1 bigjoiner output
>> (DP-1) then we want to try
>> DP-1 on PIPE_A
>> DP-1 on PIPE_B
>> DP-1 on PIPE_C
>> DP-1 on PIPE_D
>>
>> Suppose a platform supports 5 pipes(A-E) and we have 2 bigjoiner output
>> (DP-1, DP-2) then we want to try
>> DP-1 on PIPE_A and DP-2 on PIPE_C
>> DP-1 on PIPE_B and DP-2 on PIPE_D And so on, Going forward this will be
>> useful we introduce any feature which can allow having more pipes per output
>> also.
> That won't work. BSpec and current driver code allows to use only _adjacent_ pipes.
> I.e if you modeset PIPE_A with 5K resolution, then bigjoiner_pipes mask would be
> PIPE_A | PIPE_B. If you modeset PIPE_B with 5K resolution it will take PIPE_C as a
> slave and so on.
> So for instance of you had DP-1 assigned to PIPE_A and DP-2 assigned to PIPE_C by test,
> _driver_ will still reassign PIPE_B to DP-2, in order for bigjoiner to work.
> That logic is implemented in intel_dp.c, as I mentioned above.
> Also you can check the BSpec Bigjoiner programming description.
>
> Stan
I think there is some confusion here,

Below is result of the test that was executed with current code
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html

Assigning pipe 0 to DP-3
<7> [44.263216] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] 
[CRTC:131:pipe B] Used as slave for big joiner master [CRTC:80:pipe A]

Assigning pipe 1 to DP-3
<7> [44.568716] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] 
[CRTC:182:pipe C] Used as slave for big joiner master [CRTC:131:pipe B]
Assigning pipe 2 to DP-3
<7> [44.909690] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] 
[CRTC:233:pipe D] Used as slave for big joiner master [CRTC:182:pipe C] So we are leaving one sequential pipe for a output,
Please let me know if i still wasn't able to explain properly.

>
>>>> +*/
>>>> +static void generate_combinations(int output_count, int pipe_count,
>>>> +				  int pipes_per_output,
>>>> +				  Combination combinations[MAX_COMBINATIONS],
>>>> +				  uint64_t *num_combinations)
>>>>    {
>>>> -	igt_output_t *output;
>>>> -	igt_display_t *display = &data->display;
>>>> -	int ret;
>>>> +	int i, index;
>>>> +	int current_combination[MAX_OUTPUTS];
>>>> -	igt_info("Bigjoiner test on ");
>>>> -	for_each_connected_output(display, output){
>>>> -		enum pipe p = output->pending_pipe;
>>>> -		drmModeModeInfo *mode;
>>>> -		igt_pipe_t *pipe;
>>>> -		igt_plane_t *plane;
>>>> +	for (i = 0; i < output_count; ++i)
>>>> +		current_combination[i] = i * pipes_per_output;
>>>> -		if (p == PIPE_NONE)
>>>> -			continue;
>>>> -
>>>> -		mode = igt_output_get_mode(output);
>>>> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
>>>> -		kmstest_dump_mode(mode);
>>>> +	while (*num_combinations < MAX_COMBINATIONS && current_combination[0] <= pipe_count - output_count * pipes_per_output) {
>>>> +		for (i = 0; i < output_count; ++i)
>>>> +			combinations[*num_combinations].combination[i] = current_combination[i];
>>>> -		pipe = &display->pipes[p];
>>>> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>> +		(*num_combinations)++;
>>>> -		igt_plane_set_fb(plane, &data->fb);
>>>> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>> -	}
>>>> +		index = output_count - 1;
>>>> +		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
>>>> +			index--;
>>>> -	igt_assert(!igt_check_bigjoiner_support(display));
>>>> +		if (index < 0)
>>>> +			break;
>>>> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
>>>> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
>>>> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>> +		current_combination[index]++;
>>>> +		for (i = index + 1; i < output_count; ++i)
>>>> +			current_combination[i] = current_combination[i - 1] + pipes_per_output;
>>>> +    }
>>>> +}
>>>> -	igt_display_reset(&data->display);
>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
>>>> +{
>>>> +	igt_output_t *output;
>>>> -	igt_assert_lt(ret, 0);
>>>> +	for_each_connected_output(&data->display, output) {
>>>> +		if (output->id == output_id)
>>>> +			return output;
>>>> +	}
>>>> +	igt_assert("Output not found\n");
>>>> +	return NULL;
>>>>    }
>>>> -static void test_basic_modeset(data_t *data)
>>>> +static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
>>>>    {
>>>> +	int i, j, ret;
>>>> +	igt_output_t *output;
>>>> +	uint64_t *outputs;
>>>> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
>>>> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
>>>>    	drmModeModeInfo *mode;
>>>> -	igt_output_t *output, *bigjoiner_output = NULL;
>>>> -	igt_display_t *display = &data->display;
>>>> -	igt_pipe_t *pipe;
>>>> -	igt_plane_t *plane;
>>>> -	igt_display_reset(display);
>>>> -
>>>> -	for_each_connected_output(display, output) {
>>>> -		if (data->output[0].output_id == output->id) {
>>>> -			bigjoiner_output = output;
>>>> -			break;
>>>> +	outputs = combined ? data->combined_outputs : data->big_joiner_outputs;
>>>> +
>>>> +	for (i = 0; i < data->n_pipes-1; i++) {
>>>> +		igt_display_reset(&data->display);
>>>> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>>>> +			output = get_output_by_id_or_assert(data, outputs[j]);
>>>> +			igt_assert(output);
>>>> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
>>>> +			mode = igt_output_get_mode(output);
>>>> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>>>> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
>>>> +				 igt_output_name(output), mode->hdisplay,
>>>> +				 mode->vdisplay, mode->vrefresh,
>>>> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>>>> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>>    		}
>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>    	}
>>>> -
>>>> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
>>>> -
>>>> -	mode = &data->output[0].mode;
>>>> -	igt_output_override_mode(bigjoiner_output, mode);
>>>> -
>>>> -	pipe = &display->pipes[data->pipe1];
>>>> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>> -
>>>> -	igt_plane_set_fb(plane, &data->fb);
>>>> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>> -
>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>> -
>>>> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>>>> -	igt_plane_set_fb(plane, NULL);
>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>    }
>>>> -static void test_dual_display(data_t *data)
>>>> +static void tets_big_joiner_on_last_pipe(data_t *data)
>>>>    {
>>>> +	int i, ret;
>>>> +	uint64_t *outputs;
>>>> +	igt_output_t *output;
>>>> +	igt_plane_t *primary;
>>>> +	igt_fb_t fb;
>>>>    	drmModeModeInfo *mode;
>>>> -	igt_output_t *output, *bigjoiner_output[2];
>>>> -	igt_display_t *display = &data->display;
>>>> -	igt_pipe_t *pipe;
>>>> -	igt_plane_t *plane1, *plane2;
>>>> -	int count = 0;
>>>> -
>>>> -	igt_display_reset(display);
>>>> -
>>>> -	for_each_connected_output(display, output) {
>>>> -		if (data->output[count].output_id == output->id) {
>>>> -			bigjoiner_output[count] = output;
>>>> -			count++;
>>>> -		}
>>>> -		if (count > 1)
>>>> -			break;
>>>> +	outputs = data->big_joiner_outputs;
>>>> +	for (i = 0; i < data->big_joiner_output_count; i++) {
>>>> +		igt_display_reset(&data->display);
>>>> +		output = get_output_by_id_or_assert(data, outputs[i]);
>>>> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>>>> +		mode = igt_output_get_mode(output);
>>>> +		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
>>>> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>>>> +				 igt_output_name(output), mode->hdisplay,
>>>> +				 mode->vdisplay, mode->vrefresh);
>>>> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>> +							  DRM_FORMAT_MOD_LINEAR, &fb);
>>>> +		igt_plane_set_fb(primary, &fb);
>>>> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>>> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>>>    	}
>>>> +}
>>>> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>>>> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>>>> -
>>>> -	/* Set up first big joiner output on Pipe A*/
>>>> -	mode = &data->output[0].mode;
>>>> -	igt_output_override_mode(bigjoiner_output[0], mode);
>>>> -
>>>> -	pipe = &display->pipes[data->pipe1];
>>>> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>> -
>>>> -	igt_plane_set_fb(plane1, &data->fb);
>>>> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>>>> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>>>> -
>>>> -	/* Set up second big joiner output on Pipe C*/
>>>> -	mode = &data->output[1].mode;
>>>> -	igt_output_override_mode(bigjoiner_output[1], mode);
>>>> -
>>>> -	pipe = &display->pipes[data->pipe2];
>>>> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>>>> -
>>>> -	igt_plane_set_fb(plane2, &data->fb);
>>>> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>>>> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>>>> -
>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>> +static void test_basic_modeset(data_t *data, int num_outputs,
>>>> +			       Combination combinations[MAX_COMBINATIONS],
>>>> +			       uint64_t num_combinations)
>>>> +{
>>>> +	int i, j, ret;
>>>> +	igt_display_t *display = &data->display;
>>>> +	igt_output_t *output[num_outputs];
>>>> +	igt_plane_t *primary[num_outputs];
>>>> +	igt_fb_t fb[num_outputs];
>>>> +	drmModeModeInfo *mode;
>>>> -	/* Clean up */
>>>> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>>>> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>>>> -	igt_plane_set_fb(plane1, NULL);
>>>> -	igt_plane_set_fb(plane2, NULL);
>>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>>> +	for (i = 0; i < num_combinations; i++) {
>>>> +		igt_display_reset(display);
>>>> +		for (j = 0; j < num_outputs; j++) {
>>>> +			output[j] = get_output_by_id_or_assert(data,
>>>> +						     data->big_joiner_outputs[j]);
>>>> +			igt_info("Assigning pipe %s to %s%s",
>>>> +				 kmstest_pipe_name(data->pipe_seq[combinations[i].combination[j]]),
>>>> +				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
>>>> +			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
>>>> +			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
>>>> +			mode = igt_output_get_mode(output[j]);
>>>> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>>>> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>>>> +			igt_plane_set_fb(primary[j], &fb[j]);
>>>> +		}
>>>> +		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>>>> +		igt_assert_f(ret == 0, "Commit failed\n");
>>>> +    }
>>>>    }
>>>>    igt_main
>>>>    {
>>>> +	int i, j;
>>>>    	data_t data;
>>>>    	igt_output_t *output;
>>>> -	drmModeModeInfo mode;
>>>> -	int valid_output = 0, i, count = 0, j = 0;
>>>> -	uint16_t width = 0, height = 0;
>>>> -	enum pipe pipe_seq[IGT_MAX_PIPES];
>>>> +	drmModeModeInfo default_mode;
>>>> +	i = j = 0;
>>>>    	igt_fixture {
>>>>    		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>>>    		kmstest_set_vt_graphics_mode();
>>>> -
>>>>    		igt_display_require(&data.display, data.drm_fd);
>>>>    		igt_require(data.display.is_atomic);
>>>> -
>>>>    		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>>> +		data.big_joiner_output_count = 0;
>>>> +		data.non_big_joiner_output_count = 0;
>>>> +		data.combined_output_count = 0;
>>>> +		data.output_count = 0;
>>>>    		for_each_connected_output(&data.display, output) {
>>>>    			bool found = false;
>>>>    			drmModeConnector *connector = output->config.connector;
>>>> -
>>>> -			/*
>>>> -			 * Bigjoiner will come in to the picture when the
>>>> -			 * resolution > 5K or clock > max-dot-clock.
>>>> -			 */
>>>>    			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
>>>> -
>>>>    			if (found) {
>>>> -				data.output[count].output_id = output->id;
>>>> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
>>>> -				count++;
>>>> -
>>>> -				width = max(width, mode.hdisplay);
>>>> -				height = max(height, mode.vdisplay);
>>>> +				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
>>>> +				igt_output_override_mode(output, &connector->modes[0]);
>>>> +			} else {
>>>> +				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
>>>> +				kmstest_get_connector_default_mode(data.drm_fd, connector, &default_mode);
>>>> +				igt_output_override_mode(output, &default_mode);
>>>>    			}
>>>> -			valid_output++;
>>>> +			data.output_count++;
>>>> +		}
>>>> +
>>>> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
>>>> +			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
>>>> +			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
>>>>    		}
>>>>    		data.n_pipes = 0;
>>>>    		for_each_pipe(&data.display, i) {
>>>>    			data.n_pipes++;
>>>> -			pipe_seq[j] = i;
>>>> +			data.pipe_seq[j] = i;
>>>>    			j++;
>>>>    		}
>>>> -
>>>> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>>>> -
>>>> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>>> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>>>    	}
>>>>    	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>>>    	igt_subtest_with_dynamic("basic") {
>>>> -		for (i = 0; i < data.n_pipes - 1; i++) {
>>>> -			data.pipe1 = pipe_seq[i];
>>>> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>>>> -				test_basic_modeset(&data);
>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>> +
>>>> +		for (i = 0; i < data.big_joiner_output_count; i++) {
>>>> +			uint64_t num_combinations = 0;
>>>> +			Combination combinations[MAX_COMBINATIONS];
>>>> +
>>>> +			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
>>>> +			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
>>>> +					 i+1, data.n_pipes, num_combinations);
>>>> +
>>>> +			if (num_combinations > 0)
>>>> +				igt_dynamic_f("%dx-big-joiner", i+1)
>>>> +					test_basic_modeset(&data, i+1, combinations, num_combinations);
>>>> +			else
>>>> +				break;
>>>>    		}
>>>>    	}
>>>> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>>> -		     "when the pipe is active with a big joiner modeset");
>>>>    	igt_subtest_with_dynamic("invalid-modeset") {
>>>> -		data.pipe1 = pipe_seq[j - 1];
>>>> -
>>>> -		igt_display_reset(&data.display);
>>>> -		for_each_connected_output(&data.display, output) {
>>>> -			if (data.output[0].output_id != output->id)
>>>> -				continue;
>>>> -
>>>> -			mode = data.output[0].mode;
>>>> -			igt_output_set_pipe(output, data.pipe1);
>>>> -			igt_output_override_mode(output, &mode);
>>>> +		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
>>>> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>>>> -			igt_dynamic_f("pipe-%s-%s",
>>>> -				      kmstest_pipe_name(data.pipe1),
>>>> -				      igt_output_name(output))
>>>> -				test_invalid_modeset(&data);
>>>> -		}
>>>> +		if (data.big_joiner_output_count >= 1)
>>>> +			igt_dynamic_f("big_joiner_on_last_pipe")
>>>> +				tets_big_joiner_on_last_pipe(&data);
>>>> -		if(valid_output > 1) {
>>>> -			for (i = 0; i < data.n_pipes - 1; i++) {
>>>> -				igt_output_t *first_output = NULL, *second_output = NULL;
>>>> -
>>>> -				data.pipe1 = pipe_seq[i];
>>>> -				data.pipe2 = pipe_seq[i + 1];
>>>> -
>>>> -				igt_display_reset(&data.display);
>>>> -				for_each_connected_output(&data.display, output) {
>>>> -					if (data.output[0].output_id == output->id) {
>>>> -						first_output = output;
>>>> -						mode = data.output[0].mode;
>>>> -
>>>> -						igt_output_set_pipe(output, data.pipe1);
>>>> -						igt_output_override_mode(output, &mode);
>>>> -					} else if (second_output == NULL) {
>>>> -						second_output = output;
>>>> -						igt_output_set_pipe(output, data.pipe2);
>>>> -
>>>> -						break;
>>>> -					}
>>>> -				}
>>>> -
>>>> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>>>> -					      kmstest_pipe_name(data.pipe1),
>>>> -					      igt_output_name(first_output),
>>>> -					      kmstest_pipe_name(data.pipe2),
>>>> -					      igt_output_name(second_output))
>>>> -					test_invalid_modeset(&data);
>>>> -			}
>>>> -		}
>>>> -	}
>>>> +		if (data.big_joiner_output_count > 1)
>>>> +			igt_dynamic_f("invalid_combinations_with_two_bigjoiner")
>>>> +				test_invalid_modeset_two_joiner(&data, false);
>>>> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>>>> -	igt_subtest_with_dynamic("2x-modeset") {
>>>> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
>>>> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>>>> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>>>> -			data.pipe1 = pipe_seq[i];
>>>> -			data.pipe2 = pipe_seq[i + 2];
>>>> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>>>> -				test_dual_display(&data);
>>>> +		if (data.combined_output_count) {
>>>> +			igt_dynamic_f("invalid_combinations_with_bigjoiner_non_bigjoiner")
>>>> +				test_invalid_modeset_two_joiner(&data, true);
>>>>    		}
>>>>    	}
>>>>    	igt_fixture {
>>>> -		igt_remove_fb(data.drm_fd, &data.fb);
>>>>    		igt_display_fini(&data.display);
>>>>    		drm_close_driver(data.drm_fd);
>>>>    	}
>>>> -- 
>>>> 2.25.1
>> Thanks and Regards
>> Kunal Joshi
Thanks and Regards
Kunal Joshi
--------------HIZzukB3VtiWTqTGDIeF9zc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Stan,<br>
    </p>
    <div class="moz-cite-prefix">On 3/6/2024 4:03 PM, Lisovskiy,
      Stanislav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZehGg6Vkqv06MbzN@intel.com">
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
      <pre class="moz-quote-pre" wrap="">
That won't work. BSpec and current driver code allows to use only _adjacent_ pipes.
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
    I think there is some confusion here,<br>
    <br>
    Below is result of the test that was executed with current code<br>
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10766/bat-arls-4/igt@kms_big_joiner@force-joiner-basic@1x-joiner.html</a><br>
    <br>
    <pre style="font-family: monospace; margin: 0px; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Assigning pipe 0 to DP-3
<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 149); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&lt;7&gt; [44.263216] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:131:pipe B] Used as slave for big joiner master [CRTC:80:pipe A]</span>

Assigning pipe 1 to DP-3
<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 149); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&lt;7&gt; [44.568716] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:182:pipe C] Used as slave for big joiner master [CRTC:131:pipe B]
</span>
Assigning pipe 2 to DP-3
<span style="color: rgb(0, 0, 0); font-family: monospace; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 149); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&lt;7&gt; [44.909690] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:233:pipe D] Used as slave for big joiner master [CRTC:182:pipe C]

</span>So we are leaving one sequential pipe for a output,
Please let me know if i still wasn't able to explain properly.

</pre>
    <blockquote type="cite" cite="mid:ZehGg6Vkqv06MbzN@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
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
Kunal Joshi</pre>
      </blockquote>
    </blockquote>
    Thanks and Regards<br>
    Kunal Joshi<span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------HIZzukB3VtiWTqTGDIeF9zc3--
