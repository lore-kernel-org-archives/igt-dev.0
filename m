Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A3FC61DBE
	for <igt-dev@archiver.kernel.org>; Sat, 29 Aug 2026 19:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8117A10E1BA;
	Sat, 29 Aug 2026 19:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNcz5YTB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1A810E1BA
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Aug 2026 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788030208; x=1819566208;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=bLxEeSvuYGfmyGH03OEOwe7/XNcMl0OQoqwUKp4+i4I=;
 b=hNcz5YTBUTjrXbcPLjLTXAhexIH5L9/UweUI1o2InLuorOtdQ/oksSb1
 IJPjDMvPucgXNF9XD4CSBWn9jYCdMKIcCz9lPMIdy5xgIRsnKWmC31lAN
 z8FxFhqQTxnob04MUkw4ehqD4xwT/9EL1HAKTZRy7str5HdpLlWi6oXO8
 gA3k9ntNf9M+My1ISFSxBXmI2UL+1fVJkNPisOrTATdHjOaieNvh6BQ/F
 OGYODkdxFK4MpBdKQb964UPpA67wrHYn87xIO0LUN6K4/01HSEpknYKmn
 KaNA3bW01bmvFTaxcJJB5po/6nhF1NmwOvCnpL2LyECJ48waELrvKD1qn w==;
X-CSE-ConnectionGUID: Q1RjcMdXRVmq3vsF7G+epw==
X-CSE-MsgGUID: WEYuUXAkRMaS6fnZxkmqMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="111275106"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
 d="scan'208,217";a="111275106"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 12:03:27 -0700
X-CSE-ConnectionGUID: yVqdPb7BSMG5RlgtW+DadQ==
X-CSE-MsgGUID: 93KHDw2TThqLTlf761VoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
 d="scan'208,217";a="262331040"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 12:03:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 12:03:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 29 Aug 2026 12:03:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 29 Aug 2026 12:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoTCF9H7rU4agQR4nTkibu58+PtiSoLlzc4XRaBZ+rIZiRZpcoJ5gK4o4sz/fA9da06yczqaTLQBmVwxsUBp1Qm4ryoKoYd0WKJKtbF8yrg8MZ3fFGEwVlzlW3zdKMiFNoiehpI/zROFcudOhcu1abAkeNeRvgv6gtriGRE5mIVJTKjajaOvDB8OwBjHTqRartjEPDSD5zRcev5NvnR6j/c7INCRA2OLlTEryy776ho6zxHa9qQ8L0IAxfLuI30J0uy38JnR3hkMTjD6EyDDNYR2ft7Nn9ngp+sUre6E7LNZHQDSuIjaK5ht1uJ6ASyfdlf1xe6Uan/g2Q1Zf0KmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/31IERj5iKcRA1+4lrx48DohW4Oo3F0fiXC7K81wt+w=;
 b=OsUSGVJwbQ8Mi1PrxVP5gINuy9AC1wG0Ja0uZ3kvphz6jFoa/2GNWPqLhWGRBPG42cSJ+PvDTbsbiUQlBe89Vr0IQQEaiubN3/DChQifu9+xwj3ETjNopK1JEj0jHQ2JtjInLOGwsmKHeN+R+pjP8MLWOXkbL24ODAjfVlKQ+nWR46t8W+LBHK69sc6lEwr7+VrfA/yIRxb9da3UGpYdUaC5UuOG9J9RftX7f+ZGSo+4iXr1pMurmr1bcO5zYz4P3gzDuhi50+wZ3xZMFAgOu4GUNfHttQav+iYOkE1BJZRAs03VfvzpekYEZcSZ467pvfzHbcEZ/bCOJe5/hVyc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 19:03:16 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 19:03:16 +0000
Content-Type: multipart/alternative;
 boundary="------------20A0a7Sf8FixWJflnUWs8rVO"
