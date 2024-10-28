Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A48D3398E
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 14:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9110E4C7;
	Mon, 28 Oct 2024 14:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsXnW+pN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F88010E4C7
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730125773; x=1761661773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=v1scTa6Tbm8lhWBkHZh+qohtN8RnxwnKoTjv5OOf08M=;
 b=MsXnW+pNl07QEDWNSqMcZffRVYJlf1d3r9VazrIRdxy2czL/RbXaTGJf
 OIemTsR/o2wkZVWLoYIoI+/frttcgOkdaIfpsIVOs5sQn99RL4uPe6vlz
 LUV37WXihRf0CFUNnih9Br+WM4quBGobUJUqPsJNe0zHzDFt1pgEjD7m7
 /1EkXLGcP9oVKfPOZ28+ThkN6Zvay2fpp3sqOU2EgJDbL2017a9rWMDNC
 y+Kqpg1+b/Be2AscOeIA3SWQQcesyECQulq5QZ53uQ2Qfs6pI0hePHEQx
 gqgMKoKN1XLR34S4zILeaS76wSoGNRyn41s9j6abev64X20fnRU5UH84h w==;
X-CSE-ConnectionGUID: mQbzl+mvS2+XeuF/nqG/UQ==
X-CSE-MsgGUID: edYzJm17T72Tx3GAm3CCiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29625311"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208,217";a="29625311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 07:29:33 -0700
X-CSE-ConnectionGUID: tL/2Kb0CS+uQRC/ij4eJmA==
X-CSE-MsgGUID: mnDJbcQDS2+N9+8mSYFMqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208,217";a="81531071"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 07:29:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 07:29:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 07:29:32 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 07:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp5oxo7yTSGFdB2KgFsO+DQcRugAEiIaQjH+In6gqaJZxPV9XcywWkJjnZk9w+YuWSFGGhraQ0gL6ck0WXlTnZm0P/pkSQmz6I3pPq6BmDWPSejyZpHZIHLRK06PuglcuGZ1c3+p5DOCStbB1DtIIr4CxIyjwnp6cyD9PQn/aNBNG64zFYVHaTiNrXzQEwhLXnjLp8J3Fgq6K9CtCO3MbZ8aM9fBtdsdN008fEOkP+HVsXF2zNE7eRLN6GBz+dLr36yyUGeUx+0ZosiyRw8sON0oW4MhzCk8I7xtSoi47Pk00m59fUpJAG33u29WEe75gCI+oJGkVwPqlC7f7ilrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjgWF0m3qtStHSsPIeo43EZa8t4tWonPKfMUbLv0bUE=;
 b=d5e4Rez11YJo5SqM7hYVnnDjbmS9ESNjqaKFL9H1vg0h620Di6ZaG6AOCeJ4IWEEHn7K3xI6gIgtAnR2+mSu52vDX/hqj51vfCokMwTrMdUDIflsyHytpERD9k72+yHRZWdKFfTZE8X6qoYB6N3kcWOlyCHCMb44+0l7FRS/LyAhSBNjE4NHaUDaLOlDKg6WJH3PGwcr2uZoBuJZUr//VXPsKRo1t1uN8dul42TezERK8S2Gce6m2HfALVzIM4GQREIzAWCoHIuBieZaoz0+B+LCljh8sfAjh+muKhOdeRGUAZ0adj7TI7v1OeZ4Pn6k3T4GDtaIb0OZmjE5z1JIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 14:29:29 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 14:29:29 +0000
Content-Type: multipart/alternative;
 boundary="------------T9wvhSPFUfnDqVVxe4pnBmJ8"
