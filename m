Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D1EC369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 16:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC41C10E040;
	Wed,  9 Apr 2025 16:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRbqrH9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A1C10E040
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744214993; x=1775750993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hHORnMk2zjAIGxguwixKMcphLh+lP3yei6KJfEvJnVw=;
 b=RRbqrH9aGO5u5kZBPkfVYjoQZ+TbsiMK61HxEFLa5e5DD+SMknxc6OS4
 ISSAkMnknnGYZadARZzF/Lpw5bA7gR8FTSTST7aF7ZRPuSUvbMYFFHr5S
 YgP9lL0sdj+4iVfWLZ3zkPXhh9b5calAUI4d3QdP4pDfocAup0ETbkmyv
 hROsvbdCBrwBLYOIh9G0NnUyZQZ1+WDJk08TVZPvLyPX9alJNCT3/F1Zs
 8+Mtm4AcQ4c4PYja6ZXyeYIZeryp9eBEjFXhNVc1Z0yxWRnSkk6d8Z39B
 lKNwBAx2wdJQlg5x9/OID4lKTXAKedTDGc8GHVtOCy4Png28AUUpFMVMM g==;
X-CSE-ConnectionGUID: MLeE30CeTB2lmCOVkMCjsQ==
X-CSE-MsgGUID: Vzga1N/8SUubvgWIAAPClg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68180217"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="68180217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:09:38 -0700
X-CSE-ConnectionGUID: Hf+6SMdLQeeMWsKMUF3FEA==
X-CSE-MsgGUID: jaR3OXCXQeC8edTyT+hBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="129154900"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:09:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 09:09:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 09:09:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 09:09:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeIFG6YmfJm+fT5ABeEnKksnxa5cUjLqoGFfwhOhk0N/FvmvhoRbHrG//0A0ZAGtb1RfDpFcyOb6zjEsz/V9kidhscR1n+W2B8aKiQOOdnc+o8yUEeViQ3bbGTM+wENqZEzIhAFaVUjiB18E65+KYje/RGQS/YeV+x92wdwJqN7vjijmFfpKJWfJyXh4TGkVILgRDGCl9EP90qLNwPw4dVMnHneq03dwUBSp6N6qP/MGEC4Ha27CpB6vDIYtaQtMQhPb+MloTYY7YH/4KlWnehpPhDpA2CWxock/hle8xFqftXUpCtn7tl18SK5p2kY6+i25A9jUbK9fUbcW/leBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cBqCvHFu7ScmK+0QBA61i7ohtAjIofbU1EWEewBe98=;
 b=XQLfg5Qhr0PThBmbctzIJzGbKTPDQYyy5DmSUfufHj5tL0ft6xhQgzDNxnyrTIGUVCgmnpo2bQEDbSC0k9ecWAAvVNXcZvUiVJdDn0I96tQNZCxyhoizgxNCd8Xw3/YwdJuSABKDRPoSWNxkvkfPP3PINOsE7Z32oKlz6f8E6JjXnjMJb+SaKEMQEzWTDh/w4GGxM4ULAN+9JJ0kbe/pK7DVSVjKRkAUlN8fayCd17QdpZ2gTLCZb7NLIAOgjaSKW+trI1lhc6V7AGfq3AQo1Ff/5cFtKNxwlmRokjuvtHffQFu0UEKawAI9tpT8dyieUVfxrCiwqaV75Caz95WiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB4990.namprd11.prod.outlook.com (2603:10b6:a03:2d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 16:08:52 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 16:08:52 +0000
Date: Wed, 9 Apr 2025 16:08:45 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v6 2/5] lib/igt_device_scan: Enable finding all
 matched IGT devices
