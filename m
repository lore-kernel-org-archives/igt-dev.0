Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA6C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 13:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0310E2E5;
	Mon, 27 May 2024 13:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHKAQe7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D20D10E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716815106; x=1748351106;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y/QxS0lWpJehCX5RFzWuxmDH+wdaCqZebYrt6HL9tYE=;
 b=OHKAQe7yibBqh8qxGKI4F9cPp5YzkRUNOpfta2TUs2fh3UgN5VJPsJyV
 jfeMbMqSLGcp9hcHzJ6oZsGkH8+tsJK5UFZfoX6KGCxePsH8T4aLmr5ib
 xDl+aCqbCzo/u7U6QvHkBLtdqO1P4AVqGr1SJOdQ9n3GWlshGkUj8r0ex
 UoFSwusOIOxT5K0x2n1ZCBdOnu4MFJRhiZz6P0iD7Gkn1F4P+LJWeCVMZ
 CTsbAXgsMt3XJw4H9Mf9DbqtO7UJdoOpIUFv0ykBGC5t47CSUusGmVeu/
 4tA8gudcWQf+jmGPiyRhQlRsah6AJfh+5smYKxfnvDZYQkjbqS2g8xWgN A==;
X-CSE-ConnectionGUID: kybh1YwtQbiuI5rZiWsXzg==
X-CSE-MsgGUID: s3DoZGLoSomwrFMnR6IlIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16960692"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16960692"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:04:11 -0700
X-CSE-ConnectionGUID: kjazdVIlQq+zOVEGKCWorQ==
X-CSE-MsgGUID: g6mrPs0jR/K8KLljOV3qDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39201227"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 06:04:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 06:04:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 06:04:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 06:04:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 06:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V49A08cdlFPqpLGksT261J7MsZJ92RhI1KPVxzfMvaNzN8w2SI9JUmbSueFykhNrrGZWMGaCMViiT94giPA0iuWtSGn20+JL6d6KjGEDeiNXO88lz9WYbubzjDqumGrXv8A47FOEoohzeISHHwtuM6CmAKpeLnPWIXtQzwLY2uqujeqQwfqydrUkf+1RYFLy34dh4LWjWpGdXzB/Ea5LukHMngUydU36pIiAkWHQigXnPnhos1daJ4yueYRfKTm6notckkMcjN5nOUeImsRCj+pYOLjrmvINceGvXXWk6pncFUW6DBMXo6PyIfm4AnGcK1jlFGfau7cAnb8j8hq8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJCH2uJxjS+VWthgYjneLQyzkRRTeGyqCJR8z5KqPK4=;
 b=B8YO/Kgx+q000fMnRY9PzDdDQYKBoMYEzTwbhNmgc86AGxdeIbZ696I5DpsTt/fmfC0X/7zGCj+yp7z3OOnAhP7i4I1AmlXBXEwVt1AE64PBqIpwjVkDVKRtHgXqVz6cRc6QNwVDMWSBku2s8mdbSiCIVJLkdGi143EahJwWo+q6i6VHUQabjoVDsAemi0T9eCJuUtqTMTbaATuTqsfeGWmuHc69kfV3icOESVlH+V87eZDQXFA4+Zo3r+j+2iKgWuocN/foSlOAZcY5NZpQsXtM9fsuyRdMKalyRI+ZCJAF3k7ZlGQPWYz0z6vG2sBwrSAg4GeXBsADqItgDqu3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Mon, 27 May
 2024 13:03:57 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 13:03:57 +0000
