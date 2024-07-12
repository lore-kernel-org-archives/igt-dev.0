Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04937C3DA45
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 00:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FFB10E755;
	Fri, 12 Jul 2024 00:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brDKYvCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B010E755
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 00:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720742724; x=1752278724;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AIxy6FVJLBgpWYa4KIEum3mDQCE1Z6iHIJSgfd8snqs=;
 b=brDKYvCQPbKQ7SoqQtjoDlFEqG5ELRHlpChpz0mzjnR87hyhuOPdYL7f
 49nx++3+IR2ZJ0EtR3vVg3ZDLZNZMndL0BstbZY4CxYzuY8g+0T6KLWvX
 z5vBSRw+FKPOnpvPzLQLO9PyiePYqq3P+ctJosvxTTZ5eWPE27XcCfddU
 ne0SOMqtXu8yYXAcx1bPr8DA7WnPSJse3yR67n5cF9R1hHsJPiI+ggxso
 7RdLlp+0uZp0dsN7B0m1UaMkQFA/cuaYx8L+FRAfbh1mKGFZZttprXG6a
 YDazkhNJIdaZnon1SGV9x2y+tNkGMdgpK9e4FRcaYHKOnvRpGBg9p0E+j g==;
X-CSE-ConnectionGUID: eyjE26dyQCicAGwOqxn2gA==
X-CSE-MsgGUID: eolc8hjOQduXzNMuyORtvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21926469"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="21926469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 17:05:24 -0700
X-CSE-ConnectionGUID: /EUD0NpWTKy3p5PpM3Zysw==
X-CSE-MsgGUID: hLmpV0iURU+iZWsrpKskiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53571046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 17:05:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 17:05:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 17:05:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 17:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFLT/21nK+GaKjF8LRIckwYwxORmQKTW5AECoZMYIWo1OWHXru8PFUuct7KqG0G86NfZQ4e3BKycN7PkwaSuioQCidquSm4JfgiQzQ1kioTU20TJfzGHiDc9+7WyCXs492B7UJW8LFSFUj/6eqwWKqfn05Vbvoq62qaOv9n4sUn3OknFCrfoK5PiOW1V7FpUnHIJGsliS1K3l1SiupDE38tCfmGioAxEGjTh1R52KM06LtAO+agPg1eqIlZrpCjHmPaRNb2FwJWUNjfuaKCCVj7C929kmhYKJaDSIqccMpFstQ2kJ8MxkGP2mhAEj8kgsVwZ89m5HUa9zvQnmIa1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUY4rgQblVcSRDx0BrYnplcugRF6CwmSBRQkbjuO86k=;
 b=MepVfNDRlFV1ojQscvq/aX2iJMdwuFM5HR5ViGLrjjA1aE9sdF7pFRxoINhSlzDN6Zj48qprJaqTkn+fe+7viyA8DmPepvF5Fc/3M6v6ONAb13zfVFWlXwfAiz5Y3Kl8mXhVqjjM38qjev491CpTuO+OX5exacB+W+RYmgF9qFwm27TdOwAWPoMxt5ngxabIu7Sbr3zJqqQHiHkbTlSc8Gy6H6Wfp2oK37q+ah5ihEVW+bdWKZEbaJdMfS57gSk4qd8H5nKto8XMP62X7r0VBuCjc3f3xm3efezKVipKyTWo+JZZhHUM/ur+LmnHbSEXz0RSMfqtvS3/QyW9boMoZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 00:05:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 00:05:19 +0000
Date: Fri, 12 Jul 2024 00:04:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 04/10] tests/intel/xe_drm_fdinfo: Add helpers
 for spinning batches
