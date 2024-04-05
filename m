Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE31CD1284
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 06:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129BD113988;
	Fri,  5 Apr 2024 06:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAl0HsmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B68D113987
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 06:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712299049; x=1743835049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wZt7bxBwsoRLQ8FqXE3AdmOBC36HfeGONkfnL7MSpZY=;
 b=BAl0HsmDG8z+gahiD5s6m0oo3OSMaDZLSxUx3lSTTFVkFX/2+nJQVIZ6
 vx1+0W3G1+wwG+09ydjy5plk8yGpAFnJWEQbSW7mpqWF5pQOVaD1+aSQ1
 wiJj6tX4jFejjFH96yrF5axOBNxrYVwI2/JtNqvPXToet5u0O74tLFAgr
 MlX74mmsMNuxns8TAezPge2U6AJRQgey3cfwbgGrebjVnpwaKLK3eUPas
 MJK1vmNOg2UzU/xzHifk1kFkBEPKUMW7dZTI14Sr7aw0r6WIs/YN/6TXR
 yOZt0rkntIxv75MD2GMFHyJAgh1xIGw7J0/ldvAEPOj0Vwnpag/nP2EaT g==;
X-CSE-ConnectionGUID: nRek4rv3QSWaJG/RWrOSpQ==
X-CSE-MsgGUID: zg5LJdYyQxeWc52ajBMZjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="30089116"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="30089116"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 23:37:28 -0700
X-CSE-ConnectionGUID: ibdf1vVcQsCv09lG+NfSVQ==
X-CSE-MsgGUID: ybVkJEYVQZ6nYy5cOcuBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19624256"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 23:37:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 23:37:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 23:37:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 23:37:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 23:37:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6AwKi5/dtMeD2MnU5FDkEZ3mBul3Qn8EGhjmE8kUzdTJyZMmspkZnRQdvwZ7tXtrp5kL0zVGj7mxYR4GZJdoA+w9VTvym/RHcZ0ThpdTp+vkjpIU5UL/jxzZ8n/JLp7E5TBZN5yXAemaPLdGZxHelcVLUXIaguMUDyesDq8CfETcv61rh1qze2DjMnKLsZlAxybtmKFTNH1MKK+1Q5STN84HH05hD9fiI2H3u6jzdQHsJ4veg9RAVWC+g1WH243oWBIFfSrW/0vhg0tXmV2IADBqBai3GG88gv09V/d+V5j0arbxPcRg9ArQhBMtOPmEonXQPxCTw/IQiEbbbiADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8vYoP1aFVwsapGhoA11BwQSPVlhPxKPpKCeSodZXy4=;
 b=c35mL03kaRwCuSu9ST8qO8h1a+8FuJrkiREkvn3PMGw1seCzNNr+k6xiZHLLnOs3XjxZixA26sDXU4cTKhSDnM/VAnUOOPblgoqM24IgZ61vs300YQAa57RI0lL0V03ExGdvm6dGbfuZtvj5LVt9Pvx9h48kGB0cmCquZNfaSSuKI/BGrMbnPpAvL0O3uN3TZvmt197+di80bm7qS+zzm+7OEO1kyEsUmFRIKIwrsHDgqNauJb93UxCIIM+pk6+3VwAGUsDsr/wex+NuVPgkiRG+avzUEP8obANvynb0a3xO9vhcm9O3l17JzIk2a+sCQrizWcSuil/anZvycM2hYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 06:37:26 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 06:37:26 +0000
