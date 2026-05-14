Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F7ACD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 05:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FAD10E35B;
	Thu, 14 May 2026 05:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vx/KokPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B4F10F120
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 05:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778735725; x=1810271725;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=onJ4EFUOcefW+9S8131hfOS3jWToylqEwbyPHsO6iF0=;
 b=Vx/KokPEOXLwq0pxRRPF+y7pWhzYhBVyvGqlUNP0PHYe8FCvU0G0JmJZ
 pz2+TVvrYtQWhz+fHgBmU9SD/Iv3fBtHKiEmqpXvWtc/g7u5MK2xNXpS7
 ye4MnXbAiN5rfWTvU6rKji6Pbf64BHyQU+LS6T3sRAdy3BvBV6u2SuwA9
 6yja+H0oVHdZ9v1pcto+SPSfAYY9nmnJl8cdBS/LCE6miewfKJXibwg/L
 SQIBBqe55XILfuXa3MYJFhuRURrXvfyk6WPfvifXVZBcl382VYpvjlcq0
 MKjj67iA1kmJb/qaSXpqOMhz9u8QYgUSSXULdKteuOv/tLaJs08MtL9s1 w==;
X-CSE-ConnectionGUID: pAdeNr47R7uSHkBuD+QeOw==
X-CSE-MsgGUID: C6tnyBW8SqG8ZcDT7pVk8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79626106"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79626106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:15:24 -0700
X-CSE-ConnectionGUID: tYsIbx+0Rg+mVGUXZedmPQ==
X-CSE-MsgGUID: EFl0D+OxSFmaRImB2KECwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="233853273"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:15:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 22:15:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 22:15:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 22:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTWYwaE6MwCILygCXepKJgi3mcNNpD19I0/hGWPNKLj12oFeWFbPagduz2w+ElVetNbRzXI5KsC8Q4qRLgoBiDa+4HB1StxuGkrZyJDkeCihQyN7VPpl0QZXvsNpaIhTFluWfWLxCTNoxH0L11m3pyOnN1uTA1W3NbUuzcM90enSiMdrZ5EPqjhxYSt5wpPdRBTo6E+iJ8hALX2k8w9UmxbqcMcRw/Q4cGTdvsfPdLDOaYihX+IOe6o+URmx/ZzD7y7CP8YN4PQG/otdUq1AUYFinjEWSFxt98Gs/X7/LenlgfaHz/0nXYqc/9XP8K27MUO9KEICYNGmOZt+bvs7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKqz5WWbWvZUcFWC+JGEyfNdxoze0KuHL9C+z1BK+i4=;
 b=aTzbx/7+ppOuHI8iaapoZEAP2NnN+OGaudWBlZfT7dnf5Qihx/MnumvDrOVHIE234agd5mQR1dqgvYl4uxCQfPOeraYi+l48L9peuF/FNIu65NI+dQ9Yxk9T/frxoNIWPbjNRzwVlyw8zO7XYDTXHODXDxNONEqX9Z4DeA8m0krF/lmFOKG+jtIKt7yQT2WtoD2/bfr0zwYxtrnbWblP1vTCgUT99ng1f+fNxRK8KKn6Pc0B8TazxUQ3vV2eio4lxDkvDrzPAcLo2skvF1A2Abq7JpFDc26d7i8EA7RKWxPbI7DvmUs/CVhhZ8hYtYbB2LUDUx1ZobLAoHIHXP7cng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 05:15:20 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 05:15:20 +0000
Message-ID: <cb1e8507-a963-4c8e-97b7-9c9934a0e1f9@intel.com>
Date: Thu, 14 May 2026 10:45:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 15/25] lib/kms: Encourage drivers to expose
 IN_FORMATS_ASYNC