Message-ID: <ZpBzD4KnSj8M9aOL@DUT025-TGLU.fm.intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-5-umesh.nerlige.ramappa@intel.com>
 <o73rxaucq4ul5cuyl4j3r6dynatc6rt7npip3npxna4ffeangn@nzr3um54pt5v>
 <ZpAkbG2v/7plCgAo@orsosgc001>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpAkbG2v/7plCgAo@orsosgc001>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: e097795d-9527-408e-a2bb-08dca20650d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3ErdHljaFNQV2M3cUlCV2JuWnk3VlV1ZWViWXdxZ21DUVpqbmF1cHFPWng1?=
 =?utf-8?B?Y0pCOHBZSTY4WVlRdUpTYWVNVVMvR0RicHlmbmN3dE9VdzN2bS9VVnlmd1Bm?=
 =?utf-8?B?T1cvaEd4SHhOT0FzU0lQTG1GZEtCdE5VVWt1Ylh5dC84MUplVXptWEk2OVZO?=
 =?utf-8?B?QUwvNDNYUGQxWmI0M2pCZnpoZkZrS3FwRkl1SUo4elo4RWFJNnAyVmxhNGc5?=
 =?utf-8?B?TllqQUFyTk9wdjdoMFhIZElCYmZyby85UWtidDdyUU02ajRVa1FIQWtVQkRz?=
 =?utf-8?B?TjhYRVVRQ1FUMmRJRlk0UnBmRmk3NWtEVFc2N0xrVy94Y3VWWEJja0NRTzM5?=
 =?utf-8?B?d1ljdXNrZUtKL2lLeGEydFQ1QXE1N2JsS0doRThNVjZGcDRTZWVGQnJQbFNU?=
 =?utf-8?B?a1oxM0oyZWZKWkpiT2FPeGc4cDAzSDA5RGdLTmZjT3N4ZG5ZcXRlSmNrS2VM?=
 =?utf-8?B?VGR0VVU5OVhiTkhXU0czanlDRzdlTEJMMGxWSU1Ock1TMnZScDJJNlRzYlBK?=
 =?utf-8?B?aGtPajJpUWVsUU9RM3cyZ1l5RTltNTZaSzk4MVlnZHE5NHlJelNPLzRlNlZ0?=
 =?utf-8?B?VVVwbDJQY2ZUaytLNlRqVzkzNHQ3ZmxGaXF1a3MxRnhsdnhjMEJlVE1Ca2tJ?=
 =?utf-8?B?YU9paG1pM0VDODZYQWwxa2VNb0xRWTFZekJ6MVY1Tys1UEZIOTJxU0J4NzNa?=
 =?utf-8?B?RFEyaVVkUUEvN0FNZHB1L2Y2R3NKTUg2UDVrcHdrbldhMVFvM1hFQlVRZjdS?=
 =?utf-8?B?dUpDSXNSOVpSekhzMlZRcTBNdk1wa0cveFpGaERqOHFkalZjSC9MVjNFblYx?=
 =?utf-8?B?ODBOOEM5ZVdtN1E0QVRqM1pySnJ2RXpEYytPNzduVGJ5QkpySUNvVnRnbnd5?=
 =?utf-8?B?emIramR1TncxNkE3dnBBQjBMTG0zNjllL3lLQWFQZ0w4c3lNajAxbjF0S0Yv?=
 =?utf-8?B?UktvcjNEelZIREhoOTBXMmRzQnBNNEhwcjltT3NCditxSHVFZlpRRWs5RFoy?=
 =?utf-8?B?b2lNVkRYZUo4enhIYWV3VHhveGdRNjdPbFZscGM1d0xJZlkyREVMMUpwT2JT?=
 =?utf-8?B?bEZ2ZHd2QnFnKzQyc0MxVnIyVXdTYzJiWWtJTHZsRitHdFBSdmNEU2Y0RUto?=
 =?utf-8?B?V0RyTTBWQk1ETElhMXoyb3kyKzY0c2hXSytGZVJBRWYxSHZXU3FiOGI0Qjls?=
 =?utf-8?B?UmxQU3Y0TlJHUVluRGtvZkRRVDNQSklzcHQzQkl2dlcxeXNJN1VReDB6MEVC?=
 =?utf-8?B?azhrMndiS1JSR3NVUndGclZ3VnRuRndHODJIQUxOOHd5Y285NlJXMExZRkgr?=
 =?utf-8?B?OVZPY2dSNy9vSklFeXlYMUZmWk9OK1VjbnRYTEtIbytmd3Vxa3Z6TEVqY09q?=
 =?utf-8?B?ZW03TklMT2ZseGVPekoxTDVveWs4NTdJWUNIa2Z2YmdRTzdsQVoxZFVPaUZN?=
 =?utf-8?B?bjVSL3JweXNJNk54N3QrQUtBUkk2SmtlSk5ibEtyRElhV01rb1hwbXRaci9T?=
 =?utf-8?B?SURuNXZ5YXpmV0xLVXVNdUowRC9SZDJqOGtEeTlYajlsTDY0SXRtcUhPRFk5?=
 =?utf-8?B?cVpZV210NzdaamFXN3ovd0NjNzNlSWZCMUJaWDhmRGllVldvM0ZtVXk5dTBw?=
 =?utf-8?B?U1J6WUQ0QnROcFNCMk5FcFM1dnhadjJRUTRNYlJGQmtkZmRsekJQWFdQNzRi?=
 =?utf-8?B?bG1pN29uTzJjNkd5YlZEaDNlVjE1d1daMHJuOFNNV2hvdi9QdmxtOXFQaTdx?=
 =?utf-8?Q?OcZue2lljAg+8YMfu4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yll3TThmR1pxNDVjRDk0S3dDOGV3UUxwYWVKaG5qazRpMkR2QUQzd3B0dmEv?=
 =?utf-8?B?SGYxaDdnYUJ2ektsKzlHamxGV044OXdLbnVtdGRFRk5ISUF5RFo1VjRBNUs4?=
 =?utf-8?B?SGxwTGlpeU9CTXIyTUJhZVd0ZWlDRHhsaE1VVzA0azR6aEZ2WEpDekhnUEwv?=
 =?utf-8?B?RU9tUTgyNWxYVjYxV2lXbE5NVERvMm9nQThVYUhGelA3MmFFQXpMa0w3WEpE?=
 =?utf-8?B?Mm5PTExZQVNNT1IvZEdFVFc0anVEL09JU2ZiUE5YVURVa0NtbTBNSGoydEYv?=
 =?utf-8?B?NFl0YXpjMmJBNG9JcXdOcFRWV0VKSVRhcll2bXhLMGdBZGRraHFYOG5CN3Bv?=
 =?utf-8?B?UUpCdHI0ZXhSZVl0ckN5dkJTL0R6bmpFcmwvVVlWUXBiVUYxNzhzSUVwK0x3?=
 =?utf-8?B?WmQ1Qm9XTXViMi84dEZlc1NaOGs2bCtEMThObDBVb0NmV2dTM2ZLTWlxa0o2?=
 =?utf-8?B?VTFFeHpaNjRTVDhiaUw3Y1JmUERTeWl4WGZCOHpDa1Zaa0hCNS9nblBZNTd6?=
 =?utf-8?B?eWJlV3Zoc3h3OUwraWpCcWRLcXE1RDBmY0ZocFRpQlVJZ1hmbW1jbForTjU0?=
 =?utf-8?B?VkZuNGJTTzBEeUlSU05LenZkcGR1aFhCVk5LYWxZZzJac1lJNlp3SVE5MFBk?=
 =?utf-8?B?aU8yYlozcVFRNGpoN293MGEzeXJhbVFRN0VyZG5XOVMyVHBGV1BldTZsdzV5?=
 =?utf-8?B?c0ZlUHZaN25NNEtYWVBHd2FyK0JFcEJJbHc4RzVYWVYxRmQvSGFYSXJ3ZXMw?=
 =?utf-8?B?ZGZFamNrY1VNbHd1dDZOVG43UG9FVDZhK1NkdjFIaW5XVzQ0bWNVdURPaTVI?=
 =?utf-8?B?ajNTMnBRc0RDTkx3MEdYaGdkTFI5dzJ3TTBlOStsU01uZmVpakpmUUI5TWU0?=
 =?utf-8?B?d0twSzBYRWU3dWYzcVEwMHZuYi9vOTVoYktPb3p0RnNNbEdKTWZtOWpzQzh4?=
 =?utf-8?B?amswZVlXVUh5dlV2c0JyS2VGVlNmYnE3WXBuQlFId1hyN01hZnlUWmVSMlE3?=
 =?utf-8?B?aHN4YTl1aTdDSGVqTW9yMTgwMEFIN01qWXhlVzNtZ2xveVl1YXd1Um5IL2Qw?=
 =?utf-8?B?UWFvUVB2cVBtbGdiZDhucFU1V0tCMjBrMUF0djNkbTE0Zkw0LzN5WTI1dTl0?=
 =?utf-8?B?R3V4Q2Q3Ry85WVFWMmpGRmhyWWgyVHVrZXNSamtSTjVxLzl4T0Y2Vm8zOGRs?=
 =?utf-8?B?R3dLS1orNkMwNWpPV0Znblp3MjZiaTdyamlwMGFNckZMK09TODlUNkNwOWcy?=
 =?utf-8?B?YkJ5V29XQ1kyRGRGWXF0TjNSb2MzOWVaZlFTajkwNGhXUk1hOHFHU1dyRUhl?=
 =?utf-8?B?YWlxUlpuM0tMTVY3a095a3diQUdqMS9oQjlBMkU2S2o1cUk5UFpvbE1CclYy?=
 =?utf-8?B?VUtobWhVZkN1ZFBEYm11VS96SkZUbDhSR0h6U1hsVm5SanBLU0ZyMHpRSzFn?=
 =?utf-8?B?eG5lZDFCdlVwMjdKZUNQdnNXbkZOZ1doaTc1ZWprWlpTZEs2bER4TElVV0Q0?=
 =?utf-8?B?WStocytyajlaQS82MTloNlhlamhldWhFVTN4TFcrclRYbXNwK3YrdmxCbzc1?=
 =?utf-8?B?SHV5VzdpYVpMZFpTaXlvZFY1YXRFTWxnTzdOV2Q5V2ZVZnNvUWFoMWZQRGJX?=
 =?utf-8?B?RTBXT25kUXFJSk9CaGdzSXBEVGQycFcwN2prd0FaSUZXRk03dnRxaE5NRVpB?=
 =?utf-8?B?YmNDZ21BUGdtbXdUekVISkVuYzVpTUdaSFNDVXM1a282aU1yYk5IVG5QMkNq?=
 =?utf-8?B?VzhjTHNZdWxOZjdaODdkSUd5OTM1Q04yTnQwaTVPTDRtVXNOaW9sa0pScUEz?=
 =?utf-8?B?NmZNbTYyaGYxWGxlc2hMSklTMENHK0FFL25HQjV6M1JaWWRxMDFmNmYreHdo?=
 =?utf-8?B?aFk4ckl2M2s4dTF3UmVEZmhobElQbm1wWU9KNngxNU9yN0dsRXVpSFdTaHM3?=
 =?utf-8?B?Q1JvU1ZpR0czV2RKa3NNQ2pla1lLT0ZjU0NQZmVnMGxCNXVkRlFUWnFWUi85?=
 =?utf-8?B?a3phamJudm5kd0plWmZ0YVBkdzNzSWdIK25NYVp0SXp1ZXB1OXVEN3RKZ0Fw?=
 =?utf-8?B?bXRQRk53dDRQckNBSlFjUnVnNEVtOWFYaEo0cW5TMWUwYTNjNjl6blZjQ0M3?=
 =?utf-8?B?cGJHeldSU1dOVlFqcXNSbzRFczZPaU1FbzZ0YWQ4OGVoZVlWQ3d3VDJueU1H?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e097795d-9527-408e-a2bb-08dca20650d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 00:05:19.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCf6ffBjQoub1M8P6ElzlaYof76wspFXMZ/NKk4/Bg8MUBvG0tZgy8NvnDTKmN6xyksUUrWKbZbUajykmC8/1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
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

