Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF1CCFA13
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 08:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7809010E418;
	Thu, 30 Apr 2026 08:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmQx69sP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAD510E418
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777538281; x=1809074281;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tS8bfdc1k6lBd2oOXNaR0u17Q/0JPBHB8x6RMN0W50g=;
 b=gmQx69sPAkNkIq1SHxCDpmrwTyMSx4sDiV3qpZ9kn6YUQqOnIzxoAcCj
 ONO9D74/+MdlatLlbIihPg0LVaKP0UxBBJd4Ivns3xCmVvm15RyLQHebW
 9N0qZquAIaD6T5Al403liVhu7H6ismj+I61sVznqFYzBK50RP+acJWUXo
 6QbMAlhMBqNaikjuDwqCvp8jRi9xmmzxY/sYV4kNs/1hoFSsWGFBb97ZC
 429VYW3pJp8z7Pf+f9QOEE4+KK4GR7IUNL56lMS+ESO9xo6ipr6vNt7tF
 Kl2w0Aqml7BRhS19M+/CJdgwI33mhhyaJaDxofQFfE1MK1OkjPFVUktKv w==;
X-CSE-ConnectionGUID: qhjAJWk4Sk615OnwHxqBuQ==
X-CSE-MsgGUID: hcGRismkSkG52hS7BI9wHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78673921"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78673921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:38:01 -0700
X-CSE-ConnectionGUID: uQivJAQPQGiolK4r4Ek1YQ==
X-CSE-MsgGUID: AqOUriliRFeiwBge84m17w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="238843754"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:38:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 01:38:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 01:38:00 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 01:37:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWJu4BzReFQZcKVjFtklWdvowv0SF2AgjyN1aSx8GRSJQJ64n18OOXpmgzJk0B19g3Q6gPDJhTramNFHyR2AnDlPOKV0DN+Jm42RZ3gvpM/g6uL/7GuB6sibNo6m/4Z7RhImR4xj2k2g+ZefuJ13easB90smWmQW+gO1rUW1TlnuOwTKf1q/MjQR6cBJq2WQyPfhWkywt5EgFVNf3d5U96jHlvusj1pJSGXzLdCNL+gGZt0+qsiHUntevGx89T7612tVsKof4AM9em5ET6UEjtjheiaBzYxTfj2tVM9NhxRGTCNnr33W//f2b2HAtNz+pISypJvgw1ktbD5oT9NYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uce6U8/gyHqoLoeg60dU+yeQ4Xf3/lcF75k7PXaHHUs=;
 b=P1rIg7HPiFfxbuDw/X/FVtAgjchuTHqp/HCoJyaKdA0jVpPXxM0YivxFgcph7KAODGVAwwexGKQClmVyK7qsViLgCpsVVT4mmlVX/Lea9iQWdIyMEWvm9XBOuQ5P5TWzyDrxmdu0IQuo/mPgwxg8NTpdqAF5HRbJHEzMl37/O3++EoSk8K2DrF34ogNj1lPXoO5GLsXTdzSNNkQD0CmgNrjx5SSD9/E+fhG1tBKy5bXh1xUJMqdBZ/0N7qtBMX4cZf3MoLKi6TzfM+0uZQ0Ae3abllMbmUcVGw5+Pg5uu13mFKhG3pD/qhti68iMQKl1vu/pfGR1MIOWA7UgV7yFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 08:37:56 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 08:37:55 +0000
