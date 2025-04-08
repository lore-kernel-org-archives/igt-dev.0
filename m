Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559EEC369A4
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 11:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C8C10E674;
	Tue,  8 Apr 2025 11:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RX6QHaoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE8210E672
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744112472; x=1775648472;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FxyxDDQ8F1NuNG4AekL7WqOclPhvsJ4ucibVQTfsiWQ=;
 b=RX6QHaojKGrqNIbb4oWMoPvX6NF8DYmn5CCn5BG1s4DJOqQQAlaYc3AZ
 f/6NPLaD1XaFkcl4y6Sg6IFy3tNJpHtwKInGcCpf2qJPvelSwoRJYETLF
 PtXEMtp5Flar+JvCK/LS3c5Kiwt5aixRMsO0iO/FBbjNJhC2b+sOGEvD3
 nXonJtYWazQV2kG7l0U62KllYsPbe5IbRvRG1gh9VOeU6jviKE8mg4rTQ
 fqgXtL7yyouYymSJg+BhYM/EX4dAbKQ8hazelMGF2NX9w3kAG7kYmbIuI
 3LDMcjN9g+4QGPuVp4yj/fQD595/bFn/g4uXsjdY0wUveG4fM0YOjP+HF g==;
X-CSE-ConnectionGUID: QAZerSIKRe+BgidzaHQEJg==
X-CSE-MsgGUID: CZYSEmWtTQelXQZksQIKCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45674833"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45674833"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:41:12 -0700
X-CSE-ConnectionGUID: lxx5sGAzSXSPu0bC0kzrIA==
X-CSE-MsgGUID: DzfESfcRT1Op89MJnb5xVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="151425918"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:41:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 04:41:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 04:41:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 04:41:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UE/MAAsbINghAQdYGWqMR+NnExD/DsH5dUwTsZPKioJ7jOENA5X5WsGYmTfas+DDJO8u0dak/dRPcnlKtB7uHhGuCB5u4/BMEHXnE/xNqVLyVJu9bvcf6x3SG2bGhDreZDZ/ZMxu0YeTKi8hHpa+Hj2dWGpGvQQsv2/LQuMIfoU7BfNVlbHhe4nI1jrL/GqAVcqXwaynqNKeE9drRFXIDyM4g98HZFFCIvkqzEakZ4fc/vbRKOvSz55K1yJ5zlnq1/SjO2gFSrHwl03VgyzK/ZBy/fGjDaHs29MZOoSoxFyHgu3r38ZQXmO51bZHgpsrjlbKQdjjRBsbrZkYWUik/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfXa59MzGQTNqP2Cn48GsCAQp0asTVAFokkZ0/hxUAY=;
 b=WPG2WpuocXozoWgRiwqdwK6qEC7D3SbJwGf9UsVJAFHypZi47MmckAyydqznLg2+KKgrIp0Oq1j7WsGxJy+2ABSf3V7JNsNHyHN3Ij7XBFx1L2uunTIdltTxJDPsKR6cX9W7xgRAemzhCevC5If3YAcgcPNHRrPTt1GQFtfsaZmTZpVRSKgw5qYZmjzUG2j/wwFhH7tFTPHT7/yx8RJ5VDlrdJIdfMDEVb+hpxVeo/R6GhmdMCjBQZJZ6cYuRv9zs1MpA34UqHHDxARD9S7avfuo0cgVTpWUU0VnupobUJM8oF2r3RALdfxBxtGMDuHrAVW8CmhmnXEhS/PVH7C7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 11:40:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 11:40:48 +0000
Message-ID: <e38de091-86ce-4996-85f9-b32711bd4562@intel.com>
Date: Tue, 8 Apr 2025 17:10:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_edge_walk: check for display
 and pipe CRC before cursor size
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
 <20250407144504.2907700-3-jakub1.kolakowski@intel.com>
 <80b003e8-afa6-4a8e-9fd4-7f97fcc071f3@intel.com>