To: <igt-dev@lists.freedesktop.org>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-16-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260512122143.11013-16-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0303.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 326c63b6-d5b5-456b-13c4-08deb177caca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|56012099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qE4yNiOz71LoFWq1tSupbir+HpwCiur6+tmYrlcq8B8sDzgwJPtGJI0fShIyGQzYGBztYf9KPXymSA4Ngmto4XfNFnzZtZrzlF3wglrcn9xr5Wm3UzhfGDabXoJCgUQnne7aKzff/C3wsy0RjwdllOJa3yWjequEjAUBzJuQUFE0KMF5EvUzRlMmiIyRe6tmFefrI8ElN210zBShsLLsG34K1pTzrBvXirHGJHxZB3qV2YJdlR9FPy+zLfEooND4oViyDd7pJPz6NLW136ASB80p9UfPRznDiJ0Xdn9cFulw1Io9nre6StYx2Yoc1vr6j/qtsXd6KkpMTb6y0Vn8NXNvFZXX+6yF8mhTHGbgf9rSy5m6Z/LaYr+9jvzbvdBkAJoUq9KErAJLsNsPwfy/S0meZsXFp+K/W8MH6V4DX6KznTIKC8jYA8f9nDzRJtHeOPKJc2yJdV7fHo4y8oxuii1KLUEpNodZMbYzJ+05d6T/WxejHrQ63ch8JkPgPORCTkUcGubQlMGbemamKGwbWbtNG6e5hBxCzhFlT8N3JdqoGhafLGYUB+HKP5r/7iYRi0au44P33kjCN2SEaK5lCC41z5UdLedt2uqI7QPKdQlfHQw0/yl8qqukR1vWxkTEIarIqLOLqt8ME/JzYxZGzeTdSFxD3pTGr85fAeF2oie2Og69OUpLAYi3r9/WygoK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzI2VmtzRGtVaVErV1VMaFB3VnFVaDM1N1kveVRMWXNORy9rMmtuQ1Z2N0VM?=
 =?utf-8?B?RkZDcDhaUHRrcmhUeVZBZ0lMNjBHalR0Ni9Na0lMU1paK2VqSlpob2lkOWZI?=
 =?utf-8?B?ZTQ5NFNoSFAyT2tBRk44K3J4REFyVnNJNER4eDA5Vy9XbCtnN2NBN2hUYmpm?=
 =?utf-8?B?c1pJUnRXdXpvS0FaY0R4MTVtWk5KWGlMb1hOaXBjVFB5cUJUVXNhWlVZUSta?=
 =?utf-8?B?QnJKV2s5RnNkZnBIdmlxcVFhUXBiaWo2a2pPeHN2SXg1WUVsM0tzMXJHbG9k?=
 =?utf-8?B?MEZQSVN1OE13TnVkUTJVeGcrVzNvNEN2MC9XQ1lDcFM5b1E2OWZZd2VvajAy?=
 =?utf-8?B?UEhNdjM0RkFpKzRNU0dlR0t0YkVyRk9ZZlU3RHc0aVdjRGNJcTFwQ1lnOGtP?=
 =?utf-8?B?SE95VVptN2RIMXdPUFhNcVZMRnZsZjZYZXlucktkOHRuZkwrcWd1MGtVWld4?=
 =?utf-8?B?WTVwZS9KOW54b3VTTkp0MWg1bWYzbHRNYXlxeE5xR1NpQmdSVjVSWktyT1Zo?=
 =?utf-8?B?d1RGVzhoS2g5UW5qMnpLcDR4S0d6WjVtVTY2d0MzclZqN2VyTTFkR1R5T213?=
 =?utf-8?B?ME42YjJCL285dlV0NS81Sm0wdzF2bWo0ZjI4YUhZRG8xQWZPZTFRNGF3Wjln?=
 =?utf-8?B?MmFVakIyUEVMY0pQUGQ3bThyYXBldEpsZlBZWXZoRVpPVUxtRitVZisxKzRk?=
 =?utf-8?B?RkJsZ1ZtdHhIV04zcGhxZFZnbXBSVjlrcEVSOFFXS1pqdGRJY1JpQkdSajRO?=
 =?utf-8?B?bVhTMFV0dWNHZnozRGhNV1BLeENQbnJYbjlQNVNpRkhnQzNTdmF3SGEvT05N?=
 =?utf-8?B?RTlLblp3M0F3YjRRZUFZQzdrTUdxYm1ydHBOZWREc011N2tTT29BNkZtUFhX?=
 =?utf-8?B?aHJJaVF4bzhqWXNBeEZyZXpnMGg2OEFyQjhmbkh1OWZqVThWeXlZWUxFRU9N?=
 =?utf-8?B?WTQ3NS9jVWlXazZjb1Rza29TL0kwTjFvT2dqRmhrbHNndytTV0h6RklWbUdQ?=
 =?utf-8?B?VEIvNGtmL2Vkb0U2WlJBaTZiY3htLzdMUlZOaDFjT2ZlSkl6RnZlanBDUlhR?=
 =?utf-8?B?ckNJVTFaZ09jamhxQWFzNWxVRmtydTVudW9PTDRUOEFQWXFFMmlIOW1Hc25O?=
 =?utf-8?B?RFJsQ2J6T3R5dEE1NEVhVjM5TW9mOEp1VEc3MkFYeXVqUlhDM0ZTU3FXRDln?=
 =?utf-8?B?amU0OHphcGk5MDBJYjlQQmJHSnpxTkJ5NXFUMTZqVEMwWEMzZnF1UVRSM3Fy?=
 =?utf-8?B?YVdmUHhWMG43YnBEZU9uWGZYQ1NDMXlTamhzQmdsRkhlR2RZMzBFMjZkLzlZ?=
 =?utf-8?B?S3BtbFNmVUdVdEZFbm4xNXRDN3gvdFhlK2owZ1ZKMWtGWG5yZG52N3JFemNU?=
 =?utf-8?B?VmdNYUFxT3pxSjMxQm5lQUZRa003VjN3cmtWMTJVWThXd3FIUW9wQWpqN0xK?=
 =?utf-8?B?SGxBUVYrOGc4cDRQSE9vK1kydlNBaDJGL3p1MFRTTlAxcS9qNCswRHMzbENi?=
 =?utf-8?B?STlCUkprQU1kS0RrZnlqRlM5cEhQaEpGWGw1NmdUZHRXMUh6MWp2Rzg1eFJs?=
 =?utf-8?B?MTJHVDZFQk5ENFAyT25KQVo2TWl1eW5uWjNmdzF5a3RIRHJIZUl4cjY4QTI3?=
 =?utf-8?B?Z2ZkNldpZ2s0OS92RTlGWFRWUE5iRVNpeFBiR24zejZaS3RkQVhhTnUzUktX?=
 =?utf-8?B?QXdaQjBSUktKcngwVEJSd2k4MEhjbXYzcUxHR08yNWp3aUdiZ3RCOE1JUE9j?=
 =?utf-8?B?WnJnSDlzNTZyYTBkK2VST0dJOG1FdDZQeFVRSklHZ1pKNDhSMGpVS09QV0hn?=
 =?utf-8?B?Z0xNUm1xU3dYNU9QaUhyZUMzTk1nNlZnUVBUUCtXWlBLZEcvajBJL3BqeE5s?=
 =?utf-8?B?Mk1yTkJnT0FYQW51MGtURDlnZ1ZJS3d4Z2JWcXRGeGlHZ3F5bmlrVGx3aXk4?=
 =?utf-8?B?UGpCQjhqczRicWZROStvdDB2d3FVVmxzQ2wzTUYrQk5lcUkxOVRkM3dmRTJT?=
 =?utf-8?B?M0ZYQkllOHR2akU4ZGNCUFU3cG1hSkZFV3ExOUxEV2MvaXdQZjBpZGpRVk9R?=
 =?utf-8?B?UnNpWHQxSFNPNzFUYmtXLzRNRm5qZXY1Q1VldVFyVlpGUEcraVRTeEZBSU9i?=
 =?utf-8?B?SU1pWC96dFZDaGpvd2V6OGJKZnpMVGcwNjlZODFodkZCajRjdFhoVmhMOTJr?=
 =?utf-8?B?M2d4czNYSS9MeXY0RGpMbFZYQXFDNGFTeHlXRTUycXFWWmNNdmFTY1lIcm5x?=
 =?utf-8?B?c0tsVURvVzlYcHdsckJ6N0xXdUNwRk9VY0JKVnlwZG9aMVVLU01yb0R3K25v?=
 =?utf-8?B?OGxCQ3d0endId1owSHVoODVQeWcyblN1c09tZWlJM0JHa2tIZXMyNGQ4L296?=
 =?utf-8?Q?u8JdZPfLjEwR+o0lnq9YSCP5lyYG8Uh1aKEmn?=
