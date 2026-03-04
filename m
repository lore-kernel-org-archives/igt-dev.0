Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F56BEB7ECA
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20A910E9B5;
	Wed,  4 Mar 2026 11:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+bfU+bW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3710E9B2
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772622318; x=1804158318;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=AOpzl8oL9QmiK3/P1G3pq1dSw59tRVqG9kqasMfoFx8=;
 b=S+bfU+bWNGvhrXbEKiJLpCPLn0XIGMhInpaIRNWhJiXMJNJxqzNTQLJt
 l7K6A+zeOF0rUPzlQl2caxtoy+GK6d2I6fE4shl/B2Bh5DJhD0IBswIif
 knTxvCOtUbXtxAkOY898ZC5LtIqHNBpzpzg3ZZl7I4GBmWDjYb6JGdaOy
 EaAKaWeKOfz8SxKXyk4IsdmRfXjCb4sMWi8tkfCmSUjPkkV/afoOKRU5T
 1AxJcIJssK4IqDffFWX2pTxUkDgSbbckYJ0JK5diFeecvNUK2Dse/rgK9
 Myld+GG7Xa0hzCKNg6NqoZLpoC7Vb8mLAe3sPjqobasEMLm+CQA4KC47h g==;
X-CSE-ConnectionGUID: rZraFWeRSYm9m5yTIV7tFw==
X-CSE-MsgGUID: viG6T2CdTh2yiVgKb/m3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73806446"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208,217";a="73806446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:05:16 -0800
X-CSE-ConnectionGUID: HI09V+ChR/GkAc5TLc2Z5Q==
X-CSE-MsgGUID: 8N5yW2MpRoWjO1DwJjGUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
 d="scan'208,217";a="218267979"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:05:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:05:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 03:05:15 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fd7Jjviu4xWZPHBp1ceuhKUDZXQST1aU23V6UjdYM9EQmzTts2NhzN1TGzvbNuT2KZCJMpnA1DatSrnQbuB1dWboLVKUf7RqbZIiawS1gUJhofES3i+D79bHCuBBqLXcbF53MGt2OBV6c510PH1ysV/v6bXJLSoqorZyPTSD+3dV5ZaCjl34pqQnP6kSMzRuskCdtIEa34QfxEmZ9n2wCcgNm9yLKvfAZ2+S+1oafQl+utdZT2MZBtOQ0uyz0x7J2kWM5tqeYgJypiH3sEhfrlKcmmmj5WjDuW+D9eiWb8HBXTcydy+L+l9l+4ZEedRbVCQn2T4CSVobEzDmEI6gYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24PNy4pkJ9XGd5wG8O+UQ466OEZ6alqy9N/vqjshnMY=;
 b=r8LN4SxOGJA1oxwNAsYpGwE+0eZNpQinS7rcWdwOdhPtpZFC2k3XtkFFtzJkQL7IN7pL8zbsjaJQ7iEwknC3PSAVmLMCogRcNcTK6od6s7f8XGfPcJbABcIDkhXn1eJunZ4CVb1zSiuijAPKqfNzbimTw7hIvAKob8gTdgavMH5KD4E/yv6gBEZGG1jRQhal7yms29aneFynx9fOG5LRwTXRqdpt8Ju5MJPI+LXhxnh2qk3O/H3Cl/KmGKJus4WR3XQ9EU2mj7ubfwYD8F5DyXxBdddDr7LBnFTxVJw8qD2yjtvsOkML19oMWQnmKXfcOL1N1Xp0CChvoLZVlMtw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:05:12 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:05:12 +0000
Content-Type: multipart/alternative;
 boundary="------------6dbBmnxb1QC2i2f9wpdputkJ"
Message-ID: <8e405167-1e27-47ed-91c0-2bf8dfef8069@intel.com>
Date: Wed, 4 Mar 2026 12:05:08 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Feudebug=5Fonline=3A_Fix_sporadic_failures_due_to_unhandled_?=
 =?UTF-8?Q?fsync_errors?=
To: <igt-dev@lists.freedesktop.org>
References: <20260227114133.2850125-1-jan.maslak@intel.com>
 <177226851550.299193.8124718151164893151@a3b018990fe9>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <177226851550.299193.8124718151164893151@a3b018990fe9>