Content-Language: en-US
In-Reply-To: <80b003e8-afa6-4a8e-9fd4-7f97fcc071f3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: e8127a16-f29f-4149-969d-08dd769234e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHc3dm1Md1QzYlpVb2pHdjlOV0wzdUNrT1d1YlcyMjRDRk5yaTkzTHNuMkZt?=
 =?utf-8?B?a09VWmpwNnk5eVJOdXl0N0ViNHZGbW1hYmlwYUJNTGNNaGlOVXJRcWxPRFBQ?=
 =?utf-8?B?THZrcGxhTFA2RFpkWVhEbC9YYjdJaEZPZ0ZqVE9tdFBPdnl3K0dxcHBLTDk5?=
 =?utf-8?B?MEx0Q2pxWG9za08yS1l3b2RKekJHeDkrbFkrRnUwU1FQdjhtV0VwUUJ1czNy?=
 =?utf-8?B?MDZFK24yMkh1REhpbmVYUVVRQUtlSGFPVW5NSDJ4aDdtV2p4QWJLTGVGME5a?=
 =?utf-8?B?N01XVFdwWFNiOXdyYXJnS2hwbTA0VHZiNDZYL1Vxc2tHcExvNVRvQUdtZndw?=
 =?utf-8?B?ODFtMS9EN1JmSDk1LzBPMlZuUGFyb1RSMGZxc3hxN3A3OUpUb2hLM3U5K1N0?=
 =?utf-8?B?T1gyYi8wK1lPTW45R0FtbjBLTXlnMDlXSHllSEFnaS9HUUJDZURqZFRtZ3Er?=
 =?utf-8?B?bFF0TFp5aGI2MWNNR0ZtL3I5N0dJY3IzajNuQWRJT0g5N2VpSXFLMHRnK1Vr?=
 =?utf-8?B?c3RZakx5MytNeHhNQy95MXErbEltWmlaOGNIOWZTbEttZ3hmZmJPSTFHbWs3?=
 =?utf-8?B?Zno2MWVCNVl0bWdKdlN3clRld0dRUElSMjROMW5Zd01ZbFdKOFZBaVc2Nmxm?=
 =?utf-8?B?R2g3L0hCc2JpZ2RUYW1SemxManJpNDVJN1pxbWNiQ2RoT0U2YkNZWTM4OVV4?=
 =?utf-8?B?NWhTVnJGN1I4SnhLd3gzcEJrUGxoWjFqL2lvUXlaSVhFL1BUcU0vQmhib3JF?=
 =?utf-8?B?c2k3bkoyNW1rM0lGcC9iMU50S3B6SHBnUDJoTkswMFN1Q1d4UHhaa2h4STdr?=
 =?utf-8?B?bFlqMEcyOTEyNEZad2h5QURFcGFpOE1OM0NNVG1vREREeXN0aXVqWStxQ2Yz?=
 =?utf-8?B?dnVzWmxEei9TaWZOU09jOGFJUGhCRDMwdXFqMzZiWGtMWXZFUlY3N1BrSTFs?=
 =?utf-8?B?RFhpdGc3VytGVElLUjRkaUcxMnVUd2prRXhIMTVoc1lBNzJVbXVEa0VkU2hD?=
 =?utf-8?B?Q1ozVDBWK2JRVW9GbDRneDY0MTZOL09qL2F0UThiaEp3TzR0ZUVjYzdsVm1C?=
 =?utf-8?B?T1pHNFVMKzJWLzJPTUZTMmV5c3VaVHZFNXd4TFRhTVlUT21GVTlyaGhwMkcw?=
 =?utf-8?B?dFhPUmlhQ2t5TXFYWnExY1Q3aGV2bmVZTXJVRE5ZZDNaV3FwektWK2hBY2Z1?=
 =?utf-8?B?OTRadXBha1I0SkVpWlU5Skp6aFg4M21aMDBUZUdwZGlZYTBWTXN0eEs2SE9a?=
 =?utf-8?B?VW1XMnZUNjdmdnA4dTFNNHJsc2liNS9OUTQ4VmhBOWhLRldIWldQZXJzV3VR?=
 =?utf-8?B?L05DNXVWQUdYVXVIbnBRenlrVmI5UEhCYjQzNy9sQytxOVRZR0NEK096c2NB?=
 =?utf-8?B?dmpTS0xoM1crZi9sd2REQ05ISTB0eUM5bFhtQWEvc2Z6QTBSQ1NBWDZXaVlX?=
 =?utf-8?B?NkpiQXhiM01LeHBmaHVZbG5lUUU2eFBTMFRxRUVRanI4RXl5U0gwcTJCMENn?=
 =?utf-8?B?WVhrdVhvMjJqbDNMU0hFQ1BJaDlEZzhuWG5mUHRIZWJNazFGTmllQ2lkeDNS?=
 =?utf-8?B?OUdvUjN4Zk1aajVyTWRSY0QyUmFpdm5UNWFOblBJTlNwRkFMdmRSVDJqcHBO?=
 =?utf-8?B?cWVEQWxHeVNTbVZpU2h2cklWT0ZCak8rV2FRL2JUYWFRaGZ0dlEyY1NKVUxN?=
 =?utf-8?B?TDNIdkluZmszeDRRVEpoN3QwZzZ6T2NWWHFIZHpaTmJPbHBXb0Fzd3hib3Ev?=
 =?utf-8?B?eXU1ZkZXdEpPaVA5bmk4WHJxNWk5U0NDVDFjcUxPbW9pRlZaZHNST2RqVkRi?=
 =?utf-8?B?c25mZW0wYlIzNkZ3TCsrL2NmcTZua25UT1NLcTVhNzhnYXpKSURBOUYrVjIx?=
 =?utf-8?Q?NRiHrhwNijbg2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjRRVzUrR05vY20rV2pQZFhOakJ0SXoyRERxb3RWODJXSWJtYzlSazUyZERu?=
 =?utf-8?B?bll2VGQxY2NqVFhPd2RraCtnWTRobDNhbGpoaEFQclVoU01XbG0zd3VsM04v?=
 =?utf-8?B?dkc2OGpzc2dtQnVJMXMySUtaWlVkTHRUQ2F2RDE0NTFtcWUrZWg3VlVSMURW?=
 =?utf-8?B?T3FwMHZsck0yM2l0QmN2My9uY1d6ZlZLUGtuUG80dG1zS1UwOGxDUjdZMjNY?=
 =?utf-8?B?a3E2V1VLOUZzczM0aUhnMzV3azIxLy92Mzg3YWpVSHpKK1E5UVlqT2c2b1lC?=
 =?utf-8?B?NEpMV3BYL0NteVhNVnJHRmVyenBOcytEWTNPQlpLYklJWEYxdkVPVWRVcnR6?=
 =?utf-8?B?ZEpJNURJbUl2K0dmLzNMd2FZVzJETXdhUHdZQWVROXlOMzgxLy9XS29FVGd6?=
 =?utf-8?B?QlZnaFoxSkx2ektUUkJ2M25pNTUvTnVaR1NUVkwyM05HUXpHU28wMWpaVkNQ?=
 =?utf-8?B?WVVScTluZmw2WVA1MGNoVERzd0cxTytPdXEyQ0MvUEJFbUdWMnE0YXdiT2p5?=
 =?utf-8?B?Yk9yMTJLV0phS2FuQTY2ZDFydWxUR0k3YjkrT1hjTlVRMVBSUnhIYmZmME91?=
 =?utf-8?B?OExvMVJiMDBGK2Y4UTZzb0tHYVl2OVpZZ280U1d5b0dFdHRwSWRobHB1aGp5?=
 =?utf-8?B?QklVN0kyRStNbzZLN3BZNDJhWmRQYjFDVU5WOW5pZjV4TmdldVFQeTZQdytx?=
 =?utf-8?B?elIyODFTTC82MnRKU3laSGtlRk5jVWwwbmlPTmJYYkxhRFJDdW9SczBRSFhx?=
 =?utf-8?B?U05iUzVHaXJGcUZETTBoVWtpL0x6WmUzcy9EL0szTmR6c3AxOVk2VS8rZDZZ?=
 =?utf-8?B?Qm01L04zak4wNnE5aWtmWXBMODVZZ1NoM09Ha2RydmlHckkwc2QvRlhiQnFy?=
 =?utf-8?B?YXhmQnJDQTVDQlIrbE5PS25EWWoyTC84RlprUE5GODNKUzNsZWV4MUZnc3dD?=
 =?utf-8?B?anlBS2drTUI0SlVCbWFWTU8zSGpibWlNOVFHNFV0RkRUeGN3VzVtQS9uVXZI?=
 =?utf-8?B?K1NDcGFVK2tLakRPcmZ1TCt4T3IwS2ZXVUVyNyszK3V1TkwxbW9EZkltN3Vw?=
 =?utf-8?B?VlFndXVraDJaKzM4blg2aEI4ZjB0SFdjZHRtVTJkZTJtQ2I3YUZucWJZL3lI?=
 =?utf-8?B?RUluNXhZd1MxVUJsRVVwVGZuQXZSNGQ2VCtseVVpaVNKeTVPNFJHajkyOHdJ?=
 =?utf-8?B?dWh2YjdiUVRPTGl0OEdydXJVbW15Wi9pN25tNStrd2xSa29yY2xjRS9uSERC?=
 =?utf-8?B?ZGo0NG8vN3djN20zcUU3ZGEwSVZuMnFpT25ZVWFVWmxEM3dXTWFvNUVrTTNz?=
 =?utf-8?B?enVxbk1kbm9CbUNwQ285TFFYMlZTTmhhbVRhUnhDQXhsWS94WTZKT1hNWWps?=
 =?utf-8?B?SkpUNVQyUWVYamhWaEk1MERLOVBWTlNSZnBYUWcwdHo4MnZvampvL040MUdN?=
 =?utf-8?B?SWJZSHB2cit3aFhoR0N6WTZGRHV3U1hDckxjOHRzV2FjN0gvS0FuMlpEUkI4?=
 =?utf-8?B?VnNWaXd1dzJyWi9yQjdDT0Y1SXA1eGw0djRWaS9tRXZEM0huNDRNa2dSN3Y5?=
 =?utf-8?B?dHRwRytpQUlWZXRSYTFVMGdRMnNtanZpL29XRVJnRno5cFNPRk14elVGWTZl?=
 =?utf-8?B?Mm1ET242VUVmNk05MEJvdmRKMjQxSG9YUmRISElnTEROVVdwM3dieW0yeEhQ?=
 =?utf-8?B?K2FRL25KQnJGaC8rRGwxdzFoSGZyWlFEVGlJRFl3SEhsaU0wZ1pnemNVOHVo?=
 =?utf-8?B?UlUrRHRJS3ZnTDk1NkNxVGdZWGd1V29aRnhSZ0d3RHY4ZWd3YUttM0ZlNktX?=
 =?utf-8?B?eStxWmxSMEkrTUFkWkt5Rk5mVlFnOGpIWUxVWU5GZU1sQksvZ2U5dVN1Z25T?=
 =?utf-8?B?SjgzdHhBd2Vycnd2R1l1b1AvL2lUay9lVE5scUkrRkdOSFJIaWFESUkxZTBa?=
 =?utf-8?B?bk9BUmVXZEJ0eFpFUlVhK1Q4UHJoamlnZVJUNVViemdQWGRjeWRXeHFSejU4?=
 =?utf-8?B?NysrTG1iUGFyMDF2amQ3R1lwS1UxMDA3RzdDLzJmR2toRG80WGVxQVFUZnMw?=
 =?utf-8?B?TThVWHZ3SStYUGI5VlpDSkUwakNvV0xUZFlXQ0ZTY1o5R0VqU2svVFVCVHRF?=
 =?utf-8?B?blc5ZmIwdDdhbSsxSXYwUzBTYUJqQ2RQRDV6RUFtZGcxRGV6dmVVVjYzZjU5?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8127a16-f29f-4149-969d-08dd769234e8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:40:48.4322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krIL6oFSCvAuS8W/kHLOveTpwsece+z5egxjvgAuOldPlt1CNW5dr6Xm/wHSgY4F/Sbogflk8bOiPWHbVqL43g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 08-04-2025 11:12 am, Sharma, Swati2 wrote:
