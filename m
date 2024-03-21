Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD31C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 08:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFBA10E1D1;
	Thu, 21 Mar 2024 08:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqV0QiX3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2F710E1D1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 08:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711008262; x=1742544262;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SqS5kcmJvan5IgGHkBu5Sa5Jk9YTKeXdm34bt3N2Vco=;
 b=bqV0QiX3OHWPecchbgDElyAN2GLGqGc9J7OEahlBUsI98BXRbqEyMGf8
 IdYi22CxJXHI5TBrrVsXg90m2pIET1vQPRG2GPWEsvaoZuCMidsQ9FUPF
 nGpjt90475MhDZiVwmoBeovkx9073QXYxai+jpkmbwot1bFXVIVeek1hL
 ZxPpDz5JkGVOhFOHYtFPWOvOePcX3lwl6c8D+pBALf9EwcksWmALUNj3l
 8MLluU73fXPQ3WL2Kr/7hIlQJTYGu+sOemp+c51jB1QdcIgYKnUaxF5j9
 mZsAYoPQbSD9rQLGSVVrI/eOEQQkN++oZzFG4kcDMv9T/itAODXjLWQ0n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16617732"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16617732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 01:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19151319"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 01:04:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 01:04:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 01:04:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 01:04:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 01:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlN2Vj9w+hJuKC9P+ijc6pIKg+jzWEiWKhjJF10ptwShOxrT/h7JjMs6eH3waqhcK0M6oDNv9OOqJ5fpMRaQ25G9PySsfVReeIMNHV4zvAjW9ATcbGYRwNY5LKEfhmCWvXR/lLCk3RLnC1OOSZ/QvARog/xlJJccLX1nsFRx6lf6cKoNXyJ4KE1SACBoqg6SoPoA5kasYNT9eWSqm7TIv5YuXx2IuWjE+g7hviThprkg5tPs5FA4VhfCA0aAlnm/60frVQdJbXfHF5sJ9UCZr+FXZ+q656D9slgezPrDVnyx+icHeqeIkx+VjU6ho6jm5utyxjIkHa7SlqqfiNsnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXO81QKipygsN1pY2+GCHXz3iYGUWSwZds/qFCpA6PI=;
 b=kkmGj7m/b8NtZih6bs5kS5pYKlHA7RtoOk1XI0oqfWilszsHIPADCF74lCABXxPCx3Yk0Jd6H6Jlk5+74bk+FRaBml7v8Qjpu6I29ZuTK4ZVW/3mRHN11/xQ6znzTTllUz5iLZf24NNO0twP4rtHaTAjAE6L34Yr8kNcOU1/VrOjm9KEoKhJ47YRclW8379y2XneVuLu1Z1laFcCyv38G2hfBicM6dutZfnGaay0+I7QyCvQkyU2OD2OUoA4mcSG7PxLJIu/4WDyxPpuD8lEozAWCDU1fSWpMe2StZu3mFEBYBJFQLSVzETxyRVcrSUj//r3nWtUTdw5yNvYrb6R4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.13; Thu, 21 Mar 2024 08:04:19 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 08:04:19 +0000
Message-ID: <814d2a46-d01c-4f20-9b55-ef960a376e81@intel.com>
Date: Thu, 21 Mar 2024 13:34:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
Content-Language: en-US
To: Manasi Navare <navaremanasi@chromium.org>, <igt-dev@lists.freedesktop.org>
CC: Drew Davenport <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, "Golani,
 Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
