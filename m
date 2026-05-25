Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81554CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 19:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138EB10E21F;
	Mon, 25 May 2026 19:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMEpxXR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB43710E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779736836; x=1811272836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lFjzsVo2Zq17+P7nEjCaMe69LgiLPdH94gix2H9+pNU=;
 b=nMEpxXR0NupnIpFXm5QG2MF5wvjBJIC3+CfhwNxeLEE5pfGIYLrk/478
 Sb4bfpFS0X7nDJQ7tK7E7/vcD7HoN+zO86wHKeKs4wRFkZcPjfEOkdqwB
 yHzN4/TR8IyNZhxIdxQI6HK021oEm74u47pVi6pw5xeDiEJc31jxIBoGR
 geGomPaI4jFW7eq/OmKWOKnuNQILUB/D3eDXLDIfNQg0bLECcQqeGE7H1
 +hGhYvHZOEHAiH6UgLb2/En0Ay1IQ8zfxfuuxjlOI/HE9jHmo3HfG5zhN
 2yOpmGc5Qjjs4K2Du2vsXFjbtAG/WLLsYeK1ELgCxDzMynhcGcO4RE/dX g==;
X-CSE-ConnectionGUID: TEPnIj+qRamJYmHmxav5GQ==
X-CSE-MsgGUID: 2Bb2xvETS8C54pSkrJT8bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103236032"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="103236032"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:20:35 -0700
X-CSE-ConnectionGUID: /ZYshDZ4QkePcXjqgS142Q==
X-CSE-MsgGUID: +msoA944RXGGLhNU+Bo6gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235321039"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:20:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:20:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 12:20:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3Z2cDdDWx+DJG5FMn5lkfRL56Uz5GWVz9cfQV4LM7+UYZi16VzqLfnsyvY78iejK+N95SLEeZdYNrEmUyfxGJmu4UXlD7a1Qk2AqVKnA6sMUdHM2//87mGnnYgPLzStxxTeLRZ0WICUXXD5wS1tmlYFKeWzD6DwFbhVL27AUfGaGbkDHUf8NqsSIWjvq30H5J8ncGcyiC33GXUa7fKaIG6g+gW6DfVZwwC5MvQKsr4U/yjGznnPiR0oFbZaFL/jmYnDH09wVmHLWwL4CuxPO8WiHyNe4HrKdVfaxv8MVAvZ3ZDVSYdDyv4EotyqcMKuPbLrt09FGOTCsWXlQuddqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7x7wTvBpbNHNZFyPgCfHd/gsQGZ/gkSGuoDqp0a0fQ=;
 b=HDQVDDzuHQysxmMcB5/kMWU5+SMnVIThGeFFZ1YHiXzbKVye3WJzlJx4eFuZ11yXLaJlhcUgVp96Gg7evP+UqCnZdf1x1hkW26BGA6OkhkNjhQqxLBjP43xzsE/zTe4QhQUAQTZ6jCgUnODkWWvlniV1LkkyoqWrhBbe8Crisb0AHphl72/c/Fk2vCrS80p7h45gsbmKVaerrRhaE2h8ND6NchoOd8sFzBWmbwV05L0uqfJIcTafLeEOs7bWudwgwnWn8GzpP/6qteZDpigK5wV7shDzBmVuRGQZUeZeMsvy0NK81H7Mb+Q4EPYe/R9GoynnqqE3IbiZwGWERjAjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by IA3PR11MB9373.namprd11.prod.outlook.com (2603:10b6:208:57f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 19:20:26 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 19:20:26 +0000
Message-ID: <c6ffa302-8f50-4d7a-8f40-99314b21060b@intel.com>
Date: Tue, 26 May 2026 00:50:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 6/7] tests/intel/kms_pm_dc: Add new test for
 DC3CO recovery after DC6
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260515153838.841048-1-jeevan.b@intel.com>
 <20260515153838.841048-7-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260515153838.841048-7-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0149.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::19) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|IA3PR11MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: dcab74b8-8194-4291-9c7f-08deba92acf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|6133799003|3023799007|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: f0xKAZ2PMfKuYJ/LiyCs3YeB/ID1CL1DIljZMRKxz6u/IYfHLeDN1Q0LhDs0zq683JPl9HTYHC2jvz6O0jOr0fl7X1hEds4QNdS1G97PvDmtR5HyoZxgHdr7i6c8a5FoXHL9eRTNW1tuYmyW+shNUTzhK51ABHbTVRJAcND8gUg1vUHxYIjq4DyhTZTouji5WsEuVi4pE8i15TWHOC7PfUKLeypA4ooPE31Xgb0/T7Ofe+vVOcyQVF13UlfVYKY4k/DEcW3iXMZIjo6Fk3mj5FzRNh5J/tZFMWM8ifXdUZXtun/Ou0KgrvwwPYRq1MWzXkyZJvcATburBHkkUE3BzO2bbhQyvMY6cg14gLjBcmwIqhSvKEJAW08uqrKooPdu+W3ev54ujHcDAv9qsVWHQvurIqc/b0useuyg/bxrHuBAZy1mmuA8anDZFhn/26/yrNtY0PApcBmuXIRti3fcCIQbAu9adbPBE7n1ILEdfeksuVLrp8RAmow+z/UUxCMGce+kb7zdKRgTfPMHNUdtoZ3NW6wjmqinUgM6QT1Amvnl4Bpb6y25UijLqtc1M8oMBPScNvu5Mc+/J8iPsHc9TThp5ly/HJ9EvciEqfK3cFVWE3AgYdI6yiq/7Ac9zp/+v1I9ydbgZ15uBAuzWPr+zC9lFUQEr5ACRBRNs+P1x5g01D6twDgUDJJHry+yiDSF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(6133799003)(3023799007)(4143699003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZFYVVtUStobElnb0lNelNqb2hsZG5PRDVlaldzOTh5cW1WaFZ6T2xQYVAr?=
 =?utf-8?B?N2E0WFNQYXEzRlJ6dG1jdXUveE5QeHVqOUdST1pWWHN4Mlgwd3ZNQ0xiczhN?=
 =?utf-8?B?Z2pKRGVGV2FOTkRwZDRRZm5pN2kyVGcyZzBEa3JwOUJxcE1DaUo1REVHdFlW?=
 =?utf-8?B?VmFkZEw5MGtoZVFLWjdBZFZiRFl0LzBrN1dXU28xblE2MjNqSnZRNm9RTTZt?=
 =?utf-8?B?U2IwQTNPVHkyV29ZWnBVY2dMZ1loY09qY2ptUVFDRkhSZTNVcmVyWG44RHI3?=
 =?utf-8?B?bjRHZnR0cDBORjZpblBsdlFwYWpYS1BxM2VUU0s5bFBZYUplLzVLWHhRV2Vo?=
 =?utf-8?B?Vmg5b3ZEbDliTFI4dFhaUGZHalZ5R2ZEZ3gwaUlzNDRSdHIrVE0wRWVheVpD?=
 =?utf-8?B?cFVaR1dVdVpYOU1yVFZ3YXNkbU9KUHhiMUN6eG1rNDhYOWd0MmM4V1NxOXJY?=
 =?utf-8?B?NVU1azFPQ3JVR2c4UXNNRzI3L2Q0OGRnclltRktVelZGcXVRMkRBNWZQSFVx?=
 =?utf-8?B?ZDJzd04wV2JMMWpoVDQ3MGg0TGZhbGlRNmE2dUZxd0FHamdwVUlNR3JzQkNS?=
 =?utf-8?B?cW8zVWQ5K2plOGhtbVllZHZpWkFrOENRMGtiZWV0STV6UFBZNmJVVi9qVHBT?=
 =?utf-8?B?RGhIdlpjd2JndEU0YUZ5cE9JQmM3TmpRdlg0KzhnREY5Ukd0YlMxR3o5N213?=
 =?utf-8?B?dWozNFlqSC9qNHR5TWEzYmNXa282S1E0MlJZcUZQWlQyaWFkcTlGREVrcnVw?=
 =?utf-8?B?VXkzcjFIZlVxMkJPZ1lLalByZXdybU94QlpxdXdCSGpwOGpMb0NtdXNha2Jo?=
 =?utf-8?B?b0wwSXhpZ0hDRFh1Tk1xN2E5NXNFVm9SZS9jc1JKeDNhVFlVK1dtcHdETUFm?=
 =?utf-8?B?TnJNZVNRdzlIZVJRVWlmN3BNK0xlTWZFck8xVkQxWC85b3oxUFRSczhYaTRu?=
 =?utf-8?B?S2owRnJuR0VGYjZEcUU3L2toVWRFU2xsb0EwOTFYYVZySy9UNkhJbFV1OWtY?=
 =?utf-8?B?WDFIQjVaT0J0M2VzcWY5ZFBMT2xkdUlmUno5NmJOLzg1WFBZMCsvSHJFVmRo?=
 =?utf-8?B?VnExcW9MRmM1WUVMQlEzSWQ4MDIxb3lWdGRQVEVWSE44bVZOQ3B2ek5BdGVw?=
 =?utf-8?B?NkljZWJobzVYM0htbC96Mk5ISS85NURNVTZiTjBlQmNmWUFNd2M3RUs2bWZG?=
 =?utf-8?B?WUorUjRPdlF2RDF4cjFnWGdYUkRwU2YvcmJrNkhEM3Jybm11aE82cmdkRVlj?=
 =?utf-8?B?Q2lQSnZ0cXlMRnUxcEJmKzFBRHg3M245Z1luN3FuTVZXMzRZYzU1ZUoxMDVx?=
 =?utf-8?B?Y0ErZHpiTGc5SnA4clBZWnJWSTFDZmVVdU9GczcyNWtLeVVSaVVuM2VYeXk0?=
 =?utf-8?B?U3ovcElxMXBCK3R2ZFlzbElPNUZHeUM2ZDYxREhuc2FBcDlEMkFodnVjaWVC?=
 =?utf-8?B?WkZ5bndyVnk5R0tDVVdmQ3dzMllyUWZKeWF3YXpUVndmL1Nhbk1JWFhyRkZP?=
 =?utf-8?B?QlBYUmlzcElEempLd2QyNFFPclRtUDNnQWNERk0vNUc3UlYzK2ZYUW5QZW9u?=
 =?utf-8?B?RGtqeGIzR0N4aFVTZXNYV05xeWpLUkpsS3lBWnE3QjNOUG9uck5GSlpUZHVn?=
 =?utf-8?B?d1pNNmZmY2RzUzNXYW5CaDZkYjUySVJKMHNpczZrMUZsTVp3bTVWU05JNWRq?=
 =?utf-8?B?TGxsVEZoV2dzZkRtNW1iQUJ0TmxPWEZVYlBHTWZqY1ZtTjFkNHJSSjl3S0hu?=
 =?utf-8?B?UHNsTHBIZ0xrSjZkdEpGR1crUmgrVEQ2RjJWTFBrRWlYL08rT2xMWXdnRHoz?=
 =?utf-8?B?dUkyMGlzQ2xQbnhMQ0swSFFBejRxVUdvdHBXRVNFOGM1YnVzOFRzYjBJaWxv?=
 =?utf-8?B?SjFGOUZVMENsbzlUYUNaeWZMZWl1SndSYUZrM0h2NklmL3pndXZXZTdldit1?=
 =?utf-8?B?RlBIQTZkNWRWVXFjZkxkbEovMm1zbk1JQ0tqbU8wMEZFbzF3c3hraXI5S25v?=
 =?utf-8?B?MFo5QlNSTDI0T0hNNGwwK1hkSmRPSytwcXFES1Zrc2doL09EdENIZVF0UTNG?=
 =?utf-8?B?NEpHMWl6UDczTjl1QXFsQ3JlbXVuU2h2N1h1cU1zTTlqRU4xcWJkd0tHSDlt?=
 =?utf-8?B?TnBTNDJ1dk8zK3JVTUJ5a3psSDZNTkJWV3cvemRTM0Ric21RR3J5WGdCVlUw?=
 =?utf-8?B?YzI2emUzS1lXK3NMcG41YzRZWVJPZG91R3JobnR4T1pjeHlnTG9kakhRYmxm?=
 =?utf-8?B?bFBzRU5HazgwaFo4Q09ubWo3cTZjVFJwNkxIZndPQ2tSaEJYdEtiWG8wYVVn?=
 =?utf-8?B?L215dThWQnN1d0Y0RmtUZ1p5dDlxK2RnTWFFc1AxVEpIdDNmMVE5VFVBcUZC?=
 =?utf-8?Q?/7yM6rYnRYwuSpdI=3D?=
X-Exchange-RoutingPolicyChecked: Ku1CMgkhZI1dqP4FMacC2bi991y5/T+HNu59e7V3Wlpij+PSGUKBkvHc+Ij0fNtYFaiAHb80MK+PZYdQo9GCaj9LShx5l19JE+lxZgcuvkcYwKkftigkn1/J8fwMgHeTf/9G7muPsdmQiCldpHEHn9X36WgZRIJgOtyxhLbNwi0HqcUOrjK/E5M2km7sZJRk/UT8KE6VCMpDlgSex15iBLzxgzSF0jLJGVLGiPqjZNaQJQ3isNVHfynQxSo5LhdZEMsKMe7J7rk7hro6gZaLWQF0t5XVzYqQrNi7NNcqy0qCuIOegsaccJJOQE/XAtz196xjz5BYzhro7zV5EXRONA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcab74b8-8194-4291-9c7f-08deba92acf3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 19:20:26.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPrVZcN/kIoo/ePlbKCLATarLMPtoKd9ZGNkBkm3pWF9ite5zcpuoIkQV52TNz1e1SOpEbZF8VnooRV1ANQb+W7TJJ9ZMmQhVvZpnzks1CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9373
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
> Adds a test to verify DC3CO continues to function properly
> after a DC6 power cycle.
>
> v2: Use test_dc_state_dpms for the DPMS/DC6 cycle.
>      Drop redundant PSR re-enable after DPMS/DC6.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 4497cffb7..0f216d9eb 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -55,6 +55,11 @@
>    * Description: Verify that DC3CO entry does not cause frame drops and successfully
>    *              enters the power state
>    *
> + * SUBTEST: dc3co-after-dc6
> + * Description: Verify DC3CO entry is still functional after a DC6 entry and
> + *              exit cycle, ensuring DC3CO is not broken by deeper power state
> + *              transitions.
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -628,6 +633,25 @@ static int has_panels_without_dc_support(igt_display_t *display)
>   	return external_panel;
>   }
>   
> +static void test_dc3co_after_dc6(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
> +
> +	setup_output(data);
> +
> +	/* Enable PSR2/PR */
> +	setup_dc3co(data);
> +
> +	/* Trigger a DC6 cycle through DPMS */
> +	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
> +
> +	/* Verify DC3CO still works after DC6 */
> +	setup_videoplayback(data);
> +	check_dc3co_with_videoplayback_like_load(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_deep_pkgc_state(data_t *data)
>   {
>   	unsigned int pre_val = 0, cur_val = 0;
> @@ -801,6 +825,33 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
> +		     "and exit cycle");
> +	igt_subtest_with_dynamic("dc3co-after-dc6") {
-->use common structure for both the tests, in a similar manner as you 
did at patch 3
> +		igt_dynamic("psr2") {
> +			data.op_psr_mode = PSR_MODE_2;
> +			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     data.op_psr_mode, NULL));
> +			igt_require_f(IS_TIGERLAKE(data.devid) ||
> +				      intel_display_ver(data.devid) >= 35,
> +				      "Platform does not support DC3CO with PSR2\n");
> +			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +				      "PC8+ residencies not supported\n");

-->igt_pm_pc8_plus_residencies_enabled is common across both tests so move it to common block to avoid repetition.

> +			test_dc3co_after_dc6(&data);
> +		}
> +
> +		igt_dynamic("pr") {
> +			data.op_psr_mode = PR_MODE;
> +			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     data.op_psr_mode, NULL));
> +			igt_require_f(intel_display_ver(data.devid) >= 35,
> +				      "Platform does not support DC3CO with Panel Replay\n");
> +			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +				      "PC8+ residencies not supported\n");
-->same comments as  given above
> +			test_dc3co_after_dc6(&data);
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
