Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7A6C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 08:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FEF10E701;
	Thu, 18 Jan 2024 08:57:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BECF10E701
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705568264; x=1737104264;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5GlrvhnG0oTiwhCbyAy8syLat1dk/EX/WqW4c1tMHWI=;
 b=ngZEtAdqWsCwqIc3hAMQQmdqXZL7w2HWmdWmykqt2qR0i6HTg7dkx4SE
 uqUPvvbiq0qHSZk9h2iBiqKCjvh8Im2PQSilmF/W9G/Ilr8sTiTHh6Ylf
 DuzJm3UiPxxWwDn9LkfO/AIHAm+ohiQjPZmz7eEU6hQeOUHjLvdqmSNxO
 hpAvx4qlvfduycwIG8fjvh+GCIvH0Pyia7du67C3+okhrYMpo5tNBHLM4
 2QzHA/5EYtbfaayhlEdlkmvGJc05dCWsRGlIQeyBc0AUg5/e1r7d6Q0FL
 tlTAbZwVebMgZNlxQ7ZH6wi5KJI4Hxiz4LC/tA6PfKWWCNA6awZ1vh5d1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7100545"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7100545"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 00:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="777675753"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="777675753"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 00:57:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 00:57:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 00:57:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 00:57:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRVWFS79y/eOdE0o3fu/cTpXzsR8Mr5twLqXjS3q1k75/X1hT/j6m6oFJwoTA8uKfRArIyiGAredViOr/raB0df3LPKQzsUeDXWaCOg6lmFVbOOvchYNAjd+nYC/hlFDTid/tyk7o75sfETnQ+4zxs/gkUtmPox+bNKpAUyxt/41K2GPwolwWS7B92wnAF3uAyE+BHDRXvGxrekehNi8/QfHw+DFA/Mnt8tLIF9O3cuUrT0Qz9Ea44OY/LzMPrOD+e/gK/qLnRJdR0N6R9IN7zvqz5X9LhW7Bp6tBmqdiNoYssDk+TBv7ZZe2U8kuirZM0DFMch61QwWbRP9pNVC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr3kl9D/EJo46TtZVaOJ8PZTvLDkVs3/kAf5Yf2TpTM=;
 b=EXIzF96bTCxmbHindnRQfJy/4TxsTZb+AG9+hVE2p7uE+NFK5k+sSUaA91Nwm0PXdCrYcqp+Ma23n9u9wD4PyRlvMo/e9EoHDK2ymLVJG18fSQs4wuD98/gzd/AwvSL4RSWzPQPmt7TBmHh/+2oeRs5J/3WkAU5AqEM/5TO3G2/F5rYa5uqsdPp8+vRvPDCHCkWYTZEzeeSMIynp+1Gy59O3x3UElWCTLAwjWyUJwTwI1WvLu/zvwzvOnoRwUC3WQfMu6T85liy6YJQDXzUw19CM1354/78OJ+oerqJXTry2wP+FAwKsmpvRlm1asY7KecumWIkxqFjv+cNvmHelKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 08:57:38 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 08:57:38 +0000