X-ClientProxiedBy: VI1PR08CA0210.eurprd08.prod.outlook.com
 (2603:10a6:802:15::19) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: af7937fc-b930-4eed-bacd-08de79dde7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: 8YzPq027oPNHY/6ZPYSuax2/qsuJS/yt2rK0j4OpieTfqLviBAI320lYn2IzQ5GphAGV61l2Xxy3Wpvl1CK8cKhZK6JFceh3fAoOExBlHVuvIxTVtqqa7TRZpx8RWVqb7zFVYwZdrYKlCk4W1NeKU+HkKSWnqBJicmc+DiI1LXt+QBdUp1NniAlgrrbYrRmHL9a+EC1nmivR1zPhA/YEeHuvxCkuQxjBFesQ3mZ1nym4nBPXNuVboT4edRFfpYhxWS5FN9eEfavHRLoaUe1/H9iVmj918ejbvsZ+TOAva8eYLvZ5RrdVvbDxkXm7o99h7rTczOFVFbMNs24CIpIfAt2jlIpD6tERjHCHIKZccUfZZsu/XlXoILh02SxgnEaYxY7O6/qNa2cAyMbPbYdjh6s9SR8swDw2mmylF2hy3BUE74IZaFntIh06DOJOln8FBvswRIhCN0nMjZD/AzVvDbCzp79DVhlhG54A9S5YWNkynJ448T2kAunDMAY/uJs1Z9yuyEKHEVJXBwqxWIV5K4wbm+8tpYIFrG5ibz3Pktue3RZMULrn1p/qrzyzuCww1Our5VKj6jaATQQXnnebVPZzLsPN8ecJA2d1wWxAmVtUxj0adu61t7sd2QlE8SLhPRVNBvs2pwrWTQXwk76PJ0WFxdx7QVXtwrjDEnPuL1rFx3JKfXKMdWXYOtM0M558
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STgyUytjeTBQSWZYNzNXdXJCMFlocTJBeFp3OXNnREZwQ09PSEl3cVpqNCtw?=
 =?utf-8?B?ZUxIRHRiK1ZJd25BWWpsLzlZWFk3OWJFTUkyY0NzNkRhV0E1Ti94T2o4MGU2?=
 =?utf-8?B?bW1TOGNNVWMzUHk5MlUzOGdiY1c1QXMzaGpGOVFYRjk3djRUcDU2bFhlNVo4?=
 =?utf-8?B?QnIxSC9lM2ExZXBLdTYvdG5yQmNIR3hGMUNVSEFBQXMwcEU4VmF0S0dySFpZ?=
 =?utf-8?B?ako0R1ZQQzhNOWFoS2VmM1FJWWJoc0EwVURVS0N0WFZuWW9ZQU9vOWtBL0Zt?=
 =?utf-8?B?QlNCWGFGSmNkamVrZ1k5S1orb2I4b1g4aGhGaFhFbm8xRFp5WUFWUmVTNCtl?=
 =?utf-8?B?dndacEx1WTIzSlc2cXRXMEZVdWgvTUFPNG5mQ0FrRm9WZldmSmZKNzZ0Rk9s?=
 =?utf-8?B?TGorc3pCOXVTKzYvL0RBdUxsYTdNcUx5OE96ZWJ0a0dIK0dPd1VPSStmUVBX?=
 =?utf-8?B?dnBJRnVHWlE0aXpJcklYNlRzSXZ2Ni9KYXc0YWJzRmc3R1d1RGUwem9mNHhw?=
 =?utf-8?B?aWpTeGJ4bmF5Mm9jK0lTc0Z4c1haMW0zUHpJditQZjdwRFFLUTJ4Yk50WW9r?=
 =?utf-8?B?VjZ2SHJPWkVzWFMvVUxycnJ0R0FmY0R6TDAwdFEzM1lkdEZLVUllRkZwWU9l?=
 =?utf-8?B?TndYT0g2ZElSS3J0QUtabjhMVm5FSllVNmpPcXhGa1dTVksxREJOOVhiS2U5?=
 =?utf-8?B?Q0ZsMWc5QXFrYjEyaVhxWHpzL3RqNFRwSVdKOHVac1ArdnY4SjllR0RFZG96?=
 =?utf-8?B?TldlZ0RYUWFtYTZ1VUFxRHk2WkVKR0xqQ3k0NlVHUlV5dzZWdTlpam1kRDk3?=
 =?utf-8?B?cUwzTTVBbmhHM0pKeTAxQlR5ZmtCcDB6MytVbm9DUTZpUlFaWUtIWmFvYkQw?=
 =?utf-8?B?RWxKK3IzMmhoK1dnREpGSFA2Zm10Q2R3bmpaVG92SlJiUWhVZG9wTGlGWk04?=
 =?utf-8?B?OHBMVHByMDlFOUFMS1VteXZsalpyUDc5MHVKamtCNUZIdkZCcUI3RXlNcWdi?=
 =?utf-8?B?RUtjZ1RBY0hUeU5TWDFqajkrOWxGREcwRW1YRUVOQ1lUejk1eDU5aVhrejJO?=
 =?utf-8?B?anBNRmhISGwrU0I1Y1JLeEVqd3oyY0toRlpoUmtzVkpLUmtyZXg2WWFmRjJG?=
 =?utf-8?B?cGhwLytRbklqdThLY1JsN0hOa1U5OE1yV2xOL2lnNGNZK2NTejhyNWRKbUk3?=
 =?utf-8?B?bkc0WHRodGlleDEvVng3OFpYakkvc2MxcWVJcGFqbVFoQUFXRVlnRW9DcHhF?=
 =?utf-8?B?SGRldkYzTU1WbFQvbmExaXZ3Y0d4b01HK2Mza3p3UjZkWlEvTFpac2x1TXYw?=
 =?utf-8?B?S1F0dEtuZ1BmbDZrSEtVNjBLYUUvOHdxb1ZSTXUxcDQvb3FpZWNTTWVlcU9s?=
 =?utf-8?B?L3dvOW5iV1llVS82dERnNFY1R3FoVnlQbFh0OUNVangwOUhCYitBOVBmcS9w?=
 =?utf-8?B?ZXFjcTNYdmNyNy90aEQzZlQxVzZqQ25NWUV6aDVwcjBrRTdrVTk5M2lVb3Rh?=
 =?utf-8?B?dnFNNVhuOXpSRGpNUmNFbnJBQVhQNyt6TGNtczl4cmxjZ1Q3WXhiUW5Ic3Ba?=
 =?utf-8?B?TzNlWU5HTGlvWlpUNU1UZEdncnlQaXRzaDU5R1FKeTZLeE04NnJBOWlCZmtG?=
 =?utf-8?B?Vi9zR3dkUHJ5Ylc1Mkg2aTl0RFpyUHhGSSt3WjlGdmlmRU10L3dNdC81QTFs?=
 =?utf-8?B?QTZ6ZE8vLy81dGJsU3drcEZmOWVzbjlDTkZ4WnJtZVdWeFFnTXRacTdGLzhY?=
 =?utf-8?B?ZGJwWUgxSnNDeGJCOTdJSzFmSUZSRFM2ak9NUFZpcTFiVUF3ZVZydWtZUVM2?=
 =?utf-8?B?VDZJcFZyZnJtTlF2cU96cFo5T25NTzNZQWZiVzVieFl4K1VweWFFWnMyVU85?=
 =?utf-8?B?cmVheDZsMzRGSGVKMEd3Q2hUc21Ka2xpak9ybDlUcyszRkdIdDNwTGF0TUZE?=
 =?utf-8?B?WlN2WWhuODFjb0xteUUwa2dMSDFjWVFmNXpMdHBOWjhhWXhDb3RxRnhPNWJo?=
 =?utf-8?B?NmZhNjNJcm9Nc2tOaUNpc2RObGhncUJlVDRrdFcrZGduWVBzdFRFeG5MaHlK?=
 =?utf-8?B?clBXK1B3d3ZTTEJWZVJuSjNzMUlHeXVkUG5TcXpjTy96MFBzZUxvR2JKeDlR?=
 =?utf-8?B?MmovNytidWcrZXh0WlFVMWljam9FOTVKdU1VRFJLOTRhSjROb0JkcnpUSG42?=
 =?utf-8?B?SnN5MFBvV3MzY0FPR2FYb2U2VXZkZmdNQk9KM0hCU3RzNnFtUnpOR2Qyc1Ry?=
 =?utf-8?B?dDFrNUQ1V3FlZGlTVnBwMk1rTm1kbGc0MzZXRU1FSS9reW9HUVhXWTloSEVn?=
 =?utf-8?B?QkdheWVPZmJpNUZrbHRLUUhVUkdyQlJaaXJ0NDhmUjBaaktNWDhBMnlrUTBB?=
 =?utf-8?Q?hn47F3aT0c/EZxYo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af7937fc-b930-4eed-bacd-08de79dde7e5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:05:12.3739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dRkfjzyh2XPKeq6dDWQy7alAvM7vIRGvfSsCY6eU1JSSREZ60eA2plH8B8Ji3npgM//81Z+y6sKsvSAeiG64bI4RIKghYKTvD+nxPqr8EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

