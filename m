Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8A0CD3427
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 09:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1938710E5F3;
	Mon,  4 May 2026 09:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9o2rI/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63C10E5F3
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777887569; x=1809423569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E6qEYVICPHJBvu3UsY2QFTVFI8m3Hu8k1bGPhl2E/o4=;
 b=V9o2rI/gdPAw3ZrB7aqe+t2Axtcdj4fm+54kgQ23PsPC1aRNIbv8WeGS
 Kesk3V9iXL/qShL62JNFHa6iGwWx6AQiyzjpiorpnWYhITPxNB6rW4DAE
 vjbIkqk1j4yGJqVtXxlLqO7pRKZGi8Kgac+QCIs6MQlping25TJbC7JGV
 r6bT1P9zxtW7pvuaHz2SpWEgktsXAxPW2ubGt4P745Oqnt9Kcg/lbiiIS
 yZwLkzNOpWzffdxKgXcGu8kGiO1fnzjq8z0JmWJXbRngGksEJ5jO5cAI6
 dKXgN1MIv/gfTbNE+UULs/RKmQnuNabGWbUxciNMix6n1QI4OttxIVtI/ w==;
X-CSE-ConnectionGUID: mTDLtXWPT4+cqU9wTX4N2g==
X-CSE-MsgGUID: 0/ZQAOoNR8mQBWsBHCtMRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96168338"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="96168338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:39:29 -0700
X-CSE-ConnectionGUID: W73kI2PfRM68wShoJXqvJQ==
X-CSE-MsgGUID: 2WIuLFCHRBmYcVfOnwV5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="228974685"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:39:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:39:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 02:39:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZocsGXFMoXdooCc7+y/zdo9RRe83sxxfFT12C3Yr/KUWrweZqypViIwgfyoBlcvkVepf+vZgDCIC954JzA4FLGkufaytGyA7uwoaOHmCDIjYimCrJ26mPkzR2siac3CKTRpOi2ReCpLHsU9rE4bc//mu5MBbgzagwux7u0M8tnFafp/eEGgETlt4Psd49rGfFjkRYP6FVM2cdQU/EqYvmK0ENtqoK2Amm2d60PKeAMLYvQS4cn0l6G8DF3btQzvBw1OcZzStqsRiU6tfjg1yExioGecT3NkRZGAWtiWcZRLB24sqQhy6dwHymARmHsfn/6z3B0LUkfrQ1x0wViDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxZoS6En+6GIcIUg3mKopPCvqdd+e5U5Hdx25vl7n5Q=;
 b=OmmyoWgi41jjsbmwEwCN3ShC1BDG6QOaTrN+jcSO6bU+9hiX1crFTdzo4gRx+FDgHYLZN/Bzro9FQ2kHSCJKukVh5K2+4pRe59zHYkTBk8dGv452hHAZHf91dJWBl8IycZvLfQJ8i6B0g3hzhg7CB9UbYNjKqr+PrEjgkGRcp9/0wOiPow6iVSB/rQO64AH9piTmT0Ob9Df8qHrqvjHUIA6kWNGns2Gn6dfJGz47WwQaeNbYAaAdMrjK0VjAGBSCjObB2z65Mc1HmKfYHAmDlQxv2K5WMvLJ2y84LWHoJvmzvzwE9y1odTlGbeXGyVmPmWXXnb5ys1ngrgupiejIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:39:25 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:39:25 +0000
