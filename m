Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FE4CA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 09:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEFD10E1E8;
	Wed, 30 Sep 2026 09:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjvKdQuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD66710E1E8
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790759826; x=1822295826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WJlFBZKc3J0vnTKuJl+ZMYkrtPdlu8VqVLbFapmT4rs=;
 b=SjvKdQuhgKiKZb9yj0R8JrlUSKMBDCC1xBUQNClpBdzdF4xmbGH0ebTt
 we5e7Vhe6s4EL//0hDeOVUoOc8wPlR54NDheJlsKsEFsiqIai+cP4iERw
 hC2Dk+A/5Gt/tyTcqCnQCPBt08mnKRz7UlpzSUGdsUz725JQp1zSZKCfo
 qLXVuo5jO3EVt+Q2S94uLkCzDoe13/4IYyQhfmz+ljXjc5bSGLARu08Fg
 Kpa4WYh5A5LbJNWbepXivpBQCSKwpR0Es0+fO/5Zon/00KvV41NUL3XBG
 RLmF2jX++2+oWqdTD3mdvcl3GUYBlBRAEo0x/48r+FTPT9JXcRYWXTLaI Q==;
X-CSE-ConnectionGUID: aR1s3vP6TjmNeblfeYpBJg==
X-CSE-MsgGUID: dDNmX0IVT5ajc88j2iTC6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102167877"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102167877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:17:06 -0700
X-CSE-ConnectionGUID: JhpLGvj0RjagaGyTcdpUFw==
X-CSE-MsgGUID: 3LiXowExTXW/cbNwtNp5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="283717719"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:17:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 02:17:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 02:17:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 02:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9r5s8Cp4ZqGUzxnpLEwSM9bBiLlCz2MzjTQ4sGTL83uQLfkzQZDn+lJQifkFP6Az7VBtvbbLArRaL2OQYiTYa4XxuetpvGiODWNBKjM9mAw+8EwIGK5beXFgaiikfywoxOJpoy5Q2rTkhLar0dC+w0XSUe5RFhG9bfcfmYVRkNirfLNHVDUd55BqFQeMdjkpVuU1MN9pGbtq6yoqdY5MRMmRNAFNS4bIWl1Rg72EG26QkwguoDtwh3TMLb7imC1oJKllnWb3991QYQxj8pWOXbPOjZgcxkUDP/N2SIklYhkOEGQrvPvS70aJ5csA0yg62XQvmcsAECjLGGzzyPyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewgRTzRhKvSzJQMjok7lqBGV2I5OFCkF0+YTqHzXZA8=;
 b=QgpnWh2eliR+LGI/IYcyS3vQMjIOKv07/GGJhbdPpFegmmST2ZtHQiox4J/Lt0meUw1SE8Xz5DWkg1Lwwyy+D7r7fCGEqnVqYLAr/FvI1Dfb13F9mqgwOBhFyWXHMEeIEjXuLYyvi3witYZCqpvK9Tlrr4qrVljLRPsffRdD+8vWeO2ZJEntM1jYYY/az+x3fZ4nMDfDOuaOTusEwd06AeOSH126jh/bHcZaS8iQtvwflXesyv1Z0ecWdHEi2FIon4VCE7YYn0rWtdr4H24KLMzQ8Je1+dhHKJW09fKQv7QIj3A+9uvBk4P61GamYrmDstf58helduloHwuAOIDuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 09:16:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 09:16:57 +0000