Message-ID: <d1dca10c-dc5c-4bd2-9f94-26ae032d35de@intel.com>
Date: Fri, 5 Apr 2024 12:07:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
Content-Language: en-US
To: Manasi Navare <navaremanasi@chromium.org>, <igt-dev@lists.freedesktop.org>
CC: Drew Davenport <ddavenport@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
References: <20240325230519.1787483-1-navaremanasi@chromium.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240325230519.1787483-1-navaremanasi@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::24) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA2PR11MB5020:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ughuB7MCNB8g8JYtDsm/btgJQT88chAPsAhXIWYuWFoCWnIuF9V3G0ZoumgBVPnF/3jbya61Iz/Xj5YeH5f7d6zgKN2pcnD+nBBed435PLqe1Myp8DaBUxJW2KGT5ghtKbv6UII9BT54HIcGxXoatOmxrgqJ+J5Izlgsvsc63oe3eD5a5zzIeHTG9T2YtorLSfAI3pNHe1z2Lu6cPSHt5D98F/Ufhe5LQV50+KLo08pZneDxTvuUQ5aYHlYiyKjCyigK/fVZEyJC62PK7BkkLCUHPiyO7F5MAZWh4ZU/C0FeX6xUtQzeoYkyRsQmGgLJ5coGo4tLh6xzdwcLStipIlzKMRt7MRdvgVaFyn4QKslMuEtQJbtFAWElq9teHeqhiiwCYvDRL+vIy5dG9TN7mGts/x4z/fd7Retv7qgsZJ6eEK5KGYvOg/iHx+Asr2lYt0lDLRs+SBXvLqmKteoeHD23l7ZvozBMNEPwn3CHpcPjOeVGH0qM4VRgUPf/K+4J8zXSK1usEIxdGI7UsKbVdf9m9sci/Kcbv4wBg5Yi8Oa/ImurhcQjbmDCxuavu5ZqVHbaYy0U12yJGSOZAbzMTcN7bZfmajbxAyX2ImxtT/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmxoOFlBRlFieHVCazNySGhmNzlCbzNYenZaRmZacm11Z2p0cDF4UHBwRmhB?=
 =?utf-8?B?NXJTZS9vejNCY04rQ3A0Vk94REVQNkd4YW8xbzRQRG1RVUVxVUk4am9ZcjRo?=
 =?utf-8?B?WHBLSFRkV29tZkJIdExZcnA3UTVwdy9qU3czZjN0SEllMHB6TVZZY25MSCtR?=
 =?utf-8?B?eFRGVVJYV1hGQTlUeFZ2MGdILzkvZ2tJSml0cG5vN2RBclcrM1pRb3NZSXBO?=
 =?utf-8?B?R0Z6cUo2VWZNVmN5RXBxT1lIOXhadEZUTjYxaW1zMFoveWkxck45UEpHVktx?=
 =?utf-8?B?NHpxUW9FTlFOalpWSjNUaHlHZFNSSC9CTyt0R3ZNWWhPU0dtM3VnNGZrMyt4?=
 =?utf-8?B?cXdTaHFIL2RQTlBuTWRRb1JnQlBZM3ZTakVtVE1RcWVWSkVGdEZWOXA1MTdC?=
 =?utf-8?B?cnh5Ujk4RE96T1N6Yjg0NTZsODFuek5oMXVXVnAydmVoRnB5UEdXSUV6VFJz?=
 =?utf-8?B?RnM0QWF6dWIwZGRiTHRtUGZnSkZVUU5FV2kxMmpPVHh5cFBZNFNVMkplWjd3?=
 =?utf-8?B?UVlHcWx6NmFuYTdlYnluVlY1WUFUS0hmdnZQQVZRbHJOdDNYRHNEQ3NXQWhV?=
 =?utf-8?B?RzRCRlg5MEM4SDN3azRaZXhKcUVLWjJGOUlyWlk1dE0yUysrMEE3MkxWT3dy?=
 =?utf-8?B?aWova3pneFBoclljUWxNNmdhN2VqZGdYM0xQTHJXT3BNbW5BTlE5WFpVZ0Ft?=
 =?utf-8?B?VWdwb005N3VXR0lNZkhiVDVGZFdyOXM5a1laOVNOSGRneDlmWk5YQXJUbVBJ?=
 =?utf-8?B?TFZ0cDVSeVpQbThGSjREZFJKaXNweDZjTVVweXV5bFJWVEdsWnpieHFScFI1?=
 =?utf-8?B?TzVSdENrbkMwcHFYREZRY1FXM1NqM1FyNTh2MGNwTXovSGlkVTV4emwrUjlC?=
 =?utf-8?B?eWxyU21SOHpnUUh5QmlPM0NZSnJyNCt2T2RsR1RkVndXb1FvdGFjOXM5dmJs?=
 =?utf-8?B?OGZHdk1RMzkyYWZraCtOOWs2M1IzZ1hPdktKc1lia2pGdWxqUll2S0Exeng2?=
 =?utf-8?B?UkxMZTFRTk14YW9aVnhBdHNkdUhWNTc5RENLRldWSlQ0bzZzU0NFYVNtaWp4?=
 =?utf-8?B?WlNMelZzcmNlb1FyNEZ6VXd2Sy9KRkx4NlpKOFk5RVE3VjJReEdOY3F2TWhI?=
 =?utf-8?B?SEJyakE2T1hvaDhRS1pwLzRTeXhBdGUvOXhQKzZPaDlMUG1qQ0hFUys3M1U2?=
 =?utf-8?B?WGczdjdXRGwrRTVBZkxlSmg0SFdMb3gvbjdyQzZiWG9YS3dCS0lsWVRpQ3Y0?=
 =?utf-8?B?TzFhbGtTdFBINCtvWFRkamRBTTNHU3ZxbERyTXN3QlJVYUtUblZYL3Z3LzlG?=
 =?utf-8?B?cmZIMUF2Vk9KR3lia3UzR0Y0VTBCeXh6YjhickZRV09VYnJIV0wyeU9Obkl5?=
 =?utf-8?B?alBPa01zdnNPbUozYkFqK0JuMGJqL1BnUnF2OXFaZEZaaTk3a2RLWVUyUjlB?=
 =?utf-8?B?V0lpMk5MUGJvOWxmM2VQeDN6MjhlR0ZUNEdzZEs3NG5hbmdldi9Ca01TTjBQ?=
 =?utf-8?B?TzBJWGhsTmtlZGtSTWt5NjBwWWVTS1paNzU0enVSbWhLK2NFUzRZNDBGVW50?=
 =?utf-8?B?VXNqSXUxa2o4TFJOVzJSZTN1ZlIrWXJ1blBxcEZ5aWcxWFZ6Ujk1RVF3T3oz?=
 =?utf-8?B?ckhxN2gwTk1aMks2WFhkNTc4Mk9lUkxaN3U1a0Y4c0VmSWtDak9COFE5bmRJ?=
 =?utf-8?B?VTBwY1NTd0V0OVBxK1VEcGl3eU9nOHoxVmd6SjFRbG5yZ1VWQ1ljWWkvMUZD?=
 =?utf-8?B?dHBoYlFyQjNhWlplK295OG5SOWVkaXQzZmdzVGpQUm9zckFUY3FHQjlncUYw?=
 =?utf-8?B?elpMMmVEbHdCRUI2R0k5RTg0Mm5OMkJBY1pURmZMTXNsUG03dkxCdVpoeEVD?=
 =?utf-8?B?LzZteHVTbUxiVDFWQis4UU5aV3VCVHJSMlpSbTlFL1YrSEQvWTZTa0ZYeVJO?=
 =?utf-8?B?WGJWclNHT2xZZHRBamxGRWsyWmdlMTdzU0xBNU1XZVhXTTdZa0x3YUJNNnNm?=
 =?utf-8?B?L1JLeDdrNG9ZMHVPaGpQcHp4TXVxOTZGdktCOWV6ckZZVTZzeWNiTFl6NmdO?=
 =?utf-8?B?ZmZvV0wyOVIyOXc1QjM1cythUmp5WkI5cThKUGRldWVrN1pjNThXT2c5U1BG?=
 =?utf-8?B?Q0l5ZllkSXNYQzR6NG9lQzJsbk8yODFsbFUyaFZHYUx4Y3B3NDU4RUd2bjVM?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1136a3a-ca69-4785-e631-08dc553adb89
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 06:37:26.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcolS4qJl4/ohDjGXs01+RGVVh71MKM9joqPpxVZiQd27484EK4dy6psLOJNARjB+fZqPGkZ8QxbEZMzXz5PzPRck37JBCjJAuQc+6KA9qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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