Message-ID: <506a337e-7b9b-4687-9643-c443b6d64dbb@intel.com>
Date: Mon, 4 May 2026 15:09:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_hdr: Move test_fini() for proper
 cleanup
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260429093955.3726263-1-pranay.samala@intel.com>
 <20260429093955.3726263-3-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260429093955.3726263-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0187.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5db26e-326e-4077-de81-08dea9c10772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|42112799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fGBwi7wi28P+m7b3YyHW2o0fJBRFf3BTZ82Ei/wbivZ0ebc45wxldr7EFvtYewdFTel3G+XB9LKjRh66W/NN1wGom1aEJi3Enl9HqofcauI5Ks/w5jjAzGV8FZLL92Fcc30xPsriACzJ8FwusqPG0XRj/JyH+osm5RAE5pOb8dznwh5W7dyoCktV01LM9BVMoYvTrM2WGLr1nrD2K5ei4QZ51kjxxkG3gA835EnaOIrhjjLHUSpsSGS1IgilvPDo5PgbkXQFwJS0hSPp2KhX9mSTcE/WOteLDjI6yJb2376aTAVJ2XX40FSj6idRMxG2gu6vwqpGyOfkfDxbPjFupAby8fQpL8W+lLjDRpshebiFQ72zYM+B4/zfuGrhZ03BEbKm6aWAD3IS6wUd6P9A/9bg/RFcj/TcT5B1MzTC+v9uO8MVyy7pmz9bwWn7KQLTZ0d7hvKUByCeELLUaE/s39ihjIQx40LyNJD1S/bUIXL4AKft4FnR+ABqXk1IxgazWB4x71Jv8COe2HCNubifALkr0kV3PYNrXVqZ3EoOQAs37oFavq8wKDOuEzicaHKAsyFWasIdquJESMWAQEVQjwwNxAWMaaNx4c8SfEhIyR77xCZMMZUnjKZyPZlmahulgA7xqAoFM2gU1+LtRttfzQIlq3lRVIaSnjUrY1aRbyZq+ohs1QQ3vkY+os9xOLIv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVwVWYzWTZCeWJBNXVRZGgyL1BYYm1ZZi9kcVdLWTl1OEVSUFc5cisyVUVI?=
 =?utf-8?B?N05EQWFYRFo4c1NaUU41MWZwVVczYnpLOFB3T1ZOMW1GSEt3dnFwYjhKVllV?=
 =?utf-8?B?QVl0Z2dCMVloYWpxMGZRaGV0WGhwaEVTdGN3SzQzTU5NMk9ibDV2MnhOZWd0?=
 =?utf-8?B?N2RGVkppSGlXMHlZenBGbmhiang4WXJpaFduaEYzK2dvcE1TYmhwbHFKdEFq?=
 =?utf-8?B?Rk5hUUh2TGFmcUtHWlhhUldxZnVxUGllWENWZFhrVEhWSEJxZGF1RTJ4cW1J?=
 =?utf-8?B?bXNFSVZudXBPOGYvdFdTTy9oL2hUYTE2Tm03MkZMaFRHRTM2ZTRiRUQxVk9t?=
 =?utf-8?B?L0UyTDFDblIxazJHV3cxbERNR1dsYzVDQ2Zxd09sM2o2WlRGZEJyL2V0V0JJ?=
 =?utf-8?B?dEVpWEtodnBTYW1zeGRXN3dGWkt6OWR0RzJpTE1LQS9CUFBOWGcwUzVud29Y?=
 =?utf-8?B?MThqR2FJdlRHN3pweXNMQUJvYm14NVJpVkJIZXlQdEZ4dWplMEVpdFBjZE9t?=
 =?utf-8?B?WUpuZWxTcEJDYTJObEt6RlBMcm5sdUZHWTJHMm1YU09OQitrRVdEMHhRdzd2?=
 =?utf-8?B?bDFCQmNqRWtub1B5dzFLdTI2MGM1b0tFWmszZmRSUHRBeHRzTHhGSFVOVHJs?=
 =?utf-8?B?WUk2ZHVuQm93UW1oOHcyUlVCc0RHZzlwOXZTUE9RTE1NTW1LaTk4Yzl4WWZF?=
 =?utf-8?B?QWR2dkF1dzRYK25SUXdiTDVGd0ZZVWROSXJxMTExdVVTZFpRdGk4OG95Rm44?=
 =?utf-8?B?cnpwenVDOUYvMnNVbFMyK1Z0dEwyeHlVU3l2dDBkejNDUStMQWpiRlpQdUY1?=
 =?utf-8?B?K1R4em1aMmozQm8xWnBhWTNCOFU0U3dlWHVIeGNVWlZkR2pTVEFVWlFFb1Nt?=
 =?utf-8?B?Yit2T0IrL3NlLzlXeDdmN0pGeHplcWFSdFZaTmJ3UWZRVkc5QWZDRFhma3JZ?=
 =?utf-8?B?RXc3bGV6cnV3NkFXMVVpdjJPUzZaN3ptUWZ1YUwrbkpNZTJEVDNBWjZsTWtS?=
 =?utf-8?B?blowVFhicThVTlFlclQycWM2enhtaDk4OXNGSElRZTdqOXFrZ2RFN2VGdVRQ?=
 =?utf-8?B?K0NlSTY1VlRPa1VTbXV3MGRndzVucUNUM3d3b01tMzRhdDhWLzlGQzBKcTNQ?=
 =?utf-8?B?ck5meUZpcXN1ZGlRcU03WVFJaVNtSGdMVUJVTHhwdlIvbThxQWIrWU1idjZn?=
 =?utf-8?B?WkNiWkdENllwTzcxN3IrM25vSU55VFRHYjNYZnhrbExJY2tBQVhQNkxKRFhT?=
 =?utf-8?B?N0ZjM2JWZ2NSc3RNbE9pVGs2bUZjY2RWbUtaWCtQcUpKMStFVFF5aEpXSnN2?=
 =?utf-8?B?TFMrcHdkVm9qbWV6eXQyY24xeVVYQldvaTVOR1NDRDNtMENQZjZRTHFxK3Jj?=
 =?utf-8?B?OHRURFpNeVFIMWpYUmZnSlZkOWd5bnpYZ2wxMyt1MFRiNjVodVJ2QXhFL2xr?=
 =?utf-8?B?cEF5SUhvcXBhMXd3eU81THdWRHlhRGI5RUFmd2RqU3BZWEV3d2R5RnBGdWov?=
 =?utf-8?B?ZFhydjlPM3gyNmpoMGR1aTZBUWtOc3NqVU1LWkhpSWp4Vy9ERlJZOUc2L3h0?=
 =?utf-8?B?eHEwNmdvMnFkS3hBUWRQYTJERFZHKzF3VlBDY2pZSzh1MVAzNXlLUEloMEJL?=
 =?utf-8?B?RjFEQzRtNW9aVTcyWWM2eFdYWkF1akNwcjR5MVdzeURLWWdZRnNZbUtQZm0r?=
 =?utf-8?B?TzZMdXlXVHdpUU1TekQwZGFnblVxWDVNQ2lORW01ZG1nOWU4T1J2ZGxRWXN0?=
 =?utf-8?B?d1EraGdrNmVoRlptZWVqR09RVTdqdDFWb0pKUE1MckI4Mkd4b2pTcjZKSG4w?=
 =?utf-8?B?M291amRJc0wzam0yN2xSczl2WWQxWGQyNk1OSkRKcjdqUjdDdXh3V29ucDR6?=
 =?utf-8?B?RGJrZ01SQjVmcjFZdElma2p5dWpHaldOTGVXQmZUTFU3cTNZTWhIbURCdUFt?=
 =?utf-8?B?MHpvWk00SE5YZTdFTlE5MXNaQkZPTTMwamY1bkpFWUsrQ21QTHBQeTNqNk1v?=
 =?utf-8?B?Sm1UemJWb0M2QzNLSElqTHJCbkdFOVhPWHk3enhja2RMUDZ6OVRtakRkajBQ?=
 =?utf-8?B?RXp5elY5eGZBaEFuWU82QUpjaW5sbDR3MnFmeTlMTlR5SlFaR29Qc1QrWTVu?=
 =?utf-8?B?bXJmQmRjN05kNmZwUS9JbnJodkVWdkt5ZktOMWRTa2dVazR3ZTAzZVh2M203?=
 =?utf-8?B?OXNnVEk5VkppMXdJU0M1WE9TZWdBRjhrV2JhK1llMkt2NmE2ZDhKV2dVWldR?=
 =?utf-8?B?UmRPZzg1RXlQMjl5QklVK3hjM2tmUmtBR3FsYnc2NUszeDJ5RHowM0dVQk1U?=
 =?utf-8?B?SzNGZ1dVU0FzNXpDeE9aRDBSZmtsVFVRWEg4Z1N1MTUwSU9wejNTQT09?=
