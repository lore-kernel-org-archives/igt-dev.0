Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6A2106FD7B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 04:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BABE10EADC;
	Fri, 13 Mar 2026 04:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTXHli5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08C010EADC
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 04:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773376969; x=1804912969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9TqXy5PvqQjqCbd/M9lvPovIookohXGQch0AN2p/u3Q=;
 b=bTXHli5vKtE5kjNC4YEGLN2e5VRcJxtyC6DONo/9/WCnXl9rgQUnXYJd
 TDZ2pWL0Hqolh4c29ykomSkcOJb1b//LBAXH65YJdEQat7YsMIPceiuHb
 7PSfMJK4kKjZFjsBctVFPYlvtkt27oTYMl2M4kS0AQTMq+EH1QcHFntQ9
 EEEjJ5Ek+Ocn3U3pIPIzmMc6O9G6x/Vph24KPoZGgMjm7XPEf0ou6CXJu
 cPZfpwPuS0d2DW05PFxG0jr6AwOpTROE9/rM3+gN2/iZQ9uflzzBG5kJt
 QycvooN7wA+Obf/bEdBAbcH8ymW130NPi2jeeID2SY9BJU4FV4HMaFcQV A==;
X-CSE-ConnectionGUID: E0Mb+XBrTrKAbxuIMqkFPA==
X-CSE-MsgGUID: 1DkgaMt3QHKoXenFtSZ+5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85568233"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="85568233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:42:48 -0700
X-CSE-ConnectionGUID: dQ4c2DxlQJ6+O4EEgNLFxw==
X-CSE-MsgGUID: KVDopgXDRtW7h00edfFgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="218804003"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:42:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 21:42:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 21:42:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 21:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYfM54gmw33vlOWA6p/sNft9RlEOG1Gw69vl428x0E6dMZCp/1fzDkzRvQ3rDX/Mix3ek1jO5y6Xtl5haswDPHmJUCD7HecC2K9qfX1cyYvZ5TGjpZHCpExpxG/AYR+pVIbqZkoigBOrnq9sBRXZnDjk2RZKNj96H7hNpDJu//IpXStk+t+L5i/ltHHKvv7PsyprwZPCEVuNJNC44ISPY8YSu8a0Y53WqksEn4q5msS/cmiHaI+F19WoOLasAVBJ5fRFo5sErWhqdiuj1jlCuHWZ/9lp95M/v8/12030ODptqUdbt2Gi3bKtYGS5yoEvRabs3oeO/Yl4rPx2AUKfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjYP+cL1lEaSQC075J4bQ6xFK+DSQNJm46LbdTO01DY=;
 b=shkCh2zc26foG74l9B5FZGMfA5ium5cC6sI9EjS1HsMlh2V1CDdEBXThG6kT2IiWdCPRb4hBxJ82OOLn6g75l/cv2l0waFMoBFb2GsSn3HQRpS1DKJ51WQT5fnwK9iAidUBdIlvW0G74OGtSGpBsKe8hJJEFUU2QWCPuf7EF3Tbu6cBByK2xCQNlWZNTSb3+9ZAqG/40nx5lgXnX4l4GykNRIZxwNSGxO0degP/oCpEsw8xVaDqAskFTUndmENVhJl3Fb+dtNsYW1Bb4fFPGRXGet2h6s/u0p+IGsdB5Fmkz4rBiOeggxn+9h0IAWHx4A1JgtUAVOaS1BPHjv1Qjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by IA0PR11MB7380.namprd11.prod.outlook.com (2603:10b6:208:430::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 04:42:45 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 04:42:42 +0000
Message-ID: <017e7c52-674c-4a4c-b13b-a319e9d2fe3c@intel.com>
Date: Fri, 13 Mar 2026 10:12:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Avoid PIPE_B conflict on
 dual-eDP systems
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260312080305.43449-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260312080305.43449-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0254.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::9) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|IA0PR11MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 90266cbf-0ee0-468a-e57d-08de80baf67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RguydbnFe+kayqrXIHMo/pKfSuuYn0DikRAh4Wei5miA3/cYO8EgVNsD8P+sFvn3j3eDk8hMcGGCe/vIbvQJQqF0MTSDck6DY6brU/i6nRs3MRAMfES5qsXnYR6Qk+KnCLZRpAocE1bSKOGuuaiAlviQWib1t++4T4jfZBx64c1K2O9SPdAqHbyl+p+22DbCs2AGJVku5srQqpES/3Jyxro+UNUB6In5LM1MVRQNwfo19Cpxj7NT/f+ekRAr5SwTk0UHINhD7WwyiOt1ctbOnEhNAfKSYkX30Gglp228O88uXFFyBGQseqIIGp8E4Y1FtTc6wlipCtsEy+cFxnLiGmS6xM8a4ckLNDpyxyOvGKS3P8XnmN0itrkWvBYptBpfnHvu8MafmGq9BwJGE2HRtlC84uPSNLHKqfL7c0O7A/g/I9q0etexAo/wV4r6P/Z45AgtDTXD4HPvAHXbzNhST1tmqEDpcfa/rYNvhdP1Ck00V/EcGyD0yjXe42ISdfb4Bv90ck9Hy2cOVn+/Q70Xq2qwVh9hM+vUCiyl6a/eJcWuZWewq8MGrlUood6WC5Y3SzebBi+u2zOeTKbRMgS5s8iHiLl5/QNemOWKIzWx3Po5mLg5DKnMcF4H685XxIJ197YgJq1SNkDsNkR15sk5kYrO1iFaDAqnoDuK2ENW0Zozdwbchs+jqICTC3qF3m+ki0MZ8HvN0LC5HcA7wOLx0dSgAn4JRkHL5k8I6f4gO5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RrUG5kMmI5Y1NGRi9Bck5OMzlVOU0xNGpEelgwZ1BsMDVZb2hqUitDWVpP?=
 =?utf-8?B?ekF3NXJZaXlaOG1mMUpxOVlQZy9sNXFoRklxTzlkT2FjSDdxNktWekNNWGZD?=
 =?utf-8?B?aWRpMkppWFZYdERyTlF2aXpCLzY3aXhzU0RGM2dDK1pEZXVhait6Q1ExaW01?=
 =?utf-8?B?eW1DS2hGdXo1aE1DL3hiWTVaMW5mT1p5OEJ3cnF6bFdodGZ0bmpCYTRFMkll?=
 =?utf-8?B?R29IZUlIZGhocmpsZ0hwMGFDVmIxS3dtd1pGRkpxRFd3dkttR2szRTJSZWZt?=
 =?utf-8?B?cGxrN3ptU1l5SkJoUGM3SWZsK2FEWXBsRkUwZzBJTjljMFJVWFNWNWRlRHFH?=
 =?utf-8?B?TE1IbFZkTnNTa0hnQTNwSU9xM09vZFo5NU9jVnlWeFZyVDY5VDdUdUZSdTI3?=
 =?utf-8?B?UkdRdi9ITkY5UU03bTJRRFlNK0dESkxib1BPUHhOOFF5TW1YWnlWc2ZwOElt?=
 =?utf-8?B?MzlHamlkN0x4TG9PYTZCV1EzWnI4RDdDcjR5NmRKMU9CNlBxRjV4QUY4eUJS?=
 =?utf-8?B?NEpaRkR2cWZOekl2SWoyMFFRYkJKbHI2MU81Ykh5M2crYnBlR2VHTERyb3Fj?=
 =?utf-8?B?Zmhvdk5Md3hlUHM2N1lRTFVBd0FidG5iVnFUYUo2bnF1T0JYeHovSmlpRVZx?=
 =?utf-8?B?TkRxbEtxVGIwRjhJQ0xneHVVWjU4NERyUlF2aFh1MmZkZjQ1UmJidW9xQ0sv?=
 =?utf-8?B?N1VFUHhiK2FLYlR4M1Awa0NnYjdHRVRZRFVvbktKREhlRFlVUnFRK3RoT2Q3?=
 =?utf-8?B?Kzk2NFdTOVcvMURRSFFaYUx2V1gwb0VDbzZqTE9PWStCNENOSnh3bTV0Smto?=
 =?utf-8?B?VTA3L21PVHlmZkxadVVidWJxVEZnR2JIZnZmNVJKUGxKU0lRWWp0dnBFQWRm?=
 =?utf-8?B?OGdUZFkrY29UZllLYktuSWVtYlowdGdSdVh0VmllNElzaUVBczVXUmI2SnBE?=
 =?utf-8?B?blorZTBwYnJNbnQydVF5YXFxWEQzeWtrYWh5SHl5YTYyQ0VGYnlpK3hMbjVw?=
 =?utf-8?B?ZmVZQjIwb1lUazJ5ekdDTEFoL1NlK2tHazVKRmkyQXIwZ3F6VURYL1g5QVZr?=
 =?utf-8?B?K2FwQ1dWNkZQWGNwMmIyeXhsSU1UaUxod3BoVTBYbHhDeUJyMW9pVjJWZndv?=
 =?utf-8?B?cTB3cTdMdGJFaVBoRFIyRVdkazFyUklzWVp6YWdtTmJvQ0NpaU96Y2xCdDdv?=
 =?utf-8?B?aDRDRU84MFVwVlA3Qkc1NDdEUWIyMGtrVzdaTDM4YXVJcVpCNVNxZnQ3K0hl?=
 =?utf-8?B?dEYzdE9KNzQ3OTJ1YUo3NVErcGZZOEN4Y21MM3Q3dzlRWGNSRjA0ZEg3UmtU?=
 =?utf-8?B?bjdRVXBlVEJvN0lyNk90N2ZBaVFHRXFtSGhpM0QrNWh2cVAxWGE5bTc1MFJp?=
 =?utf-8?B?cFF2TmZIVDhPNWRBdmowQXprenRuK3dFaXBrQmhudkdiMzNrT0FSdHFFU1hU?=
 =?utf-8?B?Rk1HYksvSEZVQVBwREVmQmJ4WS8reEFFT2dRS3RPSVM3dmVIb28rcmx6T3hN?=
 =?utf-8?B?L1dkOUI0TmNpKzhPemd6WVNOYnhzcDBjRDFTNCtvcGpNOVlGSTJTQ0FTV20v?=
 =?utf-8?B?dUhEZURZZzRYdVF5c2RMUmNmSVJHd3Z5N0F0blJkYy9BT2xaWmUzTnh1WEZQ?=
 =?utf-8?B?aG5nZEpuQ2kreEJYUUFhN3Z5NENXV0lQdkU4dWloOE01OTBPVFIrNkVlRlU0?=
 =?utf-8?B?ekFYM1hOVVc5SzQ4Y3ZoY3lWSDBWN0RYTnNPdUc5Q3k5bkZ4bCszYzZFM2JT?=
 =?utf-8?B?VjhIVXd2VzlKSmRPYWNVMkdXd29NcTJLcitBK3pOZzhibUtzTGZ3SWRDNWw5?=
 =?utf-8?B?U3l1Znl6MDE2NGdNTUFBamwyVmVyMzFodDJlNkxQRXdHNFVUaHlRSUZxZTVm?=
 =?utf-8?B?WUZTTXNQNEdXRTNqak9xUGFrK2ZSMzM3VEdCQklpbHNkRmVYTW9Jb2dBTldM?=
 =?utf-8?B?OHppalJDL0N2c2dFZXVUL3E0Vkt4YjlQcWpZMXMyaG01dkNtSzQ5Q3lnOE5r?=
 =?utf-8?B?anRneEJGMnVKM1N0TkgxcDgyNWpNLzc4N0dCRTF1cVFnRnlnT3RYdXJrUERo?=
 =?utf-8?B?OVo4ZVdTSkh6alVkaDh3OSsxZWdUTmxvd3QxVEhERmhFeC9PZ2FQTHVkcGx6?=
 =?utf-8?B?NzFJWHIrQnNmK0VMZHVhSUdtVjY3TmFQKzdJK2RkcmVXTFQ4Rm5JQnZEVzZI?=
 =?utf-8?B?MEo5Z3A1cTFmY2Evc3FGU2w4SGp6VVZGQnlrbDN1Vmlpc3R1UWYyRTB4ZnRR?=
 =?utf-8?B?MExJZ05rZWFHM0NMVWdQZndPc3cwUkphRi9zbVV2ajNzd1MyWjJ6bVNSQlhz?=
 =?utf-8?B?a1F2N0M0VHZxWW41ZlZJdmFKbFpVQVE3Y0IxeEtTdnJWM05JR0ZqZz09?=
