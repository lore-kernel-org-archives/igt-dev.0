Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB6E7718F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 12:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE72610E4CA;
	Mon, 30 Dec 2024 12:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPfsR4DQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A0910E4CA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735562958; x=1767098958;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yeZ3j4aslxv5sRFL6oVcVzxSb3Mo3AyL/yTTX8nwLnY=;
 b=BPfsR4DQRqm27PH+h4ffOm+dBMgu5OAhJmDXFHXPfR6BjR3i0STIx4TU
 B0jPjO2DYnYVFTZ8fkjExSD9U9QGAHaSrzAz6WWUs9/rmOjbB22nD8G5p
 oq1WMRFI6NFl0kVN1kDniamTJR+ESz8iK7aRFvjA8gAwIhkE0lHRaMRYy
 zBveY65t5OOpuzuNIfQua9ez+qXQmEbzOWARrCgBdjv7lxg62e9y/ZP3y
 IBJbtyqVltevPHDTU+aRB1E5fGS2RbCfBRzlQxUfXAMScEb6Zvcgjd0Fx
 f4woHx7+uzvu4MVUbRYIHFsyCM5SLN2eerCsG1X5bzd70DlzsqjD0XUDU Q==;
X-CSE-ConnectionGUID: UKLzK7sxQQCoTLAjuW4xfQ==
X-CSE-MsgGUID: lNWtRiHHSKGymmnozBI2kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35731555"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="35731555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:49:18 -0800
X-CSE-ConnectionGUID: wRMD+FpaSkC2A/XFhhHguw==
X-CSE-MsgGUID: WydAPvxQQm2G/c1JYFMr2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="100648955"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Dec 2024 04:49:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 04:49:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 04:49:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 04:49:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7YCgzpG8fGiVUXkkcWhgLW5lsa4rM8g+gxzcGggNTpyKYdlH1GPAF6KKFrXI5MMqOYFt1yPPXeYnSM6YpLETBZqbV7WfRpahQPayc2KOeFa5WP3bjs1OANvs4mJonilGcJ7vZTn3ybICQhS9NLy8V0JmPVXSr6T0w5a2Uqmi1JVPr4TeK/J5VCnUR+HUwxCm6x2rMXc2Qm1RiV0rsK70sfwhMKD/1YcFSJ6vFvvPIUib5mUZTNwbzXFJGojXWcoi8elSxd3SCrhW8BIL/yL5zmn5/swLobuBds3SmvXiWR5sDzEF/kmCQlGEWgC+ABADkPmqw5omtLaBUkKUG6mLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pb3UDdMyECQ38jEg+JgX6VuEtg1wfbTCaYUdFK1WC4=;
 b=lJFahVNpCP3siEeD3p5eu9nJXA1Dt4ljRPZ2kmx2WbX3cnbCEXZ3Yacd4x32sq7LvU6Kndj6zOvwOgIY11TLfC/a1GSsC+SHB3Z+Ml6CJwkoba58yVSmiBf6WYwzfqHNOs6TGH+hEvkmdC+Mi43a7pcJl9P6dXhQ06oAtH8G3u+J0quhsrXkQRP0FQ+DvWkEHm1OjgFuvGxHDSIdL82SK8U3dtCmPsEQcAYnILuq2aK5rtuUVmL94i8wziOxReDz1wQhTP5E8peWNFdyIoFlEpP4H1R/qhXEvnX+pNEesK+9uCWSlLGXSx3UKBwGrOJmqDfTXOn3WzSdpk7+eYz+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 12:49:06 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 12:49:06 +0000
Date: Mon, 30 Dec 2024 12:49:01 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <andi.shyti@intel.com>,
 <janusz.krzysztofik@intel.com>