Please find the comments inline, you can get my R-b once you fix those 
minor comments.

Also, I can recommend to add a HAX [*] patch (along with this patch) to 
run VRR tests in BAT. So that we can get some CI results before we 
actually merge this patch.

[*]: 
https://intel-gfx-ci.01.org/#forcing-tests-in-bat-and-changing-configuration

On 26-03-2024 04:35 am, Manasi Navare wrote:
> This subtest validates LRR fastset functionality by testing seamless switching
> without full modeset to any of the virtual LRR mode within VRR range.
> Here we start from highest refresh rate mode and then switch to virtual LRR
> modes in the steps of 10Hz within the VRR range.
> 
> This is used to test the LRR fastset functionality of the driver.
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
>   tests/kms_vrr.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 15c62b34b..d838647bd 100644
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
> @@ -641,6 +659,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
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

Nit: Please add a new line here to separate variable declarations from 
actual logic.

> +		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> +		kmstest_dump_mode(&virtual_mode);
> +
> +		igt_output_override_mode(output, &virtual_mode);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +
> +		rate[0] = rate_from_refresh(vrefresh);
> +		result = flip_and_measure(data, output, pipe, rate[0], 1, TEST_DURATION_NS);
------------------------------------------------------------------^
We need to pass the reference.

s/rate[0]/rate/

- Bhanu

> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +			     vrefresh, rate[0], result);
> +	}
> +}
> +
>   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	if (vrr_capable(output))
> @@ -686,7 +746,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>   
>   	/* Search for a low refresh rate mode. */
> -	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
>   		return true;
>   
>   	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
> @@ -841,6 +901,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   			     "between flip timestamps converges to the requested rate");
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
> +
> +		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   	}
>   
>   	igt_fixture {
