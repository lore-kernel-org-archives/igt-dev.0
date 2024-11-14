Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20104D68B35
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65D10E81E;
	Thu, 14 Nov 2024 16:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJ0S5nSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5AA10E81E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731600714; x=1763136714;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d8xFXUlQtSnE6ZOk7q9Iml9cL3vkK431Cg/EHcp6Tf4=;
 b=WJ0S5nSvbq0tIJcq9Yhni0n7vvfy/qH1/3Ka2UDSh3+Tsyb+XUMT4snE
 /72OmvzwWmnPKa2oVxKPU0CAI2D9mbPWJy+Snc6GNTSih72foOv6PbXwX
 daVkNllBnGZA5GjWbuUFPQjIWg1nBNjYgU7apX5gcHDfrqr/qQh9Gu3/P
 Uqlmx4ArowMVEmaz0ZjxPCIMH3I1ZB8qwDaQnPlMQ9FokAYeayq+rjDYb
 ySseXbYNwhD+0rIf4V3F6TSw/rQbBz12/gkF13mcQmlKcTPXF/kLH4sv0
 SZVrhRDAyq+XziC8po1ru3uy2GReBoxp0luoBdC5Zp+eY27yqJ2FB7GYZ A==;
X-CSE-ConnectionGUID: feDALYuiTOKidFKQbP5Gvg==
X-CSE-MsgGUID: 8pOAmX4wQQGSuEoisAp7pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31661591"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31661591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:11:51 -0800
X-CSE-ConnectionGUID: uEDiSBM4RUeNfkblqMmDQA==
X-CSE-MsgGUID: EdljnVEJRL6L9oM4B1Vveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="125773774"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:11:51 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:11:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:11:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY87awHdU0QFnl43IfE6Sa43dt0+ffYpBy8KYd9dC+N+7nRse6I1zLCTvcN6SKtYCM1qACVvIqCWt/opx+xV1jzSu/E7p7UsepeZx4fA1mXNVMoZ/QG7jr1cAMXBDCgM9WXk9cpbk0LMZGX4Gmkb58Ue4w13IEGULGmMD/uf+ed3ty/cuLTP5w+CHXJZ1fRP5kHk7dgxiLF0u6FAzvkO+n7CJdbO7k6wca4iD5QsAlOQE/Og1iHHLGoJUP6QnFduXx+7z7W2cbtBxfgUywLvaxSPNEzutr+3g4G6A0pvDo1yq/XACNDclAP5oTvzzaffrQiJ31tm7KuWVCTthYGDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oobt5KjYAIdyDNQllk87krtKXpyKQjMUCD9Besy3LV0=;
 b=cgDobB4+NxfqsGLhZHekeZvvEfE+8o4HG4l9tncl/sxusmCbkgQO+fwGghls7E+dkEEzdGzumGjQWE8gJeIT38EFl8b3HsaeVZ1VIQuIv7jqXEmevbZ349Wx2IW0SIJZgXx+32E3dtyyM9hYx9r046Hymm4qYnBhqU+rsZipSRfINVMr6UyLCVmTDXUYmUWvNXoJ8juiPpZoPLxGpkbQwdWoPqWcZqkg1UFZG1w2JuMVm4DnOHpZhD9jLLElNzsdG8y6BjNG4sV0vJTh13dVJjvTt9k1hMxN5a8ycGCteWPZ6YdHyQqgDM5pjL7I4viXYwAAbEsGHkQIPRLraZGJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 16:11:46 +0000
