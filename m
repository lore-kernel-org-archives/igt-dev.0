Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15391EFCD93
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD89B10E4D6;
	Mon,  9 Mar 2026 10:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDZAuJL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C60510E4D6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773053597; x=1804589597;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5n3/mnXD07o0JtNDs2Qe1LLj1VtuTJ3gtUN4bBUDm8c=;
 b=FDZAuJL2Fnst9FBrmxWIpkN+co+xB6zQvOUYHeooxkJ+Ib7SepIcf+UV
 /NS/PKHD9mSLznzvtH+WXmVflPMLYqy3l0zI0n8R7D10sZLGRTZVedldd
 FHVyHEujxuc98Rj5rpGaGXpCsod1oa39ccO8NnAogXym2IgYD5YcvLv8W
 cH6o05D8VOMMzA6XdmETjGo6aNjrtnZjouaDxsczzgH5danVYC5Q8dvtn
 ax7/D+SVYggPsG4YxrMZ8bratvEJxLgm04ad8do/WB3Cx8iWDXIu502m4
 55pHXaROyb84b4TrsuOmc75AugB6kD2Pm7JGRY5UR3eWauKSqkAc4P2FF Q==;
X-CSE-ConnectionGUID: Y+rp2zPMTry39TliLu9eig==
X-CSE-MsgGUID: rUANaEJBQiOV5loCVAhJFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74118399"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74118399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:53:16 -0700
X-CSE-ConnectionGUID: RXps/rIbSqaTP8bFMOGLyg==
X-CSE-MsgGUID: 59Fx3sruTSmkizbsdr5mRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217325359"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:53:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:53:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 03:53:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD4SKQEg6xoZviufK8AWvPqq9n3hWqUZ7WhfRapCGpqFXdAT1UpCI04lpZ5ULY/E1p/cTZ5MfWQcSM1e5l2UdWgTQcvlVNfDfc1cQyJbY3bywWAdlVhanosjIb5Ck8M7SOgJ/Vix5WSmmsgWq/SY95lP3YFSa+Ku+K4j917hMAuzV6E8l4LXmjYzu4nXZqDjpfr/jE1wCw8tcWhvJWveBTPx3/nzvAxWdQCy6myTmJesWaNeSj8STzu/SM8/E0XBKdyl+TTS9kgGsSUb8H+BnHd0xFbUOoela5Hpsbk5apdGrpMUcRUNXef6A1zt4pngrsLbztfplTpylTVkYedZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib1RPtB39mNSCHWGCpSnQcA511VejpYI/v9aQbtr2ik=;
 b=TvuD8tU0XTILd+sLqjohhs89zKD3LtnRfyjFDH6c8EkbPaUcjYEh1/5hFBAA+93yF68D30/7MwBzuP+gAkgiz8HoKb08g3x/txTWoH9yR88hcCd2c0ePIHrtWTGNMyERxSA03pBPcDywdXsooorcXZY2yadvCzor1xVc7Zb4Wd09CpIbQARylEtDeYjYAjncnO5jjif4jyOgqGfHv34vGOThYLz6Y4Qx6CipuL0eGDghK1Y4rPw5KbQSeREpQ3hFkmFLdeYYjl+ifEf7q/YMefZGAz2FtitLKBP3mAOFprzFuOuVlcUXpx8RmVJ1P0YVJZu9IYLg3WyKpQkt+Yukig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 10:53:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 10:53:12 +0000
Date: Mon, 9 Mar 2026 11:53:05 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 4/6] tests/xe_compute: Extend compute test to
 cover user passed buffers