Message-ID: <3413edb7-7a96-467c-8bf0-818cf107b7c0@intel.com>
Date: Mon, 27 May 2024 18:33:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>
References: <20240527102118.523796-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240527102118.523796-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f88fb22-39a1-4f5b-d4d7-08dc7e4d77d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2YzRGYzNnA3NmlwV3NtbFA5MmY4N2VVbzRMK0J2RWpMVjdTTTliMFh1ZXcw?=
 =?utf-8?B?bVp5WEF4VEd2YzNZcDhpbEp5c0xyMmlEbG5ab3FPWFJlVHFhSzJlL0RsdDNw?=
 =?utf-8?B?aGl6dFNmSG5tcUlWVlVNUFNYbVpNWHdrNE45Y3Q3amJoN2ZIcDFzYUFBUGdM?=
 =?utf-8?B?RzNWaXBGWUJzZE9JTmJpVjhQOFNlWmZsT1hUOUJLNS95YkpxbUxKM1hJcDBw?=
 =?utf-8?B?cXZBTlhjQWVvYmhjVUVHZlBJY3BZMTBXcGlMb0JKSU0rcEtDRDJSaWZ1NGJz?=
 =?utf-8?B?VmFrNHBMeHdpcC81U1hQSCt0M3BOd21adnZ5eWlLR3cxN1lEaDFoZlJFR1Rv?=
 =?utf-8?B?cFh2dENObk5Xb1I3Q3JLSDFSN0ZvLy9jVnpoMlZkNGkzanN2ZStRMS9oc1Jl?=
 =?utf-8?B?UTBScE5YNFdTZUl5aUdzY1dRYVZqZjlObWh1bzJDcUhMSFhiRUs3eHdhQlBQ?=
 =?utf-8?B?NnFodkt0MFVzbXBIdmVCTk0rSEFoUTlFTDU5UzdiQVhyaW1CUm50RW1zbWF5?=
 =?utf-8?B?SGc4MXpraG80ZHNHVGRzWG90QkJtanN6V0hSa0o4QVZFQVlya3ZGMmdiR2dZ?=
 =?utf-8?B?UHBZUjlQWnRvTUZrZVUrWjZNODkwSTIySVA0N010RGRWM0N2UzFTUHU4dWls?=
 =?utf-8?B?YTVSdUtyZTE4S2R2bG03M2FhVU5kWkcvTFlJeE5EUjNKYnRDR3MvZEpiRW03?=
 =?utf-8?B?RTNrN1QrTFI2cFphQkhKVVdlYndrUGY4dEY0KzVkVFV2bzlGNHZnYi90MkFH?=
 =?utf-8?B?eWJNTlh5VW5MdkVVRmt0NGREQUhBcVJGZWhaZ2dBSTJqSWNqU3dzWkk2MnFt?=
 =?utf-8?B?UnhMN2JDU3RNKzJQOTl5Tnk0NDJPNHRTMmx4NGdsc2xMQlI5Q0ZzY00zRFRt?=
 =?utf-8?B?eXVKVFJDTXR3bHlmS3dEWkZqUmVnSmhscWJGbkQ4WjB4WjIxRW9HdndhZ0dN?=
 =?utf-8?B?OFA1cG9PN0hGMzZnVXFkMjNrdnR1UjRkbld4eVVPbmNNYVpZNTd0WUdabUlR?=
 =?utf-8?B?ZFdDdFphYk1VQ0I2TFR5ZHRRWU5leTBnWWtlYS9qekczcUNHVk14WUgyK0hK?=
 =?utf-8?B?dmJGbmJmWjd1b0FGU3FXZUkwUDFjOFpZUUJ6M3NJemFkaXBCTWZMeWVSdmcr?=
 =?utf-8?B?OGxWSFNHWlozRG0yd2paWFg2eTJiYU1DaStZSnRwdDkzOXVnODBLbkRNL0Js?=
 =?utf-8?B?MlNkNHlnbkFyT1ZML2NmZGRjdDBxUmZmaWZYV1JHQ2MzdnJKNk9VSHpuNmJl?=
 =?utf-8?B?Qy8xYkZSaDlJaFlDb3ZTWmRFUldMZGJDRHEvaUdnMzNXSUR5c1hkNVErdHVu?=
 =?utf-8?B?ZlFEanZZSExxbVNNK2xVekdvb0hOMjYzVW15MzROaWxDWWlXMXYyMm91RlQ0?=
 =?utf-8?B?NWtqbkhjZEJlNkhEeWIrN2t1RTlMZ0w2RTVSNTRYRXI3NWcrZmFmbCtMNEhX?=
 =?utf-8?B?TXAyWFNGbW42a3hycVZZR244NXc5TWdWUWFST29jQ0k4d3pVTzZmb2JrdlVQ?=
 =?utf-8?B?a1ZSYVhzVzhOQnd6Smlqc21DalhOcHpkYjgyUzh6Q2x3aXRxVGRTRGx2Rkxm?=
 =?utf-8?B?VjFjaEdNaTVDWE9tMUp0RGJMRytlSDc2ZHJyekpyVGlXZGxJUXdzcGM5OENr?=
 =?utf-8?B?TkNEd2hEWGhHdGRsN0RNTWsrV2dPb25nMFB4c2NUaS9qQTRSMU5veHBQVkNC?=
 =?utf-8?B?dUxnRndTdTVxcWMxbEhLNXdYOEczSTFqbkFvZDI2MldHNzJLdGppeFNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFBDL1R3Tm0xVWdFTDFTT2x0K2ZsUkxneHFmQUZZY1FtLzNESG1rTDk4U083?=
 =?utf-8?B?M2JUQlErU2QwWU91dWV2ZkFWTk5lQkJTdldHanRjQmpiTlRPRlVsc1huWXBr?=
 =?utf-8?B?cXNxOUcrY2Z6LzZBK3VOSGwyUlV3OG5WN1k3OGRWM0NHakNLUlZhZElsUGFx?=
 =?utf-8?B?dktiZC9JaUNLSkNkRHdObXR3S2xGcmVNdmxDUVhuWjVweDNsRW9pOVZUOXlQ?=
 =?utf-8?B?Z1VWZXZqV0JSWTJRUUFZNW1UYlM5QTVVMmdIV2ZFaFJ3M2ZUQmNvT0NFcERQ?=
 =?utf-8?B?c0syb2ZyL3pzL0JPS1VEWWV2eVAyV3Q0ZTI5VU83Q1htTkZzSmdFMUYrdEt0?=
 =?utf-8?B?TFJLeTlFalBLdHoxOGZSUWJLRjUyRCtvQ3dwaUN2REUweEp3cXIzWWJFZUN5?=
 =?utf-8?B?OTIzTVVxRGhDalBMeGtaajREQ0paRUp1V1FoN2JLSGhMdVRIUXpIejlHOUo0?=
 =?utf-8?B?V2diSzBtcGFXN3VjQmtJNXlVcDl0U2FJM1VYcjlEWHppVkh1NWNPV2l4UlNX?=
 =?utf-8?B?YitlclVEMjl5QXlxVW43b3QyTXVGUzhqRXU2ejI2QTA0MnNYemtlNGFHcTNH?=
 =?utf-8?B?c2RyRTRtcXdKQ2dXMjlIWEVtR29IZU44WW9oYm1QeGE5SDU0Wm5JS3BORGRD?=
 =?utf-8?B?S2hTNlRYbkRlS2trN3YvcEJ3WDJSSHkwRFp2N0ZsUWlOZUxoTXVZcFZJMVl1?=
 =?utf-8?B?MkdtTWZoclhOS205VUpoaGNnT2xOYTB6QVFGbzQvUXplL0l4alZnZldjcXhR?=
 =?utf-8?B?cTJZaThRb2c5dEpTazJmbG9ZM2czbkxQOG1WanRSNUhvRGU5YXU1NDR2aGtk?=
 =?utf-8?B?VEkrL2xCd290cUhnU2NoWnByT0RVdndiK09qTnIvR2w4R0U3MzdaL2F2ck41?=
 =?utf-8?B?UUYrcTJnb2xTN1dMSTg3T2s3OUYwNDZ4dlNSUzkvcWRhYzlRRmk2RVBBUEdO?=
 =?utf-8?B?QlpJVStBMmtMek0rd0RaVENDV2FSVG9lVWd2YTZOWG40VlBNeWVzOTQ5T1U3?=
 =?utf-8?B?Z01IeDFZa1FsM21vUk9sQldwZ3ZUK21FR1VxajY1L09HZDRjemx1MFczbzV3?=
 =?utf-8?B?VkUydEdpQXRpYzhIT0Q4R2NmSnV2aS9pQmUzd3V2bkM5S21HZjlrMlp2bCtl?=
 =?utf-8?B?VS9mM2xwaEx2OFNMYWRvUyt0OXRNYTBNTlI1aXhubzQzTWdEOTVZYWZVL0xX?=
 =?utf-8?B?d0w2ZEFEVnh6d3VZMnVURURnTDI4L09MQlNMbDhBV3A2MWNlMS8xenFsZUhN?=
 =?utf-8?B?blM2dC94b1NkZ1ZmVjVyS0MwSmk4QlYxazh0QkQyYjBtNE12WXlwcStsQlRU?=
 =?utf-8?B?dlVTYnlITWN4R01qYWZpbGNoYnFHeXcrdCtkOXcvR1lwTjJZQlM1bEM2MmNU?=
 =?utf-8?B?QURwNjRTZ0JuQjB6d0puZHRFQ2JYT0w5bWc2QTFUbTFhVEZSblp1eUgwaFFi?=
 =?utf-8?B?a2J2dFIxbU93MTJoakgvOGhmYjM2ajlrc2YrZVFRazBRN1RVeWRWNVpZVXh6?=
 =?utf-8?B?dHlvamNFUWxiU0VXb3FFVk1OekJNZ1l2YWRJNHQ2R2R0QmRsam0vZEJTTHZO?=
 =?utf-8?B?VFdLcXRkZnlRbnRKSnJ3eWRIU2RKa29SWjdyMXphekxoTWxEY1NKanljZUZk?=
 =?utf-8?B?ck45VHdSK0FLTFNONDRhR3F0dmhLbzJGRG55b2cyYmFZeTlvT0ZhZldEeUNH?=
 =?utf-8?B?YW8zazN0UEo3YVBuNERxNzB4aEZLMkZKKzVOWkw4R20zZU5lZWFNOWdTTEZX?=
 =?utf-8?B?dmFOVWwwdFVzL1pLSE56UGhZZDBFR1hkTG40a0dVdzY3TzVHRVlTeThxOWdL?=
 =?utf-8?B?VUZvVjJoVFgwMDFxTktMbFRFK2FFcDN6VldlakZpK3hEQysvOHltRktWSFFT?=
 =?utf-8?B?QUhubGlqbkdQcTVhdm5tOFJON2FCYXdGWUtXSVJaMlhZZ2RGdkJqYTA3TlQx?=
 =?utf-8?B?TXIwRUJmOVl4NjBWbThyOUVlaG5Wakx1eVBQb2ZhRllvczVJY0JZa3ZzcE11?=
 =?utf-8?B?WEFack9tRHozSERKZEdHSk1kNE8vR1FsMHRpS0JObzVwN3RVNHJ1OHZISDlz?=
 =?utf-8?B?cGxRYktwaStVQVp1YUo1aGFEeHdpRFFQKzdKdm9IazFPbFhjQk9OaGpNNVZJ?=
 =?utf-8?B?UCtXK3l6dVN6cWxWbTRqT2xyMFdzZmh0WFRhcmFRT3V4eHdYYUdrSGxMN0ow?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f88fb22-39a1-4f5b-d4d7-08dc7e4d77d8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 13:03:57.1256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF+FkmS8iYuaj0V6gXHEbssWvu8D6M4zJLJq8ZppB1k00xBb2MigwnUidEaQ8y2xqZy/VufZjmaxCYplPdTUCLzPSIhS31b7LOMW4RI1QAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