Message-ID: <ee82b178-70e7-4021-8def-e646ac3f1acf@intel.com>
Date: Thu, 18 Jan 2024 14:27:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] tests/intel/kms_dsc_helper: add dsc+big joiner helper
 func
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240111073502.151340-1-swati2.sharma@intel.com>
 <20240111073502.151340-3-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240111073502.151340-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BL1PR11MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 79822e34-0960-4422-2ff4-08dc1803853d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuJRLgVXXuot8cUTNQ60C8IPN2w/fQI6EOguKom3TQq8lxgynA1z3OsbjZ2vV3wjWP5wMsgMykNpuBEaUT9/JU9lKhWWtYY1d/Qqu32NxVceNdDTQFrlzNiKqTMnEfRrDlv2IS0AEYQL5ZVPoyDtoKq3bBFar7Cbo0WRyt6srVtwxUjESL8pPhHyEUuC+hFcOyWe9Cyfm5dd/1ppTPTOzq3QbId50YIxsKu/pKE2NlGSmrurZplNnimuKQH8yaouV8sYTbjYE8LmDODPkNKuR0969gJxkypAyl8qCayVP9reVlZ0AzO/T8lJbN6kkhJAyOWdmJHNfZh0ZN71x1H+6PO0Jc1VRL7z2GViL8T4jUxr5jjg1+5D10xFbmUcCkftMwaHbIbbsE8h+/8P2eu3r+z2oXR6jjJW3LJSfNmsUF7tP1F/V4Z0CHx5zWYTx5oy89rJxUTpxaaz+5Bye3yLMZxQKmR8zO/nULRvj2/X+UzPlvd/cy5izAum3T0Bj43LsEJ25lGFOR9/pGyGXx/XZG7AuxgDsc4gblnLE5Z52HeWdAIkZzpwc2piy31sjeyH3DCO5ZzZorndJ8uufjFbLp/X2iuch/sch6EzTtXHWvx5GmFbHyrRH4OYLOpMXLyZIX7pr3TKCN42FAXkSZeZAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(26005)(6506007)(6666004)(53546011)(6512007)(2616005)(31696002)(38100700002)(36756003)(86362001)(82960400001)(2906002)(8936002)(41300700001)(6486002)(316002)(83380400001)(5660300002)(478600001)(66476007)(8676002)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXRrb0wwRTBIUlZpTEp0aDdONXh1SHFIa3Y3djFNczNFSm1DYjRrb0Z6T0dy?=
 =?utf-8?B?clRBdjhzT1NXMVBXRlNOT3VaUjFSQVUxQkNLWlphMFN0YnRmRU1Lc2s4UStq?=
 =?utf-8?B?R0dtSXFKWXpMcDVvUlB0dlp5SGdBSEU1dGhCTnFxY1ZMMDFLeWdGa3NZV0t2?=
 =?utf-8?B?N0tzaWVQTTZjR0orLzZ2SWY3TjlTV0d4N0taYnZXSHJFcWNBaXpwdWZIQ2hm?=
 =?utf-8?B?QTVaWEl4Z3haWkJNYjNTb0JkSlNrUUlsUlR0aUYvS3JnRUZETnZrZm1zQWN5?=
 =?utf-8?B?bEl2TTlmcDNWKzNHR1JRamQzVXpNMVNEOWtoTmpqaVYvTk5pUXpYVjZkd2xN?=
 =?utf-8?B?NEpkNEE1YmJBMU90ZzgzbENqKzVhd3NoQ01sZ0hNaUUwMXd1VDVhSGZPMHdT?=
 =?utf-8?B?MDQ1MS9ZNEQ2K2JmcjBCUFBpcURSZUZRUzdreTVsU2hHZHlFSzBuSVBCbmN6?=
 =?utf-8?B?S1VabTZ4VFF0REhrQlFPVWp0eVhCeDR2NTV0ZmdLK2dwR1lqRXRBQTZzcmFH?=
 =?utf-8?B?Q2diWmhGQUV1L0Z2VHU1UkdDcTNOcXJieXVJeWVUM1E1MU5mL1cxYVF3UlFI?=
 =?utf-8?B?Zm96aFNCeWZPSloxbnZUYVErQzZiTDNQeWhnUUVsb0RqV3NuTS9HR1V3YnQ0?=
 =?utf-8?B?UkhRMGo4K0lucXhOVUZGMmVncENPcFpwdG9mMVN1Q01tVW9STTh6R2hYRVBS?=
 =?utf-8?B?VWM5UitaWkVjWHhSa1VRbVhxSWZtSkczd0lmeEF3eFdYc1F4SzRMcEpLcGoy?=
 =?utf-8?B?bXcvSXZ1NGtGU0JJaER0amhMOVdnVTFzS0M1UCtDZ01vVGFyNEZOdUR3Qktz?=
 =?utf-8?B?Qldzd0NUUGxKa0d5YzBaak9Dalk1Tnk5cTJWUFIxdUJNNldTd3pTY3k3Qncx?=
 =?utf-8?B?YlFMSlltRVBnSzE0dGl2Yks1bFB2RDZTeFJJd1EvYWtlQkhDZ1NJdjA4R2gz?=
 =?utf-8?B?cnQrU0RmUEE2NS9FOHBqTitpcHY2M3lqTGc0RDdIMVgzYkM2Z0tYNVNGVVYx?=
 =?utf-8?B?Yk9JLzIzdTNZWFNvWEhlb3VVbmhnbGV3a3p3bGxuLytjUy9tTnYrTzJBV0hQ?=
 =?utf-8?B?d0JheFMyUDFxWEgvTGYvdUtlNnFJMXhUWmlCcCtKNE41ejB6am1JaEQ3MUlK?=
 =?utf-8?B?THBIcE9MbTdMRjJzK244NmpDZ0Zoc1dveVFEamRZTTc5ek4xV3RQdmhxcTQ5?=
 =?utf-8?B?b0xPd1luKy9na1lmbnJtWThERDFVV1NYT3pWQ3BuWkFadDdFNEUrVmxmVVdp?=
 =?utf-8?B?TzZqeHIwb0pJc2RuUUlKM1Baak05VnNJRlJRdkh5VTAxNWd0ZHJTQ2VwdndG?=
 =?utf-8?B?N0c5Szc0RFNoMEdQdGZ0Smd1eDQ3dzVOVlNaaVJIbGpkL3J3SzFWWXRyRkZq?=
 =?utf-8?B?WGU1akQ3VVlUZ1p4elNCSk1hQlpRN0czYldGT2xRTVJvdVljUC9aRVNCNWNQ?=
 =?utf-8?B?d0pWM04wc0VUd29ZekFOU2FSMGluQ1FQNjd2THhWQmpwWDNKMG5HMllxMEtZ?=
 =?utf-8?B?eUM0ZmRCdEUyM2QrdGZyM1dEMDBjaGNYQWJOQjlLNXNhcHlKK3VQaHp1bWRC?=
 =?utf-8?B?Ymw2VExnTmlJZ1E5NFgrL0F0cmd4bzBVVkZNTytxTE1sMFFNcFZKTWRQdkox?=
 =?utf-8?B?bXBzb29uQ3dEcTRrNWp0b3B6SElST2E0OFZJZEl4ZmlQbUlmSWhKRnJXR2wr?=
 =?utf-8?B?Sm0wS3FOMVFqQXZraFJlV1ZOQmJLcXkxRFhia2ZZNTUrbkpSdFAxbVg2Zlh6?=
 =?utf-8?B?YkQ1YSthK012bFpuSmlzZmNpUVlZdnV3UXBZc3UrQWc2SDRIYVVxNlNEb2My?=
 =?utf-8?B?OUZsb29DanhqM3Ztd2ZKaE0rTmNOUXRjcjlORWM0NWFKTDdHNDVuSUJnZUNt?=
 =?utf-8?B?RHRWWk41UzRsN0tzZ3FwOXo2OFQ2citNYTFiaWtOWmo0ci9qcEN3L1RpWTJu?=
 =?utf-8?B?Ly93MTZjNERhZzNHYitGc3ltZ1ZVOFNhVmFnckdURlBaU3UxMVh1TVBpZkFW?=
 =?utf-8?B?eld4bFpwMmNUZFd1bkpWeG9TS0t1RUM0MjhWOE50cW12M29SUWczaXl4NURT?=
 =?utf-8?B?R0FOS2k0OEJrREE1N1lYcHZiaW5GZjVJSERSM0kwWTlGU2paV0VXeXF5aHdl?=
 =?utf-8?B?MURoYUMzSUQ3QXpJUjFvUVpteUJrV3poWkpPczBvQ011bEJiUmM2cjRVNm5m?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79822e34-0960-4422-2ff4-08dc1803853d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 08:57:38.2489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+VpBRzvwJ1Xk6dSkTflJwPbCeBMaiMa0Y86ze5zCjAwDibI6HpbBSvzq+Pjp18JKFhHGO4UX89GSLdtPlgUFTKt/60grfWl1romXre2PHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5366
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

Hi Swati,

On 11-01-2024 01:05 pm, Swati Sharma wrote:
> Add helper functions dsc with big joiner helper functions.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 32 ++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  3 +++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 58057aca3..91ce21062 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -7,8 +7,10 @@
>   
>   static bool force_dsc_en_orig;
>   static bool force_dsc_fractional_bpp_en_orig;
> +static bool force_dsc_bigjoiner_en_orig;
>   static int force_dsc_restore_fd = -1;
>   static int force_dsc_fractional_bpp_restore_fd = -1;
> +static int force_dsc_bigjoiner_restore_fd = -1;
>   
>   void force_dsc_enable(int drmfd, igt_output_t *output)
>   {
> @@ -201,3 +203,33 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output)
> +{
> +	int ret;
> +
> +	igt_debug("Forcing DSC Big Joiner on %s\n", output->name);
> +	ret = igt_force_bigjoiner_enable(drmfd, output->name);
> +	igt_assert_f(ret == 0, "forcing dsc big joiner debugfs_write failed\n");
> +}
> +
> +void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output)
> +{
> +	force_dsc_bigjoiner_en_orig =
> +		igt_is_force_bigjoiner_enabled(drmfd, output->name);
> +	force_dsc_bigjoiner_restore_fd =
> +		igt_get_bigjoiner_debugfs_fd(drmfd, output->name);

Why do we need to preserve this fd. As it is just a connector debugfs, 
and we can open it whenever we want.

- Bhanu

> +	igt_assert(force_dsc_bigjoiner_restore_fd >= 0);
> +}
> +
> +void restore_force_dsc_bigjoiner_en(void)
> +{
> +	if (force_dsc_bigjoiner_restore_fd < 0)
> +		return;
> +
> +	igt_debug("Restoring DSC Big Joiner enable\n");
> +	igt_assert(write(force_dsc_bigjoiner_restore_fd, force_dsc_bigjoiner_en_orig ? "1" : "0", 1) == 1);
> +
> +	close(force_dsc_bigjoiner_restore_fd);
> +	force_dsc_bigjoiner_restore_fd = -1;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index 4dbd88fe7..b2f8ea1ca 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -38,5 +38,8 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +void force_dsc_bigjoiner_enable(int drmfd, igt_output_t *output);
> +void save_force_dsc_bigjoiner_en(int drmfd, igt_output_t *output);
> +void restore_force_dsc_bigjoiner_en(void);
>   
>   #endif
