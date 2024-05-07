Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A73DC25B4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 01:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D6C10EB0B;
	Tue,  7 May 2024 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8jRpQ+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7486A10EB0B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715044285; x=1746580285;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aTfow3yrsG5DWQJgQxfSPBnPKtPGqyNJjxkrzDR6T3I=;
 b=i8jRpQ+QjjVFnjCLSxDt59NYhf1BbLlnaJGPf7fSN3yhD0AGdN9qHS/P
 13DKRloOKI8PIN/81eihmqk3n7MEfBlENq4eVTh7yzRDn7SzFLl8JEVXe
 i/eVC0TfHH5OAQaxaZ2Uh7wH70eareo/esC6Gow+WmBuIyErHClztwypV
 MBr/6wtcQMk5bpdDXo98xQtkUH389NfIochQNLqgOSv/zSMk27fLg33Yb
 7h3HXV6jv8t1czo9wKKPGLz2UA3c7gFVL3U1nGb/8q7SJ0VmPnldz/h60
 J84Yhlqq3HLUSkoKPfKFCUNgZgkI9u9AjbgMDvKklggdj0Yy6Ye/jRf+Z g==;
X-CSE-ConnectionGUID: 9WYRoyuCSL+4IqlT+Mah+Q==
X-CSE-MsgGUID: AMUYSpoLSui2h4Ww5FWBpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10939803"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10939803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 18:11:24 -0700
X-CSE-ConnectionGUID: UfI1rtZVRf+0V35gEtQM6Q==
X-CSE-MsgGUID: 2rb3iJm0RK2FiepxzW9nQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="33171208"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 18:11:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 18:11:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 18:11:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 18:11:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 18:11:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnoHniEQBVHSVZnFLFMAQLOUlxQV/IzK5sxSrN3sEo/S/HjkPiYPJ7ahyYkaCVSJWDDXnAAb7NCx4r1Aui/KwkIjXHX0jPPOJyjA37BbZjA/OZufVuAR0L4RRZHIw8cwZJMRNnp1+DqrLt3dtEWFDah9lNhG8kxsApT0qzx23fwV9ioxwCIeidCqz7NFNWwKLFWvtxQE1tO9bBsGkpx1uBkyyVKjpeM7k/oD74Fsy44Yg/w0B2eGzddeWL1Tql25lh2xg+MCev7Avpi8qEmVY6M5A3TlUe5l/BZkUe3sIYCrDDM7vR0Boox6K/KcKF0aEGlrzXzCaeNvvu9td2+MJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozHwm0tevk5jdhy0kHGA9pyBpzA7bX7zpyj3UOKAApw=;
 b=O4n5n4e46sJ4dj5tMR/qcjV1Odvjzq882opRnY/FHoM+YcnSM8aZbYdT5uNClTyu7bCrRrAkaosUByM5uR7TqIqsiJ6K+BrDVaPJhC/Af5W0B/OEmgDCRisO/O0WmkB79vbBsprQlgqqGYgpCupTzOSGVRiJ6Sj+KW9CHZC/Z7GLLLjoCvhxLYLP1r3Ps1pfzXTJxF3LGzPS3IB3xbMWu0i2ZrbUbLAo+8tladUafNjZ7b94+JxG0Eseg4NX8GOzlW+ByJnQywjDEPXsWxGa9aQbkraV8Pa8ftysrGKRByqaanjM0Rj6YaYccWLPTXxtci3PnrMw4d2FuFzzyIjIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Tue, 7 May
 2024 01:11:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 01:11:14 +0000