Message-ID: <abb37210-9751-4ed6-bc12-34a0c7adec33@intel.com>
Date: Thu, 30 Apr 2026 14:07:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 3/4] tests/intel/kms_frontbuffer_tracking: Add
 HDR feature support
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Suraj Kandpal <suraj.kandpal@intel.com>, Kamil Konieczny
 <kamil.konieczny@intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20260429175205.2327206-1-swati2.sharma@intel.com>
 <20260429175205.2327206-4-swati2.sharma@intel.com>
 <4c71ddd4d33464fef5729e991e7818ffe3c90ba8@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <4c71ddd4d33464fef5729e991e7818ffe3c90ba8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::17) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CO1PR11MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e161ce-1650-4800-2db3-08dea693c66f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|18092099006|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ZqWU0v85W0reUoqx8fmkcynhf5CiTqakVzvLeadLa34uIZmHBn2sELca1AQ//zkEUeh8i3jqjNBfmrVTbqsGPDpQR9U9ATwV2h9IFEAnSH6FrhWo2EXER9HSmoxi0v1ueDp2U2yS8zN3LKnZNP4ugiqbES2umoghbFcKXFR1e4rp3xcXlvH7BIClxRsRhsKGhHYx3lYvmqKGK/L1feZGtxVSc858xfMtIAhtHU8YYZsN3vmNLoiqnskN6HS7fgP6y8oPX9gyWnoVPKgId9yNU3OTaz6BkY6NzsxZ4QxyjbMGejo6AjeiToB/K45IZ/HgpLIfGhqimuTdXjUgtzn03i3aUk0DUyE9f1XrxlgTm8FiwWEam2pkV9/jJR5p8scEK8GArr2SeJLjZw5qyXrUjjW6T3O8lk48o9HIvuByVI2cEwtn89sTiLd92+hxVp4gYp30diY/fVaAAN+HT9PAWjjGlJiWszwoLv2cWXWBYqxB6M1jboAAH6YSOtJCExk1SCCRhldFAXV5b/ieKjP36QgUuiQidideL/sXQMkjk30LjBm3rPnuXH1hafsMoKgJLpgaz5j/0cSUDGpn9V5l0dcuR4YI/EAGfTcwv3Ttt21Roh5zyNy4nvEi+BJ9Rc+WjNqJxDt3ZMxW4yq8nZ8MbqP6TThpMxH3E+BQICUVsLVnvgv9phsknXHFWYyzZdkLUYhGLu5vJK7VN4QcOH+zNzld9BplalUyMJnIad5EfnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(18092099006)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXRld0o0cE1RZzRuWFJVYXM0YkZ5L2xMcEZnV25naXRCTk1ZQVdHU0VkQlIr?=
 =?utf-8?B?RnhibFQzQzM2OEgwS0RqRFUrRzZrNmpldnhJR0NwdGJkbUpVZ0VkczY5c1Vm?=
 =?utf-8?B?elZGdTNlS0hlRDFIUVh2dmkxTm9sRkI2VG96SGdmWHdRM3M0bncvNzN0Y2FP?=
 =?utf-8?B?Q1JBL09GQjRXd0JmUkI0NEM0cURiWTZieGNaOVNYdnBYRDR4d05OOVFzYTlz?=
 =?utf-8?B?WHBBWTMvNDdoR2xUNGZCUmVwa1RuWGdQL3VRNWtab3huTjFzaTBCRlhUUVhy?=
 =?utf-8?B?QnJRQTlRc2Jzd3E2VDhYd1hUMXl0Wmw3ZTYrZ01McjRtMDFhR29uQWhyclk0?=
 =?utf-8?B?NFQydnNYalJtV3JVWmQ5K1NJWkJIZ2FJUnNtMGJlLzRGbGdBSXNha0s2NGNZ?=
 =?utf-8?B?eVNBaWNMQXJZNmhudE5KbkZyckN1bW9aYzlRZW83eGZmcGFpeWxDYTl6RFZv?=
 =?utf-8?B?OHBFOVNPblRubzBUVWJpZzA0MUZSOGRzRG9xTzNnRXJRY0xBYUhUYjlPYmdC?=
 =?utf-8?B?bitpM0JTU2F1TTJVR2xWUUxGN3cxWXhDamFCU1dETnQwSG9WM1ZQNExnWTFq?=
 =?utf-8?B?OTB6R2RtcFo2MWdzdTMvVnc3VlR0d2hLc2FYSjBwbWpIWkRWc2VZU3BnSXNy?=
 =?utf-8?B?S2VTMUg3RGppZlJaN0QrUzBVTFhjNmJITmhvVlQ3eWNCMFRKZ3VDS1RIaGw0?=
 =?utf-8?B?ZWpYTmc4WmJTekpucHNodkNEUjBLY3F3MklycHJzalpuWVdYTlpVQ2taUEFP?=
 =?utf-8?B?eGU1SDRNL1NsTjZKcm5mV0NWRG5ITENWSVpuY1QwSU9WSUJ4TER2S29HNXRM?=
 =?utf-8?B?SmEwODk4WHVWY1IxVlo3cWV0dlRWb2Zlc3kxMDZ2VklNWmVUZklGOVBUbzlR?=
 =?utf-8?B?QzRhS0t4RC93U0ZsRkFrSkRRVjVsZkNuUXlyZ045b1AyS3VYMFZYNDMvOXZ3?=
 =?utf-8?B?R3VaMVRoRHo1NGNzNlh4azRVTDk2SllNb21KeGRCYmdtV3krdjBiVnYrZm83?=
 =?utf-8?B?MVVrbFF3MkFST1Q5bGFYVXlhUjVLdDh5RHBOMWdHSXhmNC9aSnlBaW5aTEZI?=
 =?utf-8?B?RmZ4dE9aeUNGTTR5cjRyQ0xrcnJBTk5kYjBxZnpzS1hnRmtTK0xnTnJOdmNx?=
 =?utf-8?B?TGRucXNPemlMa0xEdVZUZ010cUxlZnlpUDJYcGQzTUVJeEw5QmY1eVRJT25G?=
 =?utf-8?B?ZWFjUXhtbC9MSTMzREpDWUVOWHNJNHZiTW8xVm04WTJaMFZSV2ZtajMrdmtk?=
 =?utf-8?B?dTdBTzBhZVphempYK3hEKzdSQ3RrZFFacGdYZ0N5RmU3MEpzSzZqdk1aMkUr?=
 =?utf-8?B?TnFpa0JyWlI4b3VuMlloQzUvT2hqclFGQThiTVkvK3NvOHJzd0J1aGNPcTc2?=
 =?utf-8?B?M0NBV1NvTHpaVWZReGxUYVlqczBVRElEOFhRVnZPcHdwcVVQM1VPN29rN0wy?=
 =?utf-8?B?RDZJT3JpZkM2R3RMbnNFaVhiMkJJeG0wQStDSzBWNzVtdHdVaks1Uk5LZnN4?=
 =?utf-8?B?YnRXTmxEOFYxNkk1SnUxVktPSjRxUnJiaStqOHAvMzl6OVhTOEFMMFNBYitE?=
 =?utf-8?B?UjV6dVNmcWJNaklldGJWSERMSEtrSlozOFBGeUJQTjdhZENGMjVOVUhiY1c0?=
 =?utf-8?B?SUlZREluaElWc1V4SWQyeUFCT0tPMWs4YjNCS1pLSEpEMlFVSFlSdXVPQy84?=
 =?utf-8?B?anBPcGVjQUJNLyswQnlva1RwSzIxQ0J1Zk5RNjZDWXg3T05RMW5QejZrRW1N?=
 =?utf-8?B?MUxxUUZ0dndaU0dERCtLZWtMdTNNSkpLWTIvWEhhazVHZFd1OHg4ZXlEYXV6?=
 =?utf-8?B?aCtndDd2dW5BZ1FjeHF3VUxzVTdUWFpyQ0V0bG5jQWRMaVlhTlg2OGNPeno3?=
 =?utf-8?B?OWlwa2pBaUJ0WngvUytET0ZjcE5VbDZobFJ1enJjazZYNHNDeDZVZ05qUnBZ?=
 =?utf-8?B?RURhUUpGbkcyRzhtNU9FOU9jWklVQ29nVlYyNG81Zy9rdGFudHNWSU9FL1Nl?=
 =?utf-8?B?aXhJeSszSnowTnhtQzZqZDBrUXgzZHB0MXd5aFpYU3ArWHRhdkQ0YUNhMGE1?=
 =?utf-8?B?UjdkZmtHcmpYWGdIQXp2MFViM01QUG9rZngrREFRdzBaSDdjOUd2M3lzUm1Q?=
 =?utf-8?B?VXA1MHBUWmNQMzdyY0hoYmVCVUNyWTBCK2JrZkJkblhQVTErelVVREw3L2pv?=
 =?utf-8?B?WUJqblhqbzdGeU9nQWpDaU1QUDZhckkxbWdGQzUxYXhGSEd4bkluYTBXQzdB?=
 =?utf-8?B?b0kzZ1RaeEM4bUt4MU96Zm54UXUxaEZFYjg4WHgxdm02NlhXOU1odll3bUUy?=
 =?utf-8?B?aXBXYlErWG5JLzFtczY3aytTeW10T0VOSmNId2IzK1V2dGJGdXpGUT09?=
