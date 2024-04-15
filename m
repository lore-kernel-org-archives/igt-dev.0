Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F24C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 06:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B440710E067;
	Mon, 15 Apr 2024 06:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxO3N8ey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE7A10E067
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713163949; x=1744699949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XcCpjD++SaFW3Nr3cAvTy9CnH7FWaa6Z/XSKw1Z3oXo=;
 b=lxO3N8eyh1PpSKbGxCqOFfvQ9pPhVZyT17lr1TptXmj7BEYl3HkRRjH3
 zYFBZdIoBkuyrBDpy5Lz0peqV9LFxlYpQ2bMGqHnKFMaeyi8focZyEI7d
 8ga2MTLdnuFBzo6CKEMRCD4F42ulc+pkPFXLLojSl4SRc4b616LI/PtVs
 6S10WNpOk6GnjD0oZu+qofI2NIDm7v1QVj6r8gL6m3ylozkfMugF0dVEW
 sTfEj+LxRrGfRcROwZQT3d1hWCT1W7pAOw/FXTfJHdNjh3pj8I4+tHfXi
 /RuCB8ZU4rxmek9ECeVwv6Qmk15X8ubN0iyX4wX+5glgiuEDA05NcZzEW w==;
X-CSE-ConnectionGUID: CVD3ZNaTTxScsEKb3U5kiQ==
X-CSE-MsgGUID: vDYSWxuwRVSv9H765kzuGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19096805"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="19096805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 23:52:28 -0700
X-CSE-ConnectionGUID: meAqeC0+TNGbcOuU4kS4fQ==
X-CSE-MsgGUID: +pjn1vUaSR+jgCsA+eoG0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21856855"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 23:52:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 23:52:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 23:52:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 23:52:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 23:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGsA9zDGIZgfHY0eTOP2yTrvNrIzpT2MP9HV7yC2PuVj42VJ9iJmu//1boRfVi600rb4iVfH0E2p1LZeR4tqnmexjUb9G2DYuEPbJvYKEmB5bH9SjVvP2cxcA7DFTMO/QbXR8UMOy3QSg7rXNh9cifas4lfXFsfeN8ihx2M0Ke/Ggdz1vDF7k1z61VQKCjif7/xa8mzSTnAlEuTuC/i3iahGBbRGg7ZXXu6BLNLhv2MAsgLXo2A4hx3hE/94z9jhiM/zUyy8tGYqIaaqE1mCjDChvgiBXSHPSeb9TMNMepCUsBBVS92BXkjgyrEeGVYVqJUXHJ9TCuphuZPYTM4Kcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwbctfGh+FAPkKHa5hXi3jg8ADh678/KuSvk2+i/BqE=;
 b=Ihn4kSVLmtGnh19PZjXnR6fFzSy0A4fu2uTGhReN3uFgz+Etp/VyP2kuJORvJpk7muI2Ye0Ev3ABoe1yaQwcy59i4E0ZaNFQ8ZYH3nYEWxglQT8tjl0nKmRIBlnFAVW5gMqk54E6+i5fxH6u0wrvcS/9yNW9u/w2pSZzSn82tDC3bIxnGS1xI0b9wf4bK8R2FGLDKNh/mFkmYIOOqPZoBG3OUlGDF0P/X7JDqlS/0YIhqUTJwh0Ui8c6tkRbmc/wa2GjX0MfdLvq3maK4p3abpOLWe4d+KIZ5sBf6O8fG2PexEI9QvBr6Vb38OmQKuLpgYbpVmLjAMyb3E+vbT7zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.31; Mon, 15 Apr 2024 06:52:23 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 06:52:23 +0000
