Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD93FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26510E1DD;
	Mon, 27 Apr 2026 05:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ko7o9lmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B63710E1D3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777267092; x=1808803092;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Tg32YJp8VgBtA6mDzdbBBegfclFt1tCrz8AlNIoEiw=;
 b=ko7o9lmXfFZ0qSzVajwQ2K57lu06NJftd3OlK/I5Xnsolp1a+BFf4caA
 9t0d5bY2i1/8POZWrWcbychZQmCBQNw4uKVHIhxZnDrGpMhaOXSw67HEE
 EGbfIiR+p26yB3kqRSuDMLtOFGZpnCCmChT8sc48h5zJ1NcOLJS8rWPjR
 P9uXG/UK723BPD5l1WCSyeQchDDyeIFSFEYqx9WL8MNR+yW2bMwncc1GG
 vXdtXvj+loUBBaZ9X1M2KMkhS+KQm4G0mPArq+TmdaHA8eZxA9x3gMQYg
 9soYtAQTHnP7kMIePTJS2rFrYjr+431XZwmFHGMKxO+GBemhylMtcAZ5f Q==;
X-CSE-ConnectionGUID: V6EatLPQRo6KCWS8YIoGJA==
X-CSE-MsgGUID: Zldrsn65T2u8IuoKP914nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88460753"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="88460753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:18:12 -0700
X-CSE-ConnectionGUID: sM3A9C9rRhWN0osQtKYF0A==
X-CSE-MsgGUID: e2fbh4/oS8SEbEg/4mJVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="228965914"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:18:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:18:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:18:11 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RimxQnTnRSpFdKK2AdZIJ2OjJiSygeC4zJRzXAasY4GaKAtAfOwEZnSqVnA5ehBWpfO/xMqyBT50aB4BEJBXbourF1TN/gXBLNr2Yuofnxe6ZxS360cii7H3dzbmFBAS1o9d5hLFV/yHJsBnaL5uT9QRqZ03ecdL7sLRW0HcEKjvk42aFnQMgkIgvQwcpNyDV2VwQaWdZmwLXglSf4Pcm1m0G/jgEitbPnbI3PyxwZm2ovj+52OIUQXoeeBFsmNe8qiKqz4xyHcM2q0c7ndEFaIV+aCstwx5ucZHNEm93kZTK3q+Dx8Is7aMYb6LJsQL1g/HXktXddCGPnrdsfTgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5faPGKUDsim+sPgtLNN34GUh6wpM3m7QWe2fRjoKyWY=;
 b=aTqYpAp4uiPc+bWedyn/m0Nw9b8kRDLdSbvi/yOMywNu/JMh4iVm6k1xqI/OX1R3ffgJ14KU4A+8nRi1ZwC9x/01jogmhDmLV365tIdDRUbYoqZYloovMlNjDzqnaNiA+r1Ll6G5GBaO+GLfgp1kRIJS4+mhxKy9PqbvB34ES7cyF5l7w+rmeuujp/pvtrvY9iNbqFKM13xfU66FZ+IFzWBRxOvF5zM9Jm0Uzap4pR4V3Ds3Cx8hQCbnbxRPnm2R2Px58wzKylC1qRmRBqZ/+Zh6b4AxI8rTm4cBXdgo6Jq/en8S7w/6+/ICQ1V9eOczgQn6nmFM6Z0mMZseQiVjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Mon, 27 Apr
 2026 05:18:07 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:18:07 +0000