Message-ID: <2bd8cb26-45e6-40de-946e-fec2f6d989d7@intel.com>
Date: Mon, 28 Oct 2024 15:29:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 0/6] Introduce xe_sriov_flr test
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, <michal.winiarski@intel.com>,
 <narasimha.c.v@intel.com>, <piotr.piorkowski@intel.com>,
 <satyanarayana.k.v.p@intel.com>, <tomasz.lis@intel.com>
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: ZR2P278CA0045.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::18) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 713968b0-2684-477d-e563-08dcf75cee54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aklWUEorQzFoK1dpejFXNVE0TVF2eHFFNnFHWmlNT3NMRHBjeittQkhUWEx2?=
 =?utf-8?B?L3dRTnpYcEZ0VWNSN05RM3RGUWdtek1FT0ZXd2xkb2p0ZXdrKzJFYlBJeGUr?=
 =?utf-8?B?N1RTVVgrRHNwZFdLRExlb0FrSi9nSFMyL2U3aVpCTHZSbW1LQjdDYm5BWTlE?=
 =?utf-8?B?TmFtRjBGRFZKZnRqUnhLajBVamlxL1pBUnZXVUNCRHozV0x0L01zVVdFQ3Zx?=
 =?utf-8?B?S1JjeFFSVmpnV0hqLzdmdlpDdmlEay8raWdYQ2FzN0loTGVzemJ0dEkyUTdJ?=
 =?utf-8?B?UzV2WDMvaUQyeTBOaEJDTHV5blcrRVRHZXArRE1sUGFqc2NDM2M4eXZLU016?=
 =?utf-8?B?NE5mdy9WYzZHdFlMZVB3cithaFdCN2xieDVoc1h6bHZPL1lHRGdpRVlOUy8x?=
 =?utf-8?B?blNaNjRBWTNVV01OeHk0SGtod2pYS2JtSWhnZmJVYyt3alRYS292Q09ET1pj?=
 =?utf-8?B?YUdKUUdUcUFtT1pXb2pzT3dvbWM2ZlB4WXRENW8yZ011V1J3UnRTOXJSemc1?=
 =?utf-8?B?Y2krb0F1UFJxblpySmorcjdTS04yUGd1eTNDQWpTMlRxYjV6SmRDbjJ2R3ov?=
 =?utf-8?B?aEsrckgybmRzWjl1TC9nNnR2UVRMWDlBUVdzUkc0N0phNmNaU3RMYkFBcGQ2?=
 =?utf-8?B?VlRBMldINU9CbWs4SU9sTXVvbmhpa0pjeHJqRmhkMFJtQWNSVytrZi94MUVO?=
 =?utf-8?B?ZmJFWXBycTBQV3lXQlB4ekhWZ0x4d2UzYTRVQnVVWnFBVCtlRi9WK2RlZDV5?=
 =?utf-8?B?VGxHcEI2RGVEeWlVd3FIWXAzVnFaVkR6TmVnQkM0MWZ2NGdueWc4Q3JPVEJk?=
 =?utf-8?B?NVB3U2V5djNjT2pmR05ML1NLRFNvbEVzaXdvUFZLMDZWTktIQXBYZ0Y0cStS?=
 =?utf-8?B?QUpwQlhhL3VDSUV5Vks2NC9jYmpla1Y1TWhFeE51Z2RiaUY1cS91a1V4dTMv?=
 =?utf-8?B?Uml1d3Q0YTlhaks5N0ZSdTI1endBY3IyVGtNcXYxOE9KbmNQam5EdmxtV2pq?=
 =?utf-8?B?ZDhpMTN0SnZxdmV4VDFjRCsxMEZDN3NleFQraS9kVEl3T2tJVDJDS1hKREdY?=
 =?utf-8?B?V2RpSkpCTCt5VnFBcGJCeC9MUEJIbTdhOG1QOWdkY0taeGVIcmxBTDRXbG5t?=
 =?utf-8?B?MzNpQ0JEZnNnRU45cVF6NkhuK1lOVmlKSGErN3RucDdJZHpGdXJkbzVqNDBM?=
 =?utf-8?B?c2QxOXlXTVhiQUU3aG55Qkt4emxMdkF1TFFsUHJhdG5YMDNDc0MxWlk3RFBv?=
 =?utf-8?B?K2lyOXFTWHJGSUFNU0xpMlo3Q3RPRGJsajV2Tm91eVNrOFdmVExSbFg1a0Fi?=
 =?utf-8?B?bDFyV0p6K2lReWplMXVXdXFRNE5ZRkxYNG4vT0ZMNFc4OFpDNkpabHgrSXZi?=
 =?utf-8?B?UUppZFFuYmd5WGE5ZnBaNjJERmQ5RldVZDN5MWM3dkdDNTNUTjZ6YmJiMnZo?=
 =?utf-8?B?bzBXeFdnaUl4QnJsMkVRNkVOb3pmK3lObDg0eW1qc3JGeHBGVG9kYTJNOHJr?=
 =?utf-8?B?NG1zK0MvTjkyL3BmVWVjbHlGcThDcXlrOW5NaUEyK3hnVHZWcmdEbU1zdCt2?=
 =?utf-8?B?UUo3Tm04Vi9abFlsdFJ0WVRFeEZYS2ZUdmVibXUreDl0SVJvSG9kVmtQMDJk?=
 =?utf-8?B?VkpWcFlwanU5UXpWT3dKV2VBMFB4Y1drcjFWYUo1N0h1NFo5eU54bWhvc0Zi?=
 =?utf-8?B?US8rUUdLcG9TNDN6cjRlYjVDOUxHbVpaUVNHUFl3RHJwL2hVZDVOcGlBREpD?=
 =?utf-8?Q?4ZZgUUwJ3/ZMOlYH6AwVV3eY5LngPufGybz1/6s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHUybGRuVUdJdURwTnp6Qmg1enlMakp0SDlQbkVVM3F5R1VpMXNxc2lhdXhZ?=
 =?utf-8?B?MVd1ZjJsRUlES1c1akZWbXBKZXhqUUxWdlREay9KdThyZDZWL2xrYnplekJz?=
 =?utf-8?B?ckdiY21SRlhaVG41Nk1idGtzK0g5V2VXLzdUaU95WjFKSFpSS1d4Vm5ZaURl?=
 =?utf-8?B?Z3BydW1JaURnbVljSkljRVNtVkRhUHNuN0twYVQwNm94em1DeUxtaG0xMExY?=
 =?utf-8?B?OElyN0RqTzRkNWJHNWJWWEZCeXdiWDBLUHZrRGhGNXFLUFRIUERRcmpRRU1R?=
 =?utf-8?B?QnlkSXpzT3hzNGwwYWhOK0FyMFlqU0tzYU1rWXJNVU92TzFLaVJjTkNRQTZC?=
 =?utf-8?B?SEhyZnhPMzJKQ2E2YjFrWm91aTVtMStseEdCMldDc1JMR1NTTGp6blBUTGxa?=
 =?utf-8?B?TERhTFpTbDRaUVpDMjF2U2cycUlpN2hxdVBQNittRFRUMkdjVmhScERUbFpt?=
 =?utf-8?B?aEpWOVVCdGh1SlNaOFU3NUoraWs3TzdCVzFlOFEydUVrN25rUFl1RWFYZWVT?=
 =?utf-8?B?TUxtYmhxdFB6ZXlZd0RuK1doZDdxN0hiVWhxQ0M4amU5VUFxNnNvZ2JzZVNt?=
 =?utf-8?B?R0JHOXJhWWNFMlphOXRENGx5ZDlnNTBOeHczSXk4YVFQb25CVy8rVXc3ODA2?=
 =?utf-8?B?cklYdEJhTkoxQzV3YSt1bEllbUF4bGJWcjZvdGRWbzJhRGk5cVVBRklxTkNy?=
 =?utf-8?B?SVZhRFFIcWx4cUx0SkNKU2tMUUJDZmd4VXJkNGNGSERNSmlMdjB5Y0RCSzla?=
 =?utf-8?B?dUdldVdPYmt2QUhzMnliSFBVZmNGRER6TGtYWk1QbUN4YjdxU2MrTWNpQVhD?=
 =?utf-8?B?dzFETUhxRkRYcHdYK2RlUFQrbjBEeWNYaDFtcUsySlBEaTl2Uyt0ZDF3OU40?=
 =?utf-8?B?aTRDK3oxRjlHcWhvcnNvempxQTAyVTNyQWYraVQxN3B3aERFeHFPUUs1bnRz?=
 =?utf-8?B?aHoxNkE3TStvT0orK0NOS0piZkcwVDJSanFxYjhwSVFFWXNBRWJoalhFenlo?=
 =?utf-8?B?NmlLVm9ZMWUvMUo4bTFaVTdnRTJURmxuKzZSTWlrdm5OZkZlZUpGT0Y2TzVH?=
 =?utf-8?B?UVpBYkdvdURlQTA0VUFFQ21pdnh6ODFXWklYZGZKeVpsWkt5b3I1bXN6bHZu?=
 =?utf-8?B?Rk94SWtubkNaSSsvU05HdThNMjdORXE3QjlHVU9oTmM1S1JnVEdjclFQZko0?=
 =?utf-8?B?WVVmb2tPVm1FM0o2TlVoSDd1eTQ2L0hBaUcyenVHNnc3T1BZWjZoMWN4ZnBj?=
 =?utf-8?B?aC9RNnlOekxRVEh5Z0xWZnVUd3BXREh4bEltY2tuN0IrQkdUTVlYNE9JckUv?=
 =?utf-8?B?M2UrWExlbDFjd2dERmp2aEczbVY2NzF3dGUvL3RrTEJ4dC9kZ0V1cHVmSHhT?=
 =?utf-8?B?WnVFU2p6VDBrWDFleGtvRjQ5cmQrYytXakVuOVh2cmIzc09UOW5ISm8rNXVV?=
 =?utf-8?B?a0tMZEZLVXV2MTJFM3loU0xibVVJQ0RWc3ZscmdXVTZBc3F4RXNWOVp4MDI1?=
 =?utf-8?B?a2w3VCsrSXE5b04rU2xLQXNpSEluNXFPMnFRdHpZR3ZhbktsTlIyTC96em5I?=
 =?utf-8?B?TzdsVkV1a3FreXZFWE91dEN6SDlRT24veXdocUQ5eGRqa0k1ZnR0LzhiUUNN?=
 =?utf-8?B?VWw5c2tLLzRYUjBKYlBlWXFlL28rNGtLK1JNYmE4VHVldkMyMmdmYXMwYzRD?=
 =?utf-8?B?N0tPUFBDVEtSS1RQVVNwazlpSUJqUUlrWkprOXdObzRGMlBpWjBlM1kxc3Fq?=
 =?utf-8?B?NW1qczIwblVYKzJjUXBQYTBRRkFlamhtMnQwMUFtT0hpZDNPSWxBTzhjK2pm?=
 =?utf-8?B?KzFyR0wrZ0tRQ2tYL2JvWG51TEcrME1VaFE3Q3BIOU5lK1h2SldrL3EzNDJV?=
 =?utf-8?B?dmxveTBDVHJvUE5zQjA5MFhjTDBhMUpZS21Va3hwV3ExWis0dTlwcHJ4cmlr?=
 =?utf-8?B?bmtwdUtXTUp5eVVKTlRoT0R4d1lNcVFYanhYRFBnWlhiS2gxaEhPMDgyb3pl?=
 =?utf-8?B?K0JxUWYvOG1iN1ZpVjkwa1A5bVZTQWN4SXhYNmxZazRjc3BkT040VmV2OXky?=
 =?utf-8?B?dTJqQjg2d29CM3RBNG5ocHR0QVV1OEp5Mm9yUnhTdmhTdG5VRVAySG92OU8z?=
 =?utf-8?B?YjNKYW5NVS9ISkNUWmVKUDB4YnRBT0hFM29iTmFzU3Vqell6K3RkZDc3VnZL?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 713968b0-2684-477d-e563-08dcf75cee54
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:29:28.9831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEfqjEykcupX0t2BnNqUPRFktodv1S7b/rK64rmVB0Jve9w3JnSU6ZQkvv0vJNKxX4tMwFK9om3BfxUtqEd+JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
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