Hi Jeevan,

On 27-05-2024 03:51 pm, Jeevan B wrote:
> Add a new test to validate deep sleep states during extended vblank
> scenarios, where two frames are committed simultaneously for a given
> time with reduced refresh rate.
> v2: dealy of one frame added to simulate extended vblank.
>      remove vrr related debug checks.
> v3: fix typo and add define. (Suraj)
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 54 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 7766d34d7..f7989ed47 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -76,6 +76,10 @@
>    *
>    * SUBTEST: dc9-dpms
>    * Description: This test validates display engine entry to DC9 state
> + *
> + * SUBTEST: deep-pkgc
> + * Description: This test validates display engine entry to PKGC10 state for extended vblank
> + * Functionality: pm_dc
>    */
>   
>   /* DC State Flags */
> @@ -89,6 +93,7 @@
>   #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>   #define KMS_POLL_DISABLE 0
>   #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
> +#define MSECS 1000000
>   
>   IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>   
> @@ -584,6 +589,46 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>   	return get_dc_counter(str);
>   }
>   
> +static void test_deep_pkgc_state(data_t *data)
> +{
> +	unsigned int pre_val = 0, cur_val = 0;
> +	time_t start = time(NULL), duration = 2, delay;
> +	enum pipe pipe;
> +	bool pkgc_flag;

Please initialize this flag with "false".

> +	igt_display_t *display = &data->display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		igt_output_set_pipe(output, pipe);

Please do igt_display_reset()/igt_output_set_pipe(NULL) before setting 
the output to pipe.

> +		data->output = output;
> +		data->mode = igt_output_get_mode(output);
> +		setup_videoplayback(data);
> +		igt_require(igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE));
> +		igt_require(igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE));

