Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BA8C61DFD
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 05:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EF410E45F;
	Wed,  2 Sep 2026 05:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THfsFXWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B2210E45F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 05:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788327569; x=1819863569;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vNO+Kh3KuXq81bI5PV6gQS6TtdjkgyfsdezyFTQR2bc=;
 b=THfsFXWBU/K+dY9qD8lapfAYBjvu3B9AKuy48YdcpJZMszK/scARVTNE
 a/2NSc7xIfUflsqRm0Y7nIVx+5e//ZD2hA5gTeGyTeI1TbhdoHebY75nu
 ZDDFNLCGMG9YRy+Dnnnf6tOsHyTRF6oL9HRYhuIG7CZkQ5tKQD3e0mZ8Z
 cB9edwquWKAh7FxCqzPn+LGu2UWvSxNiKKA/fT36GQWVsL4INF+sS3wqI
 xSbLU3ijyqDFDGX2Rmm45CLzWQTGTFPdhI2UjlkPUHaBkytNnQHDUTEH0
 ktRwdgJtyQFPOLrlXE2/Vmb9JWdWjm2V2/3cvWJc9KDTg/yFG1LDJ2LYg g==;
X-CSE-ConnectionGUID: ccLgAiMARAeM++Ne+nnw4g==
X-CSE-MsgGUID: utFNlw1PSxWahiJq6svUrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100127282"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100127282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:39:28 -0700
X-CSE-ConnectionGUID: ZAir3iFtSTyXWQ1J1hnyBw==
X-CSE-MsgGUID: XTfIaRVbTtSbE9BS3rXPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269325976"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 22:39:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:39:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 22:39:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cku4nNSK0Hy9YdfidHTS8O/UB4hqyCATXF/xBbnYf0vayEZ6BZMuSeW12XMM8N1KWlIy744mQGZ23lOFxR8FDaDNFeAXFuN86hvphE2ZSNx8hohHQDriJ19sJueX81VrR9qTucd691313pFSzJQWW94jkvX7TUkKpz2UbKfCGtbrv4m/ia7ao8jX6DansEeXA594ZtRE2r0qgoNu8/bMqeH0nvfLPoQUq0lAJZZudl/M+v99Vac8EWnB9ka+rgDQWr5/K7X4+MBuQKKe1caGyjbbA9+irFSOTYidnW5mQqN7xJy7ZP9vr/b2p9KZSMvBJ3pHwbHitNfZjPBsof0BWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wChoBDd72R1Mrn1MBaBbnLcDmT3N7U2xIvNiQB3Q2Ks=;
 b=eB1SVP9Zo+GZHXHYJirufs1lVwpGhDa7rvFh71MtnI7ivSfN8t/0Y31Tc1hl4TGyCLLL4x85SM7kBnjwobwjJMNLIJIcgEAxUMocXeoOm0o2K1xgyTvnz1wzJLAzj0BKcsvSDMQxgXvbdNQTk0ANKDdxZBFYmTH+ELmbv+CKtPeUFVaf5eM31dmQtFUCXnMid0nKtTcV3Q8rHEHuPL/ohLtytWXcXOQkhpmZ4aoi7c0vsBZLHxbWqSY0hU2Zg7yzzItmH1Rqfgl53HfwazeeI8gHv+QykY5gjUgyj5m1+SkVeH6unnsNIaHiSqZOUq4wecBNM+ijOP8p9ny8/Aa/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SJ5PPF263E38237.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 05:39:25 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 05:39:25 +0000
