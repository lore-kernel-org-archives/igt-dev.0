Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDABC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 17:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6369C10E67A;
	Wed, 21 Aug 2024 17:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVCuRaaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE43A10E67A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724260689; x=1755796689;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=7yo/6/buGVUpC6Jtd9YaUe7/Kr9d8fjl0AEQL+wfGpU=;
 b=YVCuRaaq9qYweBKNdTe/lO7jFZC1qRCt/2qjxzR53gLtUFkYvKnQrErT
 lve40vmK3yiuSjLEBICT0G01RFdz4eT3isaQIz3Pne4VyKG0ABcuuXMsD
 YWlpyxcmVh8HJNvR9CCLzuBpjCWaGmy3P+/eWSDwJ/ED+0P4pQnfcY0xb
 Y/01hB9ShAS7+jn6OeI5ggbV8UACWtwAwi0cSmzajh3xz4kBNrYsfGzWg
 cR3BaWA2q5lZu6rlEiqaIcOpToN4jbt91N8NIkeahGumN+uq6TNacdx39
 M40P6o4YnnFjfZ/1s/Ai+RIlMXk9q+IHY4/qYJLiRlg7fgXsi0WbfNhqi A==;
X-CSE-ConnectionGUID: +0Glz3HTSqWb8NrS8eJS2Q==
X-CSE-MsgGUID: yvaSmb8MTT6RSEcpqlX6nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33786559"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33786559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:18:08 -0700
X-CSE-ConnectionGUID: wwWpUdZ8RkqW/UVQpY7QAg==
X-CSE-MsgGUID: ZXl6rPw4SIifC1m/d26bUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60815399"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 10:18:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 10:18:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 10:18:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 10:18:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 10:18:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pw5KfVLTGj6wLvOt7XyclFaHc2OIpBybrFbw9wFCXeEcj8aMpcGOtI8cq+80LvxFm17CKycm7MtwUDCm16IB/zTyCdBWQaZuFKjgN6YHk2vRM6NupJ5Hyb9LaQvhda8rto7/zOco6fT8a5CeHX+H1YeDIKFtOU+iUcCer2wKQ9T/SxlTyrdggwcxQW5v3kyPHG1iEQiQmjYYTqp3bB14pVR9JYi5q23cQXtx4bYpeiMSK8QOmQF1nHcnmedDMhnHso+oM+Kt8IHCDrLHQLXpWfgRmLNiLXE21PfyIX9AQBUK+ZRLu1oQdgxQc5ESewggC/0qphW86iw/WDom+E3qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUSCd5uUfC9NIduI0VucBF2BOR9EMeek1cbytW8KGJw=;
 b=LMJROW1Rh7WSSFjEYx+h8WrGk/95JGeFqT029qt5juSE1spsjWDE2FaoL+fS7YpCKCdyTjXaKFdjPoJkWWioNRsKZPZpgTBSJND8IMww5C4MLYUQPF7JZkJnAFJhfRL4zFrMs9mbhay29TMTsi8YOdHrNASuJlxSqnEZSlZPQBUmui9sIdhQApv3wLwM5G2lefDqIDeKPQ/GKyGj3+8tEQZMr5LjMuByiluy4gkgCRu3kPR6bpNiTSqO+feYR2fRJoCW9m4oAxu2u9Nu+5ij1rp8nE4oSRUng+Ka1CAscx9wkALfncM5ypSpIZSJimk4oS7+KBDHCbXixa6yd6iruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 17:18:05 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 17:18:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240820232928.458248-5-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-5-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 4/6] tools/intel-gfx-fw-info: Override kernel
 types
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Aug 2024 14:18:02 -0300
Message-ID: <172426068263.2071.3467208225849587363@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:303:8e::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: b70e3068-91b7-4bbc-cfef-08dcc20537eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZ3VTlxYkpOYStSVnhiZ3pHY1pGdHB0K29VUDIydUtVZ212SHJYYk9RTGhU?=
 =?utf-8?B?K1lwUXBHV2twMHpnMEZaSHRzckZPaDY3VCtoVE5pZXExRk9CNmJkVFlzQUlt?=
 =?utf-8?B?SWZGblFPV2hNdVJWdnhJV1MyOVpML1puV3ptWmFRRE50L0xTOGFrc3RWWUJr?=
 =?utf-8?B?a2hJZlFkcytlOEZnUG82WDNqTGY1ZTY4ajZtMHgySXE0c3N0c3VnUHdGeUt3?=
 =?utf-8?B?STNScUMxMVh4MUNGUG5KYTRGMVBFUTJGMEljZ1FaWXZCdHVRNWVNbS9tcW5R?=
 =?utf-8?B?cmRVNzdERnhaOCtURFBlZGREMzBlby96VG9vZVZYWWVYNXBjQy93d2p6SjM0?=
 =?utf-8?B?RWVzU2lLMC96c21jOWl6SWdlaUJGUXAvV1doNkZKbXRabDY2Ymh3VjFMUC9E?=
 =?utf-8?B?UzViTEl5WGd6U3RPaGtxOWJMUzRDV2Q0TVVDa0JoWHVsdWN1TXJUanByT1Mx?=
 =?utf-8?B?cmtVUFhtVVJ3dFVnNTRuRVU5K1hsN1h3UHJreXB0TVBoT3pQQUZ1bVMzT3Nn?=
 =?utf-8?B?czFlcFk1ak80STBXYlVUb1JSamxydUdSLzRmMlY4Szh4bDl0Y2xEVloySGZG?=
 =?utf-8?B?L09yaEdjSk9iSERRQmdERzQzcEhCY0FMdk5XSWoxUHBleWY4dmltTXhjZlBG?=
 =?utf-8?B?c0hOdVVPSS9yZ3FjSjNnTnRpbk1BZzJjL1Bud2htOXdIcmV1dTV2MlRpMFE0?=
 =?utf-8?B?SUFZazZxNVdjVW9CR2VGQkFiTmd4TEptRXNXeFYySksxTXBPUmkxcVp4N3dj?=
 =?utf-8?B?SlJIc3AxVkVleEZlYXkyVFVXZDlUQW1TY3pWT0JQNmtQRGNNS1VuVmptWlA2?=
 =?utf-8?B?RnU1TllHZTJoRU1TTklITmcyWW9ReGNySGJ3bFp4WFhuVDZYL0Z4eWJJcFNH?=
 =?utf-8?B?R1NUa2JGeUMvZW0rSml1bnpIUWJ1a1J5cHQxSm9EbTlpNXlyRmZvTlhhZ3E1?=
 =?utf-8?B?b0hsOVowYUlpTTVhTVRLczhsNHB0SU1PYk9kSmdRYjVKcjZOUDZUTEdJeGpM?=
 =?utf-8?B?aXcyRnQ3U3dIRklJTS9tYkMrdi9TbTNRZ0NCV0txZURkeTZQajFxUVdGUFhj?=
 =?utf-8?B?eDZrdW1XSEp3ZEF1K3VxQlBJUVc5RXJFL3U0ZzkxT3ZRdjlZRlhvTUhxV201?=
 =?utf-8?B?N0NrVktkTUMrOGlWY1I5TXlHVGw4MDNpckE3QUx1alRUYzVnNndQcU5WaDIr?=
 =?utf-8?B?K3U4WHFOTzBhZU82cGxXdmV2Z1FGZGRMa3NDN1UzcWpJVFhMRHBPNmlNUjcx?=
 =?utf-8?B?Z2w1eWppYlRiQVpiOTdwaUlETGZ6SFVwaHloOXdWbWsxMGE0NDhldGZNK3dN?=
 =?utf-8?B?RHRMMG04UjA1YmhjbzZNWmZWSGdKTUVDcFQzUnQ1TXg5NGIvVEVESDluMTBD?=
 =?utf-8?B?TXZBSnQ0c29jMFlsU05DWVJUY3pZTjNGNFdPRGJFeDZINzcxRE9VdHNGZVlO?=
 =?utf-8?B?NWw1ajRHRDJVL2VBNER4NGhvdlJxd2R5Z0Zxc2xraHcvMWpjTEhZQzVWZ2Na?=
 =?utf-8?B?YW44QUY0V3o2Tm1CNGFXY2xtcVBNdzdOOTZIdjJlSW1UMUpwTTNZVC9xZ2U2?=
 =?utf-8?B?ZHl5V0k1M3BlSnhoY0ZLeXZxK29nK2hQRFppNFBERGdzQzZiVFV1SndZUUVi?=
 =?utf-8?B?N0xWRHM1dm5TM3F6MDNVUVlIOE1mY0lTb1QzaGJWaGUyVXFzQVlLQTZVOUt0?=
 =?utf-8?B?NlZIU2MxRDJRcVFCdnZ5QlR1bXVsNFRLakF2OXRUR1RCcU1JcE5tTG5SSzlW?=
 =?utf-8?Q?5B1zS5ci58pbauZRIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNYUG52NU1ibTZEU0NVMTc1QTdXelN2K1pmOEh0ME1nU2lDT0N3RGZIRGR3?=
 =?utf-8?B?MjR4MVNkMVNkYXVsM2RiREZydE96dnplV3YzbWF1MCs3REMrcHgvSFNKUkR2?=
 =?utf-8?B?SStoR2RacDJ3d1pMSS9RTC9ydkFqK01sQnBpeUtCVkVxZGU2aDd4VUlCRnVt?=
 =?utf-8?B?Slk3b0Y3MVp0UG0xWTRRZXA0OGZ1L2hENmF4WXg0Nm1yV01WNjZJUXRGRnly?=
 =?utf-8?B?MVBZSWlCekRjbGdmL0t6MTM4RXJobWgxdVZoR1JHWmtSY3FGWnpxc1E0TW03?=
 =?utf-8?B?TldGa09MWndaYk9uaEVLU1Q3bXloMmZmOE1YZFdicVpoUEpwUStNWWc1TGdR?=
 =?utf-8?B?ZTRRcHZ3d3RpWVl5MzZqWFNuT01MT2ZBVkw4cjVHZ1dnQkNCNkVLV1JoeHR5?=
 =?utf-8?B?clVFVVV2RWVja2tUQXdZc1ZWbllweGgwOXgwUWkyRGlHMmdGSnFyTFczQVZX?=
 =?utf-8?B?QUk2bTJRSWVjUWlqNE4wNDh1NDQxL3ZKV3Fvb1VwVEFjMjBTOHVtb0VNYzdT?=
 =?utf-8?B?V2NIQVpUcEV3enV4dXJJWkRIQ0E1ZHBtM2paMU9qcVIwcU1wbjBHY3MxbmE4?=
 =?utf-8?B?NHZRUk5HaHVsSlJsMWdWejRkTmw4WXl3emdhUDBrelB0aWNvb3hKVmtVWGdN?=
 =?utf-8?B?SnlsbjZqY2RwaUM1a2krMGRTc1I2NUM3Wjd2SWFML1F6b0xHN0JnSi95U3lu?=
 =?utf-8?B?eUZRQVJacVNWYkNTZVhvWHhXZVk1MUphcWlnc3NXS0hra0VCelZzcnl0QVdi?=
 =?utf-8?B?bFdyM3BzTllRS2N4cHZuYXJOR3dnenJhV2pUdFdLTnZscEVSamh4amI2WndK?=
 =?utf-8?B?dnYwUytRY1BNNnBvL0hZSXFyLy8xelQxZEVHbXBTRnhERUc4Nm1yOEsvRk1G?=
 =?utf-8?B?RVVLUVRrNiswcTJrODFzOEVwbmRRekdGeWNGU0pvTTVSajIxOWIxdDVXQTZB?=
 =?utf-8?B?Z3lSRHBrZG4rYnIya2NYSnZuL2xuMXMyendRUXNiVVdJM01haExFNURmeStB?=
 =?utf-8?B?MXB4eU9lTEJuSkwzUVMwbGtqa3Q1OS90OUZEVFUwd2lPLzdheGJxQlpVQnpt?=
 =?utf-8?B?aVhMakY5Yi9xT1hiYUVmbVdmckFHMm1GWTZlYXlaR05EOEdNelR5VmxQTTBr?=
 =?utf-8?B?ZTNBRzloWHR5TVNXTG9DR3lTOXNsZFR6K0hmQkNJaDUwWDVNMnNqdlJ0c0xh?=
 =?utf-8?B?M2ZXR0VMcTR3QVRIaEx1RjVJRjd6WG52R1lhTkc1ZldqQlRTdnA3a3R2Uzc4?=
 =?utf-8?B?bGVIVGZMMjJnUzg3bGluMjNxMnpkK0diek00bkZPRzV0Y2ppVlhjaGRaQkwv?=
 =?utf-8?B?ekN2Ky9WejB3aTJWT2NYS2VFWHFLZEpobFhUaGFoM2hoNS9CZ3pxL3NOTW9G?=
 =?utf-8?B?V205Q1ZPT2twSkIvTG9ybE01MkN6OVV0bVlGbHhtQW9OU0dIeTBZdWQraCtw?=
 =?utf-8?B?TGwzcHg1eUVOYTltNFdpRmJ6ZVc5aGltYnhFRExSNG1RbXA1YkxNdjNaK0Nt?=
 =?utf-8?B?T3ljNU13b1pWSUZvNTZBbHlqYkZuZThkeHl5aFIwSlkxdkNXalhEOElQKzBF?=
 =?utf-8?B?S0FFRlNRMllwWnI1UmhTbnlTQXo3Ull6UXJ2MkR5d1dFcitzcjZmU0pCK1Az?=
 =?utf-8?B?UkxqVUZuVmRnMExjVVFMZVE2MEhPeDVLWHExMXZoK3dSYndyL1ZJdWZNMGp6?=
 =?utf-8?B?cUJMVGNRd1NXU0xFVk9wbmR5Q2dGRU1mVk44cGZVZ1RmSm9vZi95TjNVQWIz?=
 =?utf-8?B?eFRHTXFzOFQyeEx2N3FaSTliVXYySWJ6a2NsOEZSZjVWQkQzWnJCN2VyZm9p?=
 =?utf-8?B?cHRlb1luVUJYNHBGNVBNUERIV1JueFlwZS9ubkZXT3EwVGROS0xsd3U1ckpV?=
 =?utf-8?B?dm5QVEFxU1laZ3AvanBndGVwRFYrMlNuS3pYNURYeDlCS0pFY3hZZW1jTHhx?=
 =?utf-8?B?QTJHQytacFA1WVJTNnVjMTQ0RC8yYlBPaWg4SHlZeStLc3ZqNkVUc1cxaFov?=
 =?utf-8?B?dkRUUUt0eFBTL3RuTlQzY3Q4VnQ4YWlUSm96MlFITFh2TXZsQ3o4MHR3S0dw?=
 =?utf-8?B?aVFkRjQwUE5KS3g1eStGS2RHMnN3QTdPQlZXMGkvQjdweU1wREJzZ2Y5anho?=
 =?utf-8?B?L1o0eWhFeGtzdHMyR1RoUWpBa2tMNUhJYzROdmYvS3BCaGVycmo3d3lNQ2F6?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b70e3068-91b7-4bbc-cfef-08dcc20537eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:18:04.9547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEfiKTpGc6+h2mpNFV11iJnp9sTNlJzLhZLeFR9jSlT8DLlB+cb0nWVQunbl+B8QuAG0yBkr92uAC2jr+8sPVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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

