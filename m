Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EEBC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86E010E0D1;
	Thu, 18 Jul 2024 12:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvpJz/Cr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1D210E0D1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721306739; x=1752842739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pkK2HvD1q1dIA5LEo+7HYN1eA7Z08g9ej3Q8bPLDEfg=;
 b=KvpJz/CrtiORQDtOseNk3NAb2sNV9MTBVt8rulKWvYuK5UvIGjttaMu2
 Q0wj6TxZGqJLXpwnNWVnX8J/BEvVfMKHkiFFRTWlDhfOLD11ljLP0wF46
 jLwwBvMBbEhnFWRYBTToaZGFL7I2vpqXdjrh0lAeq7ubkN2CzOc7XJ0k+
 CRaI8uXcUA8/4boBL5JhIDHHe42rH4lDpzG3r3k5SgisdB9+trKnV+Uzq
 Lygeiry3fp9ETYdICj1D/i2bXYrcIB/W2JGazyS+Ctj/ogfoVsSDExkR8
 h/5Sk4oP+ro241/ERab9M4ZSVC33/Oca0qLu7/23nDmhzgbUUwQc2LNH8 g==;
X-CSE-ConnectionGUID: t9ULaHmiS8O1RiPPLaGsog==
X-CSE-MsgGUID: 158UYrt/TpqbbrloabZfOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30252677"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="30252677"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:45:38 -0700
X-CSE-ConnectionGUID: QydJYOHcQwettBhAZkFuVw==
X-CSE-MsgGUID: UGIndHh7Sw+uWZEmWSMkSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="88237576"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 05:45:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:45:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:45:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 05:45:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 05:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tABG1KTTUfo9R/ai0bkdWD47XeFQaEE0JWXF3p8oArFDaVL/sUxi78jcvzkE64VVGG4CldlljT6u32W1XEnROV3HV6t9k+GLpar0YEwmiW1Y+cLu4AtDPZS5pxTAnW37VNQavqJhlO/V4NB52RjeyZ1kgQG93kaG3uwK//eehp6wKMxmT/c6eAZI5GjC2ivY7XNZ0pCLhlHGuC+e7EDnB9JMyqDUdcsW8Fcv5q1QsVvnZAJ0tQVX0hNsPuNWWZSb1UiCdcB6hNo5kjWTQoLGQTUEK3xCkrPeZtpy8b2CtMAYWn78Q2c7RJR3ixPLuUcRu0TcOYmpfXYsSby7uU1tVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb4JGlK4/Bgpx2NUqrM5KF4SugLUhltvX0aGuyMpsEQ=;
 b=T7nzfCgh+r+Y2yqGhmykSzJg/8YpPw7lJkS94ByxQKsmtiz8WU6k7kn9EkVxkF+HgLUfBoP2sg/BejbsfLKA7Kxys/0FgBlGaI4aKBUOIbZ3UZYJQv8Bc8WeW2/fG0X4A0MdJuqnP4k6NwliESnLLWvTFoP4ypuQgus+e/iNfkBGRhUWza+V3wKhR5GOLdmyoE0Ub9fjKbOFk2BR46eif8CVTABEU83kSnDSq3621OzCswtELWEJR2vQ5BplY6O6Cgaio6Cuwi6EVVaLUaHxste+LYBATDcOJQ5KxFOk0lSoLybMUWWN/jIgOQ6tIROd8+oMisdJttMbklKLlRgBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7687.namprd11.prod.outlook.com (2603:10b6:930:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 12:45:30 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 12:45:30 +0000
Message-ID: <9bf81fd8-7f92-4f43-a4b0-109c3e652314@intel.com>
Date: Thu, 18 Jul 2024 18:15:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/5] tests/kms_plane_scaling: Find display mode
 fitting in BW
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
 <20240718111146.665240-4-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240718111146.665240-4-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: b527b685-a110-474e-2750-08dca727817f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlRKaEdRdnE0MkpQcFVnTlY4VVhsa2tMa0FlYmM4M0krU05oeno5SnI2dVlG?=
 =?utf-8?B?SnIvRWYzb3R3QmhZRk9kbWZSTHJGR1NiR3hTeU85clpHM0RDcVhlYTZjemgy?=
 =?utf-8?B?cXVMWHVKUERwdDF4MjhLdGZreVBmWkxreEFaZ284a2UycVhDTkh6WlJoWkRn?=
 =?utf-8?B?VEhkYmFIMFVsb1RtRXlrZnBNOVNMMUZ2cHFlNStVTVhjTGFQY0pIeGVFSDVp?=
 =?utf-8?B?RmVDL1drdnAycXBYWDlZV0Z6UTZNS0xId3FWUW1pL2RLMGR5QUNQY3JJTHQ4?=
 =?utf-8?B?QnNSMklyQzNsdDNyTGRjdjRtL0xLUzEzSGlHb0xGS3VkeWNSM0VvYUltVU9I?=
 =?utf-8?B?R0lyWS9QMC9qTnZvTURsdCtQM2FtREJLSjNFQVlYbHF3MklodGtnNVo4SXJM?=
 =?utf-8?B?ZmUwZVdoWDNxazQ5a2UrczRlY1p4UG0rajhOWTk1VDVhZnoxbnUwaGxVb1k3?=
 =?utf-8?B?NzRJeStIOVlrZDZ4OTNpVmtvMk9RTWw5aHIvWHhSOHI0bDRGdGF3dGtiWUZG?=
 =?utf-8?B?MEp0VzF5cG9xOGd5VkJUZjVDMVdSdkZGV0NZSGtIRk1TMEcrRmI2NUJnL0xP?=
 =?utf-8?B?WlJhS3c3aEY0cGp4eXI3UHA3OEw0S0N3V1R6NjcvaUFENzlzcFhvS0FGRUJX?=
 =?utf-8?B?S1BlOStXNUVlaFdlM0JPVVdzTTZVUU1hdkJBejIrNSs5QTM0R29Gb3dtemRZ?=
 =?utf-8?B?MC9XR1BXRjFNUHIwenc0bkN6ZU9JblRqbWlvN1g0QkxDUGxyMXdreFl5YVpD?=
 =?utf-8?B?WEpMaVVhbWdxLzg1S282NDNEdDJueSsvTEJuN25TYTkxbDBhV3FGdXlmR3Z2?=
 =?utf-8?B?L0w2SjE0RlM5R1pLYXFJSGVaS0E1Y2FYZldPZzdISmxVOCtUZm8wS3RFb2NG?=
 =?utf-8?B?RmQ1dk95bjRDTElOSC9kVHdUVGxKNzNJUFA3cEtvT0hINnp4aFZqeTlKU2ZC?=
 =?utf-8?B?dXNRL0RORmpITkJTWjliVnlmSGJJNFMrYno4aUVObm9JQmQ1QkxuamgrdjhW?=
 =?utf-8?B?RzFUaU1rOFM2YjkxclRLMGRYTmxFWmtPalNsanhNc29NVlBWenV0U3BvYzBL?=
 =?utf-8?B?dStjNjRpdm5JNGxEOTBvQ1VGeTdHQnlmMi9wRCt5b1dwMmlDcEEvUmU4NzJ3?=
 =?utf-8?B?V1d2K3FuRDdYYWZVM3pyNVFYVEppL1JiNm96ZUhWZW81YXd1MmxpUzd3czk1?=
 =?utf-8?B?Y0tJNU01bno1Y05WRzRjaVRNbmRyRit1aHdqSHpJUHB2bk5HYUVLRGJFQUFU?=
 =?utf-8?B?bkZjWTZSQWFGTGd6dzRsOGdJM2VHS3hqM0JXTnZndTk5WGVmWlZtYkk0cVk4?=
 =?utf-8?B?UkxVanZWaFBFZkdsUjFJSEJ4cHpXam1xejlURmdMbHBPMFJhRVl4UkVscHh6?=
 =?utf-8?B?K0FCeFBRK1o2RVpYckpRdjFTaEt6Z2FUalZoRGwvVDl1UXVzMCs5WnNleTJ3?=
 =?utf-8?B?R3FSZkRlYmJ2aHhxbGJMOGVuU3g3ZjhFSkJ2WjJ0dU9ERHliL3pIZlFFK1dV?=
 =?utf-8?B?ZVVnZXN6d1hmTTQxakJQYUdHUnJsMVp6SlZ2SjNGeG92S1pzUjVJYlVxWVdn?=
 =?utf-8?B?WFBIOVJBdXZTREFqNjAxWkNCdHhmT2M5RTJndTFIMW9oUGpsdUIvbWx4Yk1m?=
 =?utf-8?B?d1Z1VmhQM3NuT1d4Wkh3cVhxdlVmb25LaHN6dEs4RWpNekZDME5SYmppYjBX?=
 =?utf-8?B?c2FRLzBpTVpvSUVlRmoxbFQ0U0d2VkRRYys2U2cyTFZpMEx4cXVLd3ZjOFZ0?=
 =?utf-8?B?NE91bXlHWFkxN1B0cXIzNUdpT3hNZ29TRGwzbXR3OHJyNUJySXpRQ3NwOFEw?=
 =?utf-8?B?VDdTbVRxVG8weVo3Tk9wdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzE0dkxRdWlDaVU4eW56MjRmeHpnNTZhWnNib0dCMDBNNFlRY1lYaEVLQ1Bo?=
 =?utf-8?B?NnpkMHR3d0prY3pxMlA4emtGby90d2doN2FFZHR4c2hva2ovTzBBeWROSW15?=
 =?utf-8?B?VXJIUVdVZDQ0U0VrQ2t1ME1OMWdpRmZGdHQxTkorbkZFbmFpY052MDU1TUVw?=
 =?utf-8?B?Y2JZaE1GVnc2TDIxYXJxZFI0U1FjbC9kZmgvajdoZGZoUkcwT3BrazBXMFpL?=
 =?utf-8?B?RkJWTFBrbUVXTUJSMEJuOS9iaEcwWW9hekk4WVNSMDZiSWxjaW9Va3pQTWRs?=
 =?utf-8?B?Z3MyRXc2VnJOTlNMRGhPTE04ZHhyZExWZ1doeUQ5N3Y0YzBJMWFGeGEyRTFI?=
 =?utf-8?B?R2g2c3Y5R2wvUGU0NlE2bTdTZTVneGRYcVJRZTMvNVFLVlNCNU1MTmRUSGFj?=
 =?utf-8?B?bVNUYTMxMTdBYzRvTEFXMXhqN0twaTcxWVBnSyt4NmVuSzBvcWdKYTVNRmdS?=
 =?utf-8?B?ZWlMblZHaE9YWGRpcHRDMlZ3OXFsVEw1Q2pLZFJHZXhrSjI1cjFQQmNoUVg5?=
 =?utf-8?B?U3BwUHcvVEFHMU5JQ3c2UWI4QnNQOWgvS1VUblB4TkVqeHVXUWJFN1ZvTXpj?=
 =?utf-8?B?VjdvK01YM0I5U201aGtaUEVxM2F3ZmhQSTEyOEdwUTJUbDYrdVVJeG5rcmda?=
 =?utf-8?B?S2FVcTd5YkZEV0ZxYzcwMy80anovWXpMYldzNW5mcGROamxDL2ZZNE5GdzBi?=
 =?utf-8?B?RFNKdmpMVkYwZFpuRXpBTEY3S2ZNYnppUkZMbzJOQ3VRUUU0aTNYaWRJZGdq?=
 =?utf-8?B?NW05WlVSUk5CdlVaT3dVRHk2M09RV3ZpWWJud0FxdkZBemM1WlpxcVQ0ek91?=
 =?utf-8?B?YUEyd082VmFXUTlOVWlFUzRZSlJITXdYOGtnWFd6RlVrUEZ3SXY3OHVDU2Zy?=
 =?utf-8?B?SnlXYy85YkNaOFpXeWVEYTFMc0pYZjNTUWw5MXRVYkJLMEUvbjBvTDN1RzAr?=
 =?utf-8?B?UEVTQzNJTWl3emhaVTRJSzFHaXNvVG9sZ0V5bWV6RXNBby9qRm1oYXRlOW5s?=
 =?utf-8?B?alRmUjJoZnBSL2VGeE9keHNJczBQMzR1aU9SU0xUcUthZUFyYUd4RTBJdHlX?=
 =?utf-8?B?Ym53alVGcUdSOUUwdWRYK0RSZjlqWnNoYzZsdEtnS0NMRU9uYUtMbUN5aWhn?=
 =?utf-8?B?d0prY3RJRWN0WmRMbFd5ZE80WU9ZV0NVc3RqMmtWRHdubWEycWE3andBQklT?=
 =?utf-8?B?c0lPZkw5RlJHNDM3dUM1QTFVNmV6Q002ZnNYL0tNN1E3dDdNL2JRVW5ZYjVD?=
 =?utf-8?B?bTlLZzJlRDFDMys5RWxJanVsbEx5UTFrVTBlSG9tU2MvTnJGN0dWcnVTYzhC?=
 =?utf-8?B?OHZYY09jcytXZ0o0SXFhWm5kVmsvbmVWMEhrRGVnbzZERkIrYURpZDQ1RFRI?=
 =?utf-8?B?bmlTaW9YN29SY00xRDUyTkNHS0RJb0drRXZyWWh4Sm1kRENwTFdwelMrY2dC?=
 =?utf-8?B?Q2JhU2E4YzFGNURRTU5QYnJCbS9LTzkxYzUzRy9FdWROOXFGTk1oeWFCM0tm?=
 =?utf-8?B?TVo0QUVnQlN0V3FiSGFJZGQyTTdLbGtIOW8wNTlmQnp4bzNtS3phQ2FFcExQ?=
 =?utf-8?B?VlpxSlpOYnhpcTFXN1hzcnVnOUdYUjh2dkNLM1JSY3IzbGRwQk1NN3JZMTdZ?=
 =?utf-8?B?Wk8wbTdSV0F6U0pGMXptMWcyc29pclc5bVk0dGVzTmFtbnpodDFOU1ZqYllq?=
 =?utf-8?B?c0Q4c1d1YnBaTndYL0lWRGVFU2JtazZFN01DNVZiMDdKNytLaFBqYS9vU0kv?=
 =?utf-8?B?MEFuUlpMRS9ZeDh4RkpiMXRaL2JhZmdZalRpRHNOQmhFdTl0MzBBVklwNUtp?=
 =?utf-8?B?czJzTHNnbFB4Vi9INGVtMGJpY05vOXBTY3pwRmU0WUtpenZEZlJaY1dEb29C?=
 =?utf-8?B?WTR5aklnbitCdzNFTWd3Z1NXWlhydGtPdUdxcDRYa29nTVFIc2NSQ1Y4TlZW?=
 =?utf-8?B?TXBwak16OUFIMWRuN0g3aTZrcjlEcXhXU0xXMkxRVWRZSzVyNEZvRHVzQjJr?=
 =?utf-8?B?eFlTMmh3QkJTRVMwdzkzTnBSWDNRMTNHbzhGd0JUS2JVT2hqRzFtUUpxSmMz?=
 =?utf-8?B?WWhncUtTVTNqVzFDSmZIVFVaOEhnbVNMNHlqZkV3dS9mdkswTCtYaWpMaFJa?=
 =?utf-8?B?NWhZL0swUW9jZHFVRFppRjBMcEY2TEUwNzY2L0dpODBvOXZnT01CVTdaYUsz?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b527b685-a110-474e-2750-08dca727817f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:45:30.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4yF67VmQyWmkmV23+GUV0yC4aG4dbk4GGp3Hz7kZPNpvKknB7Pu7I1CTEO4Bd3WSALs0MzIMjxGZpC+b8p7ZToHIz7ENradBSMzMhCsTgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7687
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


On 7/18/2024 4:41 PM, Naladala Ramanaidu wrote:
> Ensure compatibility with driver scaling restrictions by setting
> lower resolution for downscaling. Adjust test_planes_scaling_combo
> function to lower resolution when cdclk requirements exceed
> platform limits. Address issues caused by cdclk exceeding platform
> capabilities.
>
> Example for failure:
> [drm:intel_compute_min_cdclk [xe]] required cdclk (1066500 kHz) exceeds max (652800 kHz)
>
> v2: Fix some styling issues in the patch (Ankit)
> v3: Split single plane and multi plane scaling
>      functions arguments in separate patch (Ankit)
> v4: Split single plane and multi plane scaling
>      functions in separate patch (Ankit)
> v5: Add return value to function __test_planes_scaling_combo,
>      update test_planes_scaling_combo function, and add
>      igt_debug prints
> v6: Update commit subject/message and add return value on the
>      igt_skp and igt_debug print (Kamil)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 105 +++++++++++++++++++++-----------------
>   1 file changed, 57 insertions(+), 48 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 8a69aacfd..2c4490fd3 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -857,7 +857,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
>   	return pipe;
>   }
>   
> -static void
> +static int
>   __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   			    enum pipe pipe, igt_output_t *output,
>   			    igt_plane_t *p1, igt_plane_t *p2,
> @@ -899,9 +899,10 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   	igt_plane_set_fb(p1, NULL);
>   	igt_plane_set_fb(p2, NULL);
>   
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> -		      "Scaling op not supported by driver\n");
> -	igt_assert_eq(ret, 0);
> +	if (ret == -EINVAL || ret == -ERANGE)
> +		igt_debug("Scaling op not supported by driver with %s\n",
> +			 (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +	return ret;
>   }
>   
>   static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
> @@ -923,59 +924,67 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>   	drmModeModeInfo *mode;
>   	int n_planes;
>   	int w1, h1, w2, h2;
> +	int ret;
>   
>   	cleanup_crtc(d);
>   
>   	igt_output_set_pipe(output, pipe);
> -	mode = igt_output_get_mode(output);
> -
> -	w1 = get_width(mode, sf_plane1);
> -	h1 = get_height(mode, sf_plane1);
> -	w2 = get_width(mode, sf_plane2);
> -	h2 = get_height(mode, sf_plane2);
> -
> -	n_planes = display->pipes[pipe].n_planes;
> -	igt_require(n_planes >= 2);
> -
> -	switch (test_type) {
> -	case TEST_PLANES_UPSCALE:
> -		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> -		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> -		break;
> -	case TEST_PLANES_DOWNSCALE:
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> -		break;
> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> -		break;
> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> -		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> -		break;
> -	default:
> -		igt_assert(0);
> -	}
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		igt_output_override_mode(output, mode);
> +		igt_debug("Trying mode %dx%d\n",
> +			  mode->hdisplay, mode->vdisplay);
> +		w1 = get_width(mode, sf_plane1);
> +		h1 = get_height(mode, sf_plane1);
> +		w2 = get_width(mode, sf_plane2);
> +		h2 = get_height(mode, sf_plane2);
> +
> +		n_planes = display->pipes[pipe].n_planes;
> +		igt_require(n_planes >= 2);
> +
> +		switch (test_type) {
> +		case TEST_PLANES_UPSCALE:
> +			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> +			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> +			break;
> +		case TEST_PLANES_DOWNSCALE:
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> +			break;
> +		case TEST_PLANES_UPSCALE_DOWNSCALE:
> +			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> +			break;
> +		case TEST_PLANES_DOWNSCALE_UPSCALE:
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> +			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
>   
> -	for (int k = 0; k < n_planes - 1; k += 2) {
> -		igt_plane_t *p1, *p2;
> +		for (int k = 0; k < n_planes - 1; k += 2) {
> +			igt_plane_t *p1, *p2;
>   
> -		p1 = &display->pipes[pipe].planes[k];
> -		igt_require(p1);
> -		p2 = &display->pipes[pipe].planes[k+1];
> -		igt_require(p2);
> +			p1 = &display->pipes[pipe].planes[k];
> +			igt_require(p1);
> +			p2 = &display->pipes[pipe].planes[k+1];
> +			igt_require(p2);
>   
> -		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
> +			if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
>   				continue;
> -
> -		__test_planes_scaling_combo(d, w1, h1, w2, h2,
> -					    pipe, output, p1, p2,
> -					    &d->fb[1], &d->fb[2],
> -					    test_type);
> +			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2,
> +							  pipe, output, p1, p2,
> +							  &d->fb[1], &d->fb[2],
> +							  test_type);
> +			if (ret != 0)
> +				break;
> +		}
> +		cleanup_fbs(d);
>   	}
> -
> -	cleanup_fbs(d);
> +	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Unsupported scaling operation "
> +		      "in driver with return value %s\n",
> +		      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");

Please avoid breaking the message string into two lines, makes it 
difficult to grep.

With that fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>





>   }
>   
>   static void