--------------6dbBmnxb1QC2i2f9wpdputkJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2026 09:48, Patchwork wrote:

> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_eudebug_online: Fix sporadic failures due to 
> unhandled fsync errors
> *URL:* 	https://patchwork.freedesktop.org/series/162288/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/index.html
>
>
>   CI Bug Log - changes from XEIGT_8775_FULL -> XEIGTPW_14634_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14634_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14634_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14634_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-9/igt@device_reset@unbind-reset-rebind.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html>
>
Not related to the change.

Maciej


>     Known issues
>
> Here are the changes found in XEIGTPW_14634_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#1428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (Intel XE#6983
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6983>) +1
>         other test fail
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652>)
>         +17 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-negative:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@kms_chamelium_color@ctm-negative.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +7
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>  *
>
>     igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-0:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-0.html>
>         (Intel XE#7305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305>) +9
>         other tests fail
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_content_protection@atomic.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278> /
>         Intel XE#6973
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973>)
>  *
>
>     igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>) +2
>         other tests fail
>  *
>
>     igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@kms_cursor_crc@cursor-random-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html>
>         (Intel XE#6841
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (Intel XE#5354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1
>         other test skip
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>)
>  *
>
>     igt@kms_force_connector_basic@force-edid:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +31
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +17 other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-4k:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html>
>         (Intel XE#1470
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_hdr@static-toggle.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>) +1
>         other test skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_psr@pr-cursor-plane-onoff.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-7/igt@kms_psr@psr-basic.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +8
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1
>         other test skip
>  *
>
>     igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html>
>         (Intel XE#4537
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_sharpness_filter@filter-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_sharpness_filter@filter-suspend.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_create@create-big-vram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_create@create-big-vram.html>
>         (Intel XE#1062
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062> /
>         Intel XE#7318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318>)
>  *
>
>     igt@xe_eudebug@basic-client-th:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_eudebug@basic-client-th.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-extended:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-extended.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@basic-breakpoint:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_eudebug_online@basic-breakpoint.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@pagefault-one-of-many:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_eudebug_online@pagefault-one-of-many.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>  *
>
>     igt@xe_eudebug_sriov@deny-eudebug:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>)
>         +12 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>)
>         +11 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +20 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-basic-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-basic-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +23 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>  *
>
>     igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-2/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>  *
>
>     igt@xe_exec_threads@threads-many-queues:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@xe_exec_threads@threads-many-queues.html>
>         (Intel XE#7166
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +3
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-1/igt@xe_module_load@load.html>)
>         -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-migration-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_multigpu_svm@mgpu-migration-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +2
>         other tests skip
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-vm-bind-unbind-all:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579> /
>         Intel XE#7329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329>)
>  *
>
>     igt@xe_pmu@all-fn-engine-activity-load:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_pmu@all-fn-engine-activity-load.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-pxp-status:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_query@multigpu-query-pxp-status.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) +1
>         other test fail
>  *
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718> /
>         Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         +1 other test pass
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html>
>         (Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html>
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>  *
>
>     igt@xe_pm_residency@aspm_link_residency:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html>
>         (Intel XE#7258
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7258>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@xe_pm_residency@aspm_link_residency.html>
>  *
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>)
>
>
>     Build changes
>
>   * IGT: IGT_8775 -> IGTPW_14634
>   * Linux: xe-4632-568403859ba7182ce2a59553664b34d58467adeb ->
>     xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1
>
> IGTPW_14634: a1229ea4a137adf633535ff74751dba5faa6165c @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8775: 8775
> xe-4632-568403859ba7182ce2a59553664b34d58467adeb: 
> 568403859ba7182ce2a59553664b34d58467adeb
> xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1: 
> a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1
>
--------------6dbBmnxb1QC2i2f9wpdputkJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>On 28/02/2026 09:48, Patchwork wrote:</p>
    <blockquote type=3D"cite" cite=3D"mid:177226851550.299193.8124718151164=
893151@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_eudebug_online: Fix sporadic failures due
              to unhandled fsync errors</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/162288/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/162288/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14634/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8775_FULL -&gt;
        XEIGTPW_14634_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14634_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14634_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14634_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-9/igt@device_reset@unbind-reset-rebind.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14634/shard-bmg-6/igt@device_reset@unbind-reset-rebind.ht=
ml" moz-do-not-send=3D"true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cu=
rsor-legacy.html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@xe_fault_injection@vm-bind-fa=
il-xe_pt_update_ops_prepare.html" moz-do-not-send=3D"true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Not related to the change.</p>
    <p>Maciej</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:177226851550.299193.8124718151164=
893151@a3b018990fe9">
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14634_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</=
p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-se=
nd=3D"true">Intel XE#1407</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#=
2327</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1=
124</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel X=
E#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1428" moz-do-not-send=3D"true">Inte=
l XE#1428</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=
=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send=
=3D"true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_ccs@bad-aux-stride-yf-til=
ed-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">Intel XE=
#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6983" moz-do-not-send=3D"t=
rue">Intel XE#6983</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-=
3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-no=
t-send=3D"true">Intel XE#2652</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"t=
rue">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=
=3D"true">Intel XE#2887</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-negative:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@kms_chamelium_color@ctm-negat=
ive.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-enab=
le-disable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">=
Intel XE#373</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-stor=
m.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE#2252=
</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6507" moz-do-not-send=3D"true">=
Intel XE#6507</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_color_pipeline@plane-lut1=
d-ctm3x4@pipe-a-plane-0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305" moz-do-not-send=
=3D"true">Intel XE#7305</a>) +9 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_content_protection@atomic=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3278" moz-do-not-send=3D"true">Intel XE#3278<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973" =
moz-do-not-send=3D"true">Intel XE#6973</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@kms_content_protection@atomic=
-hdcp14@pipe-a-dp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send=3D"t=
rue">Intel XE#3304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_content_protection@dp-mst=
-type-1-suspend-resume.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send=
=3D"true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_content_protection@legacy=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" =
moz-do-not-send=3D"true">Intel XE#3304</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt@kms_content_protection@uevent=
-hdcp14@pipe-a-dp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6707" moz-do-not-send=3D"t=
rue">Intel XE#6707</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel =
XE#2320</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Inte=
l XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-64x21:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
64x21.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Intel XE#=
1424</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-9/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-=
dp-2.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-2/igt@kms_cursor_edge_wa=
lk@256x256-top-edge@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841" moz-do-n=
ot-send=3D"true">Intel XE#6841</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">In=
tel XE#309</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-si=
ze.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_cursor_legacy@cu=
rsora-vs-flipb-varying-size.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354" moz-do=
-not-send=3D"true">Intel XE#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1508" moz-do-not-send=3D"true">Intel XE#1508<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>) +1 o=
ther test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-s=
end=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_feature_discovery@dp-mst.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1137" moz-do-not-send=3D"true">Intel XE#1137</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#=
1421</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downsc=
aling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-d=
o-not-send=3D"true">Intel XE#1397</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1397" moz-do-not-send=3D"true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rc=
ccs-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/717=
8" moz-do-not-send=3D"true">Intel XE#7178</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-lin=
ear-reflect-x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bp=
p-yuv-linear-to-32bpp-yuv-linear-reflect-x.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/717=
9" moz-do-not-send=3D"true">Intel XE#7179</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscal=
ing:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-=
not-send=3D"true">Intel XE#7178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-edid:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_force_connector_basic@for=
ce-edid.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send=3D"true">Intel XE=
#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-=
mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz=
-do-not-send=3D"true">Intel XE#6312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-=
send=3D"true">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) +4 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-se=
nd=3D"true">Intel XE#7061</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do=
-not-send=3D"true">Intel XE#4141</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-dr=
aw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-=
do-not-send=3D"true">Intel XE#2311</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-=
send=3D"true">Intel XE#7061</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-=
not-send=3D"true">Intel XE#656</a>) +31 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-d=
o-not-send=3D"true">Intel XE#2313</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-4k:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1470" moz-do-not-send=3D"true">Intel XE#1470</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_hdr@static-toggle.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6911" moz-do-not-send=3D"true">Intel XE#6911<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send=3D"true">=
Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clampin=
g:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-no=
t-send=3D"true">Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_plane_multiple@tiling-y.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE#5020</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2392" moz-do-not-send=3D"true">Intel XE#2392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141" moz-do-not-send=3D"true">Intel XE#3141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-s=
f:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-no=
t-send=3D"true">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4608" moz-do-not-send=3D"true">Intel XE#4608</a>) +=
1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-=
sf@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
608" moz-do-not-send=3D"true">Intel XE#4608</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p=
>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-se=
nd=3D"true">Intel XE#2893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"=
true">Intel XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#11=
28</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@kms_psr@pr-cursor-plane-onoff=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406<=
/a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-7/igt@kms_psr@psr-basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-s=
end=3D"true">Intel XE#2850</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true"=
>Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=3D"tr=
ue">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_rotation_crc@sprite-rotat=
ion-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel XE=
#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-lnl-3/igt@kms_sharpness_filter@filter-formats@pipe-a-ed=
p-1-nv12.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@kms_sharpness_=
filter@filter-formats@pipe-a-edp-1-nv12.html" moz-do-not-send=3D"true">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4537" moz-do-not-send=3D"true">Intel XE#4537</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@kms_sharpness_filter@filter-s=
uspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send=3D"true">Intel XE=
#6503</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send=3D=
"true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@sriov_basic@enable-vfs-autopr=
obe-off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send=3D"true">Intel X=
E#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2849" moz-do-not-send=3D"true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@create-big-vram:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_create@create-big-vram.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1062" moz-do-not-send=3D"true">Intel XE#1062</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318" moz-=
do-not-send=3D"true">Intel XE#7318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-client-th:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_eudebug@basic-client-th.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a>=
) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-extended:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-exte=
nded.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4=
837</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@basic-breakpoint:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_eudebug_online@basic-break=
point.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#=
4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
665" moz-do-not-send=3D"true">Intel XE#6665</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-4/igt@xe_eudebug_online@breakpoint-=
many-sessions-single-tile.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-se=
nd=3D"true">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Intel XE#6665</a>) +2 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_eudebug_online@pagefault-o=
ne-of-many.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Inte=
l XE#6665</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-eudebug:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4518" moz-do-not-send=3D"true">Intel XE#4518<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.=
html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-7/igt@xe_evict@evict-beng-mix=
ed-many-threads-small.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-s=
end=3D"true">Intel XE#6321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_evict@evict-beng-mixed-thr=
eads-small-multi-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6540" moz-do-not-send=3D"t=
rue">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_exec_balancer@twice-cm-vir=
tual-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-not-=
send=3D"true">Intel XE#7482</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecque=
ue-userptr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" =
moz-do-not-send=3D"true">Intel XE#2322</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel=
 XE#1392</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-rac=