--------------T9wvhSPFUfnDqVVxe4pnBmJ8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2024 22:07, Marcin Bernatowicz wrote:
> Introduce VF (Virtual Function) FLR (Function Level Reset) tests to
> validate shared resource cleanup and ensure isolation across VFs (confirm
> that one VF's FLR does not affect another VF's resources). To reduce
> runtime perform a single FLR and verify all subchecks (clear-lmem,
> clear-ggtt, clear-scratch-regs, clear-media-scratch-regs) in one go.
> The proposed skeleton ensures that while one subcheck may stop due
> to failure or a skip condition, other subchecks can continue execution.
>
> The series includes:
>
> lib/igt_sriov_device: Add helper for opening SR-IOV device sysfs
> lib/igt_sriov_device: Add helper for resetting SR-IOV device
>
> tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
> Introduce a skeleton and verify_flr method to orchestrate FLRs across VFs.
>
> tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
> Add GGTT subcheck to verify address resets post-FLR.
>
> tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
> Add LMEM subcheck to validate VF memory clearing post-FLR.
>
> tests/intel/xe_sriov_flr: Implement clear-scratch-regs and
>                            clear-media-scratch-regs subchecks
> Add subchecks to verify clearing of scratch and media scratch registers
> post-FLR.
>
> Example test output:
>
> ATSM:~# xe_sriov_flr
> IGT-Version: 1.29-gf1c71392e (x86_64) (Linux: 6.11.0-rc5-xe+ x86_64)
> Using IGT_SRANDOM=1728461543 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: flr-vf1-clear
> clear-ggtt: SUCCESS
> clear-lmem: SUCCESS
> clear-scratch-regs: SUCCESS
> clear-media-scratch-regs: SKIP : No media GT
> Subtest flr-vf1-clear: SUCCESS (7.506s)
> Starting subtest: flr-each-isolation
> clear-ggtt: SUCCESS
> clear-lmem: SUCCESS
> clear-scratch-regs: SUCCESS
> clear-media-scratch-regs: SKIP : No media GT
> Subtest flr-each-isolation: SUCCESS (11.797s)
>
> v2: Correct subtest run type, use uppercase for GT.
>      Adjust pte_offsets, vf_lmem_size, mmio arrays to align VF index
>      with array index.
>      Add set_skip_reason, set_fail_reason helpers for readability.
>
> Marcin Bernatowicz (6):
>    lib/igt_sriov_device: add helper for opening SR-IOV device sysfs
>    lib/igt_sriov_device: add helper for resetting SR-IOV device
>    tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
>    tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
>    tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
>    tests/intel/xe_sriov_flr: Implement clear-scratch-regs and
>      clear-media-scratch-regs subchecks
>
>   lib/igt_sriov_device.c     |  83 ++++
>   lib/igt_sriov_device.h     |   3 +
>   tests/intel/xe_sriov_flr.c | 936 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   4 files changed, 1023 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_flr.c

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------T9wvhSPFUfnDqVVxe4pnBmJ8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/21/2024 22:07, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241021200737.941384-1-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Introduce VF (Virtual Function) FLR (Function Level Reset) tests to
validate shared resource cleanup and ensure isolation across VFs (confirm
that one VF's FLR does not affect another VF's resources). To reduce
runtime perform a single FLR and verify all subchecks (clear-lmem,
clear-ggtt, clear-scratch-regs, clear-media-scratch-regs) in one go.
The proposed skeleton ensures that while one subcheck may stop due
to failure or a skip condition, other subchecks can continue execution.

