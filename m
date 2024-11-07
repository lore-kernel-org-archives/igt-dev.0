Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FD1D5AE60
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 05:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7EF10E231;
	Thu,  7 Nov 2024 05:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBMqiQiK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D097510E231
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730957307; x=1762493307;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MKtFTXv8+56J/dke6dl2x6g1NtekhjV5FOYpeEBKX4M=;
 b=aBMqiQiK9RyTBp4BMPG4+VlvmFW5GqNJT6EmFFb6jR6+Kp2E0WOeXKLX
 kNAfFQJxfeQZTnUPPW7joB+pdayLaPDsokR8Vw/tArj7dCCwOXOFyB180
 iul3Js/nqfo7vcMDTkPNfSGqDYIu0cAq00/qPuMfLyaa/gFhPXnkvyLQT
 gbW5NdAsmiaNSiR1ON/WO2xrtAJPNUuSzlXX7HPsipciErPTSFdPOaGh3
 /fYuvQTKTgQxfNOXpx6beuRaFgaTKdC8UDbl8nh7aIfK1d1nhtadm2Rli
 8odsmJ0iGpV7gohyMO/oDbXl7ie2Id0xWmgr99dWigE/Lu8nx1P5UdYYJ g==;
X-CSE-ConnectionGUID: iwP/pr/iSLuondijLFLZxw==
X-CSE-MsgGUID: 9IfIRhF1Q1S+lQcvKGqUUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34479365"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34479365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 21:28:27 -0800
X-CSE-ConnectionGUID: k53mhdUSS8+/aiyKyxHsmA==
X-CSE-MsgGUID: D7cRK9SMRICkRR+g1QuMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="89453584"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 21:28:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 21:28:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 21:28:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 21:28:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofUdbeusuurU1WTSBJZ5OoxDUElgCxAi1RrJOULS6gB1jc/FksGBJM0Cjv7R/i0GGcEQQ4ktDm7cJdvNrtbT6GhoY9u72a9vTSKFY82cObDJpzkiMP93+zy0DP/2FHLyvPDYc8R+GZt1E73q6RBkLi4PjJCefxhckJYMjVS0r6FZHJMF/zV9B+byJZk1S6aFoTOb0pphNEW0H4Q3Ei+7uDYPTOWG64wG8l/QtiY+vhx/OG8uKnNbJK0UfhA4Ccd76Eb2WMlmietqC6zRqQ5MsMEenItA/Ty6Wi0sQvG2GhKBLJu+M7tCzGWQkwa497MUvEjv2bo7Z2UtrV33rU/08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSULAnRkRc7gEp0YyFvT/11fznnU268z3GR01eBSBrU=;
 b=r9Jbcc79ehOCb4Ov74sQJkxl51puXUclQHlaewI2DBQUx+S58t+Z9F8aavhO9JN/YRSdl6vtLzZ6voSxZpw46dN+9NaQST6DBt9NmMvAvPxocsURkF+9K6IDOs8xH18CQM6s4WgCC6nR1LOu/9Lk9WKRkcdkWFpez/MhZXmwwWf6Unut+avL3quUBokxwLq+37rf1UdNTf9A5IfSTqDQRd8GiEV3wEBhOU99sSSyTRHIdoDJWhTfxWq6bydSQEbBMLbkEb4kWj8Q65sjMZ/8DuHVnzwY/iM+AmGjb4nRwR9i2tcIWXezgdLyGTEjUY46MfVcbtvMqnPjIzoVIDRiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 05:28:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8114.031; Thu, 7 Nov 2024
 05:28:21 +0000
