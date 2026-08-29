Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236B6C61DCB
	for <igt-dev@archiver.kernel.org>; Sat, 29 Aug 2026 20:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388410E085;
	Sat, 29 Aug 2026 20:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/qcHa0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE0810E085
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Aug 2026 20:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788034271; x=1819570271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=udXZOyOp+GUwhDNTh6Zldj9+rr5Wm6FV6F/4NsKafto=;
 b=A/qcHa0TQ1Mxt5qBY+KsBhI2lRhgDT8WmiEuL+8ywdJzWpubZQt22yeX
 VJSuH6Q7AA5Mxa+/1lnRXfD/2opDByyuaQdcOQsW/BkmZp8dQ6dF0nls5
 cMmJxVz55T6BCToXKEyqygaIjBM9+yZZsdTjCZMzs5SM/PIfHTAOYuFDL
 KAEnxpdseA7V3GuHFBsHszvCr/aRAYkGm3tHRvqb5rJ10MK6yrsUE1pef
 URYnypx+Na1z29oyFHCD1lEY+4dIypv1U0lT992xFSbUr83sJ9fOzCvfD
 p4pOEn1OKsj/nE+4F+8owpiVTEJ3bH5dPxpRXiYpoXBspZ2ausDTLnd61 g==;
X-CSE-ConnectionGUID: mRDptgrIRKCu0x44G7/J+g==
X-CSE-MsgGUID: /hRqzrTUQZ2KLJDIe62NBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="111276922"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
 d="scan'208,217";a="111276922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 13:11:11 -0700
X-CSE-ConnectionGUID: bFnojLquQqeUhVizXsywVQ==
X-CSE-MsgGUID: TYXGPW26QAGuIqe7UBQ5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
 d="scan'208,217";a="268485691"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 13:11:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 13:11:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 29 Aug 2026 13:11:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 13:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDSPsRcmqTl1a0DVgh1PqtWIIorL+oW568gIEF47jhL+BDCwTfMmWi+0Nkog+mM4Au16dlesx6Bx6vPQsmbkKG4Qm/3AUjT2BihBLMjqGkmd0QU7oE9Jm+ApyYislU37ZaCTI9e328Hg8LgAgEHiPgohREDCPs0mWCj7h5x97ay72nEsch7Yd8NkdPgVHZH+sZOhMhppa330bnWaIaupAoxSYE587Zm8msoUYWhARkVC+ESwyGOfCKBJDP1O1l9T8kqiZjon7LcXC31L5/ewCLHbVOOb9+XuYBYjHG8UHg63GEMVU+wdKoaZTaJYC+q27DCX7hhi9dxDddXDWW4Kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjfWje8ru6fRr6yzmb3XQEtygzepcI7sEg7PTplV7+I=;
 b=L/ZSuvM8fkFGZRh7JTX5lC3Hyt7i172WhG2CkQb+ohiKovppXlCOoDv3PzizWLAFjjUDPqM/Gwwk4/UCzZHIQjBDGAx3D1uHb/QUH+ErMR5LBqt1A9MRilBzq+tZpRijO6RyGVwJNJ0vKR8tOW3qKZNBcleADVJfKexNC7QYiBiJ4zi+1PUK76ZsL+UxlwA5Vre7tc8oOGfDio9Wn6t1DkPoFezjUFcTyDI+KFtNdwQqtbuoMjMTQpspIFWceiRPcDrXTxqEcvQfY2JfyyxLEh7m7vaICNXo4bOaFH62zK+l8SR22/A+fRJioqxlDjCXByQXmV+NV0UcYkiVCLa5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 20:11:06 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 20:11:04 +0000
Content-Type: multipart/alternative;
 boundary="------------jnFm7T850qYlXse1uzppzpwB"