The series includes:

lib/igt_sriov_device: Add helper for opening SR-IOV device sysfs
lib/igt_sriov_device: Add helper for resetting SR-IOV device

tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
Introduce a skeleton and verify_flr method to orchestrate FLRs across VFs.

tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
Add GGTT subcheck to verify address resets post-FLR.

tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
Add LMEM subcheck to validate VF memory clearing post-FLR.

tests/intel/xe_sriov_flr: Implement clear-scratch-regs and
                          clear-media-scratch-regs subchecks
Add subchecks to verify clearing of scratch and media scratch registers
post-FLR.

Example test output:

ATSM:~# xe_sriov_flr
IGT-Version: 1.29-gf1c71392e (x86_64) (Linux: 6.11.0-rc5-xe+ x86_64)
Using IGT_SRANDOM=1728461543 for randomisation
Opened device: /dev/dri/card1
Starting subtest: flr-vf1-clear
clear-ggtt: SUCCESS
clear-lmem: SUCCESS
clear-scratch-regs: SUCCESS
clear-media-scratch-regs: SKIP : No media GT
Subtest flr-vf1-clear: SUCCESS (7.506s)
Starting subtest: flr-each-isolation
clear-ggtt: SUCCESS
clear-lmem: SUCCESS
clear-scratch-regs: SUCCESS
clear-media-scratch-regs: SKIP : No media GT
Subtest flr-each-isolation: SUCCESS (11.797s)

v2: Correct subtest run type, use uppercase for GT.
    Adjust pte_offsets, vf_lmem_size, mmio arrays to align VF index
    with array index.
    Add set_skip_reason, set_fail_reason helpers for readability.

Marcin Bernatowicz (6):
  lib/igt_sriov_device: add helper for opening SR-IOV device sysfs
  lib/igt_sriov_device: add helper for resetting SR-IOV device
  tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
  tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
  tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
  tests/intel/xe_sriov_flr: Implement clear-scratch-regs and
    clear-media-scratch-regs subchecks

 lib/igt_sriov_device.c     |  83 ++++
 lib/igt_sriov_device.h     |   3 +
 tests/intel/xe_sriov_flr.c | 936 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 4 files changed, 1023 insertions(+)
 create mode 100644 tests/intel/xe_sriov_flr.c
</pre>
    </blockquote>
    <br>
    LGTM,<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------T9wvhSPFUfnDqVVxe4pnBmJ8--
