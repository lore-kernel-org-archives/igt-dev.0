Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A795606A331
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JIIdVPfA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Vc6xtcTb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6ED1128C2;
	Fri, 27 Nov 2026 09:15:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0627D1127CC
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795770871; x=1827306871;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w0TeuOWiTlOz64CTPchvQhd+5+FtSssg/zL3EMhsRgY=;
 b=JIIdVPfAvsGlI+P3KQ7VluA9oFhjN6lHWysw4VNtJqubWH1AyAsg8aqA
 i1l7yp/ywSz55uPCtKLIT57quBqhNjueE9K1RDUOeUK8M6h4csm6H6hmo
 Btz7eWwKZf9zTOHwxcHf3Adf2JvUJzDtD8RAbuEGnCQfh2FJ9p4b5Sx98
 u6aULb/tx8k0dgGsJL+XZZeiqCeo/r01kW8C9xgi0grzBrBgfHdzZGt1Z
 jHnE5WMMjJkgShzzu/TAMOweHqGd/P7xnVtlRuI76UMBv7jG5BKqOMpN+
 eS6LhJDUtf6Foc1N3/7+X9MqnQPrMNPx+F0L4apfp33AB55k9r4JSgpjl g==;
X-CSE-ConnectionGUID: 6JXa+Vx6TeS5bJ6kiH/GvQ==
X-CSE-MsgGUID: BM9dmEERRaO0X88V61Q3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4606429"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4606429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:14:30 -0800
X-CSE-ConnectionGUID: YMtDbvSSTmaDfm0OsxNnPQ==
X-CSE-MsgGUID: nZmGUTurQiWTCtanT4C5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12606272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:14:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:14:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 01:14:29 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 01:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYp+EXj/mTog6o3SYbKzlNHcGqX9bYGaBdKvUeLcCH7BOxTCR6ZfeMmgWSNMwX21+gHK7LBxlOQT+9UKhNcyjhF2raBqQRn4aU7lSA5+HOdhnE06bxPYAZP+oX2kXb7+wSnqPAY9nOW0F45BoyFIaM9zBWzFTj9knAf88v9RULsk3ZLWUdZVawXry1A9hD8IJ+LOv90Tcn7mFhgqoCOnhOSoM4eBnFtjZvuaR7n65XoBMS2cqqf77nJD1Ftu+e6W1EfG+rIoKRc/iilOcuXu1WaD4XVtAAEOa65S1qlX3be9OZrukgl//quKQYd53HEQPll1g61Tju0S9PGapfn2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWf9mGtuadx6o75vE3z2aY0FFq5Z3BtZefE404xLcA4=;
 b=a6043EN8okW0/f4xYiqub2M0lurMI+8v+uOuNMMQYjB4yBP4kgvfLOVbueaSs/xDmzxNAE5/5pcdVbEi5IED6kFy9Q3vTXrG2bJwk/eXJkrN8oQ/r60InwBWZwJEjnW9g8NGQWDWGCR/NdaIMEhbEn9eaQnr1rZGs2eIEYzbPqfo28IPIAxcBqe/Ro3GXnKGrGGDi2Pmb353CaIyH1akOpVrYldcb1VLEWuE2YgnWRYt23yIzy0CTnwiukauuQichzP51dOPs+mZ7TLf15ol6IEpgdZU6ia8K2joZdncrCUvp9TcQBMkW49chtsG/vy3y0Wqruu/vh1Cp4x8gVDxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWf9mGtuadx6o75vE3z2aY0FFq5Z3BtZefE404xLcA4=;
 b=Vc6xtcTbHq/ob6rqh4tNzBnMHwwyqUhbMFlwZ0036IjHkg/40jaqYHyvqi5zHAxMXTuptoitARMLlFCdOFvu0ROPRspVtD+9fDir7jTOEBaf2cixUgRFndf6RECdw5SOxtzy0SBGzD6pN6lYAaf706sKGDKeAtyijxYtQzdEXcY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 09:14:28 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 09:14:28 +0000
Message-ID: <ddbae092-52a8-490e-80d0-b62955b5f427@intel.com>
Date: Fri, 27 Nov 2026 14:44:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs: Avoid leaking configfs
 device groups
From: "Anirban, Sk" <sk.anirban@intel.com>
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20261112061324.906135-2-soham.purkait@intel.com>
 <91e1e755-c450-4fec-abeb-23c81070c7cc@intel.com>
Content-Language: en-US
In-Reply-To: <91e1e755-c450-4fec-abeb-23c81070c7cc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0327.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::6) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cd5e1b-4037-4654-77de-08df4c66d664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: qM61AwQCWcKQYqBoBOsoFazjlG2eyfnDKHTzTuCLkUjQgSS07EVCEyNf5iQJNWlHbHNrL5cpO4vsiNzcm8atjVZymo5xQxagtKBWKLXYw4lOP0W1Yp3gUZCBdtNrm+z/weuFI7lyhRfU8FSNg3p7DAUgL1p5FJ0IBn2CWvt846de8aLsz8EThtFH6xNQUKE8OKZLcvvjtyzFJ50lrhJDs/iaMQZ0/vkhOjc36ZwSpu9ANly0oLMmx5yK9B4khVnv3jDrUmdYSukgNR1M2Edui9mzdYSJh3Oo4rkTYO4ZQpKKPBxVhqDOT3eqkFl0Osn466LM96IK1xCMYEcpqrZ6CKFAviuKUTlVz8mEw0eroQ/DOOykXJs9RqMi5zq6b0YF1wEnkafoshD5te35WOkE8QNexWMK7ThVv1jcNOSyT76yqAc07N5rWFfWUMYzYMV9lVDndJ4vgx342TomuGdzyYLn3tiboYhqDgqgweYjdhUxqSwqLDSL6hvDi8MwmBY86lSFN31QhUQb8TXDOasFkqkRLqRFYJeK19++CKWGrpJ5iIIULTn/iLxLBHGmj6iFXVAd5hGhptaxNxKMb+hJc3SI0Iwe1xh2NWMygwMwhB3hLpd+gfkHFrAuKwA0B58sTIOMiQDMpM078pB0ivI6BzhiUVdWgJBdPBY8SlU2tXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWV5MnZGdkIvTU0vMVA5aHIraDhjU2dzZTY3RkdzRTlneDNUd08wYTdreWdq?=
 =?utf-8?B?VHdmQ1U5NTc5L2Zacm1taDM1dnJ4eXZiRG01UmpjckVJcDZRTnBYUGVrVDhz?=
 =?utf-8?B?UDcrMXhVczdwTTVuNURFN2ZsTGQzQTVXL2R0V1FPQ2pueEpFdGxnOVBTOW5G?=
 =?utf-8?B?TlNyZzF2a0JIYklMWk9TVndsNjlZcGh6eHM3Sk5ZQ3pmWWRrZkhpR2FFeklz?=
 =?utf-8?B?MThqV3hBV1hOcG9iNXBXMHNub1VOeFlBV3duTkNPV0xzempsYlF0NlV3eExB?=
 =?utf-8?B?R0pTVnErVzVzbWtacUlZR2RId281OW5rY2pabmRPekpmMGlTNE5QSXpFb09u?=
 =?utf-8?B?RHlzKy9uOHhvMlIzWEFOcDQ5SDRmYVFQajhOcUxiUFVsR0llZ0hVRUNiOGl5?=
 =?utf-8?B?SWFWczJMNHpkaExIY1hGMkJneUJ1NHdSbTZ4UVlQaDV4a2kybXpaR1JNNEhN?=
 =?utf-8?B?N3VyZmt6bVBFcTVmei8vbDdidHJ0YzFrMkRPYTR6YnoyYVF2TG5STkZOZmV4?=
 =?utf-8?B?YkUvNERkalh4WURpRkZLMWVtYW5pS0ZuZ0k3QmNwaFQrZlIyNjRzZVZ1cU5D?=
 =?utf-8?B?dXBscVArWk11WDRTdzE5MCtFNFJacm5sQTRjbUZuMlloNEk0dDVZaFlDSWVM?=
 =?utf-8?B?RHM3Szg0ejRiMG5xK2NNdlZ3dXArK21McG5PaWNackxtd2pyaUVXOXFmdHJY?=
 =?utf-8?B?WmZnK3JpaHhPeWlVcXBQSnVSR0dIRjd6Rks1ZmgzdTBVRFhKVVZvb2tpckUy?=
 =?utf-8?B?cW04dkpDQjFadGRzRzAzMWxZZ0RzSHEvZEMyZ0VZMnQ2SUM1VnUyRjNnb1hx?=
 =?utf-8?B?NTZUclJUbjJHL0lIODd0aFN5WHg1S01IcDJBcHcvMldxT3VUYzYrclBVN25F?=
 =?utf-8?B?K3JDMFFlenI3SHF2OG1YTnFTRjRmVVJ3a3FwUTNkUitCV2tHeENZNE1hRHB0?=
 =?utf-8?B?Mkg4dUlGU3I5RkY5WWFoZ01jZEpEUDRuMmE3eFd6RjdLcUt1WGxXWkphSzl3?=
 =?utf-8?B?b09SL3paNld0SFllMkROOUYwOWZvd3dKVm5PWUlFK25KNG9vbkdDak1ieTM1?=
 =?utf-8?B?SGJLUnF3cXlrSlVPZ2l5aERmYm9WdkRrdGQzU1RaM3J0bm1jMkxuREJuYjMv?=
 =?utf-8?B?NGNWbWxnZlEvVHRIMWMwQzVIMFBBcmtOWXhRYWFmdGZvZGhoeVhYYnk2Q2U0?=
 =?utf-8?B?dzdhdUVYRHBockhLakNtRVpobDVSRlViOVNqQkRPc0pxVVVIZUIyYS9KQVli?=
 =?utf-8?B?THdGcFRCQUo3bUpjdCtjV0xlblVOTThNMkgwSEZBaWVYMGZ6RXVTeklGYnVQ?=
 =?utf-8?B?MElzaDFKNU5XVzJmOVZvZy9mY1AwTHp0eGUwRnpHVHVqSTlIdWF2ODhRN3Fu?=
 =?utf-8?B?cUxnRnI2RElYaTRDK2FJZStJNGRlWkNSM3Y1bVdFR3JnekZGMHdoWUVoVkF2?=
 =?utf-8?B?TG1PU3ozbEZCWXJhbkhLaTg4VnJkUUVsKzdJaHA1VDJLUmQxcEVZeXlqWlFW?=
 =?utf-8?B?aEhPd01GMW56citnVFBRS3JHNFRaQUE2QldwV2lxNWkxaGl5cTJoM3Jmb3FN?=
 =?utf-8?B?Y1ZYWi9sVU53OXNzb0lIUGVQeWtIdDhXQUtDK3lNdlpocVlUZkFYZWtieVBY?=
 =?utf-8?B?NFJ2T2NhbFFBaXBJOVFLWFk1N2V6aW5ua0ZPR2JwOFd1RDF3Zkx0alUvWnAr?=
 =?utf-8?B?TFozWU9rd0FzR2NmL3F2dnlEZndMYzBoOERqVllPWU9DSWNTTTk4TE1CUXow?=
 =?utf-8?B?bzUxMkYvS1k4emNOK05aT1VGV1ZiSTdxUlJYSUVmbmdJNGpPb1AyQnh5ZXVI?=
 =?utf-8?B?Yk9Kang5bWdPU092VTF6Q0VyanhSZU44eWlzUlJUS3FhNndXbU1yUWZzOWRa?=
 =?utf-8?B?bTRLUEFhNXpTanhtZm5PM3FrZjZzbHp2bW45YmZnZ0h5K2xJLzBhSUgwaXlq?=
 =?utf-8?B?UGNyd1NUWGpMeUh0ai9DL2hWQytwMldoZmxUTys5V2V5andrTFUyMzlmLzl4?=
 =?utf-8?B?bStpK3lDWDc2Z05SUmNFSGJtWEtVL1d0eUdBenZqNnk0WG1hby9JWlVXckZy?=
 =?utf-8?B?cXk0RGNCaE9qdFZYVHIrY0V3ZFZWWkRMOG5Gbzl2cVdGaE5MMkFOMEdsSC9Y?=
 =?utf-8?B?QXord05jL2RDeEUxUHF1a0hFeWhwMWRCUUVsMFRMeGd2YTJEN1FQL043VzVL?=
 =?utf-8?B?YXRYSldhMDRBZk5jWFpta0VGMk8ycW5UUXptdUxudDE5MHA4bUhkOEVFcXNR?=
 =?utf-8?B?QS81cnJHaHZqanNNbHVONkZIdTdkdGlGTkJzMWF3ZEFRMjR5YmhydjBaaVQz?=
 =?utf-8?B?aVFjdnZRTG1rdEhjbXE0SHBKN3o3NHJEdU5HVkZjT3JsVUtBTkxyQT09?=
X-Exchange-RoutingPolicyChecked: fMuhhJhCIsWVuz4h4nR/inpvG2U22XCS6wzvErA9CLnBiCf61Oaa1Bg0xUjhyNPSOBOC4uSvRJU9MRT9Jzy1mYn3PGF0rpMZ4TZokBmxjaLKsvzI++6jEM8jAQK1F83tg+VCccMy8adfRu2nLR4bboLHD7+kTt9gmc+9i3gbmE4Yrbc4YvE0awAexXMmGy2k9nt6eWjMX7u86fL9akXga/S4AinCDbCXxw66HNK7sNapBOh8pIGtzDlry0eUlMBCEf+3HTOoBvdHTy4R95aWNl4zXFkHBC6ABGKJ+SVsBIQEYbBc5jiGT7+ENC+FspK4he0IWOOopveR4lKARlSegA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cd5e1b-4037-4654-77de-08df4c66d664
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:14:27.9004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cD4K7wdSfE0xa07KHCN+xgQO3dTCV/+daJRlOA98i9hQ3hAn8SdhrNFV9vKCgiRiLnQ7Hlcg0xzcKKQ9wH2owA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 17-11-2026 23:23, Anirban, Sk wrote:
> Hi Soham,
>
> On 12-11-2026 11:43, Soham Purkait wrote:
>> Reuse pre-existing groups without removing them, and clean up
>> test-created groups and fds in the configfs and survivability tests.
> Check the patch subject as you are modifying xe_survivability.c as 
> well not only xe_configfs.
split the patches if possible.
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   lib/igt_configfs.c             |  3 ++
>>   tests/intel/xe_configfs.c      | 86 ++++++++++++++++++----------------
>>   tests/intel/xe_survivability.c | 37 ++++++++++-----
>>   3 files changed, 74 insertions(+), 52 deletions(-)
>>
>> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
>> index 7bbeca746..ef0ba3ba5 100644
>> --- a/lib/igt_configfs.c
>> +++ b/lib/igt_configfs.c
>> @@ -106,6 +106,9 @@ int igt_configfs_create_device_group(int 
>> configfs_fd, const char *name,
>>       mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>>       int device_fd;
>>   +    if (preexisting)
>> +        *preexisting = false;
>> +
> change the function description accordingly.
>>       device_fd = igt_fs_create_dir(configfs_fd, name, mode);
>>       if (device_fd == -EEXIST) {
>>           if (preexisting)
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index 68daed690..534eb239d 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -25,7 +25,8 @@
>>     static char bus_addr[NAME_MAX];
>>   static struct pci_device *pci_dev;
>> -
>> +static int configfs_fd = -1;
>> +static int configfs_group_fd = -1;
>>   static bool configfs_group_preexisting;
>>     static bool check_registers(const uint32_t reg[], const uint32_t 
>> val[],
>> @@ -53,18 +54,37 @@ out:
>>       return ret;
>>   }
>>   +static void close_configfs_group(void)
>> +{
>> +    if (configfs_group_fd < 0)
>> +        return;
>> +
>> +    igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_group_fd,
>> +                    configfs_group_preexisting);
>> +    configfs_group_fd = -1;
>> +    configfs_group_preexisting = false;
>> +}
>> +
>> +static int create_configfs_group(void)
>> +{
>> +    close_configfs_group();
>> +    configfs_group_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> + &configfs_group_preexisting);
>> +
>> +    return configfs_group_fd;
>> +}
>> +
>>   static void restore(int sig)
>>   {
>> -    int configfs_fd;
>
> fix the blank line here.
>
> Thanks,
> Anirban
>
>>         igt_audio_driver_unload(NULL);
>>       igt_kmod_unbind("xe", bus_addr);
>>   -    /* Drop all custom configfs settings from subtests */
>> -    configfs_fd = igt_configfs_open("xe");
>> -    if (configfs_fd >= 0 && !configfs_group_preexisting)
>> -        igt_fs_remove_dir(configfs_fd, bus_addr);
>> -    close(configfs_fd);
>> +    close_configfs_group();
>> +    if (configfs_fd >= 0) {
>> +        close(configfs_fd);
>> +        configfs_fd = -1;
>> +    }
>>         /* Bind again a clean driver with no custom settings */
>>       igt_kmod_bind("xe", bus_addr);
>> @@ -373,7 +393,7 @@ static void set_bus_addr(int fd)
>>     int igt_main()
>>   {
>> -    int fd, configfs_fd, configfs_device_fd;
>> +    int fd, configfs_device_fd;
>>       bool is_vf_device;
>>       bool has_survivability;
>>       const char *engine = NULL;
>> @@ -409,81 +429,67 @@ int igt_main()
>>       igt_subtest("survivability-mode") {
>>           igt_require(has_survivability);
>>           igt_require_f(!is_vf_device, "survivability mode not 
>> supported in VF\n");
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_survivability_mode(configfs_device_fd);
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate engines_allowed with invalid options");
>>       igt_subtest("engines-allowed-invalid") {
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_engines_allowed_invalid(configfs_device_fd);
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate engines_allowed");
>>       igt_subtest("engines-allowed") {
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_engines_allowed(configfs_device_fd);
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate gt_types_allowed");
>>       igt_subtest("gt-types-allowed") {
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_gt_types_allowed(configfs_device_fd);
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate ctx_restore_post_bb with invalid 
>> options");
>>       igt_subtest("ctx-restore-post-bb-invalid") {
>>           igt_skip_on_f(is_vf_device, "MMIO register readback not 
>> possible on VF\n");
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_ctx_restore_invalid(configfs_device_fd, "post");
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate ctx_restore_post_bb");
>>       igt_subtest("ctx-restore-post-bb") {
>>           igt_skip_on_f(is_vf_device, "MMIO register readback not 
>> possible on VF\n");
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_ctx_restore(configfs_device_fd, "post", engine);
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate ctx_restore_mid_bb with invalid 
>> options");
>>       igt_subtest("ctx-restore-mid-bb-invalid") {
>>           igt_skip_on_f(is_vf_device, "MMIO register readback not 
>> possible on VF\n");
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_ctx_restore_invalid(configfs_device_fd, "mid");
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_describe("Validate ctx_restore_mid_bb");
>>       igt_subtest("ctx-restore-mid-bb") {
>>           igt_skip_on_f(is_vf_device, "MMIO register readback not 
>> possible on VF\n");
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        configfs_device_fd = create_configfs_group();
>>           test_ctx_restore(configfs_device_fd, "mid", engine);
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>       }
>>         igt_fixture() {
>> +        close_configfs_group();
>>           close(configfs_fd);
>> +        configfs_fd = -1;
>>       }
>>   }
>> diff --git a/tests/intel/xe_survivability.c 
>> b/tests/intel/xe_survivability.c
>> index 015b22051..757ddcc6b 100644
>> --- a/tests/intel/xe_survivability.c
>> +++ b/tests/intel/xe_survivability.c
>> @@ -39,7 +39,8 @@
>>    */
>>     static char bus_addr[NAME_MAX];
>> -
>> +static int configfs_fd = -1;
>> +static int active_configfs_device_fd = -1;
>>   static bool configfs_group_preexisting;
>>     static void ignore_wedged_in_dmesg(void)
>> @@ -156,17 +157,28 @@ static int find_i2c_adapter(struct pci_device 
>> *pci_xe)
>>       return i2c_adapter;
>>   }
>>   +static void close_configfs_group(void)
>> +{
>> +    if (active_configfs_device_fd < 0)
>> +        return;
>> +
>> +    igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> active_configfs_device_fd,
>> +                    configfs_group_preexisting);
>> +    active_configfs_device_fd = -1;
>> +    configfs_group_preexisting = false;
>> +}
>> +
>>   static void restore(int sig)
>>   {
>> -    int configfs_fd;
>>         igt_audio_driver_unload(NULL);
>>       igt_kmod_unbind("xe", bus_addr);
>>   -    configfs_fd = igt_configfs_open("xe");
>> -    if (configfs_fd >= 0 && !configfs_group_preexisting)
>> -        igt_fs_remove_dir(configfs_fd, bus_addr);
>> -    close(configfs_fd);
>> +    close_configfs_group();
>> +    if (configfs_fd >= 0) {
>> +        close(configfs_fd);
>> +        configfs_fd = -1;
>> +    }
>>         igt_kmod_bind("xe", bus_addr);
>>   }
>> @@ -210,7 +222,7 @@ static void test_spinner_after_recovery(int fd)
>>     int igt_main()
>>   {
>> -    int fd, configfs_fd, configfs_device_fd;
>> +    int fd;
>>       struct pci_device *pci_xe;
>>       bool vf_device;
>>   @@ -223,14 +235,15 @@ int igt_main()
>>           igt_device_get_pci_slot_name(fd, bus_addr);
>>           configfs_fd = igt_configfs_open("xe");
>>           igt_require(configfs_fd != -1);
>> -        configfs_device_fd = 
>> igt_configfs_create_device_group(configfs_fd, bus_addr,
>> - &configfs_group_preexisting);
>> +        active_configfs_device_fd =
>> +            igt_configfs_create_device_group(configfs_fd, bus_addr,
>> +                             &configfs_group_preexisting);
>>           igt_install_exit_handler(restore);
>>       }
>>         igt_describe("Validate i2c adapter functionality in 
>> survivability mode");
>>       igt_subtest("i2c-functionality") {
>> -        test_i2c_functionality(configfs_device_fd, pci_xe);
>> +        test_i2c_functionality(active_configfs_device_fd, pci_xe);
>>           drm_close_driver(fd);
>>           fd = drm_open_driver(DRIVER_XE);
>>       }
>> @@ -261,9 +274,9 @@ int igt_main()
>>       }
>>         igt_fixture() {
>> -        igt_configfs_close_device_group(configfs_fd, bus_addr, 
>> configfs_device_fd,
>> -                        configfs_group_preexisting);
>> +        close_configfs_group();
>>           close(configfs_fd);
>> +        configfs_fd = -1;
>>           drm_close_driver(fd);
>>       }
>>   }