Message-ID: <cc5c98c8-70b9-4ce2-9d96-9e97849c308e@intel.com>
Date: Mon, 15 Apr 2024 12:22:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
To: Manasi Navare <navaremanasi@chromium.org>, <igt-dev@lists.freedesktop.org>
CC: Drew Davenport <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20240410190329.3518540-1-navaremanasi@chromium.org>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240410190329.3518540-1-navaremanasi@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e235a9-1d9f-4e82-bcb5-08dc5d189a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SNqsGuSd44P7EYHvtGCTkn5PT7UMZQmN00CsRBaPYD1Ahrf5mIKD3HrGKOFF+1tNB3QUxEfVpi2v7ScYOmtsIQDesVNPl/DIHYq5Loxa/MpQxR4gkW0xNYCwoHxlh5FcmscyyxMPQ5QvlBzvwRlbfZzHaHVB+8OyyG1NhQz7pMWHQ/JvMnTQyABLCKfeCGTEd0ANfJiEyFOxK9F+xfu9IggedSV/Wp15kxF/ZbffVezq9AWxh+0KL7CT4qoBP7MnKl63DvE6k5GlK8BWJk0pkomocBaaUYADRE3h3nH4VMp8nWFkZB847XyKaevcutfestrNWBF8MZr+A9WoIwEGbRzsgPEONhyDzedMCbVwsffKbv4HYM49wc7AcgZfZS5kT4ikqFVL5yrZ7eEkDwh4oBC4FGUXju2ZWcLO5U1RnY8izKpDmNgfJscWqepsLJQA7uVg04FzGSrjBUcrO14qIdzRPt38XM+Lba5JNvLbravg/AGgctDYheNzjIBPdVLwapmu4iVnxT4VG8PT6GZZ4yJKewsSt1FsOvFe7Ul7Mk+apI/z9jN3JpPTCRO6gyjWeyOrv8/RYpsJvgvSlB4DBV4o51zJNNcCucx99e/KFctokRpincwso2PjPyCrvgr9bLgL1R6RbaHkhPYHUYg0udx0LObniTxfm6O4JZWrhCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym0wcHVNV05uaHBVOUM2VzRHSHdoUHhVelBzZDAyOFRUbytSZlBRWGFKYWk0?=
 =?utf-8?B?UWRlVmhYT2pzN2FWZXdJajAxZXNWZDYxdXh0R1pFRkNuTE51Y3VpVEg0eFhk?=
 =?utf-8?B?dW8yVEhEcVRvN1c2cXdDYTFjSEdOL3NPYTNlQ3N4TEhkN3UrQks0WVcwS0tI?=
 =?utf-8?B?MHlKb2ZGeWQ1MzFkN1FZRktxNS8rNzNSaGVjb1pBZVpsaVpjY094djdXbzIz?=
 =?utf-8?B?TWlIOGtrR0txR3U3MVVCTHNoQllhOHVhcHdLMXRtdFQ1aXc3TUNqOWNtOHlw?=
 =?utf-8?B?Z0NlWldFbkFrenlOWGliaDlKUkVEWGVPc0UxT3p1eVcvc3ZPY2lzeHg1ZjYy?=
 =?utf-8?B?UTJTTmtnY3B0MTBCa2lNYmhuK1l2TDZrMnhOQU15UTVZeGx2dWxTOHNGSDl6?=
 =?utf-8?B?WGRwUUVVUTc1RVhVTCtKc2loUi9xUWt2ZHBRYnlOK3F1RHZWQUdod1pyMnRG?=
 =?utf-8?B?TXJZaFdiY1BNZDhWdjduVys5V0VNWjZFUEhRcWs4dy9zOXQ1MjFnbWwyRVZY?=
 =?utf-8?B?ZmFHNGkveEVpRVlsRFdENkJ2U083YnpYampkT29rRXZxb3pRV1FISUVBQVJU?=
 =?utf-8?B?Q1E0VHB1Nk1Caks2ZFpxcUFPUXlPbUt0SDgxNDlLT2xoUEgzY2dabjVhdHds?=
 =?utf-8?B?SFg5K1R6VlZMTzFuTy9HWk5KbllhMDVGMmdLQ1o1TVUzbUF3YmR6dndXVStL?=
 =?utf-8?B?T2xKV0dEOE5JOGNuZUJueTZvMUk1TzRSeXlWN1EzOC8wVEp0a2hMNmMxc1Z2?=
 =?utf-8?B?N3djL1BHclJmdnJ4bnJ3M3NQcEIvMnVQM3RncExXcTB3eUptZ29rWXNqZEFm?=
 =?utf-8?B?S3ZmeGVLWHZCa1Y4Yy9OTDhETE4zUmRrK2lLNG5LeWRvQk5lQzFmbzY0LzZS?=
 =?utf-8?B?RW5ZVHNVNWMzZWZGQ0hGRDh6QkF6eUpQT05GWER6VkVpT3hsSENvOW1FejhC?=
 =?utf-8?B?aDBEeDd0S05IVlJlWmFYNUtjNjg4YklrL3Z3cGNvWUk4c3NHK0NZNlNOZXI3?=
 =?utf-8?B?SzR2REtyY1JINDFnbGxwRTZSTE8xb2hLYmdHZ3pOb2pPVjhvQXIyd3R0TEJ5?=
 =?utf-8?B?TXRCZnRGRHJXSUhZOXJ0UU55NnNrYi9pZFQrUzZ1SHZ2UDUyTElpdGVMZ3py?=
 =?utf-8?B?Z0xjTkJPS1QzQS8xVzJpc2hjQ2hobzNmNnl3V1Z1ejluV1NQM2ExODNOeXhG?=
 =?utf-8?B?WW5KR25ZTkw4UVNsWEo5aThGR0ZEcDNEN3J1YTZmaVNzSy9OQVdTcmJSTjg0?=
 =?utf-8?B?QnRrSXpUOXFqZlFNVUxHaGtLWGE2TmtiNnJzZ1IvWnp1dUFTc1prU0ZFMnJv?=
 =?utf-8?B?cktFSktPeVpoYWxzT0hTRUk3NzNnNXdVQkg1N0NWUFpjYnJQYTE3T2hFUm9t?=
 =?utf-8?B?cVNERXozLy80ZGhibVdDd1lOVURVbVpEeGcvUWp4UmFnYlFMVEVGT1lpUXd5?=
 =?utf-8?B?M2RBNG9wQjVCOGNzd29WeUpsakowV0V5S3VUQlVJK2E4SnZQUlFGc1dqa1ly?=
 =?utf-8?B?SVNpSnVlRGQ3VUhjci9kbmtKdmhZREpxSy8rMEJpOGV5UnF0SlRPU3lPZVJS?=
 =?utf-8?B?VG5uUjUyblNpQWYvZ05TZ0NKQlh6UnJtMWdlNXA4Z0FpYVQzZDZZQ25qTXZY?=
 =?utf-8?B?bS9BQjUyWkFtTHZXcGQ4ZFlTc3kxb0dvVW1GcytkRWh5L0NneGhnTUtoZ1F5?=
 =?utf-8?B?UHNYdldKQ2F2MVROYXJIU3REdEZ6Q0dETjhlU01pUituTWIzQVpMZE5KWmdu?=
 =?utf-8?B?Wm5ualpmQnpWWHlJL0lBRXA1ZEV0ckhNR25zYVdzMnJRdFZBcXNka21LRCtI?=
 =?utf-8?B?TGx5WDc2bjVPVHh2eHdYRkFhVjk0M1VhcE1rSG9LVmtyeEMyYXMrV2h4Skp0?=
 =?utf-8?B?emU4SVU2R0drMnZ6YnNlQVlRQVlPdDFZZklURTJqUzdtRjlOc3I2eklNdS9h?=
 =?utf-8?B?N2V5Z1RBYWZYM0R1d3d1THptc2t2S05YZmFhVi9tWjRDS1loUGZsSlowZXdX?=
 =?utf-8?B?N3M4Qys0V3ZlbE9sUEZaOS9YbkRCMm80TkZ5K0RxUVNJd0VzN3daMm1WdmZ1?=
 =?utf-8?B?bVRvWWJKYnJIbnI4WFhyMWRMSmdpSHBrRTEyNE9MZ3FVdkdkUk15V2NZcEJ0?=
 =?utf-8?B?eDh0ZnZrVGttTFQzRDdFWHkwZ0FxQjh6aGp6UzdDN29WUUZKYWkrbWhtRjMx?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e235a9-1d9f-4e82-bcb5-08dc5d189a33
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 06:52:23.1197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gUi0m99gwiXu+PR2cxxsTA9TyTyGqfn1VKtexJTXNclJZmUH3+FkYi5qO9PMpQnAwUqfarhAYx/wbX+FsDUvOy2Cdu7UdDEStlcy/Snz5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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