Message-ID: <ce4ce5a8-f442-49ed-a336-4205e6c80a83@intel.com>
Date: Sun, 30 Aug 2026 01:40:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 10/17] tests/kms_vblank: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-11-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-11-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8ed208-beec-4699-c7a6-08df0609a7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|3023799007|10067099003|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: GAdtDqW0ZfJ7l0GjC22FHB5qR9kBsAEb9S1OmI807sFAAG9Fq5JhQ+Cg786VEIkiVgeyf2fYb7EWZORXW4zYjhlRTYTV62CWs54XURnrrNOGx/x3pqxUov3FG1RcjwiS90pA0HJrcikAqdQ4nG/G1MGSktdqGbqvDR+SbLfPQKH9VnIWmh5UB+FXok1ymUoC7kVDAbsrLqUqDB19QIUVMp8XJlGuN2VUHJvCCOgXDSOUn6d8+Ub/Qf6nzPOhvqfjzXVqLJ4i0ajYwrJbYWveqAhMnsac+bh4iQzgG51Jeov3Xj8AlcRQxlzvk9cnMWT5YkxZoHFb/BeRbpZKGgmZjRrNnC+Y7CQ37msaJsLg9wo8/Hub8lhLyfQjOfFllu65yT3rNebY4okv3/X7IfZsFKyvTRHq4jyGOOxV+ZuPUnRJoUa3q9Qw/eP/uVhjX6/CzidkvDrYTlQHwlKXrMTzv4KFpk1wNNph0QQhxLAvS1mLM5/qY3A2/YLgPQQYsJA93WsB805V9epifofhymo3T9JmWl65L8AOiyqlfAy4srEG+v+nLHsHiTPFvxc3yiLrWUq6i1Xw9jU0iQkT+uUF0OW0wfR+sVwhPsBJenxXGclDkrPeq9SXQ8mp8tl39Ec3QpiiNfxULAz85oOsLdORW2nOW6eW6Aidnu/pcQfjGlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(3023799007)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVSbmY2WGFPbEZKaWc2aVltd2FubUcyQ1JXcXdkRVB3T1BKaklLTmNvWlBl?=
 =?utf-8?B?QVlIcVFjYVVncGFTb05kc2dCb3k4MUxrMlFJVWZnUkNRamdZdmZIRVc2ZEJx?=
 =?utf-8?B?dUhCZlg4Q3p2SlNPWVFoL0NVS0VsV1VoT0NYVWVWT1dBNkl4OVc1bUFKZ1Ri?=
 =?utf-8?B?NEJXRG14MnJMWlRBU3p3M21WcktnWXVYZy9DaEp6VmVlWHVaL1pKenMwaHU5?=
 =?utf-8?B?RTloNDlSREdtcnB1b2t1Mnd3VnQwWlY0dmFVZjFIUGdLNVBOMjk3UmtnbVdH?=
 =?utf-8?B?cGVUdVBWdFhjbkE5bkVRMTFvUzJZNFVMVFVTMUpOczQxbUs0ejhwU0ZFNW5U?=
 =?utf-8?B?NTFKMStONS93ZE5NMXZJS0U5RXlnYVRuUjN0K3loKzdUVmo4cnM0OS91Rzkx?=
 =?utf-8?B?YkhnT0RnNlRwWXdWRzVOdWdkYTB1bWJzajFpMGVBOE54eHBBZFNIcEFINU4w?=
 =?utf-8?B?L2h2TnJ5TS9DQmZLQnVQZU1TQmk4T3JoYkZyaUg0VTBzUEF1aVhUMGYwWmZU?=
 =?utf-8?B?ZDJzb2Q5QUlYNzhXMElBanVMdHYwS0NPK2VDVU45UnJDay9PNzJnSmdyNmk2?=
 =?utf-8?B?QjFYb0FEMFR5dlRwbk9MbTQxQ0I0bmI3MnJEWVEzL1dkc0RsSkJrNG51NzRV?=
 =?utf-8?B?Vy94cUtNcEh4ai9CY29nYjF4VkVpM2t6TWhpQjVaOTV1QmhKMjk2cE5lMTJD?=
 =?utf-8?B?VitSYjNkSXZGUXRrbGRjTzd5dUZJdlhBMTF6c3NmQmFGd3MyeFNCeGR5ZnJj?=
 =?utf-8?B?cjB1aTFOU2ZIc2FHQWREcDVOQmRiVXlJMjkvZzZZRlNkY0JjbUJuNSsxNVlB?=
 =?utf-8?B?T1lXZERTd0NZamlVSzJ0MTV0SnRUY3BMUS9zVGRsZitHMzR1d24rblRBb2c4?=
 =?utf-8?B?ZU1xNEU3K3ZGbnovZGFxTHFVaHUyRlJHOHBFcDNsTDBhd1ppK1U0T3V1UWtm?=
 =?utf-8?B?Rk9sYmpVRTZDUTVsYWYvcnNoTlo0TW8zTnA3d3hEdTVDK2VZMWJBV3hhRk12?=
 =?utf-8?B?czFsYWxvLyttWjdJZHp1TmdJMEFWRzhBMlpwVC9iYVdjYnZzQzhlUlczVlkr?=
 =?utf-8?B?dzF5ZnlpN1ZxVVBxaXR2THlJVW1jZWdHOE1UM2t6ZzdDY014Vzh1d2psLzBU?=
 =?utf-8?B?L1hJbGZnNFJPbWpLTHZoRjZCUUdWaVhZV0o0ajFYT3U4Z3BwT21FZk9WbW9t?=
 =?utf-8?B?VnZGR2hDdUtGVGIrRVJyRi9mbEdObjhORldOU1lrL1QwTkltSUZ5Tkx3SUxu?=
 =?utf-8?B?STdFOUE5VnpuY3NHTFFEaFJzRGhycWFycHBnZkkraGhJQmdBR2dSTG1nQVM4?=
 =?utf-8?B?V0xIMG96dzl4bmNLUDFVb3poOUtrZ1J4bWFYeVdtLzZsbzl5TXU2UkpJZWJj?=
 =?utf-8?B?c1BCaGNBUW1vQy8rd2RPN0VWaURPdnZ1Ny9iZ2w2ZDhmUUNsemlQRldYODkz?=
 =?utf-8?B?T3h0S1V3WUU2Q3NYNW5UeUdxY1BwMGxSWWFvVG1SOFYwYTFuOWxCeXJDcG1Y?=
 =?utf-8?B?VlNybm54bVBNNFZvbFNKdGkwQ0pxbVQrQVlMdE51MG9LTGkySlhDZmhPbnVq?=
 =?utf-8?B?TnJNQWczSlo4OWVxK25aVEdHTE1PZGlqOGRLdU9YT0hGOWpOQ2VraHB4MmNG?=
 =?utf-8?B?blZNVW15d3UwSVI2NGtXeEFQZXducXYwYnlNdVV5U1Z4VyswWDBhRWJTeWtn?=
 =?utf-8?B?TVRSNE1qVXoxT0JreXRIWjNYS3ZYVkhWM29NdVdRbDducFI2a2VzRTV0Q2Y5?=
 =?utf-8?B?Q0cxMk53TmlyVlBXVGN0ekg5YjdrYk0wWm9XTHNQQkc0VWtvM0thdTBiaXJY?=
 =?utf-8?B?dzFOclJjUzN4TUROV3NuamhVSjRFckh2L29Zb2FPV3dKcXM1dnl3ajk2cWlP?=
 =?utf-8?B?K2FNZTJDVGN5ZnpQM2hlNGt6TlozVGl2QzlZMkQ2VHAxYlk5SUZlSndPM1VG?=
 =?utf-8?B?b3UxWlhNVTAxaVFOWjI3TVBEZHVoRStQdGJVQmxKRXFOUi8xZ3Q0TFdPOFhl?=
 =?utf-8?B?U1RzRnVzTkZuN2ZzL2UyMnFoS0M1WXB5UFYrbWx6bUp3UHhiTzZEU25BcExz?=
 =?utf-8?B?UFBmempBVWExVlVnNjdjS3Q4am9LbTUycloycUtEbklVRXVCeG5VZFFCZHNC?=
 =?utf-8?B?enQ3WVg5bmVzR1RIYkVQSjdiRTB1L1lYczQwYmJhditFcFVRWk10Z0xWQVpZ?=
 =?utf-8?B?TFNhdjlxWFUrclQyVHdyVVMwVG1LN0N3Z3N6N05SaDdmbFRXazVKV204M0t0?=
 =?utf-8?B?QitPdmJrR29sQUF6OERUOGlrTTJmVk41OGlyVGNRVDFoaUZNdC9QWHQ0eURK?=
 =?utf-8?B?emJEWTZuWksyeEcrQUprRDdTUzh4U28vYVBVeVdJSWNrOVpXU0ZxTWF3MWtX?=
 =?utf-8?Q?HyrubyHutiF6TiaI=3D?=