Message-ID: <8c517bfc-3bfb-4387-8313-3ece896ee761@intel.com>
Date: Wed, 30 Sep 2026 14:46:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260929032354.1971070-4-sk.anirban@intel.com>
 <20260929032354.1971070-5-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260929032354.1971070-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: d315b22d-402c-4bdc-2f5b-08df1ed39379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: d+lMBpgzGi8K6mNvINvdo/9KWlZkBnZw19OyP/Qi7VxdLYJJQbR+KOu0VuSQtMKOBuPa/SmpNReCTM8X5aJomVRyIZ7U4GFo9k+/ORizGoDo5OaB2dFScFcNH8VffYrox1MF7vaz1ziL/5p4aVbwI43zI30xA2iQBFjtNEr4yFqEtoVl40X+g+Fj8uWi8g1qbXCL8IvbxfI+BsfPdJ7kIGF8Ddx5MUWhQuusrPQpPdK9cKcoTKaHlecF0iGBpMjrF5V7b/DOfnNfMKu1TTOS7GfUZ4Vx4YyPplClGnmZAq0quOaOia6gYDuNJuzzxcM4lakh+DW9aDlwt8DhBMzF6eYAwLmo3h/DmRgbBqbpQJpN7ymCzyg81CpMW8CT45/35SBmA36ciI7B5OKnr5CzdYH5eplW7tzRMvxmc8WkvPhaYRgGYC5uX6qUEpZWD636q5vY+UhEzY+4xcOZc6eXPi4hgs3VjFicqoNzBzpwXXYidNVqrlwkILGDprR80diZht28X9/Co+xnBDsOY6ujdq1FldyreeC63nwToWp85sHwsUUlkxUgZVOlqfqYiGWfWMQPLa/7pxzayoCaaiWwS2ZaAkJcx8YIadqqt0ly7dQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yld2VEdtNmJWZkM3a1I1c2JiTDgvSlBwa0NDTmE3ZVNrbm5KTU01UVZrMWVu?=
 =?utf-8?B?a1NIR01WZm13YmxFOEZJNWU1VHlib1pWakROVXprYkNjODNVOE80QXlXSDJk?=
 =?utf-8?B?VlNXdldoUU9HbEo3Qk0wd0c1VXlyaEtJTk1TNUs2VzVPeldxYjN5bnV3SEN3?=
 =?utf-8?B?b1NGOG1XNVBRbDZCVGFRY1p3dE1KRkdaRmtGWmY1QUYxSitRa1FpaDZJRkVl?=
 =?utf-8?B?dVdGcTkwNlQycjBPaGZmR2s0bDNFYVhCcUxZM3R4bEdDdDdCVUpSVU9ISFBs?=
 =?utf-8?B?ZUNRd2hYaHF4VDI1STBMQnRjc0tBUnhlUkFZb2VpVDkzek1OVVFjYWhIdGFW?=
 =?utf-8?B?ZVR6SkVvemwvNFRYdmxDVWFoajF1eGxtUGJJTEdOam5yNDVwUVlRRzdjdXJJ?=
 =?utf-8?B?cnVCVlVWMWpibFpTSGVUOFBiOUtRMVU3RWtVVXJ4MytNWFIwQ2V1VnZ6V2Vo?=
 =?utf-8?B?RmFwcWFEallOODNnSHBLS3pTeVFNUWViaWgrRlEzTXZQemh0cjRHcGM3RkZ1?=
 =?utf-8?B?RWZyUVpZZkRmVUE5Zit4Zk9yNUsvMVMzT0lzV3lJTEhlTWpOUDR4d0ROZmIw?=
 =?utf-8?B?Q203TjVGZ21rL3hzM0VMOXRVa1BtUG4wemtDSXl2dTJGN3VuVGFvOSt4VUd1?=
 =?utf-8?B?VCtDZ0poV3ZwbFR0ZUhuUHZlSFkrV3lrWUJzSkZhOEFrYjRQOHlmNll1dUx3?=
 =?utf-8?B?UDNyakdpRTdLVWcxaFViSzV0eGFZVzZLRG1PZVpnSHRwTGRWRjJrQ1BidHd3?=
 =?utf-8?B?TC82WkpIL1pFRFZ6YUxDY1pISFVPNkFxRUtuRm54WFIzSlpiZmFxWGZZNTRx?=
 =?utf-8?B?L3QvOXFtTy9GUU5SRVF5SVliOVBLbGlyc29YZ3M2cTgvTkJhcmNtYlpma1RC?=
 =?utf-8?B?R1didGhKcWt1b3BQRWU3RkhtTzQwQTZhZjdoRzFMc2VRWEZPOUllWmRMZlNG?=
 =?utf-8?B?cEpnZkZqR1ZQN2h2QmN2Z29TTWdyWlhpMEZSaVIwNXh3VTgxV0ZSM2t4dGor?=
 =?utf-8?B?UmtmanA0bXZ3bWExVzd2TTI3c2NqREFvMUdLbXNaL25IN2ZJV28vYTZNSUVV?=
 =?utf-8?B?OUpHL0srZ2EwUlQ3bm9SbXZrdFd2ZUJDTXlWRWFtSWUxRzNIdWc2Q2pqR3py?=
 =?utf-8?B?cjBTcmRnWnNsajVyQWZOa1dVWU0vMm8vakM1aCt2OWZ3a1ZOL2tVZWp1amIw?=
 =?utf-8?B?eS91UTBHQzlhTG55Ry9aVXM0OU4wNEZvR3RXRjl4L2pRa3RydHJjWXFzbXpR?=
 =?utf-8?B?ZmwrdEpjQ01ENE9HL1dROXpIdHZIYm1neVJDUm5nU3h4R2NlLzNYemtWclFm?=
 =?utf-8?B?Tk5uK3orbVh3MHNDejc3U3lVNHNVa3NhbEJBdGpBOG1qbGU3RHF3N3I5ZmZq?=
 =?utf-8?B?VElkQnRvTUlUeDllWWloVVV5b0NIVG01MVNLcXdST21FZE9NMnp5dGJTZGdy?=
 =?utf-8?B?OGE3WUIwN3dLampKSllyT3NsTHB6YkNneE5tbmZsYktReDNoOWc3aGd6YWw2?=
 =?utf-8?B?T0dGTUhtSWZUNUVrVk85Qi9QenJXK25IT1JuRmJObE9QTXZ2ZVB6c0l4MTUx?=
 =?utf-8?B?SzhwYUZGcUVKOHdBUEtHd2Y1ZGtpQUM0MExITVlGUWFsc0pVaGNwalZ5dnRZ?=
 =?utf-8?B?WkRTajFuTytPZW1zVGY0SThsOHhjNWk1QUJwTDFaaVZzbnl5cEVGMjlCV2Jk?=
 =?utf-8?B?NFd5aE5XN2pYMngvNzZGWThtZTQ4amRqY3E0bnF5aERpNkZjSkh2Vm1WWVNw?=
 =?utf-8?B?ekJ3VWVrZ1NRSVNHOWxsWmNZcXVTd1VsQWRMR2ZCYVdKeDl4bE5jY3JwL2Iy?=
 =?utf-8?B?V3dlMmtjN2RnSzdLaVR1eUJjcG1kUFJxYWxlM2Q4UXZBWXJKaGc2RlF6SVlV?=
 =?utf-8?B?SERMdlVOb3JKL0RZOHhNM3BQY2I0U2tYdWR1SlZHYzd0S1lQN1hRd3JRQTF0?=
 =?utf-8?B?cytvK1E1Q1FSVmpINHBaU0RpZzd0cHJIZVFxTlFOMXd6SDlzYTZkN1hQd1pn?=
 =?utf-8?B?bmRZUkhoaS9XdFlCK3FjQzBDSEpRR0lnTkxUeWFpcmxPWGdwaUR0UWVQUnNn?=
 =?utf-8?B?aUN3bm9RQzJnbC9yYUhIcTEzMTlVMTdjYitLOHJHbTU4c3NPS0dxUi9RN1hl?=
 =?utf-8?B?eHZqY002MHowRERPN3dYT0d4ZFEvU3hTRmtoaVNpcW5RSjdSK1AwOG5zK0h4?=
 =?utf-8?B?V1E2c3gzaVo4d1pFUDI0bXVEUHhEYXhDVnlFbmxzdVk0TWpMaldqVmxRTDVP?=
 =?utf-8?B?eS9XREJHOFR0cGRCeHhiT1JJRFVUVmhnVXh3VVBrdGs0NTBtOWFNQ0xqSThD?=
 =?utf-8?B?Nmd1cWpZUkwvbnZ3Y1lGQXFqdEVLTWszZ0tUS2NVZTU1cm04WjE3UT09?=
