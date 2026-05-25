Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4349CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F5710E13B;
	Mon, 25 May 2026 20:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYe/4Zq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A13F10E13B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779739871; x=1811275871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DpdCwNN+md2ldE47Nyr/ftuozGmZ8FzNDLBS/qaUkwE=;
 b=XYe/4Zq9dHOsk54m2wr9k5mmQQ9f2q6ln52GEGQx7dbDUikR7fDcb7H7
 BqFnV9Pc4gpLkqGVgZjOHjVzaIELWQ5wkQtLN7wUL8n5iNINnUlIfFaJh
 uoc773zMaOf5DjlDoxJyr02VLnPro/wgBybBizvcXMLaZ0jELBwFCe2Mk
 tsMBj+lw/9a4xlPlxjrPRgMPv9xMYnfgcK6SIJY7EVXxfh6qVUDEmPWFT
 6BmqZ9TgyJIvYWckPGAMawgIW9rFUWCydGJi9846jaZNtUPtpUGzYFvvf
 o6d+wg60AKiLnwPye4TJ80ZwkXGgZSKsraPNuvSbqHxa7si2Sj0eluMSm A==;
X-CSE-ConnectionGUID: BBn+9e4qTMSdVi1/CZ2XUg==
X-CSE-MsgGUID: oanb+IYrSjaYvYqoYbF5Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103237789"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="103237789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 13:11:11 -0700
X-CSE-ConnectionGUID: 5quLhSCpTuOQYaRM7qXICw==
X-CSE-MsgGUID: Ygvb7Da2TgOArMtJDROdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="265281565"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 13:11:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 13:11:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 13:11:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 13:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAIq049E5SuU51hlFr12Bd29/FgEG3mo0PCAP4A+C8WjEBc9PVcxDCQbyrNZjDxnG9Nqc4A0Yf7OXoVYMXo35ksofSZfRHFnH3em0RmIAkCHL93wkQqbcdWZIWGAKIHTbxyras/A9txf3NRafypkkoExEInLxwn3aveo9XSnoQVxtqJq1gm1HtP4UQh9jYOGm7gjzfzsXAdohzAoZH2yDBsZIX426dIHQeeLQMykSxc4Pj4VSYibUrBQ/aMpyDkJGxxx1iIagJRBzFtVz8fX3i/jK40PR4SJ5gHWbmGQP5FR2O15jSNGvIufKvJAYwOCBrJvbxvZyki5m4pWkrA8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYEvjDv9yPMfwXRuBSzaXoCURycLjUtVs65UEWiACVM=;
 b=MYLFc50VoXTFmv8srqp6oteuQDiX7cD1XZwip0cAtCDPId72VqRpo2K6hMxlhkFiSoTrIdfX6ZU6fzrXVi6kp+2waTJhhUDPewrZhD7Xcv/CIxPQllxKoCx9vJxK7tQ5sdjQy/eRb64daB5JiP+7lZxzr9UeIFDo4oXvSXqICEz3W07fcth+K37Ok/az5q/56zmvIM5IUK3w+9nfvX9ru4KYagBwKuy1HI1rClwfcGwojP6V48vxDENzEF1IdOdPljzflLUgqce9FL6lzVVtWV+Di5DCWKNSwYh0G7brW6FJsJsd6cgc04Y8i4aC/Bt6+lfz2Fu5qkAlc5JZe8fXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 20:11:05 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 20:11:05 +0000