References: <20240319163338.3993235-1-navaremanasi@chromium.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240319163338.3993235-1-navaremanasi@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 73635a84-76f8-482c-6d1a-08dc497d826b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGei5zMjeGz4Qkaz2WmZB+sS1Ucw2IwAXAvVf7QJrWsfBOQSm+OzWS5E0kuRSzM5ByRQteeezbTxOMuOUi+8ooAwHmGnf40brRsMIjurV8TitmTC+y8/YkF09ei8t/xPSRhqj59HhIv47aDEe3M7N9TyqNqMe/qQxJBqRk/+xCQGzR8QGBjGY+W5G+OboUBnnNYlVws3oeQqwEF6nKAH97i8ag2pQgO27peFVIMEMQAJ3NNJwmjs0eBFkPeyyR7KJ7u6DHN+gYiBvXMBvtwzpldwFN2ODxKADGglKkPrKbSPcFpS1jdZGdqRo+ZiQyxOHRguQzR1W5TYwZRjZUFyN2h1FVqxmiJP/E2309VJtH/iTjFlK2tbu1zDYZqTVSJXjGUsWCcqSCKs/2g02HyQ1TX8Tm5fdxyYFCwHszLpwlY+ZrJm8ePYANy62TjgGj7BfL33jhbr803HtwZHIpWo35ywvWMb97FDCOryU79cwQhEodTwg7I+MJ+H1pgC0wea9fSJx+nS0HYpDIjx7ARMg0GpTO+tPe4QXgMnZJnkcbpgXNXNCqLDBc4GKlnlpzNrtZ85Mx+wNC0VgLdfcoBrZ6KbY6BF92IyqO2EhFloJXx1UJ33iCSruNAfAstbyYBJgeTYP/r3q9ZtjFCH4BPZgm5m1MXqM9WDnuTWz3tVLS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDUzdEttdUtwL1F2NittTTFCbGJHeWFsTlZCOEN0ZXBlT3V0MmFtVWMrakR5?=
 =?utf-8?B?TitPS0kzYm5ENmgzWVpHcXBDTVRYNis3UzdBa2lFWG84bm42SnZsYXcxaDV5?=
 =?utf-8?B?VXJxTjBqbXNrdndIUmd4RmlLa2s3N3UzMmNNRmU5ZjZUSm9jUjNQL3dEQ1do?=
 =?utf-8?B?SFRiMnpYbXNSWW1mN1pVZk95ZlVyRFVCRVZIL0FZOXFTSmpSWkIzcW4wNTRT?=
 =?utf-8?B?UG9NUDBDZm5neFYzS2d0T1JTbDQvQnV4b3FRaWlKN0tUaVVkMG50K1BQQnk2?=
 =?utf-8?B?TjZGVzVrc0JpRGNJSUZkbEZlbFpkN3hyR0xoMEZMTHRFUm1VQVRmaENFamFM?=
 =?utf-8?B?aHk4ZjVPUVNRUGVibTNlcFBnUUsxYU9mbTFqOGV0VmFpNVlTTjZYYVhwblB2?=
 =?utf-8?B?RXNoOXU0MWlkcHhxTGhCcVQ1NkhuUTNHRTFhWTliVlZaT2o1c1ZySkx5MEox?=
 =?utf-8?B?T3lRcjkwZm85bXc4TXA5dXdLTHJWT3JWd3N3RlgrRFUxNVJ0dkFvV2NQSjQ5?=
 =?utf-8?B?ZlV4ZExhSk1FSTRLTEdwYnBzSEc3L0g3UDVlNHpQaVJnbWpJME9wRTNOTDRx?=
 =?utf-8?B?WG5YUy8vRisrd25zZVBzSW9aekw1Z0VLU2RUcC9HcWd5am5td0FTcy9mZnFP?=
 =?utf-8?B?UlN4MEx2SFV6bjNUcEowYndwbjNDVXJBanc5bXhuQXMrYWlBVUlrTFVWNUJB?=
 =?utf-8?B?UDlNcU1YN3l5Y0JUeG13aVVsMXV5K1JOSFdxSHBVRGNOY3lEaXdvajNYL25R?=
 =?utf-8?B?ZnhlWW82WDlhVWpiVVFzUjRTODd2cVErK2ZMWTFrcU16VjR5elg0cHhINGpr?=
 =?utf-8?B?Vi9BYlVzS21PbUdRdWJBVy82SnBrZWl0NVVPODMwQjl0R1BPdUdBWk5zWUxu?=
 =?utf-8?B?Umc2RzM0UkJUcEtQTjVLWFRBU2IyMThja1BtTEhhbmlCL2FtTHEyVnJiWENp?=
 =?utf-8?B?NEc1T0NybDNLMm90SUFoeU9MU1RDaEJ4cS9vRDloOWN6WDMzdHg4L3pGRG5J?=
 =?utf-8?B?U0lZdG55V051ZVhCWjNYNHFXa0t0MWZPOTN0S2x1ajAyVTkxQzY2ZkxFRnFO?=
 =?utf-8?B?ZDFKRjRlSFZSVWNHZ0drQUh4SmRxU21FcjhOMVlVUnk3enRhUG1rbUlibk4z?=
 =?utf-8?B?V05KT0dzeWVTUGxZcUZTMG9UamJSSjFkK3JCZE1xQnlGS0JkYWNaaUtva0ZK?=
 =?utf-8?B?c2J5UDhkQUZRK2lFbmFTajNnaGdFT3pEUkFvcUlYWXBCc0NDMUhCcG1IMWlX?=
 =?utf-8?B?SDQ5V1RqSUFUZ1RDZEdMZGREeVordno3Q1Frbm1BRCtlVE1oWHk1NCtLMitL?=
 =?utf-8?B?Z2NsUWxxalVMemloZUxRcUZOMWVhRkFCZzNDblBZTy8weFZEbklHVmxkWHU0?=
 =?utf-8?B?TnB3UUtFdUZnaTJEaS9BM3dGTnlIcXN4ZUF4QVpEVUZVRHlWTm5wWEZPckNV?=
 =?utf-8?B?SFZGMTUycWlHMkFYU1FPNi9Yb3UvV1U5V1VEcXhIY01nekFiVlBycklDS1BC?=
 =?utf-8?B?RktzSC96N0tvYm0xWkhsYkFMMWJyU3c3Q01BQlAzZzh0YnJzT2pnWkxQa3Fa?=
 =?utf-8?B?dWxWSjFxd0NXcFVER0s4Zm9qbWJ6bzZMZ2xYay9oYVBqZHMrMkhHNElZVHJo?=
 =?utf-8?B?eEtwZkp0WGpLV1QvZ1JXUm5jdWZ0b20vbGQ0UThxSzdoUFd3MWVRRUdZRko0?=
 =?utf-8?B?aWhqZUhRNW8vcUVBZmpEb0FGUFFNRk54Y2g1NGdVTW9sSkVjQnZ1U1laeUZ4?=
 =?utf-8?B?TXV6Tis3QW1LUGwwUnh0MUtYcHdPa0N5TlozZkZ5S2g3VTNvbjBaUE0zK3po?=
 =?utf-8?B?eUlpaE43SDVjanpWMmpnTStXaTh0RSt2TGhHTlpVZkdoM2lTTUZWYjRZZFlJ?=
 =?utf-8?B?UVRRQ2xFblRoL0NaOG1IVDFSYUhTSmt6U0crTHEzdERpMk80czJMd0FqY0xF?=
 =?utf-8?B?UWlsaE1hRmZKYUI4RDlCYzhXYUpDWHhQOTIzZzR3eWhXeGc2dlFZVFJHaFd6?=
 =?utf-8?B?V3ZZVGtQTjdMMFEyZGdqc0FMbGZQZlVkYXZxQ3phUkMvaTFZbThPcE4xSmlw?=
 =?utf-8?B?OEh5YWFvSTdMSUxWeUdiNE9JeTRkSHd5YWhxMldKc1h3Y3Q2WncrWU1JWVVS?=
 =?utf-8?B?WGU1WnZBTm52NU5IWllmYTZ5Q2JFY05GOVEwYjJmYVhQVnQ3dHh6Z01PWm9C?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73635a84-76f8-482c-6d1a-08dc497d826b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 08:04:19.0570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9Vxt2aw1eJsLalqz8TLWe3HAxqTYk8kuq8E1FvB19xFrLWHUxu1jH9zzKsHwRjf9a0RqnE3wOJkRBOgPasms1RzIHWwarzitP35u2iA7Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
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