On Thu, Jul 11, 2024 at 11:29:00AM -0700, Umesh Nerlige Ramappa wrote:
> On Thu, Jul 11, 2024 at 07:46:23AM -0500, Lucas De Marchi wrote:
> > On Tue, Jul 02, 2024 at 05:25:26PM GMT, Umesh Nerlige Ramappa wrote:
> > > Add helpers for submitting batches and waiting for them to start.
> > > 
> > > v2: Remove xe prefixes from the structures and helpers (Lucas)
> > > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > ---
> > > tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
> > > 1 file changed, 135 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > > index c697f3e53..037f25e53 100644
> > > --- a/tests/intel/xe_drm_fdinfo.c
> > > +++ b/tests/intel/xe_drm_fdinfo.c
> > > @@ -54,6 +54,17 @@ static const char *engine_map[] = {
> > > 	"vecs",
> > > 	"ccs",
> > > };
> > > +
> > > +static const uint64_t batch_addr[] = {
> > > +	0x170000,
> > > +	0x180000,
> > > +	0x190000,
> > > +	0x1a0000,
> > > +	0x1b0000,
> > > +	0x1c0000,
> > > +	0x1d0000,
> > > +	0x1e0000,
> > > +};
> > 
> > where are these numbers coming from?
> 
> The hardcoded number above are arbitrary, although I don't know if that's an
> issue. I did see similar numbers in use with other xe tests.
>