> Hi Jakub,
>
> Patch LGTM.
> Please add "Closes" tag for the gitlab issue.
>
> On 07-04-2025 08:15 pm, Jakub Kolakowski wrote:
>> Currently igt_require_pipe_crc(), igt_display_require() and
>> igt_display_require_output() is called after trying to get cursor
>> width and height which leads to fails on configurations that do
>> not have display enabled.
>> Move igt_require_pipe_crc(), igt_display_require() and
>> igt_display_require_output() before getting cursor width and
>> height so instead test will skip on configurations without
>> display.
>>
>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> ---
>>   tests/kms_cursor_edge_walk.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
>> index 858d1da9b..27bee4482 100644
>> --- a/tests/kms_cursor_edge_walk.c
>> +++ b/tests/kms_cursor_edge_walk.c
>> @@ -361,6 +361,11 @@ igt_main_args("", long_opts, help_str, 
>> opt_handler, &data)
>>             data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>   +        igt_require_pipe_crc(data.drm_fd);
>> +
>> +        igt_display_require(&data.display, data.drm_fd);
>> +        igt_display_require_output(&data.display);
>> +
>>           if (is_intel_device(data.drm_fd))
>>               data.devid = intel_get_drm_devid(data.drm_fd);
>>   @@ -372,11 +377,6 @@ igt_main_args("", long_opts, help_str, 
>> opt_handler, &data)
>>             kmstest_set_vt_graphics_mode();
>>   -        igt_require_pipe_crc(data.drm_fd);
>> -
>> -        igt_display_require(&data.display, data.drm_fd);
>> -        igt_display_require_output(&data.display);
>> -
>>           /* Get active pipes. */
>>           last_pipe = 0;
>>           for_each_pipe(&data.display, pipe)
>