Subject: Re: [PATCH I-G-T v5] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <oa3knzj3ggdt5bnrgswnsxzo65q547adc737tq3a2irqu32wp3@kjkoqgockwfa>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
X-ClientProxiedBy: DB6PR0301CA0094.eurprd03.prod.outlook.com
 (2603:10a6:6:30::41) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 7629437d-cc10-4f5e-8af7-08dd28d05887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW1jOEhUUG9EYUp5cG5oblowS2ZUMUNrNXdVUGE3Z3k4S1lRUDVET09nYzFV?=
 =?utf-8?B?Z3BSWlJsVmpNbTNlYzVMV2NrNGlTQ2VIYTNzMmg1U0VESHBlb0dQbVFCVGFi?=
 =?utf-8?B?eUp5TEpUTnJXbi9tb1BtYjM3aGFqNmpEZXRNbytYV0Ywb1J2T2xNdU5Bd2Zm?=
 =?utf-8?B?elRWR2ZaVDV6eUJoNVduQm03bXVDSEtoVDJkUTh0Z0NqVkQ1RmQ0OGN6ODNm?=
 =?utf-8?B?MjdZSDk2TGlhbU5vM0drMXJDN1N1cHlyamt3NW1NeUhZMldDbGxDMm9IZkZU?=
 =?utf-8?B?dEg4M1BHMTNMQjVhMndlbS9GUllqNXBSU3BjWjhGcVl2SjA4endrTGRmZFdy?=
 =?utf-8?B?TzBIQUpMNS9FdDhwNTVEUzRuazZueFpoWlRqaXc1bDZIR3FEWVBUSys4VS9q?=
 =?utf-8?B?Rm9JalJvZndPNHFSM0hCUnU4azQ1WTFOUUtjR3FWWjh0Q2xvS2EvZnNOMVNH?=
 =?utf-8?B?OFRTUGZMb2REMWIwVVBIVTNXS0xKY2prRFBXSiszWHZtaUp6eVVaUnNUNlFt?=
 =?utf-8?B?Q1cwVVNFUlJNQ09wdmlTMTd1WVZiZ3BGZGsyOFBIbDBjdFRNclJpTkJzM3Bl?=
 =?utf-8?B?QVhMak5NbHNFM1ltdWxLRXYzSFJOVWpmTTQxNDZDdGNyREtBVFFTMmVvUm4v?=
 =?utf-8?B?UVdnVHFSZ1k3S0xwTnRyWjIwSjAwcW9GNnQ0cGFkdmJMTWxmN3pySUdONlF1?=
 =?utf-8?B?ZlVJWnlpT29YTmVJeWU4MS90REx2aWR4SUdCVVlkdjVkeEJDczhyVTRDQ3JP?=
 =?utf-8?B?UVc4N3lFN1d3K1ppZklKQWEvQ1oxcXIzY1VUc2t2VE5CVDM4ei9McGZua1hQ?=
 =?utf-8?B?VWpEN2FRREdHRlBHdnc4SjRjQnc4MFNiRjE3Z3VQdGVMZDlpN3F4Z1gwNU5Z?=
 =?utf-8?B?clVSZDViN0RGQ3J6Vm1nZE9DV3Ivb2ZWa3RtL1RzVlI0Q09TRzE3akk5N3Q0?=
 =?utf-8?B?UDlkWTR1bExmTHlvejVkdTVBZGVHVWhlNis2a21pcTJUZDk0Tk9qS3NBQUxv?=
 =?utf-8?B?MTkxWVlJQk5oQnBPc0F4dmVjSENUbTMvYkJDbE1Ka0U0NEcvcWFTa2N6bEVy?=
 =?utf-8?B?S01Ndm12aFJyTTd5a0t0cVkzNGtLVzNxUHcreG9UZEhvc3Y0bkNaWnlTVGg0?=
 =?utf-8?B?ZmU0Ym8rNkNlb2MzclNRUHhTYVJoZ0R2YjdhaDB3amJLOXVrQU9jOWxEMHRC?=
 =?utf-8?B?RXgwdFdMeWs3NDdEZHZKd1Vzd1dMaWRXTUlqc2x0UGN5L3pXdUIwUnEySGxD?=
 =?utf-8?B?bUpFNlNRTFlncTI0clRFOTJDKzVXbmwwMHZaUkFSd0VOakpCem4rdlY4NzVS?=
 =?utf-8?B?T3VWbFgvc0V0Z2lVd29nQ0xUdEY5RDJnQ0pzOVp2elo3Wi90N0NqN2RLa0pX?=
 =?utf-8?B?bmc5RkdmMFBUME5nVWFmNm9naDdOTDNGYVR3a1ZDME9YMnBDM2dpb3VsQ1RO?=
 =?utf-8?B?Zkp2TG53RGJMS1RxSGN2NlU1SmdZNUU2Q0ZGWklJZDJtSWpyNFFBdDhtNDY4?=
 =?utf-8?B?V2JIUkh0ZVA0eCtnc2RRZjN3ZnlycGE0bktwYjBZTmJXY1pBQlRFWVZvYXp4?=
 =?utf-8?B?QnZjc0xwckZmQXZkdTZGUUJLaU5jcldNcC9LMnVvR2tuRmlEQStzSkJCWlhS?=
 =?utf-8?B?WmZIbjRuZk9tYlBQWGJrWEhOVEZvdkVXR3ZJT0I1VDN4eWR4RlhjVm4xT0hW?=
 =?utf-8?B?UWJoQnduRE8wL3RuRXI2MFlBMkFzZUZQeEJkdFNZVkJqOXlNUFJRZ0dHTk9Y?=
 =?utf-8?B?cjJpYm5hTXlMMFhmMko4VGYzV1ZyNTNxVm4rSjFnYmFzeTFNYVQ4eHBPU09U?=
 =?utf-8?B?SnVob3dPWFphZXpWWklIcXZWaDE0M0d4Vml1bjJPOGJ1OVk0TVhlWXcvdTZ0?=
 =?utf-8?B?c3ZOR0pEZkRKZnZMWFpJelZDcUpEeGlmWmhxU24rYzBiSVphb2tubjBSa09t?=
 =?utf-8?Q?QCVqlrOZdWJWtNpyZNgVshcEn1m11mkU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkJONnQycHdPVmJTTUNHWnF4czdGZmFRRmNxVjR0emd2VHFmNHZkbENwN3da?=
 =?utf-8?B?Q0I1b25PY1pxM3ZxQWc1VWdOK2RVWkFMLzNDenpMRHptcGRBdmhkeTNSNjZr?=
 =?utf-8?B?SUgwUDIwbTFwSS9PV2hPTHF2NndienhKN2tUbmNzaWFqd1VIUVhSKzJncGt0?=
 =?utf-8?B?L0dnZkRaYnJyb0tMNFQvcmxsc1F6MmJ6V0JlTnJsNU8xeW5XTGpmNlp3Y3Zm?=
 =?utf-8?B?MTB5RnpvSVUrU1YrS0FETXRQbWFrN1puVHdUVmVnbVhqTmlLaTlhbXpoRWFl?=
 =?utf-8?B?ZnpEOERlUTUwMGd6Zk1mWS9zZTJyRUhpZGNoWW9HT2RpTXlHTzNxQkFNczhz?=
 =?utf-8?B?RVRZV1BkY2tDMVhUOHd5TXVmN1NYbTJCVHdzRUV6VXRRU1FKZ3VkUFUvV0RI?=
 =?utf-8?B?ZytkSWJtWCs1ZlZDL1RFTEd1ZFVDS3dEUUFXZkNZRTVnNkFvVDV3SVdTenBp?=
 =?utf-8?B?cUN0amRhUFYzVGx0TTVSS1ovdUlSd2xhZkdmTVZZd0ZwVU1zL25QVENUY0Qw?=
 =?utf-8?B?Z1l5bHFBQU5maWJ0ZW5sZDhtVU5vanRNK09yY0Z5Vi80Nm9IWDJ5V0xpek91?=
 =?utf-8?B?cDV5S1hTbGczZlB2MkJxd1UrQUNGSGtmMEwwd3o4Qmd0UUx4ZzRPVXorQ0tH?=
 =?utf-8?B?Vy91NWVOUnA4NGFmTlJrRkhvelcvSFdtK2svOHByN3FCcnNROVp3NFkvc0l2?=
 =?utf-8?B?aVVvOGlJRXk0ZDhMMldpYklzMFY3enB6SXhSY25zNGtDOUY4NEFxNmt2NmtC?=
 =?utf-8?B?SHBtdkpNYkM2MENVaEVCbDQ0QzlIcGRqU2dNcFpLVFZtZVJrcXU1ZHZjem5U?=
 =?utf-8?B?QzVHRW0rMjVTOXF2QnhsZForS2t1enp1b2c3cjVwVm9QSXprd3ZjSjJFcEJU?=
 =?utf-8?B?bkV6bmhHWlZLWHFvUWdiNkJWeTVmdEpWS1d4aHllV1FUL1MvbnlISllLdnhI?=
 =?utf-8?B?QS9XRGJNZzZTMmJ2Y0Vud3BhSE9uUkFxSzVoOTRMYUpaZjNsMFZHVlNjbFhI?=
 =?utf-8?B?enRLQzBiM3FqN2tuWUU0MElGN0xaSGJ4Uzg1Ykd4cy93U3JSbFVsVUdBcHNk?=
 =?utf-8?B?R0FnUDVXK0hJd05DSU5zdzJ0aTlDWnZWY20zcnhyaS8xQjNYNFFIUGVlWWJw?=
 =?utf-8?B?OVBlMHBZMTVvQjl1bXRHNDFJdUlrd3htNWhUZ2hqK1dwTnAzRGQ5eDRXNzJC?=
 =?utf-8?B?eUJTUWUwVHdmNERtYTJ6VHJTbVVzZDl6VllSLzhWUnhZMGJDblU5S3BDNzR4?=
 =?utf-8?B?VWlQNTVNbmpnN2hTQVBoLzJTQlJaZWtVQ1FWZDIxVXlPQ1hPMEtxS1plMjEr?=
 =?utf-8?B?TW1LU3c1MEhobUZkbGt1a01majU1R3lkcG9HRXliQlprNlluckg2ZGlKVDht?=
 =?utf-8?B?V2NXOTVlcmpSSkVrYlJPYlBSS1RaWVlwZUluTjhwT1Raald4d3Yza0pRNWxC?=
 =?utf-8?B?TlVWTUZHUFpHOWRYVEhQYjgvcUpUSzZTcDdBZjIzTzdiZEpWTmxhVVBUUDlD?=
 =?utf-8?B?c3Fud2dBVG5LL21EYmExTzV5aFFZSWx0M05rL2NZQlVxZTBocXBqeTAwaCt1?=
 =?utf-8?B?ajI0ZGQ3L001UllLTWZhUDVHRFNHZEZKYjNMaXh2ZE4wRGsvNlpGRnY3dEFC?=
 =?utf-8?B?MlVyV3ljYWR0NFdXaXJ4THBzcWd1YlVSRUFsYmVVRG9kZnVxUkRyMzBsWE1t?=
 =?utf-8?B?SjJFNU9FWWllRGZYeHQ1MWxRNkpSVjRmMm1ISVgydklSQkdCMGlidDd5dW5Q?=
 =?utf-8?B?T3lLVEw1SHhGek9uWkdQZEdySlR0K3hEdi9Gb3MrNm5nNGNxNnRnQklOUHAw?=
 =?utf-8?B?WkJQTUpxcWVnL0Z1SVY0UnJhQTZkNVpIdDl2VEZ2OHdlRW9QVzlibDdGZTcy?=
 =?utf-8?B?dzc3S0pLRUtxL1RZek5aVUhMSStIdkhINlRWTzNjbHZOVU9UU2s0eFdQd2Rs?=
 =?utf-8?B?QXdLMFlMalRDSTZoOGhCRjhhMjVzL1hVMzhGVUhFSEtKOVVtL2dLbllpdmlD?=
 =?utf-8?B?ZFlvVEsrTzlwNVlRL1N0aURYMDBNRnRsNHVHUndXNUd6SEhIVmpzZE03emIx?=
 =?utf-8?B?VWkxcnRIWWlMdFJFb2toOTM1YXM3Mzl2cTg5UWNVRGU1ZUtyTTBJZk1hc0N4?=
 =?utf-8?B?RDhmUGJLem1hRkNWQXZHUG03cldHYW9XRUVzMklocUVoQmhORVRhd3hKdnl1?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7629437d-cc10-4f5e-8af7-08dd28d05887
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 12:49:06.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XdwTnoTtmyfe2TYcjZgIXzfLVATtSIlzckhrQcYVv1x/24IIPNG84gQ495a8bGyntkNhRK9xP8TJoemsOGLwrAKAGJMOBWvDEEO3YaHOGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