X-Exchange-RoutingPolicyChecked: yaTFiufXWlmA7AWG3gLXe+4LAtyb9C/6C17USnSCVEVUU14Ufeq77kk2hTjNYOgZSSeKkiiJfkTe6jqlO+CT/0+zAvQVBfjN0NtIBtPLn2mKWrq7eWitiN79wDwaonxZ/VSSoLSkTJ2+rBY0A2Xm0Mc68f31m4cKr1FA2zcbaus+qPcTt6l8KNG1xknkz8xtXo6PgKmEhP+BwJJ53H9l83WWK7qFSKPUVmZQ0TJNoko2XUq45qAXsxhMmEK0g/VGqajpW1eP0pQgnzIMVhG+pMB/sSb2Bx5yQbgUlDf2Zk0jmhBg7LnbaRaV14uuLfDiuBl4efOD8po8eGh09+Vvdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d315b22d-402c-4bdc-2f5b-08df1ed39379
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:16:57.4798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XOBt0Fe0hvrBZvofTwK6Y0OdO+gjmLj1D561EjNEkDB3DUJa7lTe21dFYvivtY71uR/QvZvFriR88k99Hu5cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
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


On 29-09-2026 08:53, Sk Anirban wrote:
> The kernel now reports -ENOTRECOVERABLE when the device is wedged.
> As runtime-survivability deliberately wedges the device, update
> dmesg regex so igt_runner does not treat the expected error logs
> as failures.
>
> v2: Keep older error codes (Kamil)
>      Modify regex (Kamil)
> v3: Modify regex (Riana)
> v4: Support sigid based logging (Riana)
> v5: Use constant sigid values instead of strings (Riana)
> v6: Fix strings (Riana)
>
> kernel implementation:
> https://patchwork.freedesktop.org/series/168780/
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tests/intel/xe_survivability.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 74488bbea..e63f2c063 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -43,12 +43,19 @@ static char bus_addr[NAME_MAX];
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/* this is needed for igt_runner so it will ignore it */
> -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
> +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: "
> +				    "(-ECANCELED|-ENOTRECOVERABLE)"
> +				    "|GT[0-9A-Fa-f]*: reset failed .(-ECANCELED|-ENOTRECOVERABLE)"
>   				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|xe [0-9A-Fa-f:.]*:.*-ENOTRECOVERABLE"
>   				    "|GT[0-9A-Fa-f]*: Failed to submit"
>   				    "|Modules linked in:"
> -				    "|__pfx___drm_");
> +				    "|__pfx___drm_"
> +				    /* SIGID-based logging (newer kernels) */
> +				    "|IOCTLs and executions are now blocked"
> +				    "|SIGID=[0-9]+ .*GT: reset failed"
> +				    "|SIGID=102"
> +				    "|SIGID=103");
>   }
>   
>   static bool check_survivability_mode_sysfs(void)