X-Exchange-RoutingPolicyChecked: Ye1v6NbrakkYvNwMwHS41J26jF+WJLKwAEnR/Hat+PjiyvTMbftM+HCQdtq1DXJ2gtfZccZT1BlaXstt4m6hmBRKiB7ydB09g1sBjQC3CB+Fl9KDAoWIbyjKX4w44SbDx4eiIa8cR678Gkt88GeAxyiCTFVwEa7XgHTtsZKnVauCstYq+LFTQqQWpJuA3hZC0n0u4EgZX4lRu04pKPN+Gss12uoBS1Sednc6orID1cSWHWfzO43LXBnMGsq4+1WZlg++e942oPkpzxW3e1HomtZiegln1npEUEUnqKM1Miwaux7UY5bk7sLDfTJb8leQsLznanpHpFC3YnT4t80qoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90266cbf-0ee0-468a-e57d-08de80baf67c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 04:42:42.4544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EL6GMjWLRWS0zTZLdwH4fu3/FYNC+ufqL56JNDYA8pg06U0umKwnZwJ+uxMpENvDout+arAwpm6sqtVO8EC5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7380
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

Hi Thasleem,

On 3/12/2026 1:33 PM, Mohammed Thasleem wrote:
> Select the first available eDP output and assign it to PIPE_B to avoid pipe
> conflicts on dual-eDP systems.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index d1c4a5019..2e5ffe842 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -149,7 +149,10 @@ static void set_output_on_pipe_b(data_t *data)
>   
>   		data->output = output;
>   		data->mode = igt_output_get_mode(output);
> +
> +		break;
>   	}

Wouldn't we want to run this test on both the eDP's if say both support PSR?

Thanks and Regards,
Karthik.B.S
> +	igt_require_f(data->output, "No valid eDP found for PIPE_B\n");
>   }
>   
>   static void setup_output(data_t *data)