See below, I think you can just use a single address when setting up the
cork (see below).
 
> > I'm looking at
> > tests/intel/xe_spin_batch.c and the lib/xe/xe_spin.c implementation and
> > I don't understand why we need to add so many helpers and handcrafted
> > things in this particular test.
> 
> These helpers are just a break down of something like xe_exec_balancer.c ->
> test_exec(). The helpers are still using functions from xe_spin.c.
> 
> The breakdown helps control some execution elements for batches like (1)
> using a single address space when running batches on all classes, (2)
> configuring width and num_placements for parallel/virtual cases and (3)
> provide some flexibility to test utilization when the batch has started
> running.
> 

I see what you are trying to do, create spinners for virtual and
parallel exec queues.

I think the proper place to put this would be in xe_spin.c adding 1 or
2 new functions that look like xe_cork_init() but for virtual and
parallel exec queues. Then just use existing cork functions for
everything else.

I think that will work.

I don't think any IGTs actually use the cork stuff yet (several probably
should) but I did post an IGT recently [1] that made use of this.

Matt

[1] https://patchwork.freedesktop.org/patch/600254/?series=135143&rev=1

> Regards,
> Umesh
> 
> > 
> > +Matt Brost, +Zbigniew Kempczyński to help help here
> > 
> > 
> > Lucas De Marchi
> > 
> > > static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
> > > {
> > > 	struct drm_client_fdinfo info = { };
> > > @@ -329,6 +340,130 @@ static void basic_engine_utilization(int xe)
> > > 	igt_require(info.num_engines);
> > > }
> > > 
> > > +#define MAX_PARALLEL 8
> > > +struct spin_ctx {
> > > +	uint32_t vm;
> > > +	uint64_t addr[MAX_PARALLEL];
> > > +	struct drm_xe_sync sync[2];
> > > +	struct drm_xe_exec exec;
> > > +	uint32_t exec_queue;
> > > +	size_t bo_size;
> > > +	uint32_t bo;
> > > +	struct xe_spin *spin;
> > > +	struct xe_spin_opts spin_opts;
> > > +	bool ended;
> > > +	uint16_t class;
> > > +	uint16_t width;
> > > +	uint16_t num_placements;
> > > +};
> > > +
> > > +static struct spin_ctx *
> > > +spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
> > > +	      uint16_t width, uint16_t num_placements)
> > > +{
> > > +	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
> > > +
> > > +	igt_assert(width && num_placements &&
> > > +		   (width == 1 || num_placements == 1));
> > > +
> > > +	igt_assert(width <= MAX_PARALLEL);
> > > +
> > > +	ctx->class = hwe->engine_class;
> > > +	ctx->width = width;
> > > +	ctx->num_placements = num_placements;
> > > +	ctx->vm = vm;
> > > +	for (int i = 0; i < ctx->width; i++)
> > > +		ctx->addr[i] = batch_addr[hwe->engine_class];
> > > +
> > > +	ctx->exec.num_batch_buffer = width;
> > > +	ctx->exec.num_syncs = 2;
> > > +	ctx->exec.syncs = to_user_pointer(ctx->sync);
> > > +
> > > +	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > > +	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	ctx->sync[0].handle = syncobj_create(fd, 0);
> > > +
> > > +	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> > > +	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	ctx->sync[1].handle = syncobj_create(fd, 0);
> > > +
> > > +	ctx->bo_size = sizeof(struct xe_spin);
> > > +	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
> > > +	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
> > > +			       vram_if_possible(fd, hwe->gt_id),
> > > +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
> > > +
> > > +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
> > > +					     hwe, 0, &ctx->exec_queue), 0);
> > > +
> > > +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
> > > +			 ctx->sync, 1);
> > > +
> > > +	return ctx;
> > > +}
> > > +
> > > +static void
> > > +spin_sync_start(int fd, struct spin_ctx *ctx)
> > > +{
> > > +	if (!ctx)
> > > +		return;
> > > +
> > > +	ctx->spin_opts.addr = ctx->addr[0];
> > > +	ctx->spin_opts.preempt = true;
> > > +	xe_spin_init(ctx->spin, &ctx->spin_opts);
> > > +
> > > +	/* re-use sync[0] for exec */
> > > +	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > > +
> > > +	ctx->exec.exec_queue_id = ctx->exec_queue;
> > > +	if (ctx->width > 1)
> > > +		ctx->exec.address = to_user_pointer(ctx->addr);
> > > +	else
> > > +		ctx->exec.address = ctx->addr[0];
> > > +	xe_exec(fd, &ctx->exec);
> > > +
> > > +	xe_spin_wait_started(ctx->spin);
> > > +	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
> > > +
> > > +	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
> > > +}
> > > +
> > > +static void
> > > +spin_sync_end(int fd, struct spin_ctx *ctx)
> > > +{
> > > +	if (!ctx || ctx->ended)
> > > +		return;
> > > +
> > > +	xe_spin_end(ctx->spin);
> > > +
> > > +	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
> > > +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
> > > +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	ctx->ended = true;
> > > +	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
> > > +}
> > > +
> > > +static void
> > > +spin_ctx_destroy(int fd, struct spin_ctx *ctx)
> > > +{
> > > +	if (!ctx)
> > > +		return;
> > > +
> > > +	syncobj_destroy(fd, ctx->sync[0].handle);
> > > +	syncobj_destroy(fd, ctx->sync[1].handle);
> > > +	xe_exec_queue_destroy(fd, ctx->exec_queue);
> > > +
> > > +	munmap(ctx->spin, ctx->bo_size);
> > > +	gem_close(fd, ctx->bo);
> > > +
> > > +	free(ctx);
> > > +}
> > > +
> > > igt_main
> > > {
> > > 	int xe;
> > > -- 
> > > 2.38.1
> > > 