X-Exchange-RoutingPolicyChecked: EhbqATuPB/kR/ULUwIet1K6KJnxC56VN2bEP+vOlXjDCEhSUBA479lALMN7JtoGuO2qWPytifoPQ/7yUY2bU1M7k1VRM8ZaZMxj6kPESC/8H7waxh4x8y1GIrLDp457S1WmVoWkqWzQNkbXkWQHGBawNCZKzfEFqoKi5vHU+a+olkErBQwPnweKsioNO4huFd7UMubcY9eS7xWKATiSOGUw+4XYy6bABLn3IQrisZRkaBAI+Ws/H4SlsVsHElC4FLlkN4XgmIhfrV94wEnDLy1q9sGI3CDFHBbfi8dFiQvNYHO9Ni0+e1x0KPx4DuYdB2z+hpPUNZez0JLX49SyQsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 326c63b6-d5b5-456b-13c4-08deb177caca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:15:20.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4mCHDfgo7RaObyCmbu87QRQ1qD4rWimq2f6EBeiBWYIXD2xPzbjrdz38e9c2QMSZCCUoLsPrkBrtI8SPDxNB1hhO+tErzIHkgKxeG3Nvb9AzsuHpvssGtJxDr8RCPcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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



On 12-05-2026 17:51, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Currently only i915/xe exposes the IN_FORMATS_ASYNC blob. Let's
> try to encourage other drivers to join the party by issuing a
> warning if we notice that the driver expose the normal
> IN_FORMATS blob and claims to be async flip capable.
> 
> And in order to make tests less messy let's just assume that
> all format+modifier combinations are async flip capable in this
> case. Any driver that doesn't like it should just add support
> for IN_FORMATS_ASYNC.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   lib/igt_kms.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b81be73978a1..b90d34e61359 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6244,6 +6244,9 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	uint64_t blob_id;
>   
>   	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
> +		/* IN_FORMATS_ASYNC should never be present without IN_FORMATS */
> +		igt_assert(!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC));
> +
>   		fill_plane_default_format_mods(plane, &plane->format_mods);
>   
>   		if (igt_has_drm_cap(display->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP))
> @@ -6259,6 +6262,15 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   
>   	blob_data = (const struct drm_format_modifier_blob *)blob->data;
>   	igt_parse_format_mod_blob(blob_data, &plane->format_mods);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC) &&
> +	    igt_has_drm_cap(display->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP)) {
> +		igt_warn("Driver has IN_FORMATS but no IN_FORMATS_ASYNC while supportiong async flips\n");
> +
> +		/* assume everything supports async flips */
> +		igt_parse_format_mod_blob(blob_data, &plane->format_mods_async);
> +	}
> +
>   	drmModeFreePropertyBlob(blob);
>   
>   	if (igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC)) {