Message-ID: <aa6mkV3qNtFsgXjB@fdugast-desk>
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
 <20260306091430.1234990-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306091430.1234990-12-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: e59ef901-73fc-4a18-efd6-08de7dca0f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: Er8TZiVCnlxcZZHBj4URgbBPS/nGc8WeqKLHOiKq6FGc7qjhDsYtnOLqihcyZ9+dpipaU0DzDGB515BEaL6n/yap5VWm64OVaVIbf+ise+4coIxvwPG1FrENk1n/gOxW4eKpNFzse9ythd8QqdyDdqM68TxKKTucMq1BBWcSQ2+zUAqU52tU/Pdg+lc75+/eGFAoQZfCwfOyC+gJGUEINGvwLTlsubE7Mjx1tqxTFZpUZ7/SUftZJrp0ObMLfytf/t+I0TIN0rdb1RUdJPWEdNDz1Ot3H25+LQun3MzPA41FPovj75cAZPOSIj8EvDxbyC2iKqLSpHl9ap7DWmU9dBh8A8sXHUzMb+fl3j7X9JoXAKEDG/YS3eySSt44KmZuO/OUHESRfK4txvKfP84R+jukKMblhYt8Z54/IG3FygxIkz+9ZacCK1D/vzWK9lBPlY9jxQl1OVoFF0obyHByVc2SpNNqQNyQf3LS0ne5tPlv08J+xzaUNV6t14RMHuNWwDbwt3D2aCw7GrpO1iEI6V+AmvGx+0unG/v30ctUPKFRqYSF+PxE3chFp71LIOShYiQmSZURa/VwqZliGDGUP9ufaiG2QQDlk3gzEDq9z1IZnQkyc3wP9KFdoaKYt5Nho0TybnPEe4SETw1m/PAcJH5kqHQlY6nCDs8xpMze8+JbJ4F+okrPDivWICRTCIhHRi8340auNotrHaSmYaF9bvYGOy77JyJI9NcQQEpLP7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtMR2trN0ROK2RZOTZPZUZVWnpuSmpJOXRSby9adzFCbW85QnpwM3AxOE1Q?=
 =?utf-8?B?KzlUaTE2czh2RlJLdkVpaGZjRFp6OURxYnRuNEF6S3VCazkzRE41aGwyampB?=
 =?utf-8?B?QU9NQS9kbStPZWhMYmU3QzFmbUhFNTE2OHJuRmZWa1BqSE15TzB6NXVYLzNy?=
 =?utf-8?B?cE5lK21oWm9qMGQ0TmIyV1lvbC9Nd3VaTldZVkNZaHZQWnFYeGVnQ2NTK1lL?=
 =?utf-8?B?Ymk5UWxZVEtoQ3dxSjFTem9PQlc4TGxidm9pc25wN0l0M0hwbHhHNzFadldu?=
 =?utf-8?B?NUoxK2F0cFpWNU5NdzlyZmNPYWdkQzF5Zis0aTIzTjIxWXFLQkFzWThzallo?=
 =?utf-8?B?YmovL0VLR0dGb1lIeFpjYTEzQnhBNmJwV2dHTWNVSUUwREI3Slk2SDI0c0pa?=
 =?utf-8?B?QURFMk93KzJBd1hNeGpkZmhYMzJNcEZZTzVpQ2M3THRucXdtMENrUTJCb3ZR?=
 =?utf-8?B?VGUzNWxrd2ovYVlRaEZQRGlEeGNaSkMzb2ljWm0xS3MzRHNTY0JYbHNvSlVt?=
 =?utf-8?B?VXBrclo1SStVZ05VMXk1a0FXTkNIRXU1S0hMazB6eU40MjUrTUlUcTlnaE9n?=
 =?utf-8?B?WlR5SjdkbDZFVkdZdDZEQzlmL1pWNHEyd1V5L1JYVFYzUHNXaGQ3RUZMeEsr?=
 =?utf-8?B?ZnVnK2dVN09hdTlITVQwR1d0ZjJzSWJodkcvWWs2YjhycXBLUisyYVpsOHlC?=
 =?utf-8?B?d05Pa1FRamlxTzMybWVtUVljeTdUOUxTMU9leXVzcWJRZmNtV2hNR0dOaksr?=
 =?utf-8?B?aWJpcUgySlVLcHR4WE4zWFowblBxc1g2Sk9tZmxZZXZ3TGpiVnFnem9NZHJ1?=
 =?utf-8?B?RXp6Mk9VWXBaMk80QnFZV29xTWhsMjBkWThHR01WVGt2RVlTa0thNXBIZG41?=
 =?utf-8?B?UWhnUDdyK1h4R3BJNUFlbGNTZTgyakE1OFVaeTlub3NZV3crcHN4UkEzMm1B?=
 =?utf-8?B?T1pzNm5FQlE2b2VUeUNIY25HMUp3ckMyUDV2dU0vdlU4TTdkdHd4eElwU0Q0?=
 =?utf-8?B?d2Q0dmhnUHRqK0EwSEVMQUZmTmdpaXJ0a0RYa0NCc285bFAxTGdkbkpIK1I3?=
 =?utf-8?B?Ui9XVnVnR3RtUk41ejVQZDIzaytGWnVlZXF5dEc3Um9BQlBMWUNJaHlTZ0xa?=
 =?utf-8?B?c0RhY0lvWEtKaDgwd1RsZ2JNd1JKUEg3Z2x1eXViSkUrSTB0djNOOFdIQXRG?=
 =?utf-8?B?MXRuTmdsOFptQjFCMWUrVWllS0hZZ2FTTHRLTXpPWWcvZExIakxyblozT3dR?=
 =?utf-8?B?UG5TaGpkVkczdnFSRWZwVzRkUzVFcVRKM0FPbG9CQTZWNkFidkhKYmplZ1RC?=
 =?utf-8?B?OGFnWkhqK2RIYUZ6VHJsaVBKenBmVHk3UlltbXJWcTZnQS9xSzNJSjRoWGhw?=
 =?utf-8?B?K1I5U0dzNlJ4L2JaTmkyRzdYRkdyVFZpYXp6YkNXTU5EMSt4RkMzNThHQm5S?=
 =?utf-8?B?M0VYclRTSmxSTGtVVDhra1ZZU2NpS3B3dUtCN2R2UnJ2NmVQaEsxV2xuMkVj?=
 =?utf-8?B?YVF0RzZNd09VaThJeEJkNUh0bGJ1QXJzNXpBMXJqK05YNnFWazZ0b2xEd0NE?=
 =?utf-8?B?bGV2bFlwSU9ZS2NGcUVsN1VtOVBqdjZPTnRpS1haWVhyTUJiOWtJVGp0Ym5U?=
 =?utf-8?B?RDA3OUVlTDN5WitwdEtMVHpKa01nQTY0amk0RTdxVjFnSnc3ZWtsQmY1SEll?=
 =?utf-8?B?aFMxWnpCd2EyRHQzSENlWTJha1BtcjJac0VDTGNESzdHS25aTVlhQlpCa2hJ?=
 =?utf-8?B?K01Hdi9WQXZrNjRINjVmbDVvT09CRzc2aXhhLzFvU3ZkZkVHdklpeElXUUFU?=
 =?utf-8?B?RXBLd1hDdHJYQlQzL0Rwd3FlS3ZUdkxZY3p2U2pCamhpVW5IZ0dobnpnK3J0?=
 =?utf-8?B?NUZEZ3BsQ0V4UldGMC9QYXFVYXUyazBoQ1MxZEZLN3dHU2cya2NvQXFnd3BT?=
 =?utf-8?B?ZnNPd0hncUhwWTdUYTJ6UzFvNTVZWms2bGxUc2tVQ2xDTHJVWFh1WTRocmJZ?=
 =?utf-8?B?WHo5bFFVcUN2U0syOGlIRXZLK28xa0E2WFlKaWVjeHhUS0pPNVQ3KzlLaFlI?=
 =?utf-8?B?QW1uWmpVVWptTldJQURGMmZlSGwwZUpqa2RxL21tb1VIRGRQUUR1QW1UVFhX?=
 =?utf-8?B?WWJrSDJPL3dRRFVmUjNRa0k1MkhybTNjNVVTc1JIYVRMbENMNE9uNHBUZ2VE?=
 =?utf-8?B?L0QzUkhrUC9oeHRENWRiK3lqOURyV0piT1dTV2NTSFBkditXRlBDakttTWEr?=
 =?utf-8?B?aUNGRWJKN3BrVkZwNVhvMEx1RmJ3RGxIc2J5dG42akd1YzZZWkhWTmVQNWtQ?=
 =?utf-8?B?WXF2T1NLME1wRlRMS0RiSStpYkFKeDlHamhwTStpQ0JEMHliU0sweVNvWFZL?=
 =?utf-8?Q?mu0qccXdeyPsVKP8=3D?=