Message-ID: <69330337-f6af-4a7a-92c3-41e04ce244c3@intel.com>
Date: Sun, 30 Aug 2026 00:33:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 08/17] tests/kms_psr: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-9-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-9-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::16) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 95300640-b4cb-44ce-9894-08df06002e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|11063799006|10067099003|5023799004|56012099006|18002099003|22082099003|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: 0AL7LPKMvld1Jmx63baQL/ApMwuLbdLCgkK/v7rI1pClqTT8fSGj9Jn8LcMMMG7HQvvN0FAq+kY1OvFXRU4kUCxuuvJLuSiGgGFxCdqnH34XjQAqHeAPKeu9lBwNmI/7Nr6ZUqGL2xOiNOjX1qK1LAxrrc8vEga0dcbqcXA/DeTbFAhVCtgWP7uU43pVliglrsi98lmDgzHyW7cuI7j80njWibem4mc3MJDZyOi58BoBNpz9cJRnavAEb4h22Xs26Wr2YzTbXWxcnQ2aWKsKZR2VluER2kKxxgVo+jKQ83g2UqsE8FOA/0mWg78y/gtZYGTW51hpDxi6pR2zZ8fSNVjCnbRkiJM6/ZsyFTeseuYa3cNZaqS8Mx3vJIRAR6JxBzV9Pe7vdIsiIXOezy5xSNCQPKPuJGzZei9TdSG/nM2PR/W/a11rG5cKay+4CrmVDv2tHNNixRFHNHApBHa2p+2i6AWv1d0BO4601Tson+rZ3rWF+LdIRzKjIcAzP4LPknP38e/MpdjDkDJBWhAedPuBIvVP4K6iEyTFD010w0h9m2NWWbDOTswQ77P63HuIQl3agCcpRPeQJbWp+cXz0dsottF1UVgaog5qlsOpjOglH7KKfbjDmfP3bZmfGLaiLUxd3qbzmFSSZmcxJy1vKKao0r1trakH4i4f3FEyBjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVtNkZVUnVoL2drRElGbm5xcnZUVnJySHp2VUNDOWllOTUvaWZFclRkWjZF?=
 =?utf-8?B?bWFtQ0tIMFBZUnlUMnZpay9UVW5ZYjNIV1VXbHB3TUNyVFNhQmcxVzBVK0JL?=
 =?utf-8?B?OGFJRFVUWDZVY3E5NVRFdnZkTkZVUTNrUGVzaGpXMUFIdkxCQ0NWc21IYkRG?=
 =?utf-8?B?aUFoWEgxNVRnQTYwY3ViTWxTV1krcm04UFJjWktkZzFFS3pxZGZpTmJGWkhL?=
 =?utf-8?B?RFA1VE1kUTNkalQ2V2IrQ3l1K2I4N1ZBb0M0UkY0bTJjUVQ5b1k5V29XaGdq?=
 =?utf-8?B?QnAvaW5KOG1kQng0enNuMFB5V0N6K0NjNm5Ic2JwVklub0FvY3FaRlpIMlV1?=
 =?utf-8?B?VE83cWltRWF2RnMwU25nNCtlMEcxdEpzTDFOYXpoRzZEcVBCNGptbWM0SGRi?=
 =?utf-8?B?N1NyTkluOGhPbHFmSTd1MTZPdU5MVjZrcmJjZ1c4R3lmeHI1MzJjOUhITTFW?=
 =?utf-8?B?ckFIYmUxVzYzZ3BWNVo2bFdhemowbXFDSHNoR3ZwWjJtbXQxYkpQdElwVVdq?=
 =?utf-8?B?eEVQOUhQVEtIUFZQTlBLbm50YzNyaklkUm5EVzJPbWNZSWg1ZlIwWFFOOWt3?=
 =?utf-8?B?akJVaE9MYzk4QmlZc1lIcDR5Qmw4bVJINTJ6L0drd2t0b1libFRlK05SZzJ0?=
 =?utf-8?B?SzBBblorNHQzVXAzb3pUU2RJejdZQ2xyT0hjWnpBYThuV3p2Vm5PMjJsa1Bv?=
 =?utf-8?B?cklYZzFTbUVGNDUyNVUzc2VrcEE3b3p3QUNwMFl4N2FiQ2NIbXJJYkNYN3ZY?=
 =?utf-8?B?Y3czK3M2RExrQUl1amkzRTV5NmVDWEg2WG5BdW4xWituOTNYOE12Z2ZBbHhk?=
 =?utf-8?B?Vm15V1R2bWcvdWdkSitaYmFwcjN1cDU3ZDg1N3AwckpxOEYzSlN3dEgwKy9V?=
 =?utf-8?B?ZDJvM08vWGZDL25sbXdmK0YyRWI5d2hXNHdjLzI0M1Y2NlcybGVYTGplZGJX?=
 =?utf-8?B?dS9MUmUzWXV2UFkzcEx1Z3FiU2dEYVd6dU1pWW5KeUdXQnFCWVMzWmFGS09k?=
 =?utf-8?B?M1p3NU8vMUpVRHJRWE1TR0lkNmFTSUN1REtKdU1mdFRSbC9KU0xSdkZCVGNF?=
 =?utf-8?B?UUxsTGt5Y2M2b09Ua0NMeEZNQVZROW5yYWswUlFwYU5sWkUxNCt5UnZBQVRs?=
 =?utf-8?B?b2huejFwWFBSYTFRZ2xkdzRRTTZDVHdCWG4xZFhEclJCWmdNaVcxcFhDVWs5?=
 =?utf-8?B?SWVCZ0I1aUR3T2k3V1R4TGkwYmhPS0VMMW1GTzlwa3RWSzZWdmFiejNPeTNt?=
 =?utf-8?B?ZERPRWNuWXZVN01qd0JQUzhTTnUrOU4yTkdubWg4S1FhS0NHM2k0QzMvNkNt?=
 =?utf-8?B?NUtBbGRoenpxWHh3Q2tSWWtBZzYwQmZqbXZuZVdwV1dUZWdmU2lRSmY4TWYy?=
 =?utf-8?B?dWlsdUJGd05wclpERk5yZkc2UkVjeDJuVDVwVktueGk1czJUaHRudlduTzBZ?=
 =?utf-8?B?SXB0NUl2UEpOeXpLQVp4czhGSWovMnVzMDZYbGxNSXJNZVplRFBnWHdJM0Jr?=
 =?utf-8?B?bC9QOE1ocmREUUpXaVZTRG8rNFRGV1JnSzNiakxIMmtidk9rdHlScUZMdmZJ?=
 =?utf-8?B?ZE5XcGx6NTRRb3dGdGRWVnF3ZEV3OWh0c25EWmJraTQ1ZjZNbElQeXE0NnF6?=
 =?utf-8?B?QlVVbVAvYmY3aWtZOHpIZ1hEQVhFc2dNa1I3aXFHblR2TDUxZEw3UUtGMEdp?=
 =?utf-8?B?SWhGV1VKSXRlcWNuc2VFV1llVGJkVnYrSTdOMXJCZUlRemtQNVNUMXBzalp5?=
 =?utf-8?B?eWlhUGFCZHdiODk5cExLaFYxQ21SSFUzY1Z0a1lYSkViL0pubW9jSEpqV3JQ?=
 =?utf-8?B?N2FLcnk1VCtlUWtJMzZYUi9QcUlIclhhdzM0UEdJK0N2c0FZZ2htT2JLYVYr?=
 =?utf-8?B?MnlPU25rRFo4WVVFalphUFV0QlN1NEFuSW53c2dKcDVsZGFjRS9icTh5ZHhT?=
 =?utf-8?B?SWF4TEtWOVB1TE51aHpjK2t6dGpnNnZCengrZGhrUkxsb2ZlTExsUHhOUGZm?=
 =?utf-8?B?Vkc4V3NjQzlweXZsWStnaXBnclFzTzVLUmR2Z3JOSk5KRGthRjJHNzZjL05K?=
 =?utf-8?B?ejl3Yit1SXRNQ3M0QkVSd2tadzZpSFJ0Rm15UVU3R2NSSVFWMjdkVXZDVkJ3?=
 =?utf-8?B?aTJwTTF6Nll6R3NnRzZRREF3MHZhcVAzS0tabGF3VUt5RW9xMDlYZzM5akg4?=
 =?utf-8?B?R1ZxOGxoUmxKVGdXR2xJdnRrNXpmZjhXMVRKNzk5ajdaMlkzNDhsNEZYQTRw?=
 =?utf-8?B?bkhaS3FCYVNMWTFzaFNleFlMS2hvRlBWcUpDNVBjczZ2VkFDTWFCNldHSDN0?=
 =?utf-8?B?SFMvc3hDQU5QOE84eFdYTjVIemxSdVB0UW43SldsYTVDN0YvWS9FWGhXdzVM?=
 =?utf-8?Q?HvHcF0edf/AfogEg=3D?=