X-Exchange-RoutingPolicyChecked: Cme9Fi/Erv4GkwThSGrAbiLnYhqkggfBBpgVU8C5B8b9aeOMkPxv1OBetOUR4C8jrWTtqfGEn1htT/iD8dPnWuI4PNu8MfFl55af+PA5FJ1BmDlfyFaB479rwHS2WtXRuwfKvsJLGuaX05LwqdxTWeHBl2uihsWyCQfHwPWPeOebKJ1oJKT+UHEsD9KNfOobab1k3+yi+qp3f/c+fWnO9zte0tRIJHwhkLjdQc9f5TdNuCX6yCl/kT0Us4KybuMJylTCNQX8n2MSDLJTyzNx9oHYZd8Puqs2xlqyyUWkTu+0O7+6k3B6KTL3PWDLYiCxqpCxSMztnEUOxXhIkCCFHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5db26e-326e-4077-de81-08dea9c10772
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:39:25.5872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyGcRSGWYdKxmVaI52k8GRP95PFQu/4dB3IN9rskLsQe/LX1BaaXBMT/OynSdgfTDM+qd+W4JQX41VEXlipcwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

Hi Pranay,

On 4/29/2026 3:09 PM, Pranay Samala wrote:
> Move test_fini() out of individual test functions to right
> after the igt_dynamic_f() block.
>
> Previously, if an igt_require_f() or igt_assert() inside
> the dynamic subtest caused a skip or failure, test_fini()
> would never execute since the longjmp exits the dynamic block.
> By placing test_fini() after igt_dynamic_f(), cleanup
> (pipe_crc free, fb removal, display reset) is guaranteed to
> run regardless of how the dynamic subtest exits.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index c4680298a..e880b280e 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -304,8 +304,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
>   
>   	/* CRC capture is clamped to 8bpc, so capture should match. */
>   	igt_assert_crc_equal(&ref_crc, &new_crc);
> -
> -	test_fini(data);
>   }
>   
>   /* Returns true if an output supports max bpc property. */
> @@ -367,6 +365,8 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   					      test_bpc_switch_on_output(data,
>   								       crtc,
>   								       output, hdr_test_formats[i], flags);
> +
> +				test_fini(data);
>   			}
>   
>   			/* One pipe is enough */
> @@ -564,7 +564,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>   	}
>   
>   cleanup:
> -	test_fini(data);
> +	return;

The 'cleanup' label is not required anymore. Just return from where 
cleanup is being called.

With this fixed, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   }
>   
>   /* Fills some test values for HDR metadata targeting SDR. */
> @@ -686,7 +686,6 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>   	}
>   
> -	test_fini(data);
>   }
>   
>   static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
> @@ -700,8 +699,6 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
>   	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
>   	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
>   	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
> -
> -	test_fini(data);
>   }
>   
>   /* Returns true if an output supports HDR metadata property. */
> @@ -815,6 +812,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>   					if (flags & TEST_INVALID_METADATA_SIZES)
>   						test_invalid_metadata_sizes(data, output);
>   				}
> +
> +				test_fini(data);
>   			}
>   
>   			/* One pipe is enough */