Message-ID: <31ff7856-51ff-4fe4-ba4e-ee8647c3ab30@intel.com>
Date: Tue, 26 May 2026 01:40:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 7/7] tests/intel/kms_pm_dc: Add
 dc3co-vpb-framegap subtest
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260515153838.841048-1-jeevan.b@intel.com>
 <20260515153838.841048-8-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260515153838.841048-8-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::8) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fae10a-dd86-4d64-bbaf-08deba99c013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|4143699003|22082099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: aYBXU54ZlLbjbHk8o4wDgmmlOX+UD7NL1Bux5pdmLZ4/Q7jShA2NiCvnnDgHAK2TFQhJVSoPMnuMvyoA0FdGK//lcJSmhjDG/AGS7wfX51LbooSFQlru637Hv8/dTuAW4o58PAT1LKcW9uStCuqi/XA2HI5bFDwWQk7nftuWs0/tky75eURIJX+Pl8bKsgRq7zIn7zCIvKMC2HGXfQOjvjRzd4bAVixx6heomJQiHpnEMRUwTyAsB8OxNGo1x4tyhyUorqPeqX78ANqGV9VwX4GpMPcAR62y6H6Sxde4Y/UqEym/mnylDGpw9/Hid+aRsceY8ydPJq3waSsBffL5PmWkN1nNcEt/DCnPbO1HfLN29phH5TUKRUBDn1tid7V9wO+8necpuH0mv3a2liGHtbliPcrOB2xDXl9A21fjS6HrK02UAzIa7HsTl5HoUBO4ui3fB+GRP3IonwtkCGVZOifxKi5GsBr4lJxUC0F+uIV/4MCX+TyRkpsWnei3dgTr3PkSM3U/6LJiAh6Fb5MEs3J/0ZmXFLimCygUB01uq+RgEfsPq7QGl+zmZNafYPU55ILhd8DYbS/+pxp1La2z0N+vUsGcSeKf3q7fZHzM44GKvs/h00RB/m5M64Yma8xjzlbChHj7xL2idpy4dd86VvEE0YZ4Ikmo5kq+6bvgL+KJr0pA46nega1jxuVaTBX3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(4143699003)(22082099003)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW0zRGprUFdUcmJBWEdCU2YwRDU5QnRJUHN6RDhtWkVQa3owaEREWjVETE53?=
 =?utf-8?B?NHBnYXpXMU1VQkNsYjJhai9COC82eGtGdjNPdkt4T05IVmxRRm05NEZYd3pT?=
 =?utf-8?B?eEVpSkdRS1BzM2E4UEtwSHRPUThyOG1GUXJOazl6N1R0VEpWZlR3VWdmYk4v?=
 =?utf-8?B?RVhtR0VLM2VtWjRzdysyRzZacXQ0K0g3OUI3VTFQcFZRK2dCR09aNHV5WVVW?=
 =?utf-8?B?SktXeHN6QmpNSHpUOHBDeDFmQnFEWTZIMVFsZy9kTVN3RTNmbjJNNXZ6ZGgx?=
 =?utf-8?B?cnJFWk9Vd29GQ3R2WUkvcVovaXdLZE5MTjZjT05EVFcxUXlPc0ptOUpEeHQ0?=
 =?utf-8?B?SHQyUDNGWWhBUkdEREErK1Nha1RJVnNkMnNGeVhoRFA5WXMyNE1PT1pHWUMx?=
 =?utf-8?B?Z3dhT3M1dGI1N1hxYjVKZXpDTWR2bDVmU0gvNG5wOE9LV1ZzeGx0b0QxMm5a?=
 =?utf-8?B?d2gxdEszTGo2cGlzUEJBQUdFT1VHZ2xvR3c1ekp3cEViZmZXQTM4TlNLRUFU?=
 =?utf-8?B?U1JSRzYwMkt5b2hiUVBzcUNXTUZTblRHY3lwVDc4WmlBU25xazVBY1JQSXRm?=
 =?utf-8?B?WGpNamdTenZhREJqUUltOEVickhIT1pXME5DdkhManVHLzJsY0hCTHBUd00r?=
 =?utf-8?B?V3hBc3FFcmVCbmVJUFV1Wmhid3FUVXdsZVh5a0tMbVI1WEdzTlNZTm1PWXl5?=
 =?utf-8?B?RHo1V0lQY2J3TVlwb29hNlZSYTFWVWZxWmp2V0d0T0thUE1HVE9oenpGV3Vy?=
 =?utf-8?B?YTcybWgvQVJGbENoYVIvOGxLcWdTRE5Xc3B2aU0vQnZqNXdXZzQ3WVN1OW5Z?=
 =?utf-8?B?cU9ZaDJvMVJ4VEVubkxqdnFZVFJPcG05MU1xMVl3VTRPN0NpVlZmb28wRHZx?=
 =?utf-8?B?SlJ6WnlCQlZnNmFFNnhxMlNaNVRZQ004UFUrNkZ5UnM5TzFxd3U3Sy9DWE9h?=
 =?utf-8?B?SkFMdFZGTGxKTEhJVjlsdVdwSkZLbTlLZjRaMUlqbUVONkY1Mmd2dXNvOGFE?=
 =?utf-8?B?VXd6SGdlN0pscGpLY0RwV0k4dlh4N0JvUjFjU2plZlJ6VjFCUDg1bW4xampL?=
 =?utf-8?B?S0thUmJNNURxQTgydU1SelpneVVvR0kzK3BPTmdzV0phRTlBclV3K2svbUNZ?=
 =?utf-8?B?QWcvTXlhc0pMOEQrZFdkbDBvT09SVmdmQXNHVWE4eldvclB6bDl2QStpL1c0?=
 =?utf-8?B?TzFJeU9WdXFjZVduTXZ1Q2ZXU0tETXV2KzQrMWpWV2xxc1dyQ2JVeGhTcnZm?=
 =?utf-8?B?dGdwQVAwTkdEZTJ3TzNPdy9kTnNGTmN4Q1R4VlhTTzFjVnFINGRLYnZ3VVAz?=
 =?utf-8?B?UTMvdnBGMmhVS0NGT2xOdWEvTkEvS2liRkNpZVRhVU9kK0huaGhUWG1wYTda?=
 =?utf-8?B?eENLbUI0RXlKM1orUlZaV3EwcjZoSnBiTXVHYW5sb0hOYkpXYVlXT0ZXMjFI?=
 =?utf-8?B?RzFqbnN5enpMblF4SkVKNTA2ZkRwaUJCM3pYT0VmV1NucndVVys4V1JlV2M2?=
 =?utf-8?B?RmFjYnVQQ0w0Y2s4b2ExVzVIcDYzb1Z0dFF4My90L2M3c1ZTb1hoa0dzQ3Q3?=
 =?utf-8?B?MU40RW41RVNUa1VlSStOUzVFb1VZdStXRkJyRHI3Mk5UcmV1aUZBVlFOMEsx?=
 =?utf-8?B?THVrVkp2RlhndVcwMFRWZFVSU0NlZ0dFTFBqZEZEcnBsSis0Q3FvcXVpQndW?=
 =?utf-8?B?LzE1aDZXamZpWHd2dmtIZ0lIOWtFS3dvZ0R3bHc3Ris5U2wwS0d6bG43NGpS?=
 =?utf-8?B?Vy9XS3pDWTFSTFdQenBKNlNrZWdaRXpxRnZBK0ZoT284dVNNdTNRT1dkRU0w?=
 =?utf-8?B?ZFdodkx3c3VrM3dyNndhbkl4V2UvZ2x0dVorWVB3dytSVGk3eE9IQmhlSExp?=
 =?utf-8?B?OHRBYzV6ZG9ieTV1QjVzeU9MK3JJQ3dYdUZySmlubHE4Y2xyQ3pORUJOdXFa?=
 =?utf-8?B?NGE0RHQycUJMMlZzMG9LWE5qa2szcXdUMFRnSEJ0TnptalFMakRvUjByTkNv?=
 =?utf-8?B?dW9ZS1NPNUMrVUhLQUlhb0JuYm12N09EdW1XU3hobFJHOEtNc3hiL2NkVWdn?=
 =?utf-8?B?NUN6eWFIWmxKTW82R240ZkUvbWNDeXJOdlhNZWNOSklRWW1wVmVKSitkTkhE?=
 =?utf-8?B?RjdPcGFnZm9yYmZkd3RjRi9MeGZRVHU5QmlHdkplT3NPZThxYXRYczZKSHQy?=
 =?utf-8?B?MGJXTWNOcG5Hdll1NlBSRFFacEplZVNrb0JsbkVPL2xtVmRFaEhuQzhudUpM?=
 =?utf-8?B?aTY1MFRhejNvb2pRS0ZYam5YcnZ1eVVtZVpsUlFTNkl2dW83Z2J4cWFsMVBp?=
 =?utf-8?B?Y0pjRXdoQnU4Q25nUVJUS2toK2J0eHNNc2M1OVZGYWU2WStzZEtWTHVBMHhY?=
 =?utf-8?Q?ODSNpc0nnWzez7Qc=3D?=