Message-ID: <6d1bee12-3025-40cf-b095-e0b06d12c897@intel.com>
Date: Mon, 27 Apr 2026 10:47:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 8/8] tools/intel_vbt_decode: Dump dedicated_external
 and dyn_port_over_tc fields
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-9-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-9-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed9a91e-ce39-4e99-9f58-08dea41c5d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pcS5z28cC6fGC2hEDHSsg0t2/2x2UEFCzxiNKGVg6wCbNStFYDYRPE1Swq+GYlgD9KIc0L22xhTlr0GtO97EPnJ2JmplqwkWF8RuskDO2Dh/P1RhE8C0ZuU8Ftwr3+l3M6LQdCenFceqvkk4YHPnp5ZnkUvgCGINskHZ3iXNTMrKGX9bRnEsKPwW74PyDHSazYifvOoeZ7Ff2BCMRSwHcWuXqj5c6WCmECt7UGcdPdGeZre5/xv/o+yl75DVPIObfoqgxc075NMXG1q+Tgdfj1/ZbseFXgDG8IYWGRWLob2jZvJUng/TlZ5GGGbpWY63qF8ayj2esnXlC24lSZdA7TGEpagWBASZrrF86k3KShWe3OeIdd5AZynhWolWdTkv7g9vVxQQHhRmrMXMis2cxH4glX1/IIpEeX+tMwiXxakf6nDJp6BFk0HI+iCWCNxwF27v0ZIGru29Wm5rpI8Qh7w73/zk0j2G7UqFL/n16uSzSe13eLi/6tNyjz3b8/YrZoyGRoRBLM/1LCkpnuVyCoWJDys0tzw9Ug5SGe1ZxzzqEMIMcrl3SsINMTXJnzDiqtbBV8mHX7dukK/PS6ssVwDN0HQ/gJ9OlqVmhE5CfnlKXIo0BY/rrGOtmhNuR9s6IL/MOKElkxe6mC7pO6JPYzQMW7ASIGtbkTs/+R+O0n0Hw4XXAp+oq6pVaz49Y+/OKO+Su/KfH/ZnNCOn+oZM9V/sN09chcpzynXnPErEtQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFvbzRPQjB2N0FWS3RJL0pXc04xK0kveHo5WlY3U2xoSUhyMWlPOWdCMFVm?=
 =?utf-8?B?YUk5eC8zMHJVdTltNmFGWW9qUWpaZkdrVjZoaDBFZnJjRXBKUzVyR2tNSVBX?=
 =?utf-8?B?M0FDY0dmY2RIZlZ6anJaZStaeWJFZUpmUER5cXhzZVhEaEFZdlBWRy9Ld2xy?=
 =?utf-8?B?NkR5QW94TUpReHZLN3Vsd1JycXBxaTFMYStMa0FWMmIyT2wzRUtaL0VMVCtT?=
 =?utf-8?B?MU9oTE1CcjhqTXQzVmJTazlpa0RPWmQ0UFBPaVFVOU1tQkpocS9KeWRFK1Av?=
 =?utf-8?B?NjF0NkJvcTdvYVFPZGZha3RmTXVBQmNFRGhCZWJzaVJIQ2FJRlZxR3BhSWky?=
 =?utf-8?B?d2hzNDE3Vy95R1k1Z3BCUExGOUZGQ1didE83RDhPTFZWeUxYYnhIbGJYbUlF?=
 =?utf-8?B?OWFKR2RpSGdJRDhONDRmdzNqb0l0MTFLcmVNRFVUbys4NzNqTUdxU2dIdUlS?=
 =?utf-8?B?bHQ2TldvdUxVeWVSUU1ZWDRTTUs1TGg2c3VvaXBkN0pPK280dHZPTWQyektI?=
 =?utf-8?B?amZ3aWtnaEhLRXhrRUFhUFliTkRkeWVBdmVKbjN1MnhkTWloZU1iNi9KRlZa?=
 =?utf-8?B?RE9PTG1oT1hTeElobFE0WThFZ0lmUDNucWlOWW9XckpLVjR5dTdGUE03UkRx?=
 =?utf-8?B?UlpqbzV0MjY0Mkx3em9TZHR5WUVVR0l3R2ZjZ284bHRqd1lIUXVEVzUzdXVm?=
 =?utf-8?B?Y09EQlRSVXJEUDZjbmw2cXNYaXgwMFQxd3lqMWpaSTUzVEdIWEpVOFJldzl4?=
 =?utf-8?B?cXdwNTJsTUswVE52TTc2ckR3dUdxbzJGL3hSVUM0NWl6YmdZN0VmRTdaT3ph?=
 =?utf-8?B?RTBkMi93T0EvUlQ4RzZveE9HcGsxRFpvNlpsc01PTGx2T1ZONXZPbWdXdDVm?=
 =?utf-8?B?QStJNXdTVTE5UmxZSC9jVmg2MkFFYVJUT2JQUEhpVjlSQjJxWTNUZEVyZnl5?=
 =?utf-8?B?OXgxc25pWm9JajBEd1dsNWh5NTB6NUM0WVYvcFZSaFlkY1dkSW5ZQnA0SXNy?=
 =?utf-8?B?cG82YTY5dUpac2FoVVZvd3pJdmdGbC9keFdsQlI1eXA3YjI5TGN2cXFqMHNZ?=
 =?utf-8?B?M2hMczlXNmpZMVB1VzROdXJxemNNVkorblQ5M2NvL2JOUWZkMW80UVA1TGRH?=
 =?utf-8?B?cStwSWZObE9Ya1BGOVMvR1Q3bUszRXVFeXVkOS90cW5VUUN0aU1lUVRlMHNN?=
 =?utf-8?B?UjZIdWdqanhUVEtZQUNXTjNrOElvcWtKeExtOHlnaSt4NFVOaWlhSnRUTW1G?=
 =?utf-8?B?ZWREZkVxOTNTRXhTTUZDRnVkMU9aekFsR0FNdDJYWUVtRU9vTlF3MjVrMnI0?=
 =?utf-8?B?U1QxWEQ4OE1uSW9CTXo1ME5WQUFmd3J0c29PM09XQm91WkpmZGVaQ2Z6YTQy?=
 =?utf-8?B?bG5QcmRlQjBDZjkrVVNNUU9GR3ZxTSsyU3pwT05Wa2NIL0poZGNJdkVyajNB?=
 =?utf-8?B?YkxWUjFxR1pUL3YwbjBkT1dUUVZsZ1g1TnBBZ2RBbVFCYUF4Y2FJZFNpSG9a?=
 =?utf-8?B?ZlYxbEFnREhnU2pTWGtTK2pDcWpSWTNxZjhkNDVOSVp6RWRiYy93ZFNSOVdB?=
 =?utf-8?B?SzhneU53aDgyVVM2ZkdJaGZ3MUJObzhOeDk5RlR0OWxldXg5dy9FNXg3VjRH?=
 =?utf-8?B?NlhJclhrOUFWL3JFSGhTZWFzdnRYbGhYRzh1cjNxdGxCRzFzOHUvWlJQNmN0?=
 =?utf-8?B?YlVJZTdRMXJiZnZBVTJrQjJLMElBVzlBRGcvZ1RnUm9mbkVWOHZ6c2RMb1hF?=
 =?utf-8?B?VzlUY0tLeUE0anNxUzJPMVpEY1U2TGhQeWRrM203K3k3bjVTZlBwU04yNnda?=
 =?utf-8?B?RnFSbXVtSG5meHlPUUF5N0lDcFdKN0FpTjAwdi95K21aS2toSndicnNtWG9j?=
 =?utf-8?B?OTZnV1NGUGpUNEg4dFNkTU14eldneWxpNlFZZ3JnMTRPZjVyQ2hpb3BvaS9Y?=
 =?utf-8?B?V3JFb0Y2MitiWWZFbGpBYTNkSVM4a0JlRnlLUkRwRUlHUE9Sb29iM0xPcGNt?=
 =?utf-8?B?c3hWdko5Q0NmZ0JtWXYybjh2YzlFY1ErZWs2Nno4YW1yUFJVNHZ1TXJWQ3Yv?=
 =?utf-8?B?cURLQlBpZ2dtdGYvOUxtSVBtbGwwNk5IbEltL01vWFNJZ2pjYTlQejgrdHJk?=
 =?utf-8?B?dllKV0tRTS8xdVlwZCtGc25jdXNnd1lidE1nc2xFR3dzMXhpMEZXTnB3Qm40?=
 =?utf-8?B?MDNDQk1GcnlxNkFsRkhIQXdOdEpabEhVQWd2d0JIS1dNWWMrK0pPMENYSVVU?=
 =?utf-8?B?Zi8vLzlNZndUbHpWVzVKRWRoK2hyMkV5ZE4rK2VwZ1Z4cHZqNUs5YmpLVGZ2?=
 =?utf-8?B?UUZIbkFwNjBGUFE3S3BxNnlERTF3UTY0R1prT1BMYUsvZ2JlKzcxZz09?=