Message-ID: <0733f802-b411-4826-a50d-38dd1a44e248@intel.com>
Date: Thu, 7 Nov 2024 10:58:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/1] tests/intel/kms_joiner: switch modeset
 between uj and bj
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241022022953.1422653-1-santhosh.reddy.guddati@intel.com>
 <20241022022953.1422653-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241022022953.1422653-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a74ac1-d44d-48dd-e71d-08dcfeecfde4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFNTRE04UmcrZ0VHZXJaWjRRMGdYdW5yK3loVDA2VWc1Unl5bTZ5T3Y3ZnZl?=
 =?utf-8?B?MG5iMmt1T2JqeGc4UW9zWFZwSHpZWXZScWRhT3h0VGdiMHhHd2tNTXdlVlFJ?=
 =?utf-8?B?MkRVQXcvTFdiS0NLYzB3dndUck9QVWtTMmVJbHhDSWZiek9vTzQrTWtqRWpt?=
 =?utf-8?B?VnJjeTRwMnZNYWYxR0RUUThUMDdGQ2M2WlZnTEFKTC82c1Y0Qm5SeWJMemZM?=
 =?utf-8?B?OHgxMXRRMXN1d0FrWW5CWWYxVER3TzZiNVBzaXQvWFhXTU1LREUwbzFiZTRR?=
 =?utf-8?B?YmZKeUxzWkVEVmE4MllKRU5QdmxMc0ppdFpjU0xkbGZZUHkxdk9DaTVUdXNG?=
 =?utf-8?B?U0pORCszMlJBK2h0bGlPRHRQeHVGZmNUYnhCWGREcjlQMDhWdGh5NmxzSkxQ?=
 =?utf-8?B?QzFwMDNrb2dBSnVqUUx0NUtyQzA3QTBwWWNNMVF3cmhpVG15eFRtZmR6cGYr?=
 =?utf-8?B?eUNoR01ZOVBMVzVqcDc2SUJHM1loU211ajN0eEZPanFsYmVrOFM4Rmg2cGxJ?=
 =?utf-8?B?TFkxdWcwdVdEcHhFVkc0TDQ4OTk4b3NSajFGdTRzV3RBMGhiUTZZSzVLcnA1?=
 =?utf-8?B?MFZ3b3d3cExWUkp2VFB1VHd4N01BWnVzMVpieW1GdGJPNHczMFNtckZVVlZH?=
 =?utf-8?B?RnlXOFpLZndENE1PNUY5VjVoM29NdVdxZEtzcW1NYWRvMS9KTW5GVStqcnRt?=
 =?utf-8?B?RGpGckxvZUViRzNCcWhKWnd2U2U5VHZIR0JGdU9HWmpISG01OS95T25KZkp2?=
 =?utf-8?B?UVE5NDhBZEFBUkFVOGZuaWl5M3dPSUR2SXZoZEJYTnFOa2ZJdEFwK0hIVXUv?=
 =?utf-8?B?eGNjUjVWanVraG4zY05FTHdkTWFGUVg1MWYxWmRVVHhodk9IK29YRVo0YmRm?=
 =?utf-8?B?QktxdHdncXZFZ2F5SXZCb2V3d0ZEWHhZWHdlclVZUllJNHJEUVBQR1hBTlJo?=
 =?utf-8?B?KzFldkpIUXRQT3EwbW5NbTVIR2I4dlErVkcvRnl4QTZCMWxhTHRkUm5MZE1k?=
 =?utf-8?B?T1RFUm14SThIblo1NEVLMWdiejJ6eStadFR6QnBpb216RkRYcXgwaHNkbWtB?=
 =?utf-8?B?clJzalhRdytHSFRRSjJaOGJTOFFjbFRBNGp3S2tnR2lnM002UmJmKzlNS2VG?=
 =?utf-8?B?a0VkSDljdHQrUWI4VEZKeEM0aWhGbVc2cEJ1VmkramIxaGNSdGU2RmlrWmEy?=
 =?utf-8?B?NlIwQ0JYN3F0SVcrVHIvVW1vYkFFNkhtdURQWnh0MXNqVFN1dHliL2RTVTZr?=
 =?utf-8?B?VjRMdWNvYkRjdHVRL2d5c3ludWY4a29iTTIwcmQ3c3pSZzkxNGRtTmh1RHpo?=
 =?utf-8?B?eU5BTXlSZDQ3T1JyMlZVZnJPekxEc3R3YkpVS2VUMmFwdEMvYkdxMXVUMkVr?=
 =?utf-8?B?Mm11ZXQzalhBK2s0RlZzbytZUittNE1zSDRZS29JVFp1dVRsSzRjM2s2dFNk?=
 =?utf-8?B?ZzgyQm5DaUk1aFpxQUJCMEphVDJld2dvQVEvQnk4SUtMSWFZV21RQ0hJUVV3?=
 =?utf-8?B?bm5sd2RHM1QrK2xWT3Q3a1dqRFl4TnNQb3J4Nnh0ZXZ2TXU2eUpqTTQ2cWJY?=
 =?utf-8?B?c0NHNUpRMnpDaUp0RThjL2grT0M2emdMakw1QnFIUGF0WlhzaUVIOUp4QVJG?=
 =?utf-8?B?S1d6ODFjQTRSR293TkI1bFAzQ21HNzlwdmcvVVM0VnVERjllcEhXc2c4c1Ju?=
 =?utf-8?B?Qm1iaGU1emd4QWdTcFdzdm53OXdDaWQwRGtQVGkvYWhOWmpwbE5KRWRIdmJL?=
 =?utf-8?Q?ANX2mUPGggNibrSLQqc71P3usRmY/VLrq2BRRUs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZZeWZZV1JmMGVrMk4xN3RhSlUvcVFLKzVTbkxjTnJaTk1TbFVodmpwM0lC?=
 =?utf-8?B?ajRqZGFuM0N1ZDFpUWE4NFZSVjc2YkNGY2JYMVZIdEpBU3Nxb1ljRVkzUFlh?=
 =?utf-8?B?RXM5elRoZ250UlJrcW55d29QQ2Z5bVhvNDBPR1dLcks2YStVaHN0d0NMRXlS?=
 =?utf-8?B?U3dETzd4eUZmYW0vRi9OK1dPUXprSENPNnY4ajU1dTcxRURuYWdEeTA2SEU0?=
 =?utf-8?B?MCtIN3V2R2RZM2YySEFLaTNBQisvQkZHb1FydG8yclR6elI4bzE1cWE5MzRr?=
 =?utf-8?B?TlpvQ2NHQVNTMWlQbDN0QWF3RSs2UzRUTnJjS2RKQVBRajZ4TXRNNmRSOFR5?=
 =?utf-8?B?cmMxK0lmTlJOZ3ZmMDdTREViWlVESithNTdGQkNWUktqU01XeXlmSDU3YW1o?=
 =?utf-8?B?YUtScTl1NUxGZ0JFbWVkYjdVMVI2ZFgxTzdjWEMwdGp1Q1BKMk9UTFVuU2xD?=
 =?utf-8?B?RDl3MWVKSDcvUE94ZUM1S2ZJWDhjbGRldkRZM05kVGcxc1ZLNWNiaXhHN2NW?=
 =?utf-8?B?YmlrRjRrbFZ1Y2cvUk91amxwRnFaLzM4WGFCYURvVWJBUTBHOHdTT3hIT2xY?=
 =?utf-8?B?eXNZNm5POXBWV3BJS2JXUnlTMHY2Yi9OeXBiK2dzSGpVSWVnNisrV2VuTWlG?=
 =?utf-8?B?YWpBcjNxTGsraWJRUjRmVTh4aENVdlhKdkNZcWFZY0xFMUprNURWWWFLeG5W?=
 =?utf-8?B?dUhJc2hDckFpSHRLRXEzMlF3TzgvTFN1MHRoUGlaTWZsSjVrWVBhTWViZFBl?=
 =?utf-8?B?YXlxZzBwcVo1bzEwY3I4MjU3U24vYW9XU0UyWkw5S0ZWSHFPZWViRFhzNUJj?=
 =?utf-8?B?NjZzdGdGeG9UNDdUM1lDclJ4OWhTdUhHRkE3aS9xbENYU3ZSQmZuMjUvVE05?=
 =?utf-8?B?aVVwbnRwcEsxWjE5bTNUSmZ0Y0JUbjVYRFdOZjluNVRnVW4zYjdqUjkzYXgz?=
 =?utf-8?B?SmVKSmtvS1hRdXcrZWRabExrR0dLQjQ1bHRjVmdQNnNtdFhCZ1FITTczYUhQ?=
 =?utf-8?B?MURiZFBLSFNZRURaSitib3U2dlVSQU1Td0lSSHQ0Mng2cjgwSHhyOTM4MXBm?=
 =?utf-8?B?MUxsSkpQMm1zMkJ4TWlYbCsxMzg0WXUrQmhPU2NISko0dEZpOUIzYTJWRDdV?=
 =?utf-8?B?R0ltVHRvS2VlWVZ4RVYvWi8rOGdndXJHcHp6MXlNRnNJMUsvQVZmSWp3RVpi?=
 =?utf-8?B?elNHOHlxNWpnNmdZUHNUUnNKcTJxcTBBWDZDb0szSEdPejVuem56V1NEdnpO?=
 =?utf-8?B?eHVLMittYzVLaUZzekxVYkFQUmhsdHk4WVJnT0JLQnpUaVdUWFhJY1Y2dkN5?=
 =?utf-8?B?TkxPYi85R0pkRlQyaFNYdTZkVjhiVlFPdmF1NnlsK3Q1eWU4VWhzQXdPOXYw?=
 =?utf-8?B?QUNQWkF1SXdDb0hrUStwMWpmSlBhaXBOaXhmNk1iRE5obEQzMVRGb2NEU09B?=
 =?utf-8?B?UTF3emxxejMxQWlMaHo0T21acXBycnJCK01SRnVBNjE4NHdQcU93QWtwanlZ?=
 =?utf-8?B?UE9TRVNoOEV4RDBQWnNNVlh5YTR1NElEQ3ovSFVIN2NyRDVhc3ZQMTFQNTEv?=
 =?utf-8?B?N3NTMVlBcHNQUVA1T0FNQWR4eE9lcnJSb3JWMWJ3aW9zS2hCYjBaYjhadmpy?=
 =?utf-8?B?UTFrNGcyQkpCSUpjSEtsN0o1eFFDbkU4cUZJellhZ2JEVTF0cmJVL04xK0hC?=
 =?utf-8?B?L0Q2ZXkwQ05iSnArUFZMM01YN3ZuUTNuQXh6WHdnSUFqYW5OOGxqcFFGTXBR?=
 =?utf-8?B?cjBPcWp6bmFsVUhEbG9VMzBXenJjMVBjcllDMWs2dXluRjN5QUUvazNyM2tG?=
 =?utf-8?B?UTY1akhiTi9NYmdQTWxmNi9qTW1YUGhVTnVvMkpwVEtqTWJubWlqZjQwZWtT?=
 =?utf-8?B?dC9Pc2xNaUhVcU5hWTZnOFdXN2Y0RnJBa1pnV0dKSWJvVnduLzB1V2pzNlZN?=
 =?utf-8?B?UnJDNXdrRU5yaXA3NUNCb1djc1dqNnRxR2E3RlpKekJuT3ExYmFRdGJiSlFS?=
 =?utf-8?B?U2c5TDRQWFVUcExHeTh3REpSNGg3STczNUt3OHVWYjdwa1h1MGdHYnRRdE0r?=
 =?utf-8?B?dTZBMHdjMHJnaVRiMVlNeWUwbzBvT2RVYnAyNlBKVjBRMlRBK2tscGZQNU1j?=
 =?utf-8?B?SXhXRUI2eWJObWF6YTF1NW5xVitEa09KaWRwRUJtWE5mMnhHQkhYV3BEb050?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a74ac1-d44d-48dd-e71d-08dcfeecfde4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 05:28:21.0411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPa06whFzzmNBZG5tcboyjrdAcSuORp6SlMwRU/XoINKR0i+mH4HQ+gnUoENmp3GvulLirZGxhsYPqUWzZhriA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
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