e-imm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-1/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-race-imm.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-d=
o-not-send=3D"true">Intel XE#7136</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send=
=3D"true">Intel XE#7136</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-f=
d:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-fault-close-fd.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-no=
t-send=3D"true">Intel XE#6874</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@xe_exec_multi_queue@two-queue=
s-basic-smem.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send=3D"true">In=
tel XE#6874</a>) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-sing=
le-vma:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pa=
t-idx-uc-single-vma.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@x=
e_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5625" moz-do-not-send=3D"true">Intel XE#5625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-7/igt@xe_exec_threads@threads-bal-mixed-userptr-reb=
ind.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-2/igt@xe_exec_threads@thr=
eads-bal-mixed-userptr-rebind.html" moz-do-not-send=3D"true">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-no=
t-send=3D"true">Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6652" moz-do-not-send=3D"true">Intel XE#6652</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-many-queues:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-6/igt@xe_exec_threads@threads-many-=
queues.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7166" moz-do-not-send=3D"true">Intel XE=
#7166</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalida=
te-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz=
-do-not-send=3D"true">Intel XE#7138</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-s=
end=3D"true">Intel XE#7138</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_eudebug:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-9/igt@xe_live_ktest@xe_eudebug.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2833" moz-do-not-send=3D"true">Intel XE#2833</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send=3D"tru=
e">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-lnl: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8775/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
775/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-l=
nl-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-2/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-3/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8775/shard-lnl-2/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8775/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_877=
5/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl=
-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-7/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-7/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-4/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8775/shard-lnl-4/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8775/shard-lnl-4/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/=
shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-5=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-8/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-8/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8775/shard-lnl-5/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8775/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8775/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/=
shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/s=
hard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl=
-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14634/shard-lnl-2/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14634/shard-lnl-2/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14634/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1463=
4/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-=
lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-8/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.html" moz-=
do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14634/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4634/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/sha=
rd-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-3=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send=3D"tr=
ue">Intel XE#6964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_multigpu_svm@mgpu-migratio=
n-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send=3D"true">Intel X=
E#6964</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-=
not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/584" moz-do-not-send=3D"true">Intel XE#584</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/579" moz-do-not-send=3D"true">Intel XE#579</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329" moz-=
do-not-send=3D"true">Intel XE#7329</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@all-fn-engine-activity-load:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-3/igt@xe_pmu@all-fn-engine-activity=
-load.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4650" moz-do-not-send=3D"true">Intel XE#=
4650</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post=
-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel =
XE#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-bmg-3/igt@xe_query@multigpu-query-hwcon=
fig.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944=
</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-pxp-status:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-7/igt@xe_query@multigpu-query-pxp-s=
tatus.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#9=
44</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-twice:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14634/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6569" moz-do-not-send=3D"true">Intel XE#6569</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14634/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4273" moz-do-not-send=3D"true">Intel XE#4273<=
/a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-ato=
mic.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3718" moz-do-not-send=3D"true">Intel XE#37=
18</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607=
8" moz-do-not-send=3D"true">Intel XE#6078</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-8/igt@kms_async_flips@=
alternate-sync-async-flip-atomic.html" moz-do-not-send=3D"true">PASS</a> +1=
 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp=