Received: from MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704]) by MW4PR11MB6619.namprd11.prod.outlook.com
 ([fe80::55f0:ee1a:cbd4:a704%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 16:11:45 +0000
Message-ID: <8e6146b8-9ed3-4aa0-8df8-9ee8bd7757ff@intel.com>
Date: Thu, 14 Nov 2024 17:11:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] lib/gpgpu_shader: simplify load/store shaders
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com>
 <20241114-gpgpu_send_rework-v1-2-e0914e09e7b2@intel.com>
 <20241114112846.nfuseu42jz4wvp53@zkempczy-mobl2>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241114112846.nfuseu42jz4wvp53@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::19) To MW4PR11MB6619.namprd11.prod.outlook.com
 (2603:10b6:303:1eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6619:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 13681035-8aa7-4e74-19af-08dd04c70917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjlzQ0dvZ3Q2Rk9RVWdhVDZrTHVHOEtOM3YyaHBWRTc2dVd0SllKbENZMFF3?=
 =?utf-8?B?cnE0UXdBTHBYSmhDWm5KMXQraGh6QStsdjgwZldzWTlGRlgzWEM1YyttNU1D?=
 =?utf-8?B?d0wweUtvek9zd1FoWmxFdFF6c2NCM1dic3ZkZFdXZkNvL0FzRDRUc2NBTVZa?=
 =?utf-8?B?ZWdwcEVOejVwVGNYQi9iTXE3QUNpK1JzaHVJMm5jRTBYS2I5dnpSa2hyT0Zj?=
 =?utf-8?B?dmJKWDdhSWMyOE5Id0RDYktiajNRaG1hRmhKWW4rMmh2a2w1a1pYVXNyNTNq?=
 =?utf-8?B?RkRYVktJWmVaaG9MM1FlY3ZUZ0hEaWhTVmpxd3c1NGo4ZUhVYXNPcGNyU1Vs?=
 =?utf-8?B?WDBRSGhmKzB5Z3NEalNGZWYyaUhPZzM4TTNzdEEvai8zaUpoKzBVWnZJdklE?=
 =?utf-8?B?SFFCNWlUZE1BbmhvRlRHcVlxajlYb3RhbXN3NGJwL2tMZUJnZnMyTm9scXZo?=
 =?utf-8?B?L2J6TEkrY0MwU2tqbjNFRGh4YThvdTFEM2NOTWxOVVlwSWlKR3plbW5LeG5E?=
 =?utf-8?B?TEo5ajNaL1lSekxpeUZUR0M2MnJzZnVlWWtVUzIxSDR3VHlSQnhGY0hhb1Rs?=
 =?utf-8?B?cWhyQ0tnZDlpYjdKR3doRW5vSjJrenNTYk5ML1FyTEV1RGVGR2xKenpVZHVF?=
 =?utf-8?B?b3czY2tQcUQxMDhuZWY2UTF4UC9QLytscUpQMzBTMGlEY3piS1pZS2tIbEtQ?=
 =?utf-8?B?Q1ZJS01yVlRmLzJOZkhBaGJNSUlWQ256TjBlanhGaWRzUmFiOE1pbVJyWjBQ?=
 =?utf-8?B?SlpKUHZHRUxFWmpqbXgxR2sxdkdidFRJNUJVMlNMRUQxR1A2MkxmbHQxOVRU?=
 =?utf-8?B?Ryt2RExVRFJLdUNmV2RJT1Yyd1lhY1hDKzhRTnBiT0VjOVhyaW5QV3VyMWlm?=
 =?utf-8?B?UWFSTVhIQU5rdkVUVmlUdEgxQWE5akVkSUhyTTV1cjZ5aElmTStxMnlRYVRI?=
 =?utf-8?B?b3l6N3Zic0xhTlkraEtSRWpqV08yd0xEMDQ5SkJ6azdVTlFpcDdqUmo0QjE5?=
 =?utf-8?B?amdhWnN0K1ZPS2txSW5LY1BFdXEvTlAvdm1VZXBwNVFuTTVFQlVxRnVtMkp5?=
 =?utf-8?B?MnFxRFpNZ2RBM3NFWUNrWmhVcHBPaFdFZ3BSVlhTN1ovd3BocXlYRUFWSHE0?=
 =?utf-8?B?Tk4vdlZhcDY2S2ZmandRVHpLd1k5aDVqUU00RUhOM3VPMFhVUWRKZVBsVlpM?=
 =?utf-8?B?S3VYd2pybnV4WHZWRDZGU25HQXVEdU5Sckx4T2M0L013OHFkWU44THRqVXh0?=
 =?utf-8?B?QWJWSkFZOGVWSTFjMkVHSXRtUW9IZEVIQWxvYWFVbStSRWtwNkNSbW1zMVJG?=
 =?utf-8?B?NWtEbnpMS1BxYTJraUtyRUlodWxLNFNFTjNsYmNrQjNJVFhHRkEvUHAyaG9B?=
 =?utf-8?B?TWxsMGk0a2NqMi9TdFoxQmo3SU1lK1hsVE9xbFJlWUhVb1YzbGYrOFF1ZjB4?=
 =?utf-8?B?SGdCbzJZWHVIYkszeDNvdTRrcUVwMTBBdlZjbHB1cXVaZC9UZ09HVlFRWUg5?=
 =?utf-8?B?RnBjQlhCWTdIZmpFRVRDK1BSVUJnYzRzY3MwSEROVEZ0WjBNSTJPMFdXRmN6?=
 =?utf-8?B?NzNiaHBBcjFvTU9rQ1BBSGY3MkxYaURQeDVpQlg2djA1VGwzc3h0V05vSWxP?=
 =?utf-8?B?RVczdmFQdDZVbGdsQXFuNk1mbHFCbURidmIwdEhoc2hKckRJWXFyZjAzY1Vv?=
 =?utf-8?B?Mm1PVlI3YVYzN0dhV2dNNDVPREMxdnV4SVZPaXo4MG5rdzRLUk9CZFpNTU5h?=
 =?utf-8?Q?5CNGcx5PEDrvxYRi3E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6619.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjRFWG9RSFhnTThxRW0xajdESzlCNUJYN1ppZCtEc2Vzekc0Vzg3d29JZjNY?=
 =?utf-8?B?T1gxME04dVNuK3lZSjc4Q01Ea2IyT1dobkRWblRpMnRkOEw0UnhQaXpzUHFQ?=
 =?utf-8?B?Y0IwMkxwZ0k2SCt6Nkg0bUJxazZTUDdYeFlUQW9CMDNsVFYvb1BiblphZGpk?=
 =?utf-8?B?QndrdHNnQ0lVQUtkL0JscVdiSE13N3FpMHlzMS85OUg4cVRVVVZBYkU5dytn?=
 =?utf-8?B?bEdsL2hwL1IwQzl3SmVnaGdwMFRPZ2JqRytTc1dvbFIxY21nUG9Pbk5HQ2d0?=
 =?utf-8?B?K3RSbjFJSlQ2WEtCTTF3NGFTYitCdDdZS3lBU2hlK2lkWVZSMXgzWkhnRkhB?=
 =?utf-8?B?VW5VUTlvd0xveldjN2VjTGd1SjV1cjJ4aEJSSnVIWGVOdEMyNXhXRUpzQ0JQ?=
 =?utf-8?B?SVRXK0hSL0ppRDRwUkJXSEZoZ215UE9aY0ZsYTVINWpxWHpYeTlMZXdFL1Ja?=
 =?utf-8?B?RXNsMlNZbDRGenVvZjVBTHNsbldGM2VlZ3gzVG5PS0pCc1JScFhVMlhlM0V2?=
 =?utf-8?B?eUttcHhTV2EzVnd6VTV1eXFvM1A0UTd0RjV0WVlrbnVwSzdYT1pONzkyblFs?=
 =?utf-8?B?YWdZdDZ3YXE0d3BHSVJUYk1pSHBSd291N25JRVFFa3BDV0hGNnlqRittMFZy?=
 =?utf-8?B?em5JS3J4M0l6bXNlaEtPeiswVnFxWGNKWk41MlNWam00YzRtV0R5N2tPbEor?=
 =?utf-8?B?VGhsTmFwYlJ5OGxqd2JBN1hqbTZXU2g3RFFGSmNSSlpaLzJYdWEyd1ozSFla?=
 =?utf-8?B?dDNiSjlEZXhjRkt1YVVBa0JXNHVKdTNPTHo5YjVJVDgyMGlMRkZlbzFRbDNn?=
 =?utf-8?B?RnRHYmtnNUllS3YxL2tNazVLTE1xbDRic1ltK3BJbEY2VWQwUUhPMUUvTzV4?=
 =?utf-8?B?SmcxV0Rtc01ESWphVllXZ0hnamM4K2lDYUJhejRMMG9QN3lWUjFyWEs2b2hr?=
 =?utf-8?B?S0UvdnNmTnVSbXNpM1IySndjaGRBUDRIQjZhZW9vVDc3MHBjZVNSbHRCSFg3?=
 =?utf-8?B?M2trMkJlOVhmVVFKRk9BeWJ5RVFMNitvV2g3UFd0ZU44SHI0M2lnbnVWUUdV?=
 =?utf-8?B?am1iSzZ1UlRIUE5WaXdLR2tBQ3diaytxS0tsb2pLcWVURW82SXhPL2R2ekMx?=
 =?utf-8?B?Z1F6VlRMWG5GeXR2L1hicGt2dFRDWnNSZUhJM002cUIvRGNCb0RHNHVvM1Rm?=
 =?utf-8?B?elM5S01Ca05GcDBkUEhodWFHWHBqK2x6VHlsbTFUQnRUTjFwa1BxdTk4Z0dT?=
 =?utf-8?B?QmpsRU96ZjIvbURXWk9RZDRaZEVqNlR3eW5iWFZWN0Yxd2kweHB1Q0RrQlN3?=
 =?utf-8?B?T3BCcVNBM0Nwc09BOTVyQkJyS3BzNVhQUFA0TCtUTG0zYXpkTXlwdHN6R3Vi?=
 =?utf-8?B?WFg1RFNwejFUa1U1R29oN2hSMG4zQ1liU3FDMkNsSjRyNTdFeXJTQy92QjVF?=
 =?utf-8?B?YXdPZ3NMdmRrWVNaQkk1Q3NablVkbFJnbXpsRzR4QW1OMmNpaWR6QnBzdGhv?=
 =?utf-8?B?OCtWV3ltUWVRWnl5WlB6ZTRUcndCT2h2bWppamF1VnY4UjhDUVZVYjUwSlVP?=
 =?utf-8?B?YlZsNzh6TkUwbFlmTENya21PbVBlT2FtR0lZY09UYXZVeFJHZlRRdTJ0T3Jp?=
 =?utf-8?B?dGJObjI2dHBnemhKbU1WWWwzTzlMdWlYV2wwRi8zYmNMRGRsUlZrdHNES1dT?=
 =?utf-8?B?Yml5MXN1a241dk03ZnVoWlh5Q1lkOVpMZENzN2ZzOU00RUx5b1JxUTRtVXN4?=
 =?utf-8?B?U0ZYbS94NGVldmF5QlBhQ3k5ZzBXdzhJYXBkUG5aVnRGZ3pla3RqTTRWdURk?=
 =?utf-8?B?eHV3eEhYT2JNN2g1WTFoellmSmdPeTBGazhLeW43RkFMS0lTN3NlcVllYXhN?=
 =?utf-8?B?SzFmQ1BjcTN1aVRjdHlhSEduVDdLVy9yRU5pRFJ4ZW9Iejk2M24yUVJDeVBn?=
 =?utf-8?B?ajBGOHVPSU1PaVRRb2xyTm9XQ25BajR5Z2c3YTVSamY5U0ZGQ0daa2M5VDdQ?=
 =?utf-8?B?OFVVTlNGbEpsOWVrbEJtZjE2cDN0SlY5eENINDQ3VFBLNFRYL0lIOXhzZzRR?=
 =?utf-8?B?Zzd5WkZIRVE2ZmxoM3NWWlBqMWpONGcvNVRndk1lN01MTGxOMEZaL1ZqSk1D?=
 =?utf-8?B?VG1sd09aMnJmRzlGTjJRcEpob1NjRUdsTmlZMitHRUljLzRHc3J3bnZxTXc3?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13681035-8aa7-4e74-19af-08dd04c70917
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6619.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:11:45.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F86M9NXBtChEdR6RObssismDgFNje76JABuMm6kJzUoX2/GUdTjFedz1tDDjrd6qw0LHpYHcwM0kmdxYEnMJ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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


W dniu 14.11.2024 o 12:28, Zbigniew Kempczyński pisze:
> On Thu, Nov 14, 2024 at 11:31:39AM +0100, Andrzej Hajda wrote:
>> There is lot of redundancy in shaders code regarding load/store messages.
>> It makes the code barely readable. Simplify it by using macros in iga64
>> assembler.
>> Every load/store operation is split into two phases:
>> 1. Load address/descriptor (from) where data should be stored/loaded.
>> 2. Issue load/store instruction.
>> Shader threads needs two types of memory access:
>> 3. Private area per thread.
>> 4. Area shared per all threads.
>> Different platforms access surface in different ways:
>> 5. Using media block messages.
>> 6. Using untyped 2d block messages.
>> 7. Future platforms will use different messages.
>>
>> All this is simplified to two macros per message in shader:
>> 	load_(shared|thread)_space_addr(dst,y,width)
>> 	(load|store)_space_dw(dst, src)
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 160 +++------------------
>>   lib/iga64_generated_codes.c | 338 ++++++++++++++++++++++----------------------
>>   lib/iga64_macros.h          |  43 ++++++
>>   3 files changed, 230 insertions(+), 311 deletions(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 4e1b8d5e9009..7728f96bf305 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -431,22 +431,8 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>>   
>>   	size = emit_iga64_code(shdr, jump_dw_neq, "					\n\
>>   L0:											\n\
>> -(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
> This comment seems is incorrect,
>
>> -	// Y offset of the block in rows := thread group id Y				\n\
>> -(W)		mov (1|M0)               r30.1<1>:ud    ARG(0):ud			\n\
>> -	// block width [0,63] representing 1 to 64 bytes, we want dword			\n\
>> -(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
>> -	// FFTID := FFTID from R0 header						\n\
>> -(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud  		\n\
>> -(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
>> -#else // Typed 2D Block Store								\n\
> this as well...
>
>> -	// Store X and Y block start (160:191 and 192:223)				\n\
>> -(W)            mov (1|M0)               r30.6<1>:ud    ARG(0):ud			\n\
>> -	// Store X and Y block size (224:231 and 232:239)				\n\
>> -(W)            mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
>> -(W)            send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
>> -#endif											\n\
>> +		load_shared_space_addr(r30, ARG(0):ud, 4)				\n\
> Shouldn't above be named set_shared_space_addr()? Load is ambiguous for
> me in this context.


I have just tried to follow iga64 convention, but set_shared_space_addr 
looks better for me, I will change it then.


>
>> +(W)		load_space_dw(r31, r30)							\n\
> Ok, we're loading dw, not store (wrong comment was removed, great).
>
>>   	// clear the flag register							\n\
>>   (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
>>   (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(1):ud	\n\
>> @@ -511,28 +497,13 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
>>   				       uint32_t y_offset, const uint32_t value[4])
>>   {
>>   	emit_iga64_code(shdr, common_target_write, "				\n\
>> -(W)	mov (16|M0)		r30.0<1>:ud	0x0:ud				\n\
>>   (W)	mov (16|M0)		r31.0<1>:ud	0x0:ud				\n\
>>   (W)	mov (1|M0)		r31.0<1>:ud	ARG(1):ud			\n\
>>   (W)	mov (1|M0)		r31.1<1>:ud	ARG(2):ud			\n\
>>   (W)	mov (1|M0)		r31.2<1>:ud	ARG(3):ud			\n\
>>   (W)	mov (1|M0)		r31.3<1>:ud	ARG(4):ud			\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// Y offset of the block in rows					\n\
>> -(W)	mov (1|M0)		r30.1<1>:ud	ARG(0):ud			\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)		r30.2<1>:ud	0xf:ud				\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)		r30.4<1>:ud	r0.5<0;1,0>:ud			\n\
>> -	// written value							\n\
>> -(W)	send.dc1 (16|M0)	null	r30	src1_null  0x0	0x40A8000	\n\
>> -#else	// Typed 2D Block Store							\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (1|M0)              r30.6<1>:ud     ARG(0):ud			\n\
>> -	// Store X and Y block size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)              r30.7<1>:ud     0xf:ud				\n\
>> -(W)	send.tgm (16|M0)        null    r30     null:0  0x0     0x64000007	\n\
>> -#endif										\n\
>> +	load_shared_space_addr(r30, ARG(0):ud, 16)				\n\
>> +(W)	store_space_dw(r30, r31)						\n\
>>   	", y_offset, value[0], value[1], value[2], value[3]);
>>   }
>>   
>> @@ -565,31 +536,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>>   	emit_iga64_code(shdr, media_block_write_aip, "				\n\
>>   	// Payload								\n\
>>   (W)	mov (1|M0)               r5.0<1>:ud    cr0.2:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
>> -	// Y offset of the block in rows := thread group id Y			\n\
>> -(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    0x3:ud				\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)	send.dc1 (16|M0)         null     r4   src1_null 0       0x40A8000	\n\
>> -#else // Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)					\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x2:ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>> -(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// payload setup							\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    0x3:ud				\n\
>> -(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
>> -#endif										\n\
>> +	load_thread_space_addr(r4, 0, ARG(0):ud, 4)				\n\
>> +(W)	store_space_dw(r4, r5)							\n\
>>   	", y_offset);
>>   }
>>   
>> @@ -618,38 +566,11 @@ void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
>>   void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>>   			       uint32_t y_offset)
>>   {
>> -	emit_iga64_code(shdr, media_block_write, "				\n\
>> -	// Clear message header							\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud				\n\
>> -	// Payload								\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud			\n\
>> -(W)	mov (1|M0)               r5.1<1>:ud    ARG(4):ud			\n\
>> -(W)	mov (1|M0)               r5.2<1>:ud    ARG(5):ud			\n\
>> -(W)	mov (1|M0)               r5.3<1>:ud    ARG(6):ud			\n\
>> -#if GEN_VER < 2000 // Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))	\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// Y offset of the block in rows := thread group id Y			\n\
>> -(W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud	\n\
>> -	// block width [0,63] representing 1 to 64 bytes			\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud			\n\
>> -	// FFTID := FFTID from R0 header					\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)	send.dc1 (16|M0)         null     r4   src1_null 0    0x40A8000		\n\
>> -#else // Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)					\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud	\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud					\n\
>> -(W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud			\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud	\n\
>> -	// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud			\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)			\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud			\n\
>> -(W)	send.tgm (16|M0)         null     r4   null:0    0    0x64000007	\n\
>> -#endif										\n\
>> -	", 2, y_offset, 3, value, value, value, value);
>> +	emit_iga64_code(shdr, media_block_write, "		\n\
>> +(W)	mov (1)		r5.0<1>:ud    ARG(1):ud			\n\
>> +	load_thread_space_addr(r4, 0, ARG(0):ud, 4)		\n\
>> +(W)	store_space_dw(r4, r5)					\n\
>> +	", y_offset, value);
>>   }
>>   
>>   /**
>> @@ -697,41 +618,14 @@ void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
>>   				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>>   {
>>   	emit_iga64_code(shdr, write_on_exception, "					\n\
>> -	// Clear message header								\n\
>> -(W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
>> -	// Payload									\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(4):ud				\n\
>> -#if GEN_VER < 2000 // prepare Media Block Write						\n\
>> -	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
>> -(W)	add (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r4.0<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Y offset of the block in rows := thread group id Y				\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud   ARG(2):ud		\n\
>> -	// block width [0,63] representing 1 to 64 bytes				\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(3):ud				\n\
>> -	// FFTID := FFTID from R0 header						\n\
>> -(W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
>> -#else // prepare Typed 2D Block Store							\n\
>> -	// Load r2.0 with tg id (X + ARG(1)) << ARG(0)					\n\
>> -(W)	add (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r2.0<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(2):ud						\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud    ARG(2):ud		\n\
>> -	// Store X and Y block start (160:191 and 192:223)				\n\
>> -(W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
>> -	// Store X and Y block max_size (224:231 and 232:239)				\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(3):ud				\n\
>> -#endif											\n\
>> +(W)	mov (1|M0)		r5.0<1>:ud	ARG(2):ud				\n\
>> +	load_thread_space_addr(r4, ARG(0), ARG(1):ud, 4)				\n\
>>   	// Check if masked exception is equal to provided value and write conditionally \n\
>> -(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
>> -(W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
>> -(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -(W&f0.0) send.dc1 (16|M0)        null     r4   src1_null 0    0x40A8000			\n\
>> -#else // Typed 2D Block Store								\n\
>> -(W&f0.0) send.tgm (16|M0)        null     r4   null:0    0    0x64000007		\n\
>> -#endif											\n\
>> -	", 2, x_offset, y_offset, 3, value, mask, expected);
>> +(W)     and (1|M0)		r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(3):ud		\n\
>> +(W)     mov (1|M0)		f0.0<1>:ud     0x0:ud					\n\
>> +(W)     cmp (1|M0) (eq)f0.0	null:ud        r3.0<0;1,0>:ud  ARG(4):ud		\n\
>> +(W&f0.0) store_space_dw(r4, r5)								\n\
>> +	", 4 * x_offset, y_offset, value, mask, expected);
>>   }
>>   
>>   /**
>> @@ -778,22 +672,8 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>   	emit_iga64_code(shdr, end_system_routine_step_if_eq, "				\n\
>>   (W)		or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
>>   (W)		and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
>> -(W)		mov (16|M0)              r30.0<1>:ud    0x0:ud				\n\
>> -#if GEN_VER < 2000 // Media Block Write							\n\
>> -		// Y offset of the block in rows := thread group id Y			\n\
>> -(W)		mov (1|M0)               r30.1<1>:ud    ARG(1):ud			\n\
>> -		// block width [0,63] representing 1 to 64 bytes, we want dword		\n\
>> -(W)		mov (1|M0)               r30.2<1>:ud    0x3:ud				\n\
>> -		// FFTID := FFTID from R0 header					\n\
>> -(W)		mov (1|M0)               r30.4<1>:ud    r0.5<0;1,0>:ud			\n\
>> -(W)		send.dc1 (16|M0)         r31     r30      null    0x0	0x2190000	\n\
>> -#else	// Typed 2D Block Store								\n\
>> -		// Store X and Y block start (160:191 and 192:223)			\n\
>> -(W)		mov (1|M0)               r30.6<1>:ud    ARG(1):ud			\n\
>> -		// Store X and Y block size (224:231 and 232:239)			\n\
>> -(W)		mov (1|M0)               r30.7<1>:ud    0x3:ud				\n\
>> -(W)		send.tgm (16|M0)         r31     r30    null:0    0x0    0x62100003	\n\
>> -#endif											\n\
>> +		load_thread_space_addr(r30, 0, ARG(0):ud, 4)				\n\
> Shouldn't this be load_shared_space_addr()?


Yes, it should. Apparently my local tests missed this case. Thanks for 
catching it.

Regards

Andrzej


>
> --
> Zbigniew
>
>> +(W)		load_space_dw(r31, r30)							\n\
>>   		// clear the flag register						\n\
>>   (W)		mov (1|M0)               f0.0<1>:ud    0x0:ud				\n\
>>   (W)		cmp (1|M0)    (ne)f0.0   null<1>:ud     r31.0<0;1,0>:ud   ARG(2):ud	\n\
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index 0bd92b8c4dc9..017adefce400 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   
>>   #include "gpgpu_shader.h"
>>   
>> -#define MD5_SUM_IGA64_ASMS e2d97ef45d5f322200793a0aa76872d7
>> +#define MD5_SUM_IGA64_ASMS fa1b0aa75c3ee1cd13300ad1324737b4
>>   
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -80,71 +80,81 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>> -		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e654220, 0x00000000, 0xc0ded001,
>> +		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x1e558220, 0x02001e54, 0x00000000,
>> +		0x80000040, 0x1e658220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> +		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>> -		0x80100961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e158220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x84000965, 0x80118220, 0x02008010, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040961, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000965, 0x80218220, 0x02008020, 0xc0ded003,
>>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
>> +	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>>   		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>>   		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>> -		0x80040161, 0x1e054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
>> +		0x80030161, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x1e058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x1e058220, 0x02001e04, 0x00000000,
>> +		0x80000040, 0x1e258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded002,
>>   		0x81000165, 0x80218220, 0x02008020, 0xc0ded003,
>> @@ -193,84 +203,83 @@ struct iga64_template const iga64_code_breakpoint_suppress[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_write_on_exception[] = {
>> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x02058220, 0x02000014, 0xc0ded001,
>> -		0x80001969, 0x02058220, 0x02000204, 0xc0ded000,
>> -		0x80000040, 0x02158220, 0x02000064, 0xc0ded002,
>> -		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded003,
>> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0xc0ded000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded001,
>> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x84132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x84032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000014, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04158220, 0x02000064, 0xc0ded002,
>> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded001,
>> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008010, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x84132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x84032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80001969, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000965, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
>> +		0x80001a70, 0x00018220, 0x12000304, 0xc0ded004,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x81004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded004,
>> -		0x80000040, 0x04058220, 0x02000024, 0xc0ded001,
>> -		0x80000169, 0x04058220, 0x02000404, 0xc0ded000,
>> -		0x80000040, 0x04258220, 0x020000c4, 0xc0ded002,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded003,
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0xc0ded000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded001,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80000165, 0x03058220, 0x02008020, 0xc0ded005,
>> +		0x80000165, 0x03058220, 0x02008020, 0xc0ded003,
>>   		0x80000161, 0x30014220, 0x00000000, 0x00000000,
>> -		0x80000270, 0x00018220, 0x12000304, 0xc0ded006,
>> -		0x81049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000270, 0x00018220, 0x12000304, 0xc0ded004,
>> +		0x81009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -324,84 +333,68 @@ struct iga64_template const iga64_code_clear_exception[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_media_block_write[] = {
>> -	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
>> -		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
>> -		0x80041961, 0x04550220, 0x00220205, 0x00000000,
>> -		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
>> -		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
>> +		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> +		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
>> -		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
>> -		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
>> +		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
>> -		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
>> -		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
>> -		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
>> -		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
>> -		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
>> +	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
>> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>> +		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>> +		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -432,65 +425,68 @@ struct iga64_template const iga64_code_write_aip[] = {
>>   };
>>   
>>   struct iga64_template const iga64_code_media_block_write_aip[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>> -		0x80000969, 0x02058220, 0x02000014, 0x00000002,
>> -		0x80000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x02158220, 0x02000214, 0xc0ded000,
>> -		0x80100061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
>> +		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04558220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04558220, 0x02000454, 0x00000000,
>> +		0x80000040, 0x04658220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x04754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80032031, 0x00000000, 0xd00e0494, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1270, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1260, .size = 40, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000014, 0x00000002,
>> -		0x80000061, 0x04150220, 0x00000064, 0x00000000,
>> -		0x80001940, 0x04158220, 0x02000414, 0xc0ded000,
>> +		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000014, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04158220, 0x02000064, 0xc0ded000,
>>   		0x80000061, 0x04254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 1250, .size = 44, .code = (const uint32_t []) {
>> +	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
>>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000969, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80001940, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80001940, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>> -	{ .gen_ver = 0, .size = 40, .code = (const uint32_t []) {
>> +	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
>>   		0x80000161, 0x05050220, 0x00008040, 0x00000000,
>> -		0x80000169, 0x04058220, 0x02000024, 0x00000002,
>> -		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
>> -		0x80000140, 0x04258220, 0x02000424, 0xc0ded000,
>> +		0x80030161, 0x04054220, 0x00000000, 0x00000000,
>> +		0x80000069, 0x04058220, 0x02000024, 0x00000002,
>> +		0x80000140, 0x04058220, 0x02000404, 0x00000000,
>> +		0x80000040, 0x04258220, 0x020000c4, 0xc0ded000,
>>   		0x80000061, 0x04454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0000414, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -499,77 +495,77 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>>   
>>   struct iga64_template const iga64_code_common_target_write[] = {
>>   	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> -		0x80132031, 0x00000000, 0xd00e1e94, 0x04000000,
>> +		0x80032031, 0x00000000, 0xd00e1e94, 0x04000000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f354220, 0x00000000, 0xc0ded004,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80032031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80004031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
>>   		0x80000061, 0x1f454220, 0x00000000, 0xc0ded003,
>>   		0x80000061, 0x1f654220, 0x00000000, 0xc0ded004,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x0000000f,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x00000000, 0xc0001e14, 0x02a00000,
>> +		0x80009031, 0x00000000, 0xc0001e14, 0x02a00000,
>>   		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> @@ -627,56 +623,56 @@ struct iga64_template const iga64_code_clear_r40[] = {
>>   
>>   struct iga64_template const iga64_code_jump_dw_neq[] = {
>>   	{ .gen_ver = 2000, .size = 32, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e754220, 0x00000000, 0x00000003,
>> -		0x80132031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>> +		0x80032031, 0x1f0c0000, 0xd0061e8c, 0x04000000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x84000020, 0x00004000, 0x00000000, 0xffffffa0,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1260, .size = 36, .code = (const uint32_t []) {
>> -		0x80100061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e450220, 0x00000054, 0x00000000,
>> -		0x80132031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80032031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80008070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 1250, .size = 40, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x80044031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80004031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>>   	}},
>>   	{ .gen_ver = 0, .size = 36, .code = (const uint32_t []) {
>> -		0x80040061, 0x1e054220, 0x00000000, 0x00000000,
>> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
>>   		0x80000061, 0x1e850220, 0x000000a4, 0x00000000,
>> -		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>> +		0x80009031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>>   		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
>>   		0x81000120, 0x00004000, 0x00000000, 0xffffff90,
>> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
>> index 03cc726d48c2..0fd5e268d957 100644
>> --- a/lib/iga64_macros.h
>> +++ b/lib/iga64_macros.h
>> @@ -13,4 +13,47 @@
>>   #define src1_null null:0
>>   #endif
>>   
>> +/* GPGPU_R0Payload fields, Bspec: 55396, 56587 */
>> +#define r0_tgidx r0.1<0;1,0>:ud
>> +#define r0_tgidy r0.6<0;1,0>:ud
>> +#define r0_fftid r0.5<0;1,0>:ud
>> +
>> +#define load_shared_media_block_msg_hdr(dst, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> +(W)	mov (1)		dst.1<1>:ud	y		;\
>> +(W)	mov (1)		dst.2<1>:ud	(width - 1):ud	;\
>> +(W)	mov (1)		dst.4<1>:ud	r0_fftid
>> +
>> +#define load_thread_media_block_msg_hdr(dst, x, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +(W)	shl (1)		dst.0<1>:ud	r0_tgidx	0x2:ud	;\
>> +(W)	add (1)		dst.0<1>:ud	dst.0<0;1,0>:ud	x:ud	;\
>> +(W)	add (1)		dst.1<1>:ud	r0_tgidy	y	;\
>> +(W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
>> +(W)	mov (1)		dst.4<1>:ud	r0_fftid
>> +
>> +#define load_shared_a2dblock_payload(dst, y, width)	\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud		;\
>> +(W)	mov (1)		dst.6<1>:ud	y		;\
>> +(W)	mov (1)		dst.7<1>:ud	(width - 1):ud
>> +
>> +#define load_thread_a2dblock_payload(dst, x, y, width)		\
>> +(W)	mov (8)		dst.0<1>:ud	0x0:ud			;\
>> +(W)	shl (1)		dst.5<1>:ud	r0_tgidx	0x2:ud	;\
>> +(W)	add (1)		dst.5<1>:ud	dst.5<0;1,0>:ud	x:ud	;\
>> +(W)	add (1)		dst.6<1>:ud	r0_tgidy	y	;\
>> +(W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
>> +
>> +#if GEN_VER < 2000
>> +#define load_shared_space_addr(dst, y, width) load_shared_media_block_msg_hdr(dst, y, width)
>> +#define load_thread_space_addr(dst, x, y, width) load_thread_media_block_msg_hdr(dst, x, y, width)
>> +#define load_space_dw(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
>> +#define store_space_dw(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
>> +#else
>> +#define load_shared_space_addr(dst, y, width) load_shared_a2dblock_payload(dst, y, width)
>> +#define load_thread_space_addr(dst, x, y, width) load_thread_a2dblock_payload(dst, x, y, width)
>> +#define load_space_dw(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
>> +#define store_space_dw(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
>> +#endif
>> +
>>   #endif
>>
>> -- 
>> 2.34.1
>>