Hi Manasi,

On 11-04-2024 12:33 am, Manasi Navare wrote:
> This subtest validates LRR fastset functionality by testing seamless switching
> without full modeset to any of the virtual LRR mode within VRR range.
> Here we start from highest refresh rate mode and then switch to virtual LRR
> modes in the steps of 10Hz within the VRR range.
> 
> This is used to test the LRR fastset functionality of the driver.
> 
> v5:
> - Pass a reference to flip_and_measure (bhanu)
> - Add a new line between between declaration and code logic
> 
> v4:
> - Change the test name to align with drrs/vrr tests (Bhanu)
> - Fix some build warnings due to rebase
> - Use a local virtual_mode variable
> 
> v3:
> - Fix build error due to rebase (Manasi)
> 
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> ---
>   tests/kms_vrr.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 15c62b34b..c392e10d8 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -66,6 +66,11 @@
>    * Description: Test to switch RR seamlessly without modeset.
>    * Functionality: adaptive_sync, drrs
>    *
> + * SUBTEST: seamless-rr-switch-virtual
> + * Description: Test to create a Virtual Mode in VRR range and switch to it
> + * 		without a full modeset.
> + * Functionality: LRR
> + *
>    * SUBTEST: max-min
>    * Description: Oscillates between highest and lowest refresh each frame for
>    *              manual flicker profiling
> @@ -89,9 +94,10 @@ enum {
>   	TEST_FLIPLINE = 1 << 3,
>   	TEST_SEAMLESS_VRR = 1 << 4,
>   	TEST_SEAMLESS_DRRS = 1 << 5,
> -	TEST_FASTSET = 1 << 6,
> -	TEST_MAXMIN = 1 << 7,
> -	TEST_NEGATIVE = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> +	TEST_FASTSET = 1 << 7,
> +	TEST_MAXMIN = 1 << 8,
> +	TEST_NEGATIVE = 1 << 9,
>   };
>   
>   enum {
> @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> +static drmModeModeInfo
> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
> +{
> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +	uint64_t clock_hz = mode.clock * 1000;
> +
> +	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
> +	mode.vrefresh = virtual_refresh_rate;
> +
> +	return mode;
> +}
> +
>   /* Read min and max vrr range from the connector debugfs. */
>   static range_t
>   get_vrr_range(data_t *data, igt_output_t *output)
> @@ -641,6 +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>   }
>   
> +static void
> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	uint32_t result;
> +	unsigned int vrefresh;
> +	uint64_t rate[] = {0};
> +
> +	igt_info("Use HIGH_RR Mode as default\n");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +	prepare_test(data, output, pipe);
> +	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +
> +	/*
> +	 * Sink with DRR and VRR can be in downclock mode so
> +	 * switch to highest refresh rate mode.
> +	 */
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +
> +	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
> +
> +	/* Switch to Virtual RR */
> +	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
> +		drmModeModeInfo virtual_mode = virtual_rr_vrr_range_mode(output, vrefresh);
> +
> +		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> +		kmstest_dump_mode(&virtual_mode);
> +
> +		igt_output_override_mode(output, &virtual_mode);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +
> +		rate[0] = rate_from_refresh(vrefresh);
> +		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +			     vrefresh, rate[0], result);
> +	}
> +}
> +
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	if (vrr_capable(output))
> @@ -686,7 +747,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>   
>   	/* Search for a low refresh rate mode. */
> -	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
>   		return true;
>   
>   	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
> @@ -841,6 +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			     "between flip timestamps converges to the requested rate");
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
> +
> +		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-virtual-rr-switch")

Overall, the patch LGTM, but please update the test name to fix the 
build errors in CI.
r/"seamless-virtual-rr-switch"/"seamless-rr-switch-virtual"/

- Bhanu

> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   	}
>   
>   	igt_fixture {