X-Exchange-RoutingPolicyChecked: NqzAitkSyDPF910qQd800orNoz5PCLUYdbdqfe0Yw03kuhdDnbAYCy6KKKEV283APQq695pi6Ggcs0n/EMAWFccAgHmApVoihAEJ5yDg9IlSjA5ArSziY9jwoWvm0gTbH154HIHcBddZzKXk2gQv3isA3cb49vjDxs4e0AaasBxLUwt7M944TkSs4qMSmUl61jlAIHGokHT2OpwbsmYhJzRvFUgGpy4fzFHsalQUEkv1vm1ZakbroXGkvDy9zjFYk/l/wd9r6W9FJSwll7ejB3QdahiPBIhV8PfWgTX8F2G8PpqYoZJi2sA5vFe9K49cYfmoYrJwORaunfQEbr+QBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e161ce-1650-4800-2db3-08dea693c66f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 08:37:55.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O985BImLPQGhLQ0UDiHOUj9Aw9lWxGwInuQfyN27xoGoVZCijPS1plNO3nZ5t3V3AGv0pDe+LUjMXd/7v60PEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
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

Hi Jani,

On 30-04-2026 01:13 pm, Jani Nikula wrote:
> On Wed, 29 Apr 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
>> Add FEATURE_HDR and extend feature_str() to cover all feature mask
>> combinations.
>>
>> v2: -add documentation
>>
>> Co-developed-by: Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   tests/intel/kms_frontbuffer_tracking.c | 585 ++++++++++++++++++++++++-
>>   1 file changed, 580 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index c16f63199..273f1f584 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -66,12 +66,30 @@
>>    * SUBTEST: psr-%dp-rte
>>    * Description: Sanity test to enable PSR with %arg[1] panels.
>>    *
>> + * SUBTEST: hdr-%dp-rte
>> + * Description: Sanity test to enable PSR with %arg[1] panels.
>> + *
>>    * SUBTEST: fbcdrrs-%dp-rte
>>    * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
>>    *
>>    * SUBTEST: fbcpsr-%dp-rte
>>    * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
>>    *
>> + * SUBTEST: fbchdr-%dp-rte
>> + * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
>> + *
>> + * SUBTEST: drrshdr-%dp-rte
>> + * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
>> + *
>> + * SUBTEST: psrhdr-%dp-rte
>> + * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-rte
>> + * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-rte
>> + * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels.
>> + *
>>    * arg[1].values:   1, 2
>>    */
>>   
>> @@ -85,12 +103,30 @@
>>    * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>>    * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * arg[1]:
>>    *
>>    * @indfb:          Individual fb
>> @@ -116,6 +152,10 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>> @@ -124,6 +164,21 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * arg[1]:
>>    *
>>    * @indfb:          Individual fb
>> @@ -149,6 +204,10 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>> @@ -157,6 +216,26 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -182,12 +261,30 @@
>>    * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>>    * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -213,12 +310,30 @@
>>    * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>>    * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -241,6 +356,10 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>> @@ -249,6 +368,26 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -268,12 +407,30 @@
>>    * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>>    * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * arg[1]:
>>    *
>>    * @cur:            Cursor plane
>> @@ -300,6 +457,10 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>> @@ -308,6 +469,26 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * arg[1]:
>>    *
>>    * @cur:            Cursor plane
>> @@ -331,12 +512,30 @@
>>    * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>>    * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + *
>>    * arg[1]:
>>    *
>>    * @blt:            Blitter
>> @@ -357,6 +556,10 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>> @@ -365,6 +568,26 @@
>>    * Description: Draw a set of rectangles on the screen using the provided method
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on the screen using the provided method
>> + * Driver requirement: i915
>> + *
>>    * arg[1]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>> @@ -382,12 +605,30 @@
>>    * SUBTEST: psr-%dp-pri-indfb-multidraw
>>    * Description: Draw a set of rectangles on the screen using alternated drawing methods
>>    *
>> + * SUBTEST: hdr-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + *
>>    * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
>>    * Description: Draw a set of rectangles on the screen using alternated drawing methods
>>    *
>>    * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
>>    * Description: Draw a set of rectangles on the screen using alternated drawing methods
>>    *
>> + * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + *
>> + * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + *
>> + * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + *
>>    * arg[1].values:   1, 2
>>    */
>>   
>> @@ -401,12 +642,30 @@
>>    * SUBTEST: psr-%s-draw-%s
>>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>>    *
>> + * SUBTEST: hdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + *
>>    * SUBTEST: fbcdrrs-%s-draw-%s
>>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>>    *
>>    * SUBTEST: fbcpsr-%s-draw-%s
>>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>>    *
>> + * SUBTEST: fbchdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + *
>> + * SUBTEST: drrshdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + *
>> + * SUBTEST: psrhdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + *
>> + * SUBTEST: fbcdrrshdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + *
>> + * SUBTEST: fbcpsrhdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + *
>>    * arg[1]:
>>    *
>>    * @rgb101010:      FORMAT_RGB101010
>> @@ -434,6 +693,10 @@
>>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-%s-draw-%s
>>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>>    * Driver requirement: i915
>> @@ -442,6 +705,26 @@
>>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: drrshdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: psrhdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-%s-draw-%s
>> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * Driver requirement: i915
>> + *
>>    * arg[1]:
>>    *
>>    * @rgb101010:      FORMAT_RGB101010
>> @@ -468,6 +751,18 @@
>>    *
>>    * SUBTEST: fbcpsr-slowdraw
>>    * Description: Sleep a little bit between drawing operations with FBC & PSR
>> + *
>> + * SUBTEST: drrshdr-slowdraw
>> + * Description: Sleep a little bit between drawing operations with DRRS & HDR
>> + *
>> + * SUBTEST: psrhdr-slowdraw
>> + * Description: Sleep a little bit between drawing operations with PSR & HDR
>> + *
>> + * SUBTEST: fbcdrrshdr-slowdraw
>> + * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
>> + *
>> + * SUBTEST: fbcpsrhdr-slowdraw
>> + * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
>>    */
>>   
>>   /**
>> @@ -480,12 +775,30 @@
>>    * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
>>    * Description: Just exercise page flips with the patterns we have
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
>>    * Description: Just exercise page flips with the patterns we have
>>    *
>>    * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
>>    * Description: Just exercise page flips with the patterns we have
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -510,12 +823,30 @@
>>    * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
>>    * Description: Just exercise page flips with the patterns we have
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
>>    * Description: Just exercise page flips with the patterns we have
>>    *
>>    * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
>>    * Description: Just exercise page flips with the patterns we have
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
>> + * Description: Just exercise page flips with the patterns we have
>> + *
>>    * arg[1]:
>>    *
>>    * @indfb:          Individual fb
>> @@ -541,6 +872,18 @@
>>    * Description: Check if the hardware tracking works after page flips
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
>> + * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
>> + * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
>> + * Description: Check if the hardware tracking works after page flips
>> + * Driver requirement: i915
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -559,12 +902,30 @@
>>    * SUBTEST: psr-%dp-primscrn-%s-indfb-move
>>    * Description: Just move the %arg[2] around
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
>> + * Description: Just move the %arg[2] around
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
>>    * Description: Just move the %arg[2] around
>>    *
>>    * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
>>    * Description: Just move the %arg[2] around
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
>> + * Description: Just move the %arg[2] around
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
>> + * Description: Just move the %arg[2] around
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
>> + * Description: Just move the %arg[2] around
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
>> + * Description: Just move the %arg[2] around
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
>> + * Description: Just move the %arg[2] around
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -583,12 +944,30 @@
>>    * SUBTEST: psr-2p-scndscrn-%s-indfb-move
>>    * Description: Just move the %arg[1] around
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
>> + * Description: Just move the %arg[1] around
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
>>    * Description: Just move the %arg[1] around
>>    *
>>    * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
>>    * Description: Just move the %arg[1] around
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
>> + * Description: Just move the %arg[1] around
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
>> + * Description: Just move the %arg[1] around
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
>> + * Description: Just move the %arg[1] around
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
>> + * Description: Just move the %arg[1] around
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
>> + * Description: Just move the %arg[1] around
>> + *
>>    * arg[1]:
>>    *
>>    * @spr:            Sprite plane
>> @@ -605,12 +984,30 @@
>>    * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
>>    * Description: Just enable and disable the %arg[2] a few times
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[2] a few times
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
>>    * Description: Just enable and disable the %arg[2] a few times
>>    *
>>    * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
>>    * Description: Just enable and disable the %arg[2] a few times
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[2] a few times
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[2] a few times
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[2] a few times
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[2] a few times
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[2] a few times
>> + *
>>    * arg[1].values:   1, 2
>>    *
>>    * arg[2]:
>> @@ -629,12 +1026,30 @@
>>    * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
>>    * Description: Just enable and disable the %arg[1] a few times
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[1] a few times
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
>>    * Description: Just enable and disable the %arg[1] a few times
>>    *
>>    * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
>>    * Description: Just enable and disable the %arg[1] a few times
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[1] a few times
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[1] a few times
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[1] a few times
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[1] a few times
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
>> + * Description: Just enable and disable the %arg[1] a few times
>> + *
>>    * arg[1]:
>>    *
>>    * @spr:            Sprite plane
>> @@ -651,12 +1066,30 @@
>>    * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>> + * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>>    * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>>    * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>> + * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>>    * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>> @@ -666,12 +1099,30 @@
>>    * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>> + * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>>    * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>>    * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
>>    * Description: Put a fullscreen plane covering the whole screen
>>    *
>> + * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>> + * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen plane covering the whole screen
>> + *
>>    * arg[1].values:   1, 2
>>    */
>>   
>> @@ -685,12 +1136,30 @@
>>    * SUBTEST: psr-%s-scaledprimary
>>    * Description: Try different primary plane scaling strategies
>>    *
>> + * SUBTEST: hdr-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies
>> + *
>>    * SUBTEST: fbcdrrs-%s-scaledprimary
>>    * Description: Try different primary plane scaling strategies
>>    *
>>    * SUBTEST: fbcpsr-%s-scaledprimary
>>    * Description: Try different primary plane scaling strategies
>>    *
>> + * SUBTEST: fbchdr-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies
>> + *
>> + * SUBTEST: drrshdr-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies
>> + *
>> + * SUBTEST: psrhdr-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies
>> + *
>> + * SUBTEST: fbcdrrshdr-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies
>> + *
>> + * SUBTEST: fbcpsrhdr-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies
>> + *
>>    * arg[1]:
>>    *
>>    * @indfb:          Individual fb
>> @@ -707,11 +1176,29 @@
>>    * SUBTEST: psr-modesetfrombusy
>>    * Description: Modeset from a busy buffer to a non-busy buffer with PSR
>>    *
>> + * SUBTEST: hdr-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with HDR
>> + *
>>    * SUBTEST: fbcdrrs-modesetfrombusy
>>    * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
>>    *
>>    * SUBTEST: fbcpsr-modesetfrombusy
>>    * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
>> + *
>> + * SUBTEST: fbchdr-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC & HDR
>> + *
>> + * SUBTEST: drrshdr-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
>> + *
>> + * SUBTEST: psrhdr-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
>> + *
>> + * SUBTEST: fbcdrrshdr-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
>> + *
>> + * SUBTEST: fbcpsrhdr-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
>>    */
>>   
>>   /**
>> @@ -724,11 +1211,29 @@
>>    * SUBTEST: psr-suspend
>>    * Description: Make sure suspend/resume keeps us on the same state of PSR
>>    *
>> + * SUBTEST: hdr-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of HDR
>> + *
>>    * SUBTEST: fbcdrrs-suspend
>>    * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
>>    *
>>    * SUBTEST: fbcpsr-suspend
>>    * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
>> + *
>> + * SUBTEST: fbchdr-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR
>> + *
>> + * SUBTEST: drrshdr-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
>> + *
>> + * SUBTEST: psrhdr-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
>> + *
>> + * SUBTEST: fbcdrrshdr-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
>> + *
>> + * SUBTEST: fbcpsrhdr-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
>>    */
>>   
>>   /**
>> @@ -744,6 +1249,10 @@
>>    * Description: Test drawing as far from the fence start as possible
>>    * Driver requirement: i915
>>    *
>> + * SUBTEST: hdr-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible
>> + * Driver requirement: i915
>> + *
>>    * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
>>    * Description: Test drawing as far from the fence start as possible
>>    * Driver requirement: i915
>> @@ -751,6 +1260,26 @@
>>    * SUBTEST: fbcpsr-farfromfence-mmap-gtt
>>    * Description: Test drawing as far from the fence start as possible
>>    * Driver requirement: i915
>> + *
>> + * SUBTEST: fbchdr-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: drrshdr-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: psrhdr-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible
>> + * Driver requirement: i915
>> + *
>> + * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible
>> + * Driver requirement: i915
>>    */
>>   
>>   /**
>> @@ -762,6 +1291,15 @@
>>    *
>>    * SUBTEST: fbcpsr-stridechange
>>    * Description: Change the frontbuffer stride by doing a modeset
>> + *
>> + * SUBTEST: fbchdr-stridechange
>> + * Description: Change the frontbuffer stride by doing a modeset
>> + *
>> + * SUBTEST: fbcdrrshdr-stridechange
>> + * Description: Change the frontbuffer stride by doing a modeset
>> + *
>> + * SUBTEST: fbcpsrhdr-stridechange
>> + * Description: Change the frontbuffer stride by doing a modeset
>>    */
>>   
>>   /**
>> @@ -777,6 +1315,18 @@
>>    * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>>    *              basic drawing test, else set the mode & test if FBC is disabled
>>    *
>> + * SUBTEST: fbchdr-tiling-%s
>> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> + *              basic drawing test, else set the mode & test if FBC is disabled
>> + *
>> + * SUBTEST: fbcdrrshdr-tiling-%s
>> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> + *              basic drawing test, else set the mode & test if FBC is disabled
>> + *
>> + * SUBTEST: fbcpsrhdr-tiling-%s
>> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> + *              basic drawing test, else set the mode & test if FBC is disabled
> This is not criticism of your patch per se.
>
> But the test documentation requirements nowadays are just *insane*.
>
> What kind of value do these copy-pasted descriptions add for anyone? Who
> will ever read them either in the source code or in the generated
> output?
>
> I'm all for documentation, but it has to be meaningful communication of
> information.
>
> This is just something we have to do to check a box and make some silly
> tool happy. This is a papercut we've chosen to inflict on ourselves over
> and over again.

Agreed, the current documentation requirement leads to repetitive 
descriptions that add little value. The descriptions are nearly 
identical across subtests and just satisfy the tooling check. Happy to 
improve them if there's guidance on what meaningful content should look 
like, otherwise acknowledging it as a known pain point in the process.

++Kamil Karthik

>
>
> BR,
> Jani.
>
>
>> + *
>>    * arg[1]:
>>    *
>>    * @4:              4 tiling
>> @@ -859,8 +1409,9 @@ struct test_mode {
>>   		FEATURE_FBC   = 1,
>>   		FEATURE_PSR   = 2,
>>   		FEATURE_DRRS  = 4,
>> -		FEATURE_COUNT = 8,
>> -		FEATURE_DEFAULT = 8,
>> +		FEATURE_HDR   = 8,
>> +		FEATURE_COUNT = 16,
>> +		FEATURE_DEFAULT = 16,
>>   	} feature;
>>   
>>   	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
>> @@ -4031,12 +4582,36 @@ static const char *feature_str(int feature)
>>   		return "fbc";
>>   	case FEATURE_PSR:
>>   		return "psr";
>> -	case FEATURE_FBC | FEATURE_PSR:
>> -		return "fbcpsr";
>>   	case FEATURE_DRRS:
>>   		return "drrs";
>> +	case FEATURE_HDR:
>> +		return "hdr";
>> +	case FEATURE_FBC | FEATURE_PSR:
>> +		return "fbcpsr";
>>   	case FEATURE_FBC | FEATURE_DRRS:
>> -		return "fbcdrrs";
>> +	        return "fbcdrrs";
>> +	case FEATURE_FBC | FEATURE_HDR:
>> +	        return "fbchdr";
>> +
>> +	case FEATURE_PSR | FEATURE_DRRS:
>> +		return "psrdrrs";
>> +	case FEATURE_PSR | FEATURE_HDR:
>> +	        return "psrhdr";
>> +	case FEATURE_DRRS | FEATURE_HDR:
>> +	        return "drrshdr";
>> +
>> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
>> +		return "fbcpsrdrrs";
>> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
>> +		return "fbcpsrhdr";
>> +	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
>> +		return "fbcdrrshdr";
>> +	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
>> +		return "psrdrrshdr";
>> +
>> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
>> +		return "fbcpsrdrrshdr";
>> +
>>   	default:
>>   		igt_assert(false);
>>   	}