Check for the config capabilities before setting up anything.
(Move these checks to just after initializing the loops)

if (!has_vrr_capable || !get_vrr_capable)
	continue;

> +
> +		primary = igt_output_get_plane_type(data->output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		pre_val = read_pkgc_counter(data->debugfs_root_fd);
> +		delay = 1 * (MSECS / data->mode->vrefresh);
> +		while (time(NULL) - start < duration) {
> +			igt_plane_set_fb(primary, &data->fb_rgb);
> +			igt_display_commit(&data->display);
> +			usleep(delay);
> +
> +			igt_plane_set_fb(primary, &data->fb_rgr);
> +			igt_display_commit(&data->display);

Why do we need 2 commits, lets simplify this as below:

                 pre_val = read_pkgc_counter(data->debugfs_root_fd);
                 delay = 1 * (MSECS / data->mode->vrefresh);
+
+               igt_plane_set_fb(primary, &data->fb_rgb);
+               igt_display_commit(&data->display);
+
+               flip = true;
+
                 while (time(NULL) - start < duration) {
-                       igt_plane_set_fb(primary, &data->fb_rgb);
+                       flip = !flip;
+                       igt_plane_set_fb(primary, flip ? &data->fb_rgb : 
&data->fb_rgr);
                         igt_display_commit(&data->display);
-                       usleep(delay);

-                       igt_plane_set_fb(primary, &data->fb_rgr);
-                       igt_display_commit(&data->display);
                         cur_val = read_pkgc_counter(data->debugfs_root_fd);
                         if (cur_val > pre_val) {
                                 pkgc_flag = true;
-                               continue;
+                               break;
                         }
+                       usleep(delay);
                 }
         }

> +			cur_val = read_pkgc_counter(data->debugfs_root_fd);
> +			if (cur_val > pre_val) {
> +				pkgc_flag = true;
> +				continue;

If PKGC states achieved, we must do the "break" instead of "continue". 
Right?

> +			}
> +		}
> +	}
> +	cleanup_dc3co_fbs(data);
> +	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");

It'll throw an error if there is no valid output found, instead we must 
skip.

- Bhanu

> +}
> +
>   static void test_pkgc_state_dpms(data_t *data)
>   {
>   	unsigned int timeout_sec = 6;
> @@ -687,6 +732,15 @@ igt_main
>   			test_dc_state_psr(&data, CHECK_DC6);
>   	}
>   
> +	igt_describe("This test validates display engine entry to PKGC10 state "
> +		     "during extended vblank");
> +	igt_subtest("deep-pkgc") {
> +		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> +			      "PC8+ residencies not supported\n");
> +		igt_require(intel_display_ver(data.devid) >= 20);
> +		test_deep_pkgc_state(&data);
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while all connectors's DPMS property set to OFF");
>   	igt_subtest("dc5-dpms") {