X-Exchange-RoutingPolicyChecked: TcdgcpQujUYlgWcoDByA6tlGx+vzGMicByHQhJGKP2QS2RDzcNuxmjGDLGlAKbK2i+BOAspEdWXO9KvwN4JmekrF/iIXfS6WxAcLCOw6KC3k7L+BtXIMrP3W9nh0z+NIRCNRgARUzhyWu8BfyU41EO2/TaLQV1bZ0yMs7qzfYSpOsyW1gKzH8DmBoJ37g97unhtglo2nMcKOB4PIptueOGIKD0jSxTFZGeOhRFu5mUBV/GqKd3vbV3JQJR3t93s+0MXbIoJZHKY7SlddfCcej+jYqmT/EWeAdcNwPzTUvE5wtErcsTJBiEzu5M1cPoyjOWtrXmqRczQidZ5EbAJhug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8ed208-beec-4699-c7a6-08df0609a7b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 20:11:04.9139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMFMgCow9pBmZ2qrmIzAipbTyoed09wIw9oVpu9b+Jcf1EaNPwvPc8xKYN3HV+ChJWeOfsm/dmb/AImfA4vXjW46NClKQTq4CN/xofS5JTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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

--------------jnFm7T850qYlXse1uzppzpwB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> We are iterating through each output while testing suspend. This results
> in extended execution time. In turn this leads to hitting CI enforced
> timeout.
>
> By default limit number of tested outputs to 2. Test each connected
> output when passing command-line parameter.
>
> v1->v2
> - fix off-by-one error (Mohammed)
> - reset output_count before subtest (Mohammed)
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/kms_vblank.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 47b733af15..7995528c3f 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -109,7 +109,10 @@ typedef struct {
>   #define RPM	0x80
>   } data_t;
>   
> +#define OUTPUT_LIMIT 2
> +
>   static bool all_pipes;
> +static bool all_outputs;
>   static int active_crtcs[IGT_MAX_PIPES];
>   static uint32_t last_crtc_index;
>   
> @@ -476,6 +479,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
>   static void run_subtests(data_t *data)
>   {
>   	igt_crtc_t *crtc;
> +	int output_count = 0;
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *, int, int);
> @@ -513,9 +517,16 @@ static void run_subtests(data_t *data)
>   			if (m->flags & ~(f->valid | NOHANG))
>   				continue;
>   
> +			output_count = 0;
-->IMO: above line ^ not needed here
> +
>   			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
>   			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
-->IMO: It make sense to add  --->output_count = 0 here.. please check it..
>   				for_each_connected_output(&data->display, data->output) {
> +					if (!all_outputs && (m->flags & SUSPEND) && output_count >= OUTPUT_LIMIT) {
> +						igt_info("Skipping output %s\n", data->output->name);
> +						continue;
> +					}
> +
>   					for_each_crtc(&data->display, crtc) {
>   						if(!igt_crtc_connector_valid(crtc, data->output))
>   							continue;
> @@ -538,6 +549,8 @@ static void run_subtests(data_t *data)
>   							run_test(data, f->func);
>   						}
>   					}
> +
> +					output_count++;
>   				}
>   			}
>   
> @@ -545,6 +558,8 @@ static void run_subtests(data_t *data)
>   			if (f->valid & NOHANG || m->flags & NOHANG)
>   				continue;
>   
> +			output_count = 0;
-->Here also not needed, above line ^
> +
>   			igt_describe("Check if injected hang is working properly.");
>   			igt_subtest_with_dynamic_f("%s-%s-hang", f->name, m->name) {
>   				igt_hang_t hang;
> @@ -628,6 +643,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>   		case 'e':
>   			all_pipes = true;
>   			break;
> +		case 'o':
> +			all_outputs = true;
> +			break;
>   		default:
>   			return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -636,9 +654,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }
>   
>   const char *help_str =
> -	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
> +	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
> +	"  -o \tRun on all outputs. (By default subtests will run on three outputs)\n";
-->OUTPUT_LIMIT is 2 so  should say "two outputs", not "three", check 
this...
>   
> -int igt_main_args("e", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("eo", NULL, help_str, opt_handler, NULL)
>   {
>   	igt_crtc_t *crtc;
>   	int fd;
--------------jnFm7T850qYlXse1uzppzpwB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-08-2026 06:18 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260821124834.1974029-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

v1-&gt;v2
- fix off-by-one error (Mohammed)
- reset output_count before subtest (Mohammed)

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/kms_vblank.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 47b733af15..7995528c3f 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -109,7 +109,10 @@ typedef struct {
 #define RPM	0x80
 } data_t;
 
+#define OUTPUT_LIMIT 2
+
 static bool all_pipes;
+static bool all_outputs;
 static int active_crtcs[IGT_MAX_PIPES];
 static uint32_t last_crtc_index;
 
@@ -476,6 +479,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 static void run_subtests(data_t *data)
 {
 	igt_crtc_t *crtc;
+	int output_count = 0;
 	const struct {
 		const char *name;
 		void (*func)(data_t *, int, int);
@@ -513,9 +517,16 @@ static void run_subtests(data_t *data)
 			if (m-&gt;flags &amp; ~(f-&gt;valid | NOHANG))
 				continue;
 
+			output_count = 0;</pre>
    </blockquote>
    --&gt;IMO: above line ^ not needed here
    <blockquote type="cite" cite="mid:20260821124834.1974029-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 			igt_describe(&quot;Check if test run while hanging by introducing NOHANG flag.&quot;);
 			igt_subtest_with_dynamic_f(&quot;%s-%s&quot;, f-&gt;name, m-&gt;name) {</pre>
    </blockquote>
    --&gt;IMO: It make sense to add&nbsp; ---&gt;<span style="white-space: pre-wrap">output_count = 0 here.. please check it..</span>
    <blockquote type="cite" cite="mid:20260821124834.1974029-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
 				for_each_connected_output(&amp;data-&gt;display, data-&gt;output) {
+					if (!all_outputs &amp;&amp; (m-&gt;flags &amp; SUSPEND) &amp;&amp; output_count &gt;= OUTPUT_LIMIT) {
+						igt_info(&quot;Skipping output %s\n&quot;, data-&gt;output-&gt;name);
+						continue;
+					}
+
 					for_each_crtc(&amp;data-&gt;display, crtc) {
 						if(!igt_crtc_connector_valid(crtc, data-&gt;output))
 							continue;
@@ -538,6 +549,8 @@ static void run_subtests(data_t *data)
 							run_test(data, f-&gt;func);
 						}
 					}
+
+					output_count++;
 				}
 			}
 
@@ -545,6 +558,8 @@ static void run_subtests(data_t *data)
 			if (f-&gt;valid &amp; NOHANG || m-&gt;flags &amp; NOHANG)
 				continue;
 
+			output_count = 0;</pre>
    </blockquote>
    --&gt;Here also not needed, above line ^
    <blockquote type="cite" cite="mid:20260821124834.1974029-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 			igt_describe(&quot;Check if injected hang is working properly.&quot;);
 			igt_subtest_with_dynamic_f(&quot;%s-%s-hang&quot;, f-&gt;name, m-&gt;name) {
 				igt_hang_t hang;
@@ -628,6 +643,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'o':
+			all_outputs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -636,9 +654,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	&quot;  -e \tRun on all pipes. (By default subtests will run on two pipes)\n&quot;;
+	&quot;  -e \tRun on all pipes. (By default subtests will run on two pipes)\n&quot;
+	&quot;  -o \tRun on all outputs. (By default subtests will run on three outputs)\n&quot;;</pre>
    </blockquote>
    --&gt;OUTPUT_LIMIT is 2 so&nbsp; should say &quot;two outputs&quot;, not &quot;three&quot;,&nbsp;
    check this...
    <blockquote type="cite" cite="mid:20260821124834.1974029-11-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
-int igt_main_args(&quot;e&quot;, NULL, help_str, opt_handler, NULL)
+int igt_main_args(&quot;eo&quot;, NULL, help_str, opt_handler, NULL)
 {
 	igt_crtc_t *crtc;
 	int fd;
</pre>
    </blockquote>
  </body>
</html>

--------------jnFm7T850qYlXse1uzppzpwB--