Quoting Lucas De Marchi (2024-08-20 20:29:26-03:00)
>Previously we were defining u32 type as part of the string we are
>loading. However in order to use other types like u8 and u16 in upcoming
>changes, it would be better to have them all defined in a single place.
>We can't create a typedef like done with u32 because cstruct already
>defines a few types for convenience. However it's very surprising it's
>defining e.g. u8 as a 64-bit variable.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tools/intel-gfx-fw-info | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index 0f1da8bff..57d6f935b 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -23,8 +23,6 @@ import typing
> #          dumpstruct(): give it a name
>=20
> CDEF =3D """
>-typedef uint32 u32;
>-
> struct uc_css_header {
>         u32 module_type;
>         /*
>@@ -120,6 +118,13 @@ class Fw(abc.ABC):
>     @classmethod
>     def create(cls, f):
>         cparser =3D cstruct.cstruct()
>+        # cstruct defines some "convenience types" that are not very conv=
enient
>+        # when parsing a kernel header - e.g. we don't want u16 to be par=
sed as
>+        # uint128

Yikes.

>+        cparser.typedefs["u8"] =3D "uint8_t"
>+        cparser.typedefs["u16"] =3D "uint16_t"
>+        cparser.typedefs["u32"] =3D "uint32_t"
>+        cparser.typedefs["u64"] =3D "uint64_t"

Well, typedefs is exposed in the documentation, but not properly
documented [1]...

Have you tried using cparser.add_type()? Well, if that doesn't work:

     Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

[1] https://docs.dissect.tools/en/latest/api/dissect/cstruct/cstruct/index.=
html#dissect.cstruct.cstruct.cstruct.typedefs

>         cparser.load(CDEF)
>=20
>         magic =3D cparser.magic(f).data
>--=20
>2.43.0
>