-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-ato=
mic@pipe-c-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6078" moz-do-not-send=3D"true"=
>Intel XE#6078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14634/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-a=
tomic@pipe-c-dp-2.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html" moz-=
do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4760" moz-do-not-send=3D"true">Intel XE#4760</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-lnl=
-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html" moz-do-not-send=3D"true">PA=
SS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7258" moz-do-not-send=3D"true">Intel XE#7258</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg=
-3/igt@xe_pm_residency@aspm_link_residency.html" moz-do-not-send=3D"true">P=
ASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html" moz-do-no=
t-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6569" moz-do-not-send=3D"true">Intel XE#6569</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-5/igt=
@xe_sriov_flr@flr-vfs-parallel.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-1/igt@k=
ms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-se=
nd=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8775/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send=3D"true">Intel=
 XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6652" moz-do-not-send=3D"true">Intel XE#6652</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14634/shard-bmg-4/igt@xe_fault_i=
njection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D"true">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
466" moz-do-not-send=3D"true">Intel XE#5466</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8775 -&gt; IGTPW_14634</li>
        <li>Linux: xe-4632-568403859ba7182ce2a59553664b34d58467adeb
          -&gt; xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1</li>
      </ul>
      <p>IGTPW_14634: a1229ea4a137adf633535ff74751dba5faa6165c @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8775: 8775<br>
        xe-4632-568403859ba7182ce2a59553664b34d58467adeb:
        568403859ba7182ce2a59553664b34d58467adeb<br>
        xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1:
        a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1</p>
    </blockquote>
  </body>
</html>

--------------6dbBmnxb1QC2i2f9wpdputkJ--