X-Exchange-RoutingPolicyChecked: RVwKQ21UKGZqxfmmAT8iBo31G7g81i5U5N6CgUcqKj7K205EYVWohAObwEWEu5yHMml9JtOHFTKebUon4D/rgt5ja3jvR6EUsIDDqU44eYYuHFBCNQYcoSnjcd8FJMKI2sDxUvLPEBtbVE0gD2ilgUVufgjj9SolS8/3ve8x4eA1DbU4W6decBy1W8zYObyqghnWAUTzD5gx1IrxV0P0YS87M2x/utM513QOBPaeUQRXd2RevHLsAWUhy5iFOa4o4RWTzfeS26fgJtZZLzSVVAPAThvBkHurKZqVSoIO0yhHgiEHDWoW6K49cjPKoUwcx87vcRwW444MiNsuhw+uhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e59ef901-73fc-4a18-efd6-08de7dca0f38
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:53:12.6718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+jmOfy3i6+WBXMb73xHDH/+x6I6IKHgttkBalAl5t3VWu3RXLFEHAtPjqv4tQ2JSRvc8SChqhUEivRUrC2hMB5mEKoVMimU3AmNCK5hDsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

Hi,

On Fri, Mar 06, 2026 at 10:14:35AM +0100, Zbigniew Kempczyński wrote:
> Compute library allows user to pass its own buffers. They may be
> normal buffer objects or system allocated buffers (SVM).
> 
> Verify input and output buffers added to user_execenv are properly
> handled and data within are fully on user control. Execute compute
> square on these buffers and check data are correct regardless
> allocation strategy.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_compute.c | 150 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 310093fc56..e5367b4c10 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -510,6 +510,144 @@ test_compute_square(int fd)
>  		      "GPU not supported\n");
>  }
>  
> +/**
> + * SUBTEST: compute-square-userenv
> + * Mega feature: Compute
> + * Sub-category: compute tests
> + * Functionality: OpenCL kernel
> + * Description:
> + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> + *	taking buffers from userenv.
> + *
> + * SUBTEST: compute-square-userenv-isvm
> + * Mega feature: Compute
> + * Sub-category: compute tests
> + * Functionality: OpenCL kernel
> + * Description:
> + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> + *	taking buffers from userenv where input is svm buffer.
> + *
> + * SUBTEST: compute-square-userenv-osvm
> + * Mega feature: Compute
> + * Sub-category: compute tests
> + * Functionality: OpenCL kernel
> + * Description:
> + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> + *	taking buffers from userenv where output buffer is svm buffer.
> + *
> + * SUBTEST: compute-square-userenv-iosvm
> + * Mega feature: Compute
> + * Sub-category: compute tests
> + * Functionality: OpenCL kernel
> + * Description:
> + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> + *	taking buffers from userenv where input and output buffers are svm buffer.
> + */
> +
> +#define INPUT_IN_SVM		(1 << 0)
> +#define OUTPUT_IN_SVM		(1 << 1)
> +#define INPUT_BO_ADDR		0x30000000
> +#define OUTPUT_BO_ADDR		0x31000000
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +
> +#define bind_system_allocator(__sync, __num_sync)			\
> +	__xe_vm_bind_assert(fd, vm, 0,					\
> +			    0, 0, 0, 0x1ull << va_bits,			\
> +			    DRM_XE_VM_BIND_OP_MAP,			\
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
> +			    (__sync), (__num_sync), 0, 0)