Message-ID: <jsu7nqpm5paj6a5kvk53kwuvzs2h5x7lqfxvk3wlheledhufmv@lvjaxhkuv52z>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250404132421.1920451-1-soham.purkait@intel.com>
 <20250404132421.1920451-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250404132421.1920451-3-soham.purkait@intel.com>
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: c09f849b-0823-417e-3720-08dd7780d200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEU5Mis2T2FyMWVOR2ZqbXNWbFZPSmFqdW5VcDgwNXpYQ3BXN3d6VkIxNlhl?=
 =?utf-8?B?UkdPTGNJa2c2QVFoV05RdUlWUkFtbkVQNmRWeHd4T1hFQjJaRXBjdGVCU3kr?=
 =?utf-8?B?bFp6NSt1Yk96aDl0QVpnVzVyQml3SWRxVFljUE85SWVLb1ZmOC9rQzRYYjE2?=
 =?utf-8?B?Y0FpZWhoN1VDdDlya3RUbTUrRG5HdXRuWE9MLzJZU2ZlLzhJWTBqSlNud3A2?=
 =?utf-8?B?RnpYQllPdUM4UjNscEJxdHJSNWlBTGMzdU5SYjh2SGJsY0NmV0JmSG4xVzZO?=
 =?utf-8?B?TElPWnJWeWQ4Zm9SSFltNWlDQ0htN0N1N0szanJIK2dOUFN6YkFGTHppa3dH?=
 =?utf-8?B?THEzS0Q4Yld5cmpBOWZPVVdwSlFFZzY4VlptdlpKcWhxWWJHcml4WXI1TjBS?=
 =?utf-8?B?THZSaWNabS9HVGRtOVV5bERrWnFyczRmOTdnUnNadytZV3c4SFc5VUxZTGJv?=
 =?utf-8?B?K2szM0hHUEJxUEdvbm9ieVZRQU93d1hLNXNaQ3dWNXg0QUhEZnkwc2l1Y1RO?=
 =?utf-8?B?c0UvMzQ4T0pmbVhWV1ZHek9VbmhBYTBsZjh3ODVQRXJHdll3MEFDRU81b21Z?=
 =?utf-8?B?SnFWZXFOREZqd2NBYzdvQUNpQTJ5K0dGclVxMDMva05qaTVBa3BuQVRPek1a?=
 =?utf-8?B?YVJqM09vK3NTMjVXblNIeXpCWEo5V3o5ZnlOV2RNWmRaa2gvU3M1UXcyR1po?=
 =?utf-8?B?MkpBODVkNUZPdGJNU2xWSFVkMGFFSmVyWjFjMTRtN1VNY0xoVEpNVnA2aDZm?=
 =?utf-8?B?azh3by9VWVJQRmFjYm9DMXRXUkJCaWIrT2hxL1Q1cmNVeXZHVUJqdWNxTThu?=
 =?utf-8?B?Mkp3MFNGRkxiMnRoc3FyQXZydmhTVlJOd3JZUnU5M3I1WWQrTFJkcTFjWlNt?=
 =?utf-8?B?L3dTaDc2d1Q5ZHU3VUlvYWFXQzh2VVRMQnpLa1ZVclRnQ1hoQ1JLUE15Q29x?=
 =?utf-8?B?dmVFS0JwQS9WN3lCM0JHOC8zcHVBeXRxd3FpdmdRbkVLT2NldjJIR3ZPUTY2?=
 =?utf-8?B?S2daMVd6UHZ4eHArMGJlZkxCMDBJQnBacXAwT0dIQkowZFJDZ1paUjRsTmcw?=
 =?utf-8?B?eldneXU5YW1EMjM2RG1hYjJNL2d3bjVnSWpFMmlSQ3hGc1hmRGxCTzd4ZjJt?=
 =?utf-8?B?cmVieEFURFFXdm5UVjZvTGhCZ0g1ZWNnamJnR3FpdHk2akdqMm9IdUR5Tys5?=
 =?utf-8?B?Y0tWTlFJNlBQbjFITHNqYU54azA3SjRCRWhpT25idks3U2FWbUIwclNjTGpC?=
 =?utf-8?B?dktoNGF1NUs2NDl6YjNxMXpsU0tlU2RoM2Z2ZkxEeDkrVHpnS1NnZkQrV25r?=
 =?utf-8?B?ckQ1ZEZnd21jQ29RQjVUaUFEV0p5YnVUMkVWc0RqaEU0MElWS3huN3BsT0hT?=
 =?utf-8?B?NmtISlBXSjZsZWgzTVY0RDlsUzJDc1NIR25RdUs1aWNHOUJxT1MwdGhxOUNQ?=
 =?utf-8?B?bHJyRm5GSGtpL0YwWUdxeDJ4aDlYZzB1UnFLaktKRExnTElBUmswN3NZL0F5?=
 =?utf-8?B?Rllkd3NPbEFCV1RYekJaUThtSUVJT1JuMU1vTzNkRktBRVBuM25RakQ0N1Bj?=
 =?utf-8?B?aHhhQUJvUkpBQU9LcVZ2aytJRUkxNWpxRENFbWc3Qys1bFg0T3MvOHI3NE96?=
 =?utf-8?B?bWdkbUZLYUpURzlCRXBmWkxMaHl2eVZQMVpYck1lUmVQdTY3QW9oMGF5OC8z?=
 =?utf-8?B?Yjd0MlU5Zy9memJYSXdlMDFqRVgrdWc2QWo2NWd1aVAzeTFYeExIV1Jtcjlv?=
 =?utf-8?B?Sk8xaEJpZlU2Y2R4VXU2V0I3dlNmRWZOZlFVY1NxS1dDRE5CRFRmUllON0t6?=
 =?utf-8?B?YnFEQ1hkUCtCeFg2L1pvUUk3OVlTSmhMME9KSVNJeUxrbFJTK3Iwc2FwbFlh?=
 =?utf-8?B?b1M0RTc2MWtHUVhOM3RTanlITWdERVU4ZnpnMXpQOHZWVmp2eUZvWmJIeXpW?=
 =?utf-8?Q?JngLGFluawY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk5saSsydnREYzJqdmpWcy9PSWJWTC9hRGNKWXdoUnRtRzhhb1RYWHdYSDBq?=
 =?utf-8?B?U1V5WEZaMzF5eWlMWmViN1FVcUw2Qm5rWGxRaGJYU1dtbkN5Zm1QV3hsVExQ?=
 =?utf-8?B?YjJ4RnV3a3FrVW5UMEdNR3hUdmhVMlVwTkFTb0hwZVE3SUMrYVdrbEo5YUFm?=
 =?utf-8?B?b1RNaEg5QUhiVmpSMUM1U0lGQ2R3TFdNM2FWRnVKRGR2bFJ0cW1vQk5Lcmti?=
 =?utf-8?B?Zy80ZHFDbmtkYk5HT1FvOUE5c3lGYVF2c0U1dExJQXB1R1lNSDFXdlNVcGpo?=
 =?utf-8?B?Z2FET1FtYjMzSzFVcEhKRWd6VThISEk4cmtKeXNxbU9BUlBhOHQ4RkNQaDZU?=
 =?utf-8?B?bzdtY3N5Qm9oMlB4K0lYSmlueXI2UnFrbjZacHI2MVNjYUJKeFoveGFVQ2gy?=
 =?utf-8?B?WmNienozcTZpZTk4T0l4Q0lKV2JhbWJMb1NYOGtITGQvdW5QWmhvcFdpclZr?=
 =?utf-8?B?Z2hFZGFqYWk0aGtTL3dNcGtiVHlSY0ZNc0VzTWg5c0FXWGJSejJEVUdoWkF4?=
 =?utf-8?B?Zkk4K2lqVjVRTmNKVG1VL2prQStDNTNVKzhmS01pTWFYWmpXYlYvc0VjZ0xH?=
 =?utf-8?B?Qng3dkQrUU5vSzc2QkdWWThVRUhyT3RrdDVNUmdxdytDRXJPS0xCRkpYc0I1?=
 =?utf-8?B?S0dvNXBuZWJWaEltMFJNT0dnWDRmUFNwd3ZEb3BDNXJ3dTcvMTlEalZ4QWJM?=
 =?utf-8?B?eHV1aE5NRWR2c1hOUDB2alJTYjdCMk1zMElBaWxtTXJhWTRpTkxvbjNNY0V1?=
 =?utf-8?B?OWhKQmh3akdEa3lwWGtZNXVFRTNiYW16NFFnMURhd1RoU3grZ3hVRzlrVXdk?=
 =?utf-8?B?Y014dHZ4Y2RTZVpDVktDd2JiNnBBemdGMXYwV2hObis2eVBXL0t1dzVkUk9F?=
 =?utf-8?B?TFVpMnRySG5TQnkrZTROK0NhVmNqVGN6eStUM1dpeEJTd3VzdFVvdEpXWjhw?=
 =?utf-8?B?TWhBb2Y4bHpKc0JJaUluU0ttdzA3N0xvYlZkSmNLZ2RHSEpYRzVUMGp6ZmNM?=
 =?utf-8?B?RG1YcG9kVk4xK25JQkpEQkF3QXh3R291Vkh4eHhEWU9TQ0lzY2g5VXozWHcx?=
 =?utf-8?B?ZjY1YjhqQXVjWHdMTEVTWU5aNHJIN2hNaGtLaVVHMWMzWVhuUzhQdlV1UEJm?=
 =?utf-8?B?M2tqRG8wckxNSHRHY3g3RndRSVExVmthNWo3eHRXY2lWVUFmKzhRU3htWUd4?=
 =?utf-8?B?NkpjVm82anZpaWdNdEQzdWMwNWhyRzZLT2h6b2hRdEYwSnVYMVNmU2xjQS9j?=
 =?utf-8?B?VXJLcjVzVTVaWnFZYXFHRkNxQzk0R3BrVGVzZE1CaUxQSW1RSytjQXNPWXBQ?=
 =?utf-8?B?VThGTm9rbjMxdGNTZjZMM1lyblh5YWUyYjJmOTlHbFNqN0dIM0QzZGR5UStW?=
 =?utf-8?B?MzhiajJscnJnV0xJeEFKU0luSHg4NU5uM1hDajlBM0RqeXVteE44QjdUNGND?=
 =?utf-8?B?eEVwdHRWMHNtOU5DUFZnbFE5d1J1UmFXWUhkN25ydHB2ZG9aZzdUZDJSL1Mw?=
 =?utf-8?B?eXkxeFhtLzVnOTVjbWdtYU1tTlFYK2YzelhxSVNzcFZpYmM5ek5udlhGYUxq?=
 =?utf-8?B?YVF1TFFaa3RsT2xhVURHVHAvV0x1QU1kbldGUVN0M3pwa1RGNERnQko5TWUx?=
 =?utf-8?B?VjhUYnZCQ0VjT1ZTV3RnWVMxYUpleERYcEFDSjRtU0ZDTGRrSm1KOXhCb2Zw?=
 =?utf-8?B?dkZqcUJIcHZ1MHFmZjNja3RNenp3TU1ZSGYrYkxaZ1JVVmtNV2dDd1AwUS9R?=
 =?utf-8?B?RGVzUUc0SXdKcFd1QXpwTGpGbldES1BxMStxVXJaeUsxUXo4VFFWSkpuWnlS?=
 =?utf-8?B?Uncza2lsNzRFdnlpOXhnSm04Q1BQUmowcTNCdzVFWGVXZnpvSFNHTUVFd0JK?=
 =?utf-8?B?Nis3RHZ4VzRjOEEyL2o1cWowNXVqZW5vSExBdmdDZGNDeG9ZUVhnMEtKa3oz?=
 =?utf-8?B?U3hHSHo0c0tua2svbktWWFFZR2R4cUdIM2p0bWlvZzF2TDFoVUFzWWRGUzV6?=
 =?utf-8?B?T0xleVhwaGJXM1FTWjAzYXQyajg4cWJSN3g0RVcxZXg5MnNFZFVuNVVIckRp?=
 =?utf-8?B?UWJ2ZWo5clBtT0dLMUZ4QjJ1RUVtRjVZeTFIUzlvRnYrOGduL0tTOVNSRHdJ?=
 =?utf-8?B?cHl4d1pIRUROK2tGelN4TVhNVWhScWtITjFVU2ttQnpvY0kxMnF6YWVUV2hu?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c09f849b-0823-417e-3720-08dd7780d200
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:08:52.0573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpNck4yEOO79OoLAA8Yhfv9qKqdvhMDUhj2jKe6g01UWRlkJ9lKJPOWkYZ8763DO2EKQVF+FCEgsELB3vZrMVXx6L2t5OWdt9oTyx30bgSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4990
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

Hi Soham,

> Add filter functions to find all the
I think this should be "function".

> available GPUs or few among them
> by driver name and card type or card number.
> Add driver field to igt_device_card structure 
> for storing driver names.
I do not think this patch includes additions to structures.

[...]

> +	if (!count)
> +		return 0;
> +
> +	*card = crd;
> +	return count;
This part could be shuffled a bit to have only one return at
the end:

if (count)
	*card = crd;

return count;

since if count was 0 anyway, we could just return that.

Best Regards,
Krzysztof