Hi Mikołaj,

> On DG2 when RCS engine is active, the CCS engine freezes which leads to
> hangman test failures.
> This patch disables RCS and CCS background spins when testing any engine
> on hangman.
> 
> Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
> ---
>  tests/intel/i915_hangman.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> index a556eec53..6f1fdc788 100644
> --- a/tests/intel/i915_hangman.c
> +++ b/tests/intel/i915_hangman.c
> @@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
>  #define ERR_FENCE_END  3
>  #define ERR_FENCE_STAT 4
>  
> +static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
> +{
> +	return e->class == I915_ENGINE_CLASS_COMPUTE ||
> +	       e->class == I915_ENGINE_CLASS_RENDER;
> +}
> +
>  static void
>  test_engine_hang(const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e, unsigned int flags)
> @@ -388,6 +394,14 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	 */
>  	num_ctx = 0;
>  	for_each_ctx_engine(device, ctx, other) {
> +		/* Due to Wa_14014494547:DG2 we can't run RCS and CCS
> +		 * in parallel. We still want background spin of the
> +		 * same type as hanged spin to be run.
> +		 */
> +		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other) &&
> +		    other->class != e->class)
> +			continue;
> +
>  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
>  		context_unban(device, local_ctx[num_ctx]->id);
>  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> -- 
> 2.47.1
>

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof
