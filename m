Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A824CAC597
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 21:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C5810E1F1;
	Thu, 18 Sep 2025 21:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7GNf1C3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064C410E1F1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758232359; x=1789768359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=njEWQN4iXaLQpaYs3qC8GjP3+ZaArR4t/FwqJECk3Pk=;
 b=k7GNf1C32y0bEz1y6uN8P62kDjdeK8uX8hzeG2LnGF2PjClRVFl04toi
 WbiCZz7/0qY5vQB5RXelAvLXVbjxJvMyRtJYWteyCcpDCC7byJy1j2tXJ
 sFvlB00SkjD8D+2R9OJkPmlRbinGT3dVFIDHomIStYmo+PCwe796vq1Fo
 Co+vGkoouy5FXDtb0SVO1/GRqSHB0aVRl4l/pmjAtMS1GwQE8B9Ed7otT
 ATfpRrnEa+bpqHJywkvjbUyUDptKa81AVAQ31Nc/y8sKoJgRVoO5N4HLV
 3YRZDEYzQssXgXO6ajXnk6iuzVl05NobUc3fiuE08qEmC3/0QvRrqmqj8 A==;
X-CSE-ConnectionGUID: NBXyVl2CSmy+K4XFh/z1Zg==
X-CSE-MsgGUID: Pwa+SO/2SxewheplQrv9OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="72007005"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="72007005"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:52:38 -0700
X-CSE-ConnectionGUID: KW+MgUfqRZOtUlziio+wkA==
X-CSE-MsgGUID: 7BFm/ctXR0Cn3avgxwX5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="180778412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:52:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 14:52:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 14:52:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 14:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA+RzBdRLZzKwRMzt1VHw1JQsWppcwoOfsicnFp3T9TXc4H/CsGemoR6+7vtIRQCng4Sfr4qK+0H2ApkNS7UjEe4SUe51leyFc3VIFrBOriyKcHVlWQr/Sih3R+yb9aj0B5a7dM1ryYtHpFxzCOy/f0PjjwWMpiSjdhcIhMiNo12jlmOa8OheS9g3x7TKBvTJ/uZdNMOzxQA8V/CnL0XsJokz1mVF4ZtPFxZd9EcyEpFdR2ha+64UhLwCaia0qwRyK6dvetzdntqVl/iUWXoPbWSS0w4I9v9UHBFsPsMFS/XNHnTIad2Y96kA5UhQwTn4ZS4narXXR2rXMkYRgtBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ohc7SN3hAaLK/X9Pr+Mpm6wtfOpXEYnJmA0jqM5//Q=;
 b=vYlwCcZueUkwRIEO1rfg7o+jP40An25j4TyLkAJGiIxmDNNOM6mPpz9CBN5Lrig7vC4MAzeNBF+xQLVeL3Dy08R/DfjuxG0EkBmz1Qav+22pdmvX/H6Iqly+oBpwHOm/vGhTU/5aBT3najxYmwjErhYUGoS3ggucU8O7FyUyp/hNvBbJDDQNYQw4RUkegUwnZ9Pyxv9CWq/bnsebebuPds3dDM92t1xH1a2Z0cjvTVOjXpxU30raIp9xZhAtqsuJcDEaE+8s/XPo2iZs2KjU4S9Pq2AHzO8SWd8MFQWMnj4H+TdBqvNrRcGqLIbgdeCskA0atizz0yeFlxFr+7HLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 21:52:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 21:52:33 +0000
Date: Thu, 18 Sep 2025 16:52:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs: Check ctx_restore_post_bb
Message-ID: <ak2bcw5bjuazm5vfccbebloqebvxnsufp4uure44opn64qev6g@bngisnsavr3o>
References: <20250906055220.803070-2-lucas.demarchi@intel.com>
 <aMxa1aehmuAqberU@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aMxa1aehmuAqberU@intel.com>
X-ClientProxiedBy: PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ada607-54fc-4cd9-bf77-08ddf6fdac4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YCq/7ojBWnhcddcGq6vFL0T1Cub+E9Dp5A/DsiAc13IR66QW61XIP4wT1be0?=
 =?us-ascii?Q?SHGsRZebsBYNa99QUir8nOd3Y4yqR3USizXc1e8KKdX5ezW1RsY/GHyhPwUl?=
 =?us-ascii?Q?dybxdh00Xsp4cP9EwD80Dnhsz3I5ouJfuXq196+tFhIVxaNfWosgPykb7lis?=
 =?us-ascii?Q?WWVjeUAZGGwWeay/FX6Py0E7tG6vGYmewjOY+kI6csPXAPwLsTWLB91vcB0d?=
 =?us-ascii?Q?Lfz68Y0IJnnFuH9vL+GHmZEolesLHlrxi2T8gSsDPiWtYBfGjm1m8+R/5AhQ?=
 =?us-ascii?Q?neXwAmfd34K5xefqjnYHcssceb+4YDhpVdTCAbEbS1ISpmrv1CEED2y20plS?=
 =?us-ascii?Q?M+VrnaCYjabmWvAItV0jXtSQiAhNTSD3YDtZT7dmlY/yZugEKZxkzAjMm4UZ?=
 =?us-ascii?Q?+7cPylyuRYNq2lLf/dhpgQ4R075aIVRBqfYWDFCX0uwmOjoSnUK1r9LZsDWG?=
 =?us-ascii?Q?BnFTRrLHMuEEkoaIpkTU174PMCfmz1oKS7ib8kmYR6/9s+bR9eiwAaP44Ypf?=
 =?us-ascii?Q?OHJFYDtBgynPaleV962umda6o1EIZKTNKK53j/ZEdRvoMu3yw3tufEl42piz?=
 =?us-ascii?Q?pVjXwUlyqJB9MQ4VHiBe0FtHZ9pFCU2DA++qZsUrBvuDxVrt3oh/7x4BuK+Q?=
 =?us-ascii?Q?xTNNqe3kQKPMKklyXeoanTqtf8yTak6Toi8OTO/C1II3PuYGX4B8hNd6lOTE?=
 =?us-ascii?Q?lfbZyBEZYLk+dMwJXQ3ztsCVclLhzgkRZAzCd0dJrd2xkGHpeQ3g2zmp4j1E?=
 =?us-ascii?Q?fLpnG1qWgTAlxkdeJSJJcujHkOR9mwNb6wa3+m/3lybHFLNw7VoGmYTgTQjq?=
 =?us-ascii?Q?Qn5Bf9sqHrMSane3u4/1Pgh2Mu+52zCX+UDNhNdl0h49x0asiHkbSrVNiZKG?=
 =?us-ascii?Q?0gU42Y9CKoHPA5ecL/9EWgYToNfEj/JY5MSJmwM4TWRUGN6lM3Np9/sgBaW4?=
 =?us-ascii?Q?rwViP9o5d55LpUkHa/MA1A11h8ySodi9DJn9ws808llCSES4Pkal4aCoHSor?=
 =?us-ascii?Q?XqcP+assncLWh0NL3s7QdvhLoO+m7CNw+dQcemi9USP9IQVcSSsqqUPTrudc?=
 =?us-ascii?Q?SZ/X+TG8/y/KVXvf0Fh3mxlSVC3AKXLLnYnF35aOAWhVoE+I09fcPVz2Fw0v?=
 =?us-ascii?Q?Xzcju8rcuv93UqPQj/fxSNMCL0lR4ShLBkoe1PruogCTT0E9vRu8Fk69Dc54?=
 =?us-ascii?Q?2+doMqUGpmJgqZSBwoCt5xwpmt+dNV0TjqGKVP9lEIIf3XQVSNThXLamjklf?=
 =?us-ascii?Q?IZ19frW0N9w0IO8DFL6UMgWYtC02lqI3AY0tf4yuIH5YmiFdqC7sFKg9iWk6?=
 =?us-ascii?Q?noGwW5Hv0VBgF2t3lnmmxnSuWbSCbt5Dvt0d78k3Zrd6rsC0kjv60v7OEE+2?=
 =?us-ascii?Q?3Vo11iwyJZF/T2U/0cQ0g1Ns78SkI92RdwQLg9mhdCkp+inyV6oDJ2a86Th7?=
 =?us-ascii?Q?IuLCX+C8c/Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynGVFehdhCzulPdw3U6wx9H3HkOU2Y9InHaLJHB5ADKpDkzAD0Ml/jnaWZl0?=
 =?us-ascii?Q?HPCO8RThjW7OHJr8M04iaVvyEdw7JZUVTmWTym2LedoS9V4HQ6z1PZSJNuhH?=
 =?us-ascii?Q?OZg20HlpEogrxMlFUwSpH+2DZ8LTbOQwlHTbpTfOoKB8Snl7pGhKuQkhhidK?=
 =?us-ascii?Q?T0+5EOgRQQJMi31tTscoeNnQSrwenMiyEpobl67YY2A+3tuA2ApV0V1PSa84?=
 =?us-ascii?Q?LIP4pIVUYX2AWKUPH9WbwubB/eRIj0E/2ak3fmI//j6IncrYKV96xZRfN+ta?=
 =?us-ascii?Q?KmBdQr98unmcrihVutx45EFy6365WlEJff3r0a1lDv3UYofHzu68eF2Fc9ih?=
 =?us-ascii?Q?n/mX3kdKLXOIIXpEkG6JxjmV/8qcF4UTwcwBSszuaHGvGuhU/Pcn1z2IHAIh?=
 =?us-ascii?Q?7B8ND7g5uO49LR90zhJnGN2EeGgqEIJLuvtiP4y6ttoiYhqvXXxRzU9S0mjv?=
 =?us-ascii?Q?7VwdL+HI9s0/vgR6R4G0bXdYVfvQcglXz5kZJ6hapmWouhTX+bXccxdaKjcA?=
 =?us-ascii?Q?Nw2iTQU0gezht0I2S6pjSg6WGYWqAifnRZqqFTmVoUvvSTAWLzJD2mgbjiAF?=
 =?us-ascii?Q?si1JgW7tIUy7Cl0k7oMJ33lws1+xqm9hFKshGOcgXKyvkr4Nd3Vi+nkqtIcD?=
 =?us-ascii?Q?s1IR/LIckTeBBTcAeTXUPMVcBl5i3yfn12CLgYlCh+KKNDQYCNF4HpGPEEIx?=
 =?us-ascii?Q?JbTiOKYNTYeKPCLu557X7vk6RRzw3NcXUu4fNMwQlgViMBnIVHB9vng14Xex?=
 =?us-ascii?Q?qzyT9aVK+fajNcq2vpyAi68RfCTtXAgYB/guHYjI1tYXMsedpDvw2rNgVD3X?=
 =?us-ascii?Q?ThPk5u0Wii4tfffD8NjQSekZbpW98PNQorrGbfZ7uMmgOeGOteO4XnYwWP3C?=
 =?us-ascii?Q?oFksaRC5sQyZy0GAqfO+8eIffzh0dHglHzreeq/s5qq+1WKgQDRwhz7YmHG2?=
 =?us-ascii?Q?9HHQP1DRs8M7VFDbLHCvj+07hOZoGu3NinWMsZlNuPk1ZqPL8zWVymaOlhG3?=
 =?us-ascii?Q?V2py1HoyURlus7hIMzB4733+2Vv+vXoHVqsGIe9vf+oAqqVRg9qRGSeVyfnn?=
 =?us-ascii?Q?Vk4SLfWNGh07BOJyaUg6ryIJID5MfUWHk8tbxZx2g0EUA01rT7rnvsMDKm0S?=
 =?us-ascii?Q?YfVyOEsWdYpK+NHUCLaIouvgPNnewe0ioQtnvu+xiVuss2LwMW4/q1qCdhRl?=
 =?us-ascii?Q?iYfoOoOJVQUQLR4DFHm3T8I7Tt2JTNCLd1R8u8412F31VKs4y+WdTtMQrs4I?=
 =?us-ascii?Q?BIfh/BbVxovDsNJRFF9gBx5vRyI7cC6jZd81HqM4Gzqk1q75dh2CxKMWiChe?=
 =?us-ascii?Q?0vvPdv6WTDgF3xBiSChBnWsu5pfSTmIQdCrTxS1mQgcsdkVq0rbawqkDuYjg?=
 =?us-ascii?Q?VSWvq0LDhuA/3erS6L9TRQ3gF1/mnDAswnr1ufOQkDhBR4g6UjkMFa/e7KLq?=
 =?us-ascii?Q?vZwFWNCdC8yeXMfvLQtPiOryQSNgOTSc7i5Gbvv6W2J0aBcHdqL+oI08jRTw?=
 =?us-ascii?Q?wit8ssNRi6FJZzWoN/OvRJWPVGu+RIA+Z5MW5lgmg3yrbnWHbf04lnwrzT4O?=
 =?us-ascii?Q?WrI7KeiR68d5gpbw9WIQmhzEpK7CtG9ko1kydFcV2uN7OY5Huu2PJqGtCNAU?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ada607-54fc-4cd9-bf77-08ddf6fdac4e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:52:33.6014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T1CNNbJu5xfx8oMPDIWy4sNk0+mM7mWWfQlieFWM5gj7lqubRCMlhfoJNq8Fm+RuiqiBHts+/0Y+2aBvpD8yhs2+om+jql+ql8e0p2vGXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Thu, Sep 18, 2025 at 03:17:41PM -0400, Rodrigo Vivi wrote:
>On Fri, Sep 05, 2025 at 10:52:21PM -0700, Lucas De Marchi wrote:
>> Add sanity checks for the values possibly written to
>> ctx_restore_post_bb, according to pending patch series:
>> https://lore.kernel.org/intel-xe/20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com/
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tests/intel/xe_configfs.c | 113 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 113 insertions(+)
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index 086f99ba5..d778065f3 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -122,6 +122,111 @@ static void test_engines_allowed(int configfs_device_fd)
>>  	}
>>  }
>>
>> +/**
>> + * SUBTEST: ctx-restore-post-bb-invalid
>> + * Description: Validate ctx_restore_post_bb attribute for invalid values
>> + */
>> +static void test_ctx_restore_post_bb_invalid(int configfs_device_fd)
>> +{
>> +	static const struct value {
>> +		const char *test;
>> +		const char *in;
>> +		const char *out;
>
>you don't need the out here right?

right, because in all of the invalid ones, it should be "".
It would be a good idea to read it first and then compare that none of
the writes go through and for that I don't need the variable here.

>or do you have plans to move the declaration out of the function?
>
>> +	} values[] = {
>> +		{ .test = "invalid-engine",
>> +		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-type",
>> +		  .in = "rcs 11000001 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-number",
>> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-number",
>> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-reg-addr-only",
>> +		  .in = "rcs reg 4F100",
>> +		},
>> +	};
>> +
>> +	/*
>> +	 * These only test if command parsing is correct,
>> +	 * so just make sure there's no device bound
>> +	 */
>> +	igt_kmod_unbind("xe", bus_addr);
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>> +		const struct value *v = &values[i];
>> +
>> +		igt_info("%s\n", v->test);
>> +		igt_debug("Test '%s' to ctx_restore_post_bb\n", v->in);
>> +		igt_assert(!igt_sysfs_set(configfs_device_fd,
>> +					  "ctx_restore_post_bb", v->in));
>
>worth binding the driver and reading the mmio register with intel_reg
>and comparing with set value?

for the valid ones (function below), yes. I was planning to do this
additional step on top, but I guess I can do it here. The problem will
be how to use intel_reg from here and make sure to choose a register
that can be used across platforms.

I will rework this test and resubmit.

thanks
Lucas De Marchi

>
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: ctx-restore-post-bb
>> + * Description: Validate ctx_restore_post_bb attribute
>> + */
>> +static void test_ctx_restore_post_bb(int configfs_device_fd)
>> +{
>> +	static const struct value {
>> +		const char *test;
>> +		const char *in;
>> +		const char *out;
>> +	} values[] = {
>> +		{ .test = "cmd-single",
>> +		  .in = "rcs cmd 11000001 4F100 DEADBEEF",
>> +		  .out = "rcs: 11000001 0004f100 deadbeef\n",
>> +		},
>> +		{ .test = "cmd-single-multi-values",
>> +		  .in = "rcs cmd 11000003 4F100 DEADBEEF 4F104 DEADBEEF",
>> +		  .out = "rcs: 11000003 0004f100 deadbeef 0004f104 deadbeef\n",
>> +		},
>> +		{ .test = "cmd-multi",
>> +		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
>> +			"rcs cmd 11000001 4F104 FFFFFFFF",
>> +		  .out = "rcs: 11000001 0004f100 deadbeef 11000001 0004f104 ffffffff\n",
>> +		},
>> +		{ .test = "reg-single",
>> +		  .in = "rcs reg 4F100 DEADBEEF",
>> +		  .out = "rcs: 11000001 0004f100 deadbeef\n",
>> +		},
>> +		{ .test = "reg-multi",
>> +		  .in = "rcs reg 4F100 DEADBEEF\n"
>> +			"rcs reg 4F104 FFFFFFFF",
>> +		  .out = "rcs: 11000001 0004f100 deadbeef 11000001 0004f104 ffffffff\n",
>> +		},
>> +	};
>> +	char buf[4096] = { };
>> +
>> +	/*
>> +	 * These only test if command parsing is correct,
>> +	 * so just make sure there's no device bound
>> +	 */
>> +	igt_kmod_unbind("xe", bus_addr);
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>> +		const struct value *v = &values[i];
>> +
>> +		igt_info("%s\n", v->test);
>> +		igt_debug("Test '%s' to ctx_restore_post_bb\n", v->in);
>> +		igt_assert(igt_sysfs_set(configfs_device_fd,
>> +					 "ctx_restore_post_bb", v->in));
>> +
>> +		if (v->out) {
>> +			igt_assert(igt_sysfs_read(configfs_device_fd, "ctx_restore_post_bb", buf,
>> +						  sizeof(buf) - 1));
>> +			if (strcmp(v->out, buf)) {
>> +				igt_debug("Expecting '%s' but found '%s'", v->out, buf);
>> +				igt_fail(IGT_EXIT_FAILURE);
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>  static void set_bus_addr(int fd)
>>  {
>>  	struct pci_device *pci_dev;
>> @@ -173,6 +278,14 @@ igt_main
>>  	igt_subtest("engines-allowed")
>>  		test_engines_allowed(configfs_device_fd);
>>
>> +	igt_describe("Validate ctx_restore_post_bb with invalid options");
>> +	igt_subtest("ctx-restore-post-bb-invalid")
>> +		test_ctx_restore_post_bb_invalid(configfs_device_fd);
>> +
>> +	igt_describe("Validate ctx_restore_post_bb");
>> +	igt_subtest("ctx-restore-post-bb")
>> +		test_ctx_restore_post_bb(configfs_device_fd);
>> +
>>  	igt_fixture {
>>  		close(configfs_device_fd);
>>  		close(configfs_fd);
>> --
>> 2.50.1
>>