Not sure about the reason for moving system allocator tests outside of
xe_exec_system_allocator.c but if we go this way then this ^ should be
moved to libs as helper instead of being duplicated.

> +
> +static void
> +test_compute_square_userenv(int fd, uint32_t flags)
> +{
> +	struct user_execenv env = {};
> +	uint32_t input_bo, output_bo, vm, size = SZ_4K;
> +	int va_bits = xe_va_bits(fd);
> +	float *input, *output;
> +	int i;
> +
> +	size = ALIGN(size, xe_get_default_alignment(fd));
> +	env.array_size = size / sizeof(float);
> +
> +	vm = env.vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	if ((flags & INPUT_IN_SVM) || (flags & OUTPUT_IN_SVM)) {
> +		struct drm_xe_sync sync = {
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.timeline_value = USER_FENCE_VALUE,
> +		};
> +		struct bo_sync {
> +			uint64_t sync;
> +		} *bo_sync;
> +
> +		bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> +		igt_assert(bo_sync);
> +		sync.addr = to_user_pointer(&bo_sync->sync);
> +		bind_system_allocator(&sync, 1);
> +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +		free(bo_sync);
> +	}
> +
> +	if (flags & INPUT_IN_SVM) {
> +		input = aligned_alloc(xe_get_default_alignment(fd), size);
> +		env.input_addr = to_user_pointer(input);
> +
> +	} else {
> +		input_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
> +					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		input = xe_bo_map(fd, input_bo, size);
> +		env.input_bo = input_bo;
> +		env.input_addr = INPUT_BO_ADDR;
> +	}
> +
> +	if (flags & OUTPUT_IN_SVM) {
> +		output = aligned_alloc(xe_get_default_alignment(fd), size);
> +		env.output_addr = to_user_pointer(output);
> +	} else {
> +		output_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
> +					 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		output = xe_bo_map(fd, output_bo, size);
> +		env.output_bo = output_bo;
> +		env.output_addr = OUTPUT_BO_ADDR;
> +	}
> +
> +	env.loop_count = env.array_size / 2;
> +	env.skip_results_check = true;
> +
> +	for (i = 0; i < env.array_size; i++)
> +		input[i] = (float)i + 2.0f;
> +
> +	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> +
> +	for (i = 0; i < env.loop_count; i++) {
> +		float expected_output = input[i] * input[i];
> +
> +		if (output[i] != expected_output || output[i] == 0.0f)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input[i], output[i], expected_output);
> +		igt_assert_eq_double(output[i], expected_output);
> +	}