X-Exchange-RoutingPolicyChecked: gs0MJVypnif165WpzPysry9+eURMzS7nUSLIdgIisQDYGEJo/CiEwq3hSyWh9XooCbv5ViboUr/XVLZwnTYbH4wdiMESDScZLlHgVtyG9zs6z7r9YbMs/5pF9MW06Rga/8KDWXBgE1AdI2R1bnZPdCiHAf+esdac11MqtC3XD+5lSXIJ8OtmOKJNgbX8RDwx9Ih7TJJGILanc056EHCC9N//QFqcT2l9ReqYq86SbtXR3Gh9e8mzs/kVR5it1hfVE+1MvefKQeQLr22u0MbseROkBkcVquKCdD/yjf+oHOQ6AAqahtzn1lmPqe9hHZcVGmE6MkXeeLKg8g1QsVCj6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95300640-b4cb-44ce-9894-08df06002e4e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 19:03:15.9606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/xbPnUD1Kzb4BsYxiwi4IN/9m9e4sRYIbP/bW8eTP0OlyXjg+22UIZ1Vm+kHNEcWdUxWF1lybPmNVKmEJgo9n8QMxyBH3zKBJoHJw1W9dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

--------------20A0a7Sf8FixWJflnUWs8rVO
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
> v2->v3
> - remove blank line (Mohammed)
> - change output format of help string (Mohammed)
>
> v1->v2
> - s/OUTPUT_LIMIT/SUSPEND_OUTPUT_LIMIT/ (Mohammed)
> - fix typos (Mohammed)
> - fix off-by-one error (Mohammed)
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/intel/kms_psr.c | 28 +++++++++++++++++++++++++++-
>   1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 7b02dd2072..7d1a303864 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -275,6 +275,8 @@
>    * @plane-move:         Move plane position
>    */
>   
> +#define SUSPEND_OUTPUT_LIMIT 2
> +
>   enum operations {
>   	PAGE_FLIP,
>   	MMAP_GTT,
> @@ -318,6 +320,7 @@ typedef struct {
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
>   	bool fbc_flag;
> +	bool all_outputs;
>   } data_t;
>   
>   static void create_cursor_fb(data_t *data)
> @@ -767,9 +770,27 @@ static void dpms_off_on(data_t *data)
>   				   DRM_MODE_DPMS_ON);
>   }
>   
> +static int opt_handler(int opt, int opt_index, void *opt_data)
> +{
> +	data_t *data = opt_data;
> +
> +	switch (opt) {
> +		case 'o':
-->IMO: case should be at the same level as switch, not indented further.
-->With this change:
  LGTM:  Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> +			data->all_outputs = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
>   data_t data = {};
>   
> -int igt_main()
> +const char *help_str =
> +	"  -o \tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n";
> +
> +int igt_main_args("o", NULL, help_str, opt_handler, &data)
>   {
>   	int z, y;
>   	enum operations op;
> @@ -945,10 +966,15 @@ int igt_main()
>   				     "performed with suspend resume cycles");
>   			igt_subtest_with_dynamic_f("%s%ssuspend", append_fbc_subtest[y],
>   						   append_subtest_name[z]) {
> +				int output_count = 0;
> +
>   				for_each_connected_output(&data.display, output) {
>   					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>   							      data.op_psr_mode, output))
>   						continue;
> +					if (!data.all_outputs && output_count >= SUSPEND_OUTPUT_LIMIT)
> +						continue;
> +					output_count++;
>   					igt_display_reset(&data.display);
>   					data.output = output;
>   					igt_dynamic_f("%s", data.output->name) {
--------------20A0a7Sf8FixWJflnUWs8rVO
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
    <blockquote type="cite" cite="mid:20260821124834.1974029-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

v2-&gt;v3
- remove blank line (Mohammed)
- change output format of help string (Mohammed)

v1-&gt;v2
- s/OUTPUT_LIMIT/SUSPEND_OUTPUT_LIMIT/ (Mohammed)
- fix typos (Mohammed)
- fix off-by-one error (Mohammed)

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/intel/kms_psr.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 7b02dd2072..7d1a303864 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -275,6 +275,8 @@
  * @plane-move:         Move plane position
  */
 
+#define SUSPEND_OUTPUT_LIMIT 2
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -318,6 +320,7 @@ typedef struct {
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool fbc_flag;
+	bool all_outputs;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -767,9 +770,27 @@ static void dpms_off_on(data_t *data)
 				   DRM_MODE_DPMS_ON);
 }
 
+static int opt_handler(int opt, int opt_index, void *opt_data)
+{
+	data_t *data = opt_data;
+
+	switch (opt) {
+		case 'o':</pre>
    </blockquote>
    --&gt;IMO: case should be at the same level as switch, not indented
    further.<br>
    --&gt;With this change:<br>
    &nbsp;LGTM:&nbsp; Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;<br>
    <br>
    <blockquote type="cite" cite="mid:20260821124834.1974029-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			data-&gt;all_outputs = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
 data_t data = {};
 
-int igt_main()
+const char *help_str =
+	&quot;  -o \tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n&quot;;
+
+int igt_main_args(&quot;o&quot;, NULL, help_str, opt_handler, &amp;data)
 {
 	int z, y;
 	enum operations op;
@@ -945,10 +966,15 @@ int igt_main()
 				     &quot;performed with suspend resume cycles&quot;);
 			igt_subtest_with_dynamic_f(&quot;%s%ssuspend&quot;, append_fbc_subtest[y],
 						   append_subtest_name[z]) {
+				int output_count = 0;
+
 				for_each_connected_output(&amp;data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
+					if (!data.all_outputs &amp;&amp; output_count &gt;= SUSPEND_OUTPUT_LIMIT)
+						continue;
+					output_count++;
 					igt_display_reset(&amp;data.display);
 					data.output = output;
 					igt_dynamic_f(&quot;%s&quot;, data.output-&gt;name) {
</pre>
    </blockquote>
  </body>
</html>

--------------20A0a7Sf8FixWJflnUWs8rVO--