X-Exchange-RoutingPolicyChecked: g2Bc+74CQwYjN++ZZyR/uVINbwIk1h3GKPXK/dwOlr6TgwqiK18VZxVoxf6NN75P9ws/DUiz2IxMVJjH0foCKmImbS8zvE3t6NQJMGLm6V8WeS7oM/w+8DAZqlDjWqvt4YkyRwdrBy2CnUavBLlKeT9LXJgtXEv/DtzOdVPMgI7NkROHfE10MxoxbotGNER09SywluA9iOFpTFL8MwtZEX9JniJSx8sl/ysIeXxDKy5f3X+dF6C/GEPCBVo9beF8PxeVy0UP7ZDqoalg8L//vASfpQ8unMZIawFZDfT7KoKqnoZvXRfnjzT4GwEC9xonaEgxeAikNCNE54nVuetxTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fae10a-dd86-4d64-bbaf-08deba99c013
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 20:11:05.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5+zm1qp8cB3t1ZXEVThLNAcEZNZ5c4NyF6nWEW91jA1FpGifGDhoH33piR64enA7PyRNS5NwUPuwf9CRSBz07E0LwZNZTbnRAk3eKnc9GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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


On 15-05-2026 09:08 pm, Jeevan B wrote:
> Add a new subtest to validate DC3CO counter increments across
> frame gaps exceeding the threshold during a video-like workload
> with PSR2 enabled.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 73 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 0f216d9eb..4ce7c94be 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -60,6 +60,10 @@
>    *              exit cycle, ensuring DC3CO is not broken by deeper power state
>    *              transitions.
>    *
> + * SUBTEST: dc3co-vpb-framegap
> + * Description: Validate DC3CO counter increments before and after a delay greater
> + *              than 6 frame gaps during video-like load with PSR2 active.
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -432,6 +436,64 @@ static void test_dc3co_framedrop(data_t *data)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static void check_dc3co_with_framegap_load(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_cnt_before, dc3co_cnt_after_gap;
> +	int delay, long_gap_us;
> +	time_t secs = 3;
> +	time_t start_time;
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +
> +	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
-->better to use delay = (int)(1.5 * (1000000 / data->mode->vrefresh));  
so proepr conversion to integer usec
> +
> +	dc3co_cnt_before = igt_read_dc_counter(data->debugfs_fd,
> +			   IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_before);
> +
> +	long_gap_us = 7 * ((1000 * 1000) / data->mode->vrefresh);
> +	usleep(long_gap_us);
> +
> +	dc3co_cnt_after_gap = igt_read_dc_counter(data->debugfs_fd,
> +						  IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_after_gap);
> +}
> +
> +static void test_dc3co_vpb_framegap(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	data->op_psr_mode = PSR_MODE_2;
> +	setup_output(data);
> +	setup_dc3co(data);
> +	setup_videoplayback(data);
> +	check_dc3co_with_framegap_load(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -852,6 +914,17 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Validate DC3CO counter increments before and after a delay "
> +		     "greater than 6 frame gaps during video-like load with PSR2 active");
> +	igt_subtest("dc3co-vpb-framegap") {
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     PSR_MODE_2, NULL));
> +		igt_require_f(IS_TIGERLAKE(data.devid) ||
> +			      intel_display_ver(data.devid) >= 35,
> +			      "Platform does not support DC3CO with PSR2\n");
> +		test_dc3co_vpb_framegap(&data);
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