Thanks for the patch.

I don't have much exposure on this virtual LRR modes. From this patch, 
atleast I understood that you are trying to switch different refresh 
rates (without modeset) within the VRR range. And we are pretty much 
doing the same with the subtest 'igt@kms_vrr@flip-basic-fastset' with 3 
different rates.

Is there anything else we are going to achieve with this patch? Please 
throw some knowledge on this.

- Bhanu

On 19-03-2024 10:03 pm, Manasi Navare wrote:
> This subtest validates LRR fastset functionality by testing seamless switching
> without full modeset to any of the virtual LRR mode within VRR range.
> Here we start from highest refresh rate mode and then switch to virtual LRR
> modes in the steps of 10Hz within the VRR range.
> 
> This is used to test the LRR fastset functionality of the driver.
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
>   tests/kms_vrr.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 15c62b34b..316b626c3 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -70,6 +70,11 @@
>    * Description: Oscillates between highest and lowest refresh each frame for
>    *              manual flicker profiling
>    *
> + * SUBTEST: seamless-virtual-rr-switch
> + * Description: Test to create a Virtual Mode in VRR range and switch to it
> + * 		without a full modeset.
> + * Functionality: LRR
> + *
>    * SUBTEST: negative-basic
>    * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
>    */
> @@ -92,11 +97,13 @@ enum {
>   	TEST_FASTSET = 1 << 6,
>   	TEST_MAXMIN = 1 << 7,
>   	TEST_NEGATIVE = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR = 1 << 9,
>   };
>   
>   enum {
>   	HIGH_RR_MODE,
>   	LOW_RR_MODE,
> +	VIRTUAL_RR_MODE,
>   	RR_MODES_COUNT,
>   };
>   
> @@ -214,6 +221,19 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> +static drmModeModeInfo
> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
> +{
> +	int i;
> +	drmModeConnectorPtr connector = output->config.connector;
> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +	uint64_t clock_hz = mode.clock * 1000;
> +
> +	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
> +	mode.vrefresh = virtual_refresh_rate;
> +	return mode;
> +}
> +
>   /* Read min and max vrr range from the connector debugfs. */
>   static range_t
>   get_vrr_range(data_t *data, igt_output_t *output)
> @@ -641,6 +661,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>   }
>   
> +static void
> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	uint32_t result;
> +	uint64_t rate;
> +	unsigned int vrefresh;
> +
> +	igt_info("Use HIGH_RR Mode as default\n");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +	prepare_test(data, output, pipe);
> +	rate = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
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
> +		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate, result);
> +
> +	/* Switch to Virtual RR */
> +	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
> +
> +		data->switch_modes[VIRTUAL_RR_MODE] = virtual_rr_vrr_range_mode(output, vrefresh);
> +		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> +		kmstest_dump_mode(&data->switch_modes[VIRTUAL_RR_MODE]);
> +		igt_output_override_mode(output, &data->switch_modes[VIRTUAL_RR_MODE]);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +
> +		rate = rate_from_refresh(vrefresh);
> +		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +			     vrefresh, rate, result);
> +	}
> +}
> +
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	if (vrr_capable(output))
> @@ -686,7 +748,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>   
>   	/* Search for a low refresh rate mode. */
> -	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
>   		return true;
>   
>   	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
> @@ -841,6 +903,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			     "between flip timestamps converges to the requested rate");
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
> +
> +		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-virtual-rr-switch")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   	}
>   
>   	igt_fixture {