This seems like a copy/paste from bo_check_square(). Besides, a few lines
above we set:

    env.skip_results_check = true

to skip the result check, which seems contradictory. Is there a reason for
this duplication?

Thanks,
Francois

> +
> +	if (flags & INPUT_IN_SVM) {
> +		free(input);
> +	} else {
> +		munmap(input, size);
> +		gem_close(fd, input_bo);
> +	}
> +
> +	if (flags & OUTPUT_IN_SVM) {
> +		free(output);
> +	} else {
> +		munmap(output, size);
> +		gem_close(fd, output_bo);
> +	}
> +
> +	xe_vm_destroy(fd, env.vm);
> +}
> +
>  int igt_main()
>  {
>  	int xe, ccs_mode[4];
> @@ -525,6 +663,18 @@ int igt_main()
>  	igt_subtest("compute-square")
>  		test_compute_square(xe);
>  
> +	igt_subtest("compute-square-userenv")
> +		test_compute_square_userenv(xe, 0);
> +
> +	igt_subtest("compute-square-userenv-isvm")
> +		test_compute_square_userenv(xe, INPUT_IN_SVM);
> +
> +	igt_subtest("compute-square-userenv-osvm")
> +		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
> +
> +	igt_subtest("compute-square-userenv-iosvm")
> +		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> +
>  	igt_fixture()
>  		drm_close_driver(xe);
>  
> -- 
> 2.43.0
> 