Date: Mon, 6 May 2024 18:11:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 06/13] lib/igt_drm_fdinfo: Parse drm-cycles
Message-ID: <Zjl/q59JJy8jgoxm@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:303:b6::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 288102f2-824d-48e8-c576-08dc6e32975c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWxTa3JWS0kzenVmTGFPbmxGa1hKUm1Wc0dibktibmhWZ3oyR1dYaUNWSm5V?=
 =?utf-8?B?U09BbFpyRWpQK2NkOFVuZ211YS9YeVA1S2lyNVpJYmFpT3pGWUpPWDhXeGlO?=
 =?utf-8?B?TFNiMlhrWWk4NVZMbGRFZkkzQzhzU0dSRzJVK3JtOTlPc0RLZnRQZGVBVmVF?=
 =?utf-8?B?QXNET2FFTEcrNVI3MklmUnI0dDMwaEduaWFiWno0YndzUHdieFdGekthVWRM?=
 =?utf-8?B?U3czdkJ2ZXdkYzhUMlRDVDdVMDRzMFBjQktOM3dsTWhXNW9ZREQ2RVQ1bS9N?=
 =?utf-8?B?eHNhVHFTdm9hS2pJb2o5MXczR3pURlRHVXN6UFFBdFNhcHBwVEFBS1Z4cERz?=
 =?utf-8?B?Q1pFUUd1SHZzWHhjc3cxbjM3ZlNXR21YOStSamJuczExR2paaFBDVDdZY05V?=
 =?utf-8?B?WmtXbXBCcGVENXB5d0Zzb2ZvNndMTms5dUtFclAvUGJHa0Z2akFpd2VYRlh4?=
 =?utf-8?B?eGM4L0tJTkJORDF6LzNKVE45Tjlhc1RpeDQyVjgxM3U1M3gwaUNNc3JxZW5P?=
 =?utf-8?B?SlByY0pTUFpWeklWQXdOSjdHaWJ1UmRIWWY5azJkVzE0ejBSbUZOL3pOTVVM?=
 =?utf-8?B?VHJQUFVyZG5na2tORHhyeHRWYVprK1hrem01Z0FqS3A2TVd1WHhqTmNkRE41?=
 =?utf-8?B?SC8rdDVHWjZCSGpRRFlYT052aDArM2V6MmFJeWxSME1STXRmTXZseHhtSi9y?=
 =?utf-8?B?V0syZEZUMi9CUXRWSng4VnY3QXVjcUhCZUJlbU9wWjN2MEdKOHBSTnVIZnJq?=
 =?utf-8?B?N2lHa1IxcU1Vb0lxblJOTVp1MnNGUThNb1BxYUowT1JoalEyZW9rcVAvREtj?=
 =?utf-8?B?bHlGczZQWVpDU1J4YWUxUUZpMHA5RFlSVSt4VG9MeXhQS2Jld3Q4Q29JQXBn?=
 =?utf-8?B?aDN0NElZK3dPVXY0SWcvemkvemhTSEE1elUyTmRNKzRGN3ZqYU1BK25lZE1L?=
 =?utf-8?B?c2w4U1dnb3hpMys5eEZobTlIYVdGZjVTTFpYMitXYWxMU28zWkZkRFFYQWRO?=
 =?utf-8?B?V1NpYW5SOFE1K3ByMWJodU53di9MbzFWbG8zSTNWT3Q4blI3eXVFVi9CM2tp?=
 =?utf-8?B?bDdZTE5Rbi9saEJzR0gwbllpZUlVQVBOanpOVnFMeldQMEZEKyszeUZMbkhG?=
 =?utf-8?B?clZabkV4V3BNY2l1dGt3V0M1N0FsMk9qbXp1QkRobHRYejhOblFaMkFkUHJj?=
 =?utf-8?B?WmtxcmZnU0JFZXFHWEI3SEpUTS9mdGNWRlM0dWw0QXRRVFloYnByQUlxL21G?=
 =?utf-8?B?MUpGdGZaYyttR1RRendiSlVHcEIxWC9Fb09qbGhxL3FSdlRTTkNQdGdTem5p?=
 =?utf-8?B?MnhWVjdzRGlDaGdYNzVjZkp4Q1BYL2w0RTZmZlVUMWZmajJ3NlphZ1VZdEd4?=
 =?utf-8?B?a09ZMFpFZVA1QU1qa1c0dmNFMy9SNThiNi8yaEJueXo1TUhtd3ZHNjN3bURh?=
 =?utf-8?B?cWdKRU5CTDJEU0dkenNRRU4zTjNwbHBNNHJFOFlsdnVBd28zVGNhRlZnMGNC?=
 =?utf-8?B?OEJxT3Q3V2hhKzBFLzhJM1ViSjk5bGJvWnNXbUlXQTY4UFQyL0NQd2xzZ3JB?=
 =?utf-8?B?QjVQUHhDOUorOXpNY2tkSWRjd1ZPSDFrS3RWdkdHblBORU5wbmt1d1o2cWNB?=
 =?utf-8?B?WFpxMUFOamlhalJ4anNhSFd0Q1F4WCtBSVcvZ0dRVWtnZUVvU2tLUnYxVVpQ?=
 =?utf-8?B?VDQ3QjRCcTd5MlpQaVl3OXR4am8yZGZwSTJRN21jWE01RUpocWhCcE1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JpWGdwMzZIYU9MOElXb25OUFhWYnhpYXB0ZGF5VDBSNnA0NWhsc1MzYmlu?=
 =?utf-8?B?UWZvd1k4U0YrcjBVMUo0SkNPUXFRVmpLT2JLZnB5VTkvYm0xREx5dHBZTFAz?=
 =?utf-8?B?THRGNVJMbnBxRzZtNDBEL2ZoNmNJdFFRWHk3d05RaEwybE84dHcycVpDcVRC?=
 =?utf-8?B?eklvZmsvVnRzSzFsUFBKUDJmcGRPZ01vVitQcWpTRHNPbWdQSVY2MVh5c2RY?=
 =?utf-8?B?TEVXNG03NHNENXNTSmUya1N3WmdlcWlCNDUwUzR4SVY0YjY4YnRsL29yWHFo?=
 =?utf-8?B?bWN1SzlqVTZZWjNHY1M4S1BGYUhINFFLVHh5RHdzVHlRdUZlNlBlMG43QXBr?=
 =?utf-8?B?WkxOc1VuUE9jekZWOXF5UjU1ekFDWTluQlN3V3FDQ3pvTTAzRDZWL0hYOGVI?=
 =?utf-8?B?M3dnSjFlazFrcnp6ajQ0dEZJaUpXRVlZUHVoZEdjSE1zNUIwTXlXRkNYaWdl?=
 =?utf-8?B?WGd5WUsrcmc1Qm9wcHI3N3IvZExkalNqNXZLQjJNVVRsOFJvSXlGTnJ2NE9Z?=
 =?utf-8?B?d2U3b0FEa0h0b3U2TDAwQ0pLODg5amxJWGpDeGRnN3FqU2VhQWQ5dEVrWEFN?=
 =?utf-8?B?TVkwL1RVU09jWW9tbGIrKzR5T08vd2pHd3FuZmQ2QXdPcis3NHdYeUtHdE1s?=
 =?utf-8?B?Q0dsL0ZkUytPaVdta3NldFVNakgyaVlYYzVHYkxWaFNERFJNeU1kSTN1Uklp?=
 =?utf-8?B?L2tCbWYyV2FuWVc0Sm4zOGtyOTZ6L1FHL1JOR1ZxV3hLZzRydDlVQVo1SUIz?=
 =?utf-8?B?YVFjdE1nbXorcVBkY0RHajFodzhyZi9DaUJMbGw0MURqQ1pwVzNMYWt5eHI1?=
 =?utf-8?B?enIvYlpTU2oweG9CWHZSVUNPb3hpMW54U01Yc3F6bHdqQmhlblpGM3NEWGox?=
 =?utf-8?B?Zjk2VGNMckg2dWNuWVVGeHB6amVXK29yMHZId3hFTXBab2JEazFEL1FzdFJ3?=
 =?utf-8?B?UDdBdHZrUGxvUmxJK2FKQXdFS3NITTBlaE41NlFXQ2tscWhNSkNwMlU3ZmN0?=
 =?utf-8?B?akpoY0pCWEVvdEh6bmMvampvMzZyeEdJdzdRMWFoMjdRa3ovbGdNY01nYlJJ?=
 =?utf-8?B?MTZjTnJPb20wSnZRbVZGVGo0OFEwODljZEFFOE1pakZtUEwyaldleFB3Z2ND?=
 =?utf-8?B?VGYrYzNReFVwKzZmcUpjbi9VY0RoeWtmOHhPelN0VHRaS3A0RDJPclMyQk95?=
 =?utf-8?B?dzJ5eGoyYlR5aWRQYlMyMjRjVnpmRERGeGV3M0xUcitJS3BpN2J2MFpobStj?=
 =?utf-8?B?cXRDZW5FaCt0OTVEcnVMRU5FMGlhZjlXNmx2R3F6RnR1RkhWYVBjUjlrTHVX?=
 =?utf-8?B?cjB6UDFRSi81VTIyMTI1TUpDOWc0QkRqWXhwTWtubkZkZmpmN1dSZTBYdW1y?=
 =?utf-8?B?YWw5ZGZUTUp5UW9TVEVkbHB1UFV5Vk11U3c5cEgwendpdjBaRm12c05DNnVm?=
 =?utf-8?B?U2lSNnhud1YxYkx3cThpNmNEVDNuRUhDR3ZISlFUWVhoRmx3U1NKcDhhYkk5?=
 =?utf-8?B?T3QyNy9Rc3B0NmlPa3l4T041TXhCckZrK2VsbDdPSFFDYUE0K0cyOHI2L0hX?=
 =?utf-8?B?QjJ1S1R5R0U3dlNPcEZjaFFIVGNFNGg1UkxNYmlTSzdGOENzK1FRM1RhbWIz?=
 =?utf-8?B?T0F4d3llSXdIR3pSbFR0Tm1xZDdnSFZhRElRcTZ5aWVuY1RuS3VkM3JROEVt?=
 =?utf-8?B?dWcxdy9EOE9ZTUJsZjRxRGFCS3JkY0xVcHhrMkZHZFppbVpNZTZwWXZZUHJo?=
 =?utf-8?B?ZE02aks5V2s4TjRXLzJtS1BFWDgyb1AvTGY5bWMra3F5M3NnR1F0MzNlQ3di?=
 =?utf-8?B?QnpvcGZ3b05HYWVnUzEyOWtlU2FDVTE3TjRzZkptMDZmZ2t3NkZIV2phRURi?=
 =?utf-8?B?NXR4a3RTV0lXc0ZPODZXMnNDQlZ3TE40YlFrR1NQejdKWkl2b1kzdEhtbE9z?=
 =?utf-8?B?WTRRUmFSeTVmR21LWGlXNE1wWGRGV05XR3k3ZzdVYzBiZGpPZ0pvSlpvSjY3?=
 =?utf-8?B?MUVwNWorcHZiN2hQN1BzY1YvQlpjQTA3UnlKZzN5THJHL1RLSG8vd1l1eFdq?=
 =?utf-8?B?RXh2QXY3SFNqWWVxeTFtMTZSYnl6UzhsYjlNVkZqb3VQTFJaY1UzWUZxSXo2?=
 =?utf-8?B?Ti9idFB5dnRpVVFaelVyRGluOGhMVG0wakNscGtvc2ZLMHplMDdKNEwyQXhB?=
 =?utf-8?Q?9/ilCVT6xW7qNY1Sux5bZK4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 288102f2-824d-48e8-c576-08dc6e32975c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 01:11:14.8302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1Ax4Vj99rManQKc4/1Iz9jJQuY1h+n62EEon0ATIXugKRtCaiPZ1LItsYxzQap2Q/XvBsOoaEDmfjmuzqvJhMEGmWIKXjQzO5wzSltUql0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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

On Fri, May 03, 2024 at 11:46:36PM -0700, Lucas De Marchi wrote:
>Read drm-cycles from fdinfo and save it for later use. Like with the mem
>regions, allow the number of engines to be updated regardless if
>drm-engine-* or drm-cycles-* shows up first.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 29 +++++++++++++++++++++--------
> lib/igt_drm_fdinfo.h |  4 ++++
> 2 files changed, 25 insertions(+), 8 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 2d8ad8b81..f0a30677c 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -190,6 +190,21 @@ out:
> 		}							\
> 	} while (0)
>
>+#define UPDATE_ENGINE(idx, engine, val)					\
>+	do {								\
>+		if (idx >= 0) {						\
>+			info->engine[idx] = val;			\
>+			if (!info->capacity[idx])			\
>+					info->capacity[idx] = 1;	\

nit^: extra tab

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