Message-ID: <dcef0fbb-c4f4-4f44-b8fc-1fc0fe38e5f1@intel.com>
Date: Wed, 2 Sep 2026 11:09:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alex Hung
 <alex.hung@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>, Harry Wentland <harry.wentland@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
 <bd02d25f-fb9b-4f38-b189-0449af5ff897@amd.com>
 <a45a1a06-36e0-4d66-99ce-3d558ecd14e9@intel.com>
 <20260901165411.oh7i4gqow36ltvib@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260901165411.oh7i4gqow36ltvib@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: 835fe915-3512-45d2-a792-08df08b48c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: W045Af29a6/gbggM+KgrNP2i24CdjZaELnPUAR8SSIppn8/hDDPzMEjEx/Gs0Q38li9Y4HbyoEpHNf1y95xM21Pg8gxVsvrxu1OY65E8HAUepGSUi6N3h1iWrohYiGAkEXrL7TJJmdw3Q3U3AbvXxGa9/IX1OA8VTtBKk5U1RPHCLg7W5qsAlJ22LU7c6OEIy+BS/ATfO336hVEk+fw8gXQKN1sBp5XGHPpFFkab3ooOPQhQb/qL9gYayx+TPCOkmF7sysv+Fqg38tfYQRfFlWRj5KkyCA1BQtEd7I6iQsUvhSd+GCmz5vVv2jbMCDiljs73x4pLCFg7Ljz6etXPp2r1+m21C6B60zGIs1TZ8tGHmJw5cqMy8YKHzUZ0532xX2E9yIf6TTOoCP2DCQaGgZxLnIl105o7MryAbK8FnmPSRJfrmkPKao4OohRrcKnsszz53A/L2TQyeC+NLwdPzIiCpFAZojWUfe+OyXnGFOg+KFUr/8vijRFsUjZtvkHvzKYh9snJ2P6ZGeHjutEGKodnN0POp52bFh0FOrgAVLK7rcdg/kh0pxPQ+lRlBG9eBCMhQ92vlqXxOIWtBPhg6+mc0nw74XH1g/P3NwD+xKvREtHkkxWRNdZ7oEUBPDnnyqE+8SAWtPv8xqUwgNiWbsVk4IKsQNpVSEXmPkEErRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZsZGlZeGZYZVNxa05reXlQWXEzWDFsWng0UHVHQTVGazVKdkpYR3RuaVRs?=
 =?utf-8?B?Z0hMS2Q4NzdiYzE4cjNrbE1EU05nUDlWTnZYNHlwVHdabWtKV3lsYi9RU0p4?=
 =?utf-8?B?cXROMTRIZGk2NjFaREs1RkxXLytHTVJmV2hUU3QvTGNBRUlBSDJiMjlVbDRL?=
 =?utf-8?B?bnNUb1JDM2xyRnF5Nkc0cjlrNTRJU1RJeTJodzRsU1ZQU0kyRGtiRkNqTStp?=
 =?utf-8?B?NkxiZnlqbW1HY2VXMDBtZkF2YU91eTNUaFlMTTZlODV0eFJNV1ZOSWFsa0NY?=
 =?utf-8?B?WVFlQlMzNmJ0Z0xaQXRxYm5taDdMSTlxN1kvNjlxRVc2ckI5QU1WeTBvS1Jh?=
 =?utf-8?B?bmJTZkNYbE5sNzI3U1BHU0hvdVpxczlHTldwKzlEbTZTYWttT1FZQUtzUzdu?=
 =?utf-8?B?UXc0MVNpTGU4ZmRBWGVMekhXdEZ1SlcrNloyS0MvTzloQlpjTXRCNU45ZXlS?=
 =?utf-8?B?ZHZYdDlBYm43Ny94dmdiNUVId1lkSWNsaUpPTE4ySGUzc3lwUENaYjNWcEZa?=
 =?utf-8?B?ZlJRVmtyZVVaU2J2SVkxNVY5a0lua05uNFNWeVluN2NURHV6QjdWRkFNNTBF?=
 =?utf-8?B?aDNtd2REaXNESi9xemRmUlgyanExL2FwV3BzMHFLTzFlaG93bEVYTlpFN3VX?=
 =?utf-8?B?Y29lcERJMXpnY3BuVW0wKy9mSTJiYW1KMVJOL3dNK3BMR3VWemNZdHNWaVBO?=
 =?utf-8?B?Q2FxUDR4MVMrWjRRQjhCMHI0Sm1FMHhsMHJaQy9FaHdPd2lYaFJvdkdUeDQ5?=
 =?utf-8?B?akVQZyt5aEpIczBuN3pIZmhPRVhoby9kY01LS2RNM3l2RUJ6ZzNFbDBhN1dt?=
 =?utf-8?B?dll1Q2VSVDEveVJ3Q3EwSjN3WFg2SDMzcnBFdm5OYkJGaGFoRHFkM0g1RHo2?=
 =?utf-8?B?TFlUa0F3aDY2TWk1WURORU5rcHJLeXdkaVc0UmxORi91NkwrMUZoY0hJUk84?=
 =?utf-8?B?RGR6R3ZhQ0pRS2N4QllMd1JJOWUzUW5pZXl5QmJFWGkweDZBSG4zU2RCeDRB?=
 =?utf-8?B?dUNKZk5wRHF1OW9GQVA5ZDgyUnB4T2xiSnF6VlVZUlhkN3UxTXVEaG83RStD?=
 =?utf-8?B?UityQWVCMnlLSkFVVDlVQXZ1K2tza3ZMU2dFMGoreHdqdWZUaGErQ3grbVhP?=
 =?utf-8?B?N2FvWWpzOVR6UlA0QTJuVWptNGhSV0ZMeHRsdlZjVEh2QjM3b3JWOENlTVYy?=
 =?utf-8?B?NEVuN3hDcDdVZ3V2VXBYVzhDeHBrRS9PR1VIeFBvZVlNYmc1UmlVNXcrVjJQ?=
 =?utf-8?B?TFNyT2VKekpuaEs2bWhqSVhObXNoSi9SZFlkaU5VamthMzlENFF3NFV1UFNv?=
 =?utf-8?B?UGMwMlVoK2FFOE81bThBYjQxNTNKbFpTTC9uYmhyQW10ZnI5Q3h1U3F4eWt0?=
 =?utf-8?B?NlhQS1pieWlPSFNsVWRVNnVpUThHZWQxUTJseVphWC9qS0FsZnRGK0Y1ZUtE?=
 =?utf-8?B?bWJzK0FvWE53RkVqU0trSmZCSk40djBvZEpXT3YzRGlKVmxXd2ZlY3l1Wmxv?=
 =?utf-8?B?ejhEUmp3c1RseVAwZnRoS2dRdk4yUW42aHdDRmM5TEJyOWxKK3puU2RIS2dU?=
 =?utf-8?B?UmEyaDJ3aXdOd1hRS3FsdFhDL3JXaFBnQXZXcURXQXVSSlpLVWtROVY2dTN5?=
 =?utf-8?B?dW9BME5BQlI4OHJMdUFzSCt0Zm9UVURxSkZUeTl2TnZYTGZ0M0NYdFFndWV0?=
 =?utf-8?B?czBoNjJRaTB3TUF5RC9CMmlMaXk0UzVRMmoxeU5KQWUwbDNUNkFjb2ZQVHAv?=
 =?utf-8?B?aFUzamhyS2Y4SnJ2ZXZCZjFpRlRLcmVZMjBxcnQyei9IUzFzUzluSm9ZRzlm?=
 =?utf-8?B?OUtMdXdBMDNxckxXd05MdHVacTdRN3grdTl2VkVDMUhuSVdZRnhNck1BNkp5?=
 =?utf-8?B?ajMzNDdROU1Gems3a1lWd2FyeTYvd1JwNlV3WGRReDFnK09RSUxTbHhVMWxB?=
 =?utf-8?B?dUgxM3BqUWZlYWFQQ0IvOU5jMDRTZitrT0ZPeWtDdENJdkc3OFZVK2NWM3Q5?=
 =?utf-8?B?b1Z0VFBoMFVtUVNPZnhEUk1PdHR3RjZaWEIvRFZXajJ0NDJOOU1DdjExbWky?=
 =?utf-8?B?K3VVL0hTZVVaZ05MQU5KZFN1ZFFuL2hFeHJmWWpRa0dDRkthZE8xcDM2MkJi?=
 =?utf-8?B?MWJFek1WYjhCNVgzVUJHTTZiR1JGLzNrZ081T2ZDTklKYTNEbDQveHhJOWtQ?=
 =?utf-8?B?ZTYzbS84YnUvU2Y0ZVltdzFjcTVoNmRkN20veEw0eHljakNFcFRpV0dLdzli?=
 =?utf-8?B?Wk1YaDloQlZiQnZ1V0pYRVZMbGFuVitjRG5ENFpsUVpwUTdKei8yOVBkR3RU?=
 =?utf-8?B?aEliMnF2dXk1N0hKRVhVTFpwRk0xQVhFSzJxa09taHNaNEtWY1M2L3cwbTl4?=
 =?utf-8?Q?mT8WBU8v4UD+vpFQ=3D?=
