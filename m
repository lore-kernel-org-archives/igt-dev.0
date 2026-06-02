Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E67CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 07:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D749B1138B4;
	Tue,  2 Jun 2026 07:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot9PvM97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0100B10EC85
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780385690; x=1811921690;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J+nBPMTp5CFNl+DUyY5n25MiCrLC54j3ErOk9Unsm/g=;
 b=Ot9PvM97WGEWPNH7y7dPLxtmdN49G7Wf1/V/ezx8FXgpn10unq06lQ6m
 D+tnUCx8jNitEtCuoVS6x1SKVUd26TJz+VjLqt6aPfZRk4w+v2xwLWBYE
 T4ecO+t9zhprf7tInSen1G3LRAFM3rjhEWLY60fQqFtQ43f8rMsvf4n+3
 qf5S4Bn3xUmraHTcY7mXBLNPJMxfPKN71YtOcAxXlT+tYi9V7iBJcUp6w
 0+CoWr36SKIE4X+gQCvGan+APl+eXZDh4fQ/4nlenPEtBQiNOMPMajisp
 1utxAjsBOgUEuP3uIqGeT0p8N+9xuJaG5jfrOh8poc+/HA1CxGCrY5UTl w==;
X-CSE-ConnectionGUID: t15/B4hAR2m3FxIJucrxsA==
X-CSE-MsgGUID: vjsQTqcOTkODM2E6cKjttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="83745910"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="83745910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 00:34:50 -0700
X-CSE-ConnectionGUID: P+vfckpXT5W892NdpLwlkQ==
X-CSE-MsgGUID: e4X6QZSYTQqbLQY6pdkNGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="245640742"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 00:34:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 00:34:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 00:34:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 00:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyak55xob1l3AKV9Svb3RKfsuh3pf+2baFLjXEvPHKWXoAdQwsSiRe9Em+qBxG2LRfPryAwll0hAPdZj/lpgHl0SiXmHVPQgg4Jy9BdORsq0VK48TRuEztJUIHoo/xbVjJk6fBqlR8NEgSfmMNH+eIXIlrDJh4JlpSDOuMWII+2O8VuB7j9cY1S5DXPIzaEpGgGDnMFPxpnw6JKegfRJ+rK23rWC1AzoesEIw1LnxbUxxgtqU9LM1asukwqFYFCAPTAtBOifgMD1fHsxTyAj8skz4FEX5zHW6peybtnpNTWHVvBUQtkatfXzDQg02kvUrRmjSwUAS5S+LJe4MHYSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoWBVUKHplHsE2UT18wkkxy3RVedK/KXyy30mmpN/x0=;
 b=XJSjrXPQyX0Zomp7ZlP7VKerObUpKXa9nnorzoOsbhF/dmbt8Gta9kAeRMVR4GCgnMaVsV5imbsGcxrdwKNbcu4c2gxN2Nox6pbTUaaG+dlq2RvuBGzzIfHi79l2pgf+nEV9Vrt/p7CiGQlroexhYq9IIvDpTeY0ZqdzH0x26pMQAa7fj9uWaqpQ1cKegth9VCD0SOg9SuhJnm/2WLQaMYwsGYlymxBwQLuDGLVpLIU+Dc0ardztgyPpo/xN/dbscdKhWbPsCAC3UsHeVoMoGxhiItNyCpYVHbbolDeI3OgXVTQSOi09dZtAI4oC1aeyUhntp+VkNJn/oBShySAnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SAWPR11MB9709.namprd11.prod.outlook.com (2603:10b6:806:4ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 07:34:48 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 07:34:47 +0000
Message-ID: <111a1f1e-7ccf-4ec3-8831-9cd860cd9b55@intel.com>
Date: Tue, 2 Jun 2026 13:04:10 +0530
User-Agent: Mozilla Thunderbird
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <swati2.sharma@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-4-sowmiya.s@intel.com>
Content-Language: en-GB
In-Reply-To: <20260527071940.3285269-4-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SAWPR11MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a2a4a4-8351-4faf-9ff2-08dec0796c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: RoPiKColj1MynyPy6wirdWUefhBV1dv1O1W0a3wRNda14WD8Y9s6BWbk4r+RCQUHEVBMr02l1gwlQ06aBOWOaVCMKGAIbHi6kBe00a9b/8c6psToZy40cSSg2g9n92QOhMJuMBf7N2BtYElCAJ+BAffwv/jRoBTiYSMg6OHvVgh3+G5C0J3F2RtE/OcJ4Au8b7eH6+7Xpz+6+feT1d2tpH1BtCYyyb2tQ+w7PGERiWDqCBi+MyB/MXzpGF6XqHW0yN4urvbXVT6b6r9XZpkfQUYt9CWE6HNrcsiGEqOAYaWg41qe4is/pqdcWkPwgNU9QQ2fDiJC6K+wRE/0l9Avj3XxQEGUBcxZpltWwNKapBXsbUeS7QDZsTIyyk/NygrS9wZThg/0yqI5Q43iHpzHcfGFTmZqMhFA+fqk0dA6Dzfs1n/ueGcfyAslREiYMAGJrh6OF9i1FkF50CXhR+ontmw36hJEuXT/TD4A8x+S3oyMFrOVLoYteVy/uCaBAJYF9/lyqrykkT486GwmqUIeYN42DxkjfyFuBOtkR3LuLP9EcEpvmZrtr/VrskjDl6Jdtp6H5hZYewdxBtSCqavcD2p9oGQZ0AKsLOnHx7xObP4FEQ0w14LN1mhC7hqMpd+b4hsVU/R4VpAvg2Eurm/U1Ij04f4FGmknysYaVuhUbp4gcWRyRXCJfwjVF4EHX6Dj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxGbkZTL2VBd04yQmcwQzFodUoxR2M4SzFCWGpXL3MyRWRxU0Jlc3pzMHJF?=
 =?utf-8?B?SVZEdGpSczVSSDFQYjZqNlFKYWtQY25YTnNneFhlOTU1UWxzNFowUDEzQmtF?=
 =?utf-8?B?czY3WVlJVnpHOG91QmdlSDhIak92WWtpNjZpL3Rzem8vMUltTXJsWGw4M1c5?=
 =?utf-8?B?cUQzbE1RK0V1Z2kxL3hOYitWQ2RNZDUySFE3MDBYY2lJSWloSXpqbGdXYXRk?=
 =?utf-8?B?SDJld25POFp4ZndIOVduTWMzTyt0MEdnTWpBVlF3NG9RZUJ1eVhmZkNJWXRw?=
 =?utf-8?B?Ly9JSnhNUmVaVmRDcEFxaXJacmlWS3ZnRVovdUdDL0hxVXBrQzI5ZjhhM0Nj?=
 =?utf-8?B?WlpMTzFxZFkrQ2IrblpvdGFJMFlmcnBickFaMWVOK3JwTTJYLzJBVS85YzQ5?=
 =?utf-8?B?bjY5VWhpcGlHOFRZTWttdEVtaXlINy9lRTRDSkpyQTZzUCtKYXBING9WYWE4?=
 =?utf-8?B?M1EvemdqS2dzTm1PaWprL1BuUXUvbzYrdVRxV0EvZlZqSFdzOHdyVjBrTjdO?=
 =?utf-8?B?cDZWRlpGVXJDV2lHK1dhNVdVQ0s1dFFCSmlrSGVvMFR4ckVwZ0l1c0drVTJu?=
 =?utf-8?B?dXVlLzk1TGk4Kzk1eFBoa1pDTjhaMFZOS3N4Wk1MbnBVUXpEQnE2N2NmTldq?=
 =?utf-8?B?UzR1MnpHbUZrb0F0QStlT2FNc1JtdUJETzU5QWFEd1VVN3d1UVNBb0Z0R3p2?=
 =?utf-8?B?RU1KcWFhdVlBZTZTMUxCTHZKcjMwSXdKbDR1UHQxM1BJOCtUVEtUZHF4V05o?=
 =?utf-8?B?Sk9FdTBUUjFhNjBNVHYvMWVRZmRGamhxRm9xWlZwOXBYYXRLakFDV3hoUmc1?=
 =?utf-8?B?VmhUYkxSRUtpZ1orTnN4KysvMXhjdDRnbTNuRFhKRTZhdTd5TjdNUkxDa0hX?=
 =?utf-8?B?eTQ5NWJzb1YwdTRvSEErKytRWGI0RERneHBaMVNvWXF1WXFvWFV1dHlDK3VT?=
 =?utf-8?B?Z09nY0tEZW5Ka0lTUkxHaFZ5RGdRcTB3OWluNkdNU1pSUURRN29qVEZwTlFF?=
 =?utf-8?B?VWZOa0hvNzRYSXFSVUVWS0pHNnppNVdNcGMrRHJ4dHlkRlZtdDZqR0UveGRI?=
 =?utf-8?B?Nk0wa0JuckhRTEppZjV4R0RsU0xUZWdjc0R0dzlqdjZQYzRWNTkrOW1jb2ha?=
 =?utf-8?B?OEE5dUFhcWdISTMyWkZZQjNqQk1jWHZaK3dOVWhuSWIrY2NWZG84cHZ2cXlz?=
 =?utf-8?B?VU1rV1c1c0I4KzBYTGxCakVrdG4zM0FiQlZsSklMcGsyZmtkS0VZSFdGNTVC?=
 =?utf-8?B?a1NrT2l5SDNQTFY3elFuUEc5R2p2MXU1ZXB0eUYzWXpXTWtsTTh5TFY0RjVh?=
 =?utf-8?B?dlUzK281NzVmVkJUdTY2TGU2RWZpVk1QV25IUmUzV2FiVzhwcGZjekplRE1i?=
 =?utf-8?B?dkpucWwwR0tiVHh0WEJUZE5ZTkEybjVwY2k2NlorN09CNE9WNXZ6dEZ2U2Z1?=
 =?utf-8?B?Q0FKTzZnelZnK3J2MjVqSS9UWk9vaDM3L0FGSm12cXAvY3hEa3F4ejBjNHcv?=
 =?utf-8?B?Y2hCdGFiVDVHQk4rWVIxWGt4TzR6bE5id2JyUktkenhKL1FQMVplOUdiREZp?=
 =?utf-8?B?eE9Hbmp6RUVJdG5MZkxrenh2Ti9XSFhWeldkMXdkWkZDZTB5eis4ckplZzB6?=
 =?utf-8?B?aWtDODJuUGx3cUxqbUpjRFczck9HblFOd056UG9Jdk05K1FHZ1ZlK1JObjIx?=
 =?utf-8?B?cDNPZzM1UGtOQWJTT09YZndmZWxmdjhZdkc4S0J1TlhFOG1TazlkR211Y0ZJ?=
 =?utf-8?B?TVdtOWpSUU8rYzFmNVJQbXNDVngrTTJOUytONXAraVVwc015ZmdQQjJoMlJN?=
 =?utf-8?B?NFYwcWIxaGpxT1JLMXk1MndiaFFmL0JpRUYraTRJaG55SC9IeTFQcmQ3QnV5?=
 =?utf-8?B?Ymt2c0NJdXc5TDRXb2lHU24rTnNiUHJ2VU8zdVpGd2orQUh1K1phVUdlRFk5?=
 =?utf-8?B?Z1BYUzR1R21BcnZZWWp1bndHNmVTOFRsR3d3dUpueStzRklaWi9kdXlybllm?=
 =?utf-8?B?REFHR2xhWlQrNWF6UkFFNXNGb1N4MEFoeG1KYUFERDZVMnV2dC9XZjFqbVFE?=
 =?utf-8?B?WXVUa1F2bnZaRkVtQ0NJM1RGQTBuYkV6WjRlZkUybzExSmY1Wk5RNXNLUU54?=
 =?utf-8?B?azdtT3lqV3h2SjUycmMxM2cvbTVMREVWY1F6QzA1dlN0TG83dkNKVUNCMnVR?=
 =?utf-8?B?dVk1SjA0M3VWN2MrRVczd2psOWhra1R4UEZMVzBaT2crNWNOdkZadjRjNTlu?=
 =?utf-8?B?MlM2dGRpNXJFUGR0cjRxVGVoMXFUZ2NGS1MybXBhWFYyeFdlUkZ3Tmx5emhW?=
 =?utf-8?B?dGU2TGh2S1JyUGlWem5kVVhidTB2MnBFNmdkSVBkOXNJTTc0NTI1QWI4Y2h6?=
 =?utf-8?Q?/QmA+ITIdv9d1nzw=3D?=
X-Exchange-RoutingPolicyChecked: X5jbzov8G4Yv1aw31i6zxVicSAUkJLHnNdRdZB2lf46EiJwcxhLd5flvvcaDBHVhK+Y0KnxbEObKGladu8IzkNximGccw36kJk3uaDqicYz4Vf5jUlgdLKqkbzLd+Fy7toS4wKbeKH2s6lipy1RuLbaY+65eQAmg8jZeQ7oBO5p+vp03ASwchdj0Iuhqzkmh0PzgcaDuwpGU3QUymnhue3SMm1XhsNMMFMLjMd+9xdXOnWHz5zxP5LVlM+27G/Jfg9jxmdYYk5nGVRndZH+Xy0R1DZIeVkrJTT8yhcZrjCmDmeSv5k447zn/hmrZGZVjKyZ+EmkmKwOuPHoZ38VqAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a2a4a4-8351-4faf-9ff2-08dec0796c5b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:34:47.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pMZInM45ZLKhuqQxBaTfevjIMWg0c3wGdNb3lwlk3iXN1z+LW6IvGcWFtKGIrc1n3B12lqr3G7wbmK/tekW/wfqdTS9rNs+LiaW5sSRems=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9709
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



On 5/27/2026 12:49 PM, Sowmiya S wrote:
> Cursor planes on Intel hardware accept mostly
> DRM_FORMAT_MOD_LINEAR, regardless of the overlay

what does mostly mean here? Does it sometime support other modifiers?

> format and modifier used by the test variant. Using
> data->modifier (e.g. 4-tiled) caused -EINVAL on the
> cursor commit.
> 

Cursor also has IN_FORMATS property so better to base it on that.

> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index a84433b9d..5362fe9f3 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -736,8 +736,8 @@ static void create_framebuffers(struct data *data)
>   		if (!data->cursor_fb[i].fb_id) {
>   			igt_create_color_fb(data->drm_fd,
>   					    cursor_width, cursor_height,
> -					    data->format,
> -					    data->modifier,
> +					    DRM_FORMAT_ARGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
>   					    1.0, 0.0, 0.0,
>   					    &data->cursor_fb[i]);
>   		}