X-Exchange-RoutingPolicyChecked: A81rcxJtYYEu51HebvC3oveteTIxkhXAgoDAENtQVBLUYcouTAPnrcfLdHZlp6OImugqVaMg0EfiRaZNkuVwdG31b1MBg/ux1NaYrE/IfnUzwwxPbRpLtyniG00wkCaLED82OeJsc2FAQI4gkXJNrWONFnrfSwqy/errnfs1+/bsoQxp/ubNqMjqVU9/zWR4f7semAS23hl+H8HIoNZl+J49M0jamLSM7YkGM6Ut3pUfurYKfk/02VkntxcE3IxNasNvr7k2M7njz3Qx+hVQUciNe4k0Q4MRoSzS2ZGDKNdE8KEqrkgn+DTsIES1gCU2oOOT8zHFe9IbTDtgkm6KcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed9a91e-ce39-4e99-9f58-08dea41c5d6c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:18:07.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxnjLPCHXTHruoPMbFUZVg/Xqx0z7MoQR9icEFP3jeMP0Hew+rloLCbKk+HmiuzjUqJxGJZCabt2adCksl0wtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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


On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
> VBT version 264 adds two new child device fields: dedicated_external
> and dyn_port_over_tc. The dedicated_external field indicates TC ports
> connected to PHYs outside the Type-C subsystem, while dyn_port_over_tc
> indicates that a TC port supports dynamic DDI allocation in TCSS.
>
> Dump these fields in the VBT decode tool.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tools/intel_vbt_decode.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index dbc92e12a39a..1f4545c8e10c 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1317,6 +1317,11 @@ static void dump_child_device(struct context *context,
>   
>   	if (context->bdb->version >= 263)
>   		dump_edp_data_rate_override(child->edp_data_rate_override);
> +
> +	if (context->bdb->version >= 264) {
> +		printf("\t\tDedicated External TC Port: %s\n", YESNO(child->dedicated_external));
> +		printf("\t\tPort supports dynamic DDI allocation in TCSS: %s\n", YESNO(child->dyn_port_over_tc));
> +	}
>   }
>   
>   static void dump_child_devices(struct context *context, const uint8_t *devices,