X-Exchange-RoutingPolicyChecked: Ltn2YAP9uVLx3yOaWSFfX3bxWkwf4h4ia0Mnw6/P2dyUvgKa2UDGcztK/0OSjqvOwU8DMRAsYrE7Uje5Z5v0KjgOzkoWVInUpLrn+GeU6tsubfB6dyVu9QAKqZ8Su0nsK2V+GCrn2FH/1sJr89UasdL9Nn275OILJIJELlmHEoUeL1MU8tNYsKdRCC0uJG/DlFZuDWm3izlNWAm2KFaMJarGwgunH3sE9dGXtEVvcP/AV7oorymtqt8bCI+Vp1p4nNFVQCdpzgenX+JsX4+OAVOYKsrzjF+kclmII103P/CxoxkUyNWEZO+4dnYsiStVNCelK6f5hssZ4kWy11HqvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 835fe915-3512-45d2-a792-08df08b48c22
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 05:39:25.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tai/bNO0wdeXoASmUI6PlT5xQUcf/LNiQrA/D7Cd4Exttd/I1eVnjNm9b768Gyw7WQJDH3RTqFjo7C3moTTcmKhCJ69+r+d70vPtMdoqaJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
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



On 9/1/2026 10:24 PM, Kamil Konieczny wrote:
> Hi Borah,,
> On 2026-08-28 at 15:34:27 +0530, Borah, Chaitanya Kumar wrote:
>>
>>
>> On 8/28/2026 5:45 AM, Alex Hung wrote:
>>>
>>>
>>> On 8/26/26 23:31, Sharma, Swati2 wrote:
>>>> Hi Chaitanya
>>>>
>>>> Patch LGTM
>>>>
>>>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>>>>
>>>> Also, it seems we have duplicate igt_display_require(&display,
>>>> display.drm_fd);
>>>>
>>>> It is required once. Anyways, its a separate patch.
>>>>
>>>> Alex,
>>>>
>>>> Can you please test on AMD driver with above change?
>>>
>>> yes it ran fine. Some inline comments below.
>>>
>>>>
>>>> On 03-08-2026 01:33 pm, Chaitanya Kumar Borah wrote:
>>>>> Following the pattern in kms_color_pipeline, set
>>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
>>>>> local variable, then propagate it to display->has_plane_color_pipeline
>>>>> after the final igt_display_require() (which reinitializes the display
>>>>> state). This avoids calling drmSetClientCap() twice.
>>>>>
>>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>> Cc: Alex Hung <alex.hung@amd.com>
>>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>>> ---
>>>>>    tests/kms_colorop.c | 9 +++++----
>>>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>>>> index 16db0b8ad..d573d2ceb 100644
>>>>> --- a/tests/kms_colorop.c
>>>>> +++ b/tests/kms_colorop.c
>>>>> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options,
>>>>> help_str, opt_handler, NULL)
>>>>>        igt_display_t display;
>>>>>        int i, j, ret;
>>>>> +    int has_plane_color_pipeline = 0;
>>> can this be bool?
>>>
>>>>>        igt_fixture() {
>>>>>            display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>>>> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options,
>>>>> help_str, opt_handler, NULL)
>>>>>            igt_require_f(!ret, "error setting
>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>>> -        igt_display_require(&display, display.drm_fd);
>>>>>            if (drmSetClientCap(display.drm_fd,
>>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>>> -            display.has_plane_color_pipeline = 1;
>>>>> +            has_plane_color_pipeline = 1;
>>>>> +
>>>>> +        igt_display_require(&display, display.drm_fd);
>>> is this igt_display_require() necessary?
>>>
>>
>> Swati flagged this too and this is probably unnecessary. However, I thought
>> of handling it in a separate patch. What do you think?
> 
> Why waiting for next change when it is already spotted? Lets keep
> number of commits low, so git history will be shorter. imho you
> could fix it and add r-b you already got.
> 
To me, these look like two logically independent and bisectable changes.
But I can do a while-on-it and combine them together.

==
Chaitanya

> Regards,
> Kamil
> 
>>
>>>>>            kmstest_set_vt_graphics_mode();
>>>>>            igt_display_require(&display, display.drm_fd);
>>>>> -        if (drmSetClientCap(display.drm_fd,
>>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>>> -            display.has_plane_color_pipeline = 1;
>>>>> +        display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>>>            igt_require(display.is_atomic);
>>>>>        }
>>>
>>

