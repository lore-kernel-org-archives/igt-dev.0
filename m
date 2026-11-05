Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21925606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b/XY3GHH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17C110E294;
	Thu,  5 Nov 2026 14:37:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D6B112418
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793889389; x=1825425389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ueL8AbuiWPbM6AKXSqQS03lfB9W1D0C4SJGcBiq/CCA=;
 b=b/XY3GHH8+Zkzx4RGtmgzxq4G8nWQG/un8Pgtjho5xEtz2F9S7GuNXqv
 xuuBDiDQb1nUT/oxF6gMXdwEvLYqbQCBrds8bEIpmY3e9rZ+wlzWe7Bfe
 h9IAVkvKkvX1LfHfrFMdbqoiK0fUdXwU/B7YLxeYlVuNWUO3ufMYxYRvY
 hD1i1biJMYX4BGBqiCTqm8vOFaz2c0u2vnFe3z3ULkQ3dwJxhltKfz7j+
 2gLBR52K6KCGcm4Sv8TGhU+cOpyDS7bvuOEUzCTr9CPzLM+B6MAnQz0Vq
 XV9kJGxR47/ktnFx/s/2+H4fMEG9Iooj4EzuABWDU3VJOoWd/ryna5G40 g==;
X-CSE-ConnectionGUID: xSjdOEOyShqj2Ni74FFHMg==
X-CSE-MsgGUID: +t7X6jxWT7KqnN7UbVoBvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2549864"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2549864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:36:29 -0800
X-CSE-ConnectionGUID: qSyFunFdR+OBe+tmOkS8Fw==
X-CSE-MsgGUID: j8aYKX3qTZ2moXlvJvjjyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6933218"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:36:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 06:36:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 06:36:28 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 06:36:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDcvbeMnreoSRYqkzEvBiVF0FOCPluu56IreCqGqqUlLc2mOyLfZbHIReObM1TfyUza47U36LqU2MKqqPEtIZ8SNfHwT8pEpgEv6C2BUZ8+h6tBeGHsTF5DYN4mcmKPeT4WCMLCo6TKtjMe68bcrWrfjhRl61ZSXPQ27rQ4OGVe+EoZ2WHUUZfUXaNy5L49FeTAdOPqW/yONOPPTQp7X6LaHqNaliBwDlvhnQwa64rk/ULnLRmUtoroKJlybM+k48S9KJd6gI0E+egTMUsXOVRrexFKQLMBleJSiUFB3m8uycE1UvRIz8t3nB/FDzQ1Y1kE+K5Jn0u1iHhJazn3Ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV11fkri0K8dq+yje6VGJFupUPPzec5EPBdRJWg/CT0=;
 b=n1VVEsiipIiMQZDN1PvykHRpb+i3ikuqO/iYv6dVXKAvHNuCR06dK0cuifry94xNwttKk4x+IUBwPMlcAmchGSsOqH/qe/dN8BJjfE3SEC5We65GWgcBhbYpTjFo2mNkPX75sjeMCLsvCOOg0t9t5eLeW1h1lsecfD/UR13ODX4oFxeonjn9QvoVxlTnGdxkOLXwqOSinRMDwrwoaTyJx1GcAP009X+03WGVORc1NLGUcy4slZSdr5etE+MmUtTUCXTFbctEMsy1DB7wx2AJJcS4ZExzfnqBm6OK+2wRbjWtasQVeEUVObZieDKMc3prSJXiHFzrVoTRybooycmr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH9PR11MB9904.namprd11.prod.outlook.com (2603:10b6:610:343::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:36:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:36:26 +0000
Message-ID: <4624c8fe-200f-45a7-bc04-b069814b763b@intel.com>
Date: Thu, 5 Nov 2026 20:06:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] tests/intel/xe_wedged: ignore expected wedged dmesg
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261105123002.1368655-4-sk.anirban@intel.com>
 <20261105123002.1368655-5-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261105123002.1368655-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH9PR11MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: e2be4fc4-0288-435b-bb8e-08df3b4a2ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261026140227099003|11063799006|4143699003|56012099006|261021121427099003|261102123227099003|261022105027099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GJgG92GQkxg1Mw0kZdYwvNHx5ubvLeg1BZKtO3kO18HkRyM9xNVjgFGFQlA5MkbciyZXgx98OS8NqcLrUSO8RHHZWHAngaZAYAlrgDPT0U38Wz9krY4h3G4SYgfc4uABXjdRwfuNvGexqA8BvhpxdrD0b+6OdyTML7q1x0S3tYfDyfyWHbu37wsdijDvyvoXInw5fQZV5e65TMMBuNGW6Lkp9U7B0Lpk5xrJAI7yw18FRqih+xfVTYL/vdyK6oiQf3eDZU0Adlr+iwIsAOVvhBcIFHe5d6zA0GV9SiB1LPi0U0QMdhXhp36QtyY2WnBQiX+hV5OJpXqpgEZgCYI2U1D7Q34dmz6vzqU4D/YJ/RmHygnYJAfUqfSc4ME49PTbXc4ZV9fRjhIom8pqspexU9+QveIy+GiMemElNdxydLS14lfb0esBp29y5cVmzhHr6j91ZbdK4g1N21bGfrS8Y0o48jaY+MhR235QsIc2wVpo5VN2f8ryfsvHOLin2iPkWL8MEDuWsI3QrY+pDGeUorGdXfnSoy8yeItaP/DW5EIszpaI9B0uD7HvPH0uEnKqNDFSqAuO89B8cm6nbm+s5kvGDjXTMo/X245i33YOh5uT7NlQajfYJoLonar7NpGeh87d5kMAAY/1Nsn+piOsYIKus4E2laqyhUGkfbpgf5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261026140227099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261102123227099003)(261022105027099003)(261028144727099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWp4WmVyY090ZWN6Zzl1TEs5N3ArYXB1Y05aNEY2VUxETGhVTGZIMm1pY2RL?=
 =?utf-8?B?TTVMUmNSenVudzcza2s4UGlaenRLVkR1bnQ1aVREaWdsblA2NkJuZmhCQ292?=
 =?utf-8?B?Wm5Tbi9HYjM4UGhrZjZGZVRyNTNVWEx5dVlkdlZ4bjdMVEdHRzNxM0Rvc3g5?=
 =?utf-8?B?bXJ6OVlDL0RWejJsR3FWWVdvSWo5OVZPMTNxRW92em9sa1pUL2dDSFZtdDNF?=
 =?utf-8?B?Q2YvTklVU2Q3WSthdnhQVmpldTZDS1UwU3FjVG1wZHJTQ2xFU09rQ2VLay9w?=
 =?utf-8?B?WlY0WWZXU1FJS0FzbzZRRTUrM281UzJmU3UzTkRaU2ZTeVJEWEZQeitMcjZq?=
 =?utf-8?B?aFR4MXRrRXJGd0F5ZWVEVldlVkJWUzVwUU9rOFg3a3dBTjNiTE1NU1VhWEw3?=
 =?utf-8?B?aVNCTlA3WlJ5RmpBdkRIUWMrME5pQzZ1bysxTlF6RTNBZng1WFIxRlg2d1B0?=
 =?utf-8?B?b2FoOEV0SExmSE9lc2E1RE1ld1N0eDVvOEkvUFZOazg0bGtPaUJ3L2RPMzQ0?=
 =?utf-8?B?S0lnZDZYcGtJSjVqY3daZXJ2cEk5NnFhVDdXV1JuRkFKNlRwcmtaKzlkYVlv?=
 =?utf-8?B?YlMzQnphZnlPQzh3YThKcExnRFlZdUR5bUdFRXpoNDBpNWhpbGZ3YnBGa3Jk?=
 =?utf-8?B?SCtCNWxTZ0hLNWdBQXludGFHL1lKZmk2TXM2WjJjelBtV2hOLzhPa3l3a1Zv?=
 =?utf-8?B?SE02anR4amNoOTZSdVQwTkxtM2V0cEUzR25jNStnTGxTL0d4UjhML0c0UVNB?=
 =?utf-8?B?VFJHYXg5U1ZpVTdmSUloZlVDaVNrQ0lnbEw4WlNvMzh5b3p6azl3QVFCRW5v?=
 =?utf-8?B?aTVIZE04MVJ1MDhBVU8xMWU4TWlHR3Y3L09FL1dLUkhSamtOYkdMSWlVcTc5?=
 =?utf-8?B?NFNGRGNmRE96ZmlreWF4TVIvRStHMXAzNzczREEvUTIvWVZ0MlBnc05kc1Y5?=
 =?utf-8?B?ZGpkWDZGQVp1SldPbGRtQVVqZ2ZoZ0NSRWpPZzNUN0NEdkdraFAwSGtORFIr?=
 =?utf-8?B?V3AzSGllZ2hBclRFWXRoU0RVcmUxSjd2VkE4bzkwQzMvMWMvdEFsdUhOeGw5?=
 =?utf-8?B?VEc3UG50NWthcWZscm0wQzJ5dzZEVWxZZ2ZMaWE4ay9QS1Y4L3FHUjFJQlUx?=
 =?utf-8?B?TFdJVzlqWmtEVG84NklUaUJiZVRrVUxPS0dEaGFEVm9weHVaQWMvS21NV0RW?=
 =?utf-8?B?QXF5Z2RtL2FuRGlvMWlXNlJKakZ2cVdvd3NQUGVTUXZSWHIrdkpaUDMwRDMz?=
 =?utf-8?B?QWt4dWh2Mm1PWHdOeGxudHplck5QUmRrT1RUQ05ENDNTUmRSU1dwbVVyR0M1?=
 =?utf-8?B?QkVCM2ZEVWNrekFDb2R0REwwZkZ6TkQ0WEh2d2ZKK2ZueEhFY1dMMlZkb3pr?=
 =?utf-8?B?ZzNsUGYvait6aytONlhoeHhvWnBoTDYyNU5uamN0L1pQQVEwL1VYamhUWjlP?=
 =?utf-8?B?NU51VjJKbjNTRFMxcm45QjkvK0xNMmF4cFFJRHdKRHovNkE1YW9rQ0c5b2Fz?=
 =?utf-8?B?bXFEdzBDQVNjdGEyenNBbklUUHByUzAvYkN3eVp5TjRqdzVjdDlkVXp0ZlYw?=
 =?utf-8?B?enIwNUowTTZVNEpGL2hxbXZkeHg3dU00MU1ubUIyeWhNNmo5ZmJsWnBLeWJo?=
 =?utf-8?B?THEvRTNzSTkvM2hhOEg3WjBoeGpZemVRNmNhT2U2T2h4bitKL2JHT0IyMjk4?=
 =?utf-8?B?N2ZBSkd0c2FadmZ6NzRnajRZb3NMUXdESldLWWdSbTN5ZC9EVzFtNWRnakZ4?=
 =?utf-8?B?RnRNdVZxQU42SW5LQTk2a3lXVUNhNkZqa1RFVnhJRXFjMTlKZHNqbW4yb0pw?=
 =?utf-8?B?MGUzZ2Z0a0ovNUczc2FDZVlJUXR4WjVBUUxjaExsaFU1RXIxa0V1dFhqZGpL?=
 =?utf-8?B?dG8ydS9GT2J6NzY2a0FCdlN3NDI1M0ttSjd2Q3ZqWHUvUGZRQVA4cDhKUHFR?=
 =?utf-8?B?Rmxhc0pGOFpxQ2g2TTcrbHNQWmY3WFBzSU9KVGNoL2lUVi93WHFVOHhUa2RZ?=
 =?utf-8?B?V0lsN25LdmFVVlR1MDAreW9yNEl2SEhUS2NDM0N5bERWZld3YWVXTHl2eFNi?=
 =?utf-8?B?YmJHODZBTXgySmxSb1ZZS1hMOGN1Mzk4YUdad1E5LzhDakw5WndKcDhMSGIv?=
 =?utf-8?B?angyNUZmM1VEUVQ2djZQLzZNeFJFajFWT2hxTm40ckNQZm0zZmZHSmFHY2p0?=
 =?utf-8?B?T0dJR0ZMa0hKL1FGemlvOGxzZE80ci9mMi9pOHFlb0NMU0hiVUdCZExPVVR4?=
 =?utf-8?B?dHNEYWVvU0c2eXVLUW9VUVRQbXFxa1RySFVENWRjRnRFbnloWmR1eFNLWnJ5?=
 =?utf-8?B?THFheEdETGp6NWMrSHZkUkJ2UG9CcXBuTXo2Sm8xV3M1SHMyNzNFZz09?=
X-Exchange-RoutingPolicyChecked: OVDSTGAIrB8z4V7YoWvWvPFuaI27g9XjVGCG9mzrnL5nl5AT3SXFnO9AGlEwFIihQUsf4mS4rQ6DfvjwlqQzseNzQWE8/xbEs3soh8m6xJ3EsAi2CHIXw0R/izTMWpoULBnU5gNHgjMuSgdy8rcU1oHvifHyhYYrJC7FPRgdbmU0DrL2KaT12bPv0rtLGhQvdzx4EQMRT+0QrEO+Q3ypYjolOYs2OsFpMIVWbwg9LKY4lLy0/3t7xGQHmn2U8vzhBe8wPz06x+jOL9SrvI5z8lDPa2X2mkMSUftxcgF8W95cfCzsFyXeWXM5qUYyPnABQDzd7TYh8YFmzd72Wrgsiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be4fc4-0288-435b-bb8e-08df3b4a2ba1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:36:25.8604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFn1Rm3EbfQOrXwoojxN3JGx018Spk3v6tyCVLvPQa7umNYVi1ld/HhmaJTCM90W2d5yiZdxTezKjGPZFNbBPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9904
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


On 05-11-2026 18:00, Sk Anirban wrote:
> Add GSC proxy, wedged recovery and SIGID based failure
> messages to the expected wedged dmesg filter.
>
> v2: Modify dmesg_regex (Riana)
>
> Suggested-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tests/intel/xe_wedged.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index ba7efbe1d..2dcab029f 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -56,6 +56,9 @@ static void ignore_wedged_in_dmesg(void)
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
> +				    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
> +				    "|SIGID=[0-9]+ .*GT: reset failed"
> +				    "|SIGID=102"
>   				    "|SIGID=203");
>   }
>   