On 10/22/2024 7:59 AM, Santhosh Reddy Guddati wrote:
> Add a subtest to validate switching from ultra joiner to big joiner
> and vice-versa.
>
> v2: Add new subtests for switching without force joiner (Karthik)
> v3: start with uj to bj switch, if not available switch to force mode
> v4: check for uj, bj support before starting dynamic tests (karthik)
>      call reset_connectors after forcing to uj
> v5: Add a separate function to switch modes and execute test for each
>      connected supported output (karthik)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 94 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 9a353ee1b..88d1567d7 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -71,6 +71,9 @@
>    * SUBTEST: invalid-modeset-force-ultra-joiner
>    * Description: Verify if the modeset on the other pipes are rejected when
>    *              the pipe A is active with force ultra joiner modeset.
> + *
> + * SUBTEST: switch-modeset-ultra-joiner-big-joiner
> + * Description: Verify switching between ultra joiner and big joiner modeset.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -161,6 +164,82 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> +static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
> +{
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +
> +	igt_output_set_pipe(output, PIPE_A);
> +	igt_output_override_mode(output, mode);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_connectors();
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +
> +static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
> +{
> +	drmModeModeInfo bj_mode;
> +	drmModeModeInfo uj_mode;
> +	int status;
> +	bool ultrajoiner_found;
> +	enum pipe pipe;
> +
> +	drmModeConnector *connector = output->config.connector;
> +
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
> +
> +	if (ultrajoiner_found) {
Hi Santhosh,
> +		uj_mode = *igt_output_get_mode(output);
This is redundant as this is already being populated in the previous 
function. Please remove this.
> +	} else if (data->non_ultra_joiner_output_count > 0) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
> +							JOINED_PIPES_ULTRA_JOINER);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +		uj_mode = *igt_output_get_mode(output);
This sequence will lead to test fail whenever we have an output which 
doesn't support either UJ or force UJ. Please use 
"force_joiner_supported && is_dsc_supported_by_sink" check before 
toggling the joiner debugfs.
> +	} else {
> +		igt_skip("No ultra joiner mode found on output %s\n", output->name);
> +	}
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +		set_joiner_mode(data, output, &uj_mode);
> +		/* Switch to big joiner mode */
> +		if (bigjoiner_mode_found(data->drm_fd, output->config.connector,
> +					 max_dotclock, &bj_mode)) {
> +			bj_mode = *igt_output_get_mode(output);
> +			igt_output_override_mode(output, &bj_mode);
Same as above.
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_BIG_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +			bj_mode = *igt_output_get_mode(output);

Same as above.

Regards,
Karthik.B.S
> +		}
> +
> +		set_joiner_mode(data, output, &bj_mode);
> +
> +		/* Switch back to ultra joiner*/
> +		if (ultrajoiner_found) {
> +			igt_output_override_mode(output, &uj_mode);
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_ULTRA_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +		}
> +
> +		set_joiner_mode(data, output, &uj_mode);
> +	}
> +}
> +
>   static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
> @@ -592,6 +671,21 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> +	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.ultra_joiner_output_count > 0 ||
> +			      data.non_ultra_joiner_output_count > 0,
> +				  "No ultra joiner or force ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
> +
> +		for_each_connected_output(&data.display, output) {
> +			switch_modeset_ultra_joiner_big_joiner(&data, output);
> +		}
> +	}
> +
>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>   		igt_require_f(ultra_joiner_supported,
>   			      "Ultra joiner not supported on this platform\n");
