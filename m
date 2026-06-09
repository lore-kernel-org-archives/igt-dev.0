Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A424CD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DF610E557;
	Tue,  9 Jun 2026 14:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lmwvcri9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8010E537
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016854; x=1812552854;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=srqnad909j51ogzWuC6jCT8VuQBNUTlSz3/gpegrPog=;
 b=Lmwvcri9Eqg/GUoh57rRzwvRzwBDKS1JjHEangiwti/T93JlTs6iOrGN
 mrX2Oihyjs3m48iWVaPar0oE5NhXfi/BzTWLoZl+X+NIDvZhMwXPRP5RX
 aQ+jfcggDtZMoTxK5DbO7gYu86wzKHuO+sL7ntG+jp5zr8YhKc62ai0zF
 IFVayrBJ3GEcgp8e0PTw51OFinuISmOONsScCrnMOsrdrpLN92vy3YBnO
 spdKWgDADMNaAWBXXLd8rUQTuO0RFJgYzDfEuiKnUQYRw+3L03sjRC4cq
 kLbZk4Hfv/5b6Zw5FASLST5cPBsGDNPBhXaeYgF7aiLFPH2w61d5bfEPi g==;
X-CSE-ConnectionGUID: SQxNtaR6Raqx03IGjEiX2g==
X-CSE-MsgGUID: RH8IGdo7QrOLbVQGlVNKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84347824"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84347824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:54:14 -0700
X-CSE-ConnectionGUID: l+MpNKrjTWyw3TbsoI0/Eg==
X-CSE-MsgGUID: 50VNNcQ5TiW/I04gn5cT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="269563961"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:54:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:54:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:54:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/CkvnAT+CkNkeof7YPJvVJO/z7s/E4oZn35S1pH8LTZjkM6PQcfcHIjQYvfWfzS4kYBegLqtudTKyPB2tQxIxEVaQcNd3JPfyVRiNllvN0AwvKeR3q/AEvSRvUQeg5W9wCoOjbCZV0auAC6vBtlTkqUl48h76ljQqvPvCDfJxK8oJaY626adUq1MMxln67XkC2XywyQt1h019UcuL//VHotykq9VhYqxlSN2ZrJ1L0QBEqL7QMRfzZwHWFMAtVS+/V+cZQAwXSZQr9hCaJxVVTmUlvVazXTytDJ8K+dVd384nkEkRKL7JQzxwmxLyoF8ca6pJSziZLkgjab/ClY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtxjLcVMUYOvkE9U4+8W7ANq+fbzjofPvc+6WJOSTXc=;
 b=r03xmFOPCNXTmpm3YPayOfY7fmlLCkHAC3ZFfO9W6MMBKSSn8LpW6F15JCtM4DIEK6yT3eG/kHqo88oEBGJIpsKGIo06TYa+UmGIotEfAMwx8lk1hWUcK6iC3HbaBnGopDmOvNQaVNrYQ39ZNsNNYyHeBEJeR1NZFzInHQ7HK9xvqltK2JC8D+hO15j1NEaSGROKxk69prOr8OJahK5sqRPiYnhrjXKOonuxAhvSgbMDnwUppNkD36u/mTywfia03dR1x2m/Cw2G+bcT+Ia6t0C4gdQ5rbhjWHoOsr3pwsWHKgsGszmCYaLKymhq0ED5KFvEQCKnvWmsXRNxRvDbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:54:10 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:54:10 +0000
Message-ID: <b54e7c6b-c546-47a7-8001-5af1e6be012f@intel.com>
Date: Tue, 9 Jun 2026 16:54:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/8] tests/intel/xe_sriov_scheduling: Raise min exec
 quantum to 2ms
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: c89f89df-f8f3-47f6-86e6-08dec636f691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: d0woMhBpO1QnkOab06hgXHVVgqfpqSm7zhp13rhgtn1zpr3aXKpulMRkJU7A9meSnU5Yra7LEzjsnLajir0GzC0AZ3h0SATEPSulTSPhHXW7YZhNbH6bRf9KH6JMxB6FOm+cNvy7ZICqaXK5aouVY2iZRQ1YHVeib37JjvIqtXZYbHe8578C7SMh29LEUUAyXAXQ22rfzdyHqXM1MdMFpFXWu2z4ozUbXHLoZfDdaWM+ouXqwZlevKDeG0Bj3enWtM4uhg6240s+vrBOLRLkJ7FtpaWcSHdIIo/X1lRSv39N2xhYAnlWbOJBY82a7JXyYZLnI3Tz9yornPMGRoBwoNwusZq14DGRnAYhoazT4yHDDMPkl5QnOT4AlvMRCgA9Fm/UBIxGFg1M7QAvRKIX/U236D9T5c/hVSZODjpq4hLrCyJyKXBJci0Ue2aSYuA6TCUL/EOSRoKhfViPJjuiq5Dv6GrlGmMNx4DtdWE7cLrYYcGPWtECrdZjPS6eh7EsY8HuFRT+Oh06m6clh2YM4B3W8a5oh2T8eFw6fjPsPRQeGCwaIkDnX6HsKwkccHOQOqoOQxRtf2D5q2MXoKFpN5JUoikImTAoe9spz26bX79aQj12rGstIqWHl85HXheEFx30DAd8J+hvE1aNsI/kbzagBDgGtcfMgB6C3IbzlNWStr2PlPXGiqCg0dpUDCUT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amg2alZWdFhEZkF1djNWeStyUkt2S21KNDZQbVlqZ2doaXAzNDI0Q2dZb0kw?=
 =?utf-8?B?MzFmSmNDZW1Fa1hBWEVla3RjekhNZStGaUpLeVV0KzJaVnZaWVg5UkwvMWcy?=
 =?utf-8?B?aXB3UFpnZnZuNUd1dHE0UjZHUURVUW1UUzU0azJlbE1MaGgwbFpWSjZLalNL?=
 =?utf-8?B?WmlEWUpkRHhpMFQ1V2FsSy80aitZZXpJN0FVRjB2b0ZPNXdqNlFyd1VGOHJt?=
 =?utf-8?B?SngwSVZLNlVBcFh6clEzbEJNcHYwOXlmTjdlQytOR0dQNHU1eUV1a2wvd2ZT?=
 =?utf-8?B?M1lYcnN3Wm1MZVFmd2oraWUxaW9idURmcVZoNGdSLzhEZzV2TjJCdy9vMlRT?=
 =?utf-8?B?US9YVkpWNGx5OXRaRjFIN2o1NThGT25nZTVMK0cyZ3p0ZllFNk4rU1c4aXBP?=
 =?utf-8?B?Rm0rYnBKb0FFMlFPQlJOTDNDRmsralJhYk0raXhYdFdXZThZT1dOYTUzYzRW?=
 =?utf-8?B?ZG4ybkdaSmYxMVBLNW9lMFhmVkVRa0p5U0tSdkliYjIrS3d0b2JJZ1IvZVdu?=
 =?utf-8?B?TnJ1WFlKVGp5NTAzdi9XSTlmOGEraEVqSW9yT1huSytBYzUrdkNuRURRZHox?=
 =?utf-8?B?c3VHeVJFSmppRzQ3Q0JBeEEzR3orQzFTWHVSektwM3ZDYkQzK2JicE8wZVI4?=
 =?utf-8?B?dFVtOTIzRUd1SUJvT1ZBVXlPY0UyeHMxdE9VYU1oRmI4Mzc4bWNNbk1jRXAy?=
 =?utf-8?B?MGtaMmN1MUZoSkZnMzBWSFdtSlN3N2pCZFU4TmZKQm5VcDQ1Zk1pWXNBM2ZG?=
 =?utf-8?B?UUpUTnlQUkV6ckhlL1hMM09nQnJBVHF3RUtNdWtNMkhUeThkZnJEYjdxTENp?=
 =?utf-8?B?NER4di9PNVdEeFhydWwrZ09lbmtpd2U5d2hFdWJuazdjbDBXdThIR2NnR2sv?=
 =?utf-8?B?aUxZNnd6ZVFmdmxEQ3pmVWtyY0Z2U3RsMGRKakV6WDU2cDFMa0gxMTZVaGFs?=
 =?utf-8?B?alkrRzRydWFlRmJIWVMvUFEvYU1UZklvT3Q5SE1Mdkc0Qi91czlNb1RrbjZ1?=
 =?utf-8?B?djJadXdWSGo5NUUzN0VadHoyTE5ydUhXT1h1M2dOaWVDUzlSVEw2WXZmemRH?=
 =?utf-8?B?bjJqM0ZCdjhleDBVQk0ycHowNkdrTjc1Rm5WM0pRZHEvUnB4OUxpNkdOdDk5?=
 =?utf-8?B?TGlJY2djQlZ6cVlRMmlyMFRPWXhuZTQxcVViNmlVVGl6eUxNSFZob0hmdFFh?=
 =?utf-8?B?VnVGV1lwVHRRTzV3U2ZJVDdKVTZwWkJScTBJaGxiYWpuM0s5Y01sdk83OUgy?=
 =?utf-8?B?QnJQa1pRTVl0WkZGS1k2TDNsNWI0L1lIT0tTVDNZZzJibTV6VnJaSXFydnpZ?=
 =?utf-8?B?SGxrd0x4KzdMVExnOUw3c2syR3Vtdmh6UlExSzN4NUxMMUU1NXEvOVpDLysx?=
 =?utf-8?B?R3Rzb2p0RURiekp1MGR5NWxmWWttV2k4UEdVZG9KTGp5S1UxblJUOE1TQlc5?=
 =?utf-8?B?elBsSmRSci9hbWU5Q1BiZEc3VWF5akgyMWovSHZsR2hNdGVYTUY4cnozb1Jk?=
 =?utf-8?B?bEcvTGMxVEkvV0FpWnhjNEpZTTRpUTc2d1BKUFBSajd4d1RyR2V1Vm9FZjRC?=
 =?utf-8?B?TWd2czZCRitJYy9SbkJESVA4QlE5RnZtSkRRSVNXSDkvV2xHUTBXZkwxVG0x?=
 =?utf-8?B?eEJnVDVtbUIrdS83VHlMbnhITm5NaU5CQkliMytjZkgvd2w4WWh4ZjlkOGM1?=
 =?utf-8?B?bjJOWjRReldUbCtwY3E5SGhRZTVpMGZvVExpOFpMZXFkUnpKL3ZZR1Nydzdr?=
 =?utf-8?B?WUtFN2hIZWM2Wlo4V1QzTnF1UVhtN0dET3BYQkx0WVpuTHBUYWhEZ0haUzls?=
 =?utf-8?B?bGV0elN3dzVmTzl3UUF2MEt2ZURpbFpsNllVckNoK24xMEpuZG52YndMUm04?=
 =?utf-8?B?d1BTbWFIUE1lYWEwck5kZ3hFN2tiY1huUnpkRG1WczZIL1Nmd0h0Y0xZNFNG?=
 =?utf-8?B?clFvVkgxSjA3SDdVWS9WOUZBOTFRQnpabWNxV2hlUDg4TEhLdEl4Zy9xUU5C?=
 =?utf-8?B?eWF2OHd3Y2p1TnZpTkhZQXJORnFXd1cxdWp6dk52cGxaOERrYnJpdVJrZUJl?=
 =?utf-8?B?eWpjVWE0S3pxV293R1ZFUTZyR29lWnNNNjNwczk0RXNQY1JpU0V2K2NMRjFG?=
 =?utf-8?B?ZGdyd3VDUmNqQnppc2RLSDFpZVppZ3cxYW1OTVNYWFZaQmF0VGxzcUw4aUxF?=
 =?utf-8?B?U0k2MWFBNlZZNnhQR3M4bUNzczRUbmdoSGpKald6SHZwSmxIUTkrZnVBVmdS?=
 =?utf-8?B?ZHRPVWw0cjJiT1pkQUlMaXhGanlYSWR0N2xERnNMRmdBeFc4cWdTYmNIbFd4?=
 =?utf-8?B?T2h4K3JNa2xRN3JSSXVsZXVzY2owRVRIRVhlWDRyUElYeHROSTJ1UT09?=
X-Exchange-RoutingPolicyChecked: bVuSOlsf/HUhWYUivdOFPKgh3I3xlBaIm5FenpJ11WQ+YTeCIgT8WGcIaMXsRprQbJw+SGeMkdwe5wFSuoNUmBVV933yXaXa2L9MPWjwsbbCYfxTyN98N3nFJ33xV3a3TsoIDyfMbRnKFLCEjaZtufxPero0p35UAFP3xsUMQe3RFXF0O5NLKHXPbBMAoOHruNtkVKncxmiexyVRcB2buOjV7FUIiaR5auoZCHQKFM3dMSbwatnC4FoZIEaCOpQY95bBMya0JIXB3BhC8rbmh5SttEEre+Kzf6CdMkHVAEF6CEnyZ/LYnMwOL0Vn49/MTRW038fJ8t0avfoAMJlBiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c89f89df-f8f3-47f6-86e6-08dec636f691
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:54:10.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MMPO7hNHVw6p3TIn0h9XZkBeusTdy4GB/pEqggVecnn8/N5EE25dw95V4rCbDRQ3oI3ofXFsBSjRoXjEFIeTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Increase MIN_EXEC_QUANTUM_MS from 1 to 2 to reduce PMU active/total ratio
> noise and avoid false positives.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 6d8b7640d..9550c8e58 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -519,7 +519,7 @@ static void log_sample_values(char *id, struct subm_stats *stats,
>   }
>   
>   #define MIN_NUM_REPEATS 25
> -#define MIN_EXEC_QUANTUM_MS 1
> +#define MIN_EXEC_QUANTUM_MS 2
>   #define MAX_EXEC_QUANTUM_MS 32
>   #define MIN_JOB_DURATION_MS 2
>   #define MAX_TOTAL_DURATION_MS 15000
