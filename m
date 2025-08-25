Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E7ECA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 09:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215110E250;
	Mon, 25 Aug 2025 09:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTni0oqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A9910E250
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756113326; x=1787649326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FC2t3PsjExtkwHNVUXrE3xatzujt+rsfIgH+jPz/FGs=;
 b=VTni0oqJxP5+rPrdyRjdPZQAoDrmTZJTowj096WiHVeLQ/g0kPtc5Mo9
 glWSFgmpAGjAS31O1n0MGULh3fzjf6IaeRb9NuvAS6w+RKbneMkNgF6p0
 3TWKfie2TOj/2vP2DLK6BAKe79pjo0pPf/jjJlmRADGgFmvHPsNK6jZnH
 uKjZgvoqpYtZ0yjOUPoVZEYX7knLxqQsH1qsyP1Asp+13W3PSmokFDW0M
 BWDocDyYxlS+atZerYfm+H5z/eZTpkiwCIiQhDk8AlsXgfoeH9WUHLnxd
 KePf/8X8huI9GvB2kOoKCCS4aFzPvSNOZg5DxaoooVmdk3d9mejTPOBrq A==;
X-CSE-ConnectionGUID: +HN5RzyOSpiz/P3rPRZ6sQ==
X-CSE-MsgGUID: 10ND20YXT6+ZYA5eSjT3VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61963029"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61963029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:15:26 -0700
X-CSE-ConnectionGUID: Ybf4CmvERpSg8JHBw768bg==
X-CSE-MsgGUID: zAVWTpVCQ7iKtdPguuGUvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="206416223"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:15:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 02:15:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 02:15:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 02:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scslva/jBvDGyJcvbTCBQKHeFxu6Ke0PO9kXdPzKNEs1DBavwyAcBQzT849ScGu2npqvaf8QQflJ0BDJCccW9GFsnZ69aYAr+dBUGwxchtBX7EePjusbrKN3l7aGVKkoKw/PWCEzjuVvZD+GYzyaDwsmtWmMEj0dJFAH7gx6yy8C1QKgSNd3eygphHrVKrCIdGJeFCmSMvk9Oyfa7IoSQPAfIuBI98W6TwJKpMrmZ3bOY8d9cYU9x/MrtZFvleD8SidH9O/IaACjOdxFTnmuiVExNlxl3OYETDU4fge5FrTM5bKnfB3wBqMfwvIVbZHjuifT55nfsGrW8pGNXfve1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lK/TW+vQG06XWE8hiqYfvaE/qoBTUwOaj4iMHEBNUQw=;
 b=x/hUqfEAag3HRUhiT6B45NAKaX1dvbSv2EyunbC+wpoXzfrjk6tviXprMb1ejBWojjt5/hvxJCVnRWfoDRsvIT4sQR7TmCXe0erVtAqVRe9TzUxprbW6Etdc8JiUojVipU0nUfHpK8aynpieYAf6+KbDX5qtcphMxUN9HKDk9Bw98vTDR/voWmgrv9QOEcHrZARUdagP6VU5ebKHnieQ5bLMkkEY5ydr3fZg8AIvmGXAl3Fu/OK9gCgRn1HXe5BixXHLdHIA0hpJ+VfTARn7HJ9VTpvWFlb5i9mzEGYoSughCFhBxvjF+8VlWjT+O44TAXvTtd8yjSGHsEy/92BgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 09:15:22 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 09:15:22 +0000
Message-ID: <b72d5866-023d-47f1-ab3f-5f44e41bce29@intel.com>
Date: Mon, 25 Aug 2025 11:15:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 2/3] tests/intel/xe_sriov_scheduling: Compute
 throughput from completion timestamps
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20250825082254.444880-1-marcin.bernatowicz@linux.intel.com>
 <20250825082254.444880-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250825082254.444880-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ1PR11MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e5676f-83dc-416e-95e6-08dde3b7eb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0FaK3JiWWxwbDl2U2ZzNmttQ3FYaGlsRG1LK3JUZ09EWjZ1blhBUGE4cWp2?=
 =?utf-8?B?cHJVYUkxYjE4bG8zT0huMGJsTVVQSFBtYlc4Wm1HdW5lc1M0dVdYN2pCamc2?=
 =?utf-8?B?eW9iVk9BU01uWGp6dDlORUhVT2pRMk1RNnhUQldLd05uK2xJUzJUbUFYTXpY?=
 =?utf-8?B?U3kyckFnc2IvMjV5S1Arajh6Z0pNNWtOWWcwZE1iRVRJVzROTnV1eER1ajIx?=
 =?utf-8?B?MHM0dy9Tc3lEM2h2bFV3RnVhVFNpZmJ2YVpwMGRsVWltSXRHVkVxZW5XNVpu?=
 =?utf-8?B?djdIeVlIM3Q4eSt1eWQ1OXpBWS91N2RnaDd6UGhvbzZIVEVXRGxFVk5TSmJw?=
 =?utf-8?B?bnFNWEZsNTVsOVhvbFRYSXE5YVNhZHhweFRDMDVJNjY2MlNER0hWWm9wN0tR?=
 =?utf-8?B?Q0kxNk50N3lpRmpLdXo2V3R4bEdaT1RKaG9leW9lR09MeEVZWTNEMisvMDR3?=
 =?utf-8?B?Z1ZUK3dXZXR2N3ZqN0J4c3dxVVFBY3g2S2dVa3huZmh6NFROby9IeVhwbFYy?=
 =?utf-8?B?eGo3THo5eWRHQXhUdUc4dzBXWTJISTdobkVrVlhucUdJR29GZ1RsT3dEaXU2?=
 =?utf-8?B?bXVhUGFrL1ltZWtCQ1I5K2xVUjRSaWc2b1J5TEZBWGJka2ZabGIxSktNZWww?=
 =?utf-8?B?dDVBM01GN0I2dFFXd2VkaTdsWHN1V25lVm5KS3poUDJLZHN3UEJCT0w2MjZ2?=
 =?utf-8?B?Y0VMc1B3bWNMV1laSlQzb1oxZ0V0Vnp1ZUF6emV1cThtTWxHNXFUYW9VUXZx?=
 =?utf-8?B?cDkva2NKV1VYZGV2VXR2Z0s5NFhqYlF6eDRYZmRqY3VPWE9EeVR2ME4rUitV?=
 =?utf-8?B?eGxnQkd1a3IwSzFEMEx2N1BVMkF3Q3hPTkQwcEIxQXlHK3pudzY5a0hJa0k1?=
 =?utf-8?B?SmRFbVJoSlRXWE96dnJGT0dGWjYvNDljaGxRd3ZjN0VUQUo5RUxyNWhzS3VT?=
 =?utf-8?B?YlRMR1NDVWNHdWJZZDdQU05iV3haVGhveDBtVUtnRllRQ2VZaTIvejRGMThL?=
 =?utf-8?B?NXZORmNZemdJMU82WS9XUmk1ZEkzMUJOWDk0RUNaM050MnhkTkVLSVlTYzgw?=
 =?utf-8?B?NnJ5bHJobzdkbXkySFNOVmFZeGRRYXZWK3BhWjQ2UEpwV05lRVpycWpYWjdl?=
 =?utf-8?B?VGp2WmJ4eG9XdU5uMnJFRHh5ekNnY2tWTW1DRjh6M3BjaU9FSURNZUdVS1lH?=
 =?utf-8?B?dnNTRFg2Y3BPdlY2ZklGaVFkQnFLdWYrVWpkZlNqUnFWWGVtaktqd01lMkda?=
 =?utf-8?B?WVVma1dNcmJidFZ3bFpIOEd6a2UzcENzbXh6Y2NjUXFNd0hDSVdqMHFSSzZP?=
 =?utf-8?B?a3FMQ2JQN2tlT2ZsSWZ1T3RXUDZDclVRMW1FaWRQcTFiMFlwSHFxU0NzRUJM?=
 =?utf-8?B?bHdXNUJlQ0szeStmV1RhQWZDUEJ1WGpjaDJTeHl6Nm43Q3p6UDUzdDRPeE5u?=
 =?utf-8?B?Z292R004Q0J0ZFcySW5JVU9Ud2M1dUZsSGdpUjBXam1FYmIrMFdOZkpYSU1a?=
 =?utf-8?B?aWgwelVqYmIrWWZISmtUVW1nYnIxTG1hQ05sdGk2OHdsWkcrZG5jdXR6U040?=
 =?utf-8?B?Z0pzLzJKQ1BZQmVqMUFzNE1pcmI5aUM2ei94WHl0cmI1eUQwaDJ3M0FJV2hG?=
 =?utf-8?B?VnptWGhNck5nYWNUcDdNSGJSVEN4MkwrRDA1RVQ2UndUbk5meWxVN2ZGdTVs?=
 =?utf-8?B?T2NjYXV4K3Q5UXAvTE5aSVRJejFZeUFHcmV6RjVBRHRabTJlVklZT0loQ1E1?=
 =?utf-8?B?RnZwZUpLV08zKy9QTTIrRkFjcUJDNERGbkp0ajludlUyRk5Bd3U5UEx6REZt?=
 =?utf-8?B?UDh5aTZ6bTgxTExVWXNHNC96dVNCVzN2b0pwSk0xS2N5NjlQRVRnMk9GSjFn?=
 =?utf-8?B?dUxqZ3JvUitpNXpueUtrSkVYb1YrdTBzQUpuQk1NdVJvd0E0WEhXcEJ2Mjdx?=
 =?utf-8?Q?x0qYssVt7B4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBHQi83RjAwbGVQa0ZqSWFBd0JLTVo5Wjl3dkpwLzBQR2U3VjNKV1BzZWhX?=
 =?utf-8?B?eWtrR255RUswV2ZzU2JjT3lWcDkyVGlvZzFlUmo1ZkNUOVVTL1pyaW9VNjJi?=
 =?utf-8?B?N2s3c1Voc0hFdnpRR0dtS2QwajV2TUlaQzRIbzAvbGJyT3lMRW8rVXN0YmZH?=
 =?utf-8?B?T3JxS2hFejdrcGUxOSthWjB4ckVBK213N3phblFUeEJJaVQxUy9FMy8wTkJQ?=
 =?utf-8?B?akhsV1UzNmxLS05aOW81WWd2QmNQVmZubVRvMERWM2tKV3RSTE5URDUrQS9x?=
 =?utf-8?B?LzdXTGFpa3R5Wnc2Q0M0MjduMHU1QkpSZmxiVnlhMDhjNTFQMmY1ZUQ4azhi?=
 =?utf-8?B?RGdsZVBLWFRpS0hHcUx1aURXQTR0b2RHcHJmZGh3Z09iZDA4bGFKcDFKVFlk?=
 =?utf-8?B?eFN2cnpleFNhV1JuUUltbVk3cFlKejlnSldEazVFZTVHV05qNStLMkp4UHRP?=
 =?utf-8?B?KzZFSVVjSi9KckY0Q1pScWEvYnppVE5TOGRPUnNUcFdpdDFQWFdLWUtSN2Vv?=
 =?utf-8?B?MFFHcDQzQTVhQXFuVjZtQlE0UmVIUDZBdGZrc29PMlQ1RWdFczBkd1dtWlg2?=
 =?utf-8?B?cHJRbHBqbzVmWnN1eFRoQnVJMXZtenpaWTNlMDk0cFc2TGtaUGlKQmxlN2Fv?=
 =?utf-8?B?U1ZvS3I3QmNqQXV0TXlUc1FYam5CT0RMalo3VUluRUdhdExSa2ZKVXV0VjFN?=
 =?utf-8?B?bUtJc2pCK1hJYmo4UitvN2s1NFk3Tnd1R1FXR0VNYzQvZ2cwOExCMDBBR1VT?=
 =?utf-8?B?Mms3bHl6eUp1L3I1UHBHeC9YYnNtN1MwU1FqKys3SFp2MEdDdE1tdUkyMGNW?=
 =?utf-8?B?SlZ6R1EvZ1lsSkpqcm1uZENYc3lnaWZmcnNPL0lmTGNvTXdzMFB0OExmRTEv?=
 =?utf-8?B?dXZtYm1VcC9uN0dMLysyaFdRWXVydlI3UVg2akFpMnlLQXUyZXByNzFpM3pt?=
 =?utf-8?B?KzlaTDlwakVTS3R5aVJMVllrc3ZOTzBPOStmNTRsSmtnN1UraVRuSDVVV0Nq?=
 =?utf-8?B?bUJOMHRNZE90YnVZeDNuZ1VDaFkzRFlTMDQ2bkhmNWl5dUFzMjMydzUwOUl2?=
 =?utf-8?B?NmpSckcweE1QQ0p0MUdRUDJMSGJYRkgyQ2FXaVowenJ5L3h0TDVMZ3I0WnIy?=
 =?utf-8?B?c1Job3ROWHB6MjdhWlFucE1FWVd2Nmx2S1h6TWRWdVNiajJrMGowYkJpTTNq?=
 =?utf-8?B?dm1KY1d5aTZrOUhpNnVpaEJoZXFLZXdNT0JScDlSRnEydDZqR1hCRnRvNTh2?=
 =?utf-8?B?ODNlTFlSTDlnd0FCQTYxY0EraXRzc3RqOXRoUW1vaE5adUZZalVNODUwMndr?=
 =?utf-8?B?THNZYUg2RWl1VVZjbnh6ajIwVnphSXBjbEJybSt5MTkyYmJqSkxQdDlRV1l2?=
 =?utf-8?B?L0xxTWp2bGx5RHBKL0dqU1E4RE5SeE9qZm4yTXlOVloyUkU1Sm83NmZIeGtq?=
 =?utf-8?B?MHRqMDZBNjFBOGJsRHU3RFJTdE5mRTBuNzZNRTkwemhFVUJKOTFRSUZsUU1U?=
 =?utf-8?B?VTNHVTJqVTYzVm1qR3dmOUhaUHFRUG9tV0N6ZVU3Z09TQ0k2cFBoeUJuT1NX?=
 =?utf-8?B?WXZiZSt0M1ZtWlRlZ1dEQzluT0g1MGlRTHp0WEd4dm9wdUJtUVBIYyt1L1Nk?=
 =?utf-8?B?TUtYSTVxVmtlVElpZzZORlJ5dm56NHBEYnNwRUtIZS9UaHowV3p0RG1SUnJQ?=
 =?utf-8?B?VlZSSkM2Wkh6U0FWZUtJamlXZGtTbGc0aWxmUGJhYU1nTVVxSG1uR1RTYy9a?=
 =?utf-8?B?Zk8vekFWdjFrYmZOU0lZTTZGYWc5dkU4M2NWVkxIMjl6MGFSbFdLRnZyVUd6?=
 =?utf-8?B?UElDTXZnUENXWTNIWkFjdTFiMnVEQ0h5RGVhdFozMS9NaWMybzk4ekRuUkNa?=
 =?utf-8?B?Nlh1eFpIb2V2VmxuU0V3R05mVXNtL1AyblpEUTFIei92VXcxSHorZUcvNkxm?=
 =?utf-8?B?cWpwd3ZRUTMzREp5dENqaDh5UE13R1FtU3M5eml3U0s5ZmlPM1hmZ1h5R0pE?=
 =?utf-8?B?cXpnSWlhb1lOcjRMWndKMWlOQ2RnUlF2UTE3R0tkd3hNdWZPMzFzT3RGNk5E?=
 =?utf-8?B?TkRPYWlsQ0s0QmVFbnM0MWtiMzJaSElTeDBQdFd6aVZTcmNnT0ZqdGdQcDB1?=
 =?utf-8?B?K0FBL0NuR3JvcXA3bEJHZ2djNEQxbDJCS2pFcCtLVkF1MWxybUtENXhxcURW?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e5676f-83dc-416e-95e6-08dde3b7eb44
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 09:15:22.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yzhxT4nlJY1cbYBiiVUFrNAhpnln8x3D7tX2vt6wZruJebP0/sHCDiKZLr3yRmXHHS98kc9EuGGL0KcrqcwIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
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


On 8/25/2025 10:22, Marcin Bernatowicz wrote:
> Make throughput comparisons robust under overlap/prefill and CPU jitter
> by basing the window on actual completion times rather than thread timing.
>
> - Record per-sample complete_ts[] and per-slot submit_ts[].
> - Build the common window from completions: [max(first), min(last)].
> - Compute throughput as count/window within that window.
> - Push durations as submit->completion (complete_ts − submit_ts) and
> print "mean submit->signal latency".
>
> v2: free complete_ts (Lukasz)
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 68 ++++++++++++++++++-------------
>   1 file changed, 39 insertions(+), 29 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index df93eaaca..314126404 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -39,6 +39,7 @@ struct subm_stats {
>   	igt_stats_t samples;
>   	uint64_t start_timestamp;
>   	uint64_t end_timestamp;
> +	uint64_t *complete_ts; /* absolute completion timestamps (ns) */
>   	unsigned int num_early_finish;
>   	unsigned int concurrent_execs;
>   	double concurrent_rate;
> @@ -54,13 +55,14 @@ struct subm {
>   	uint32_t vm;
>   	struct drm_xe_engine_class_instance hwe;
>   	uint32_t exec_queue_id;
> -	/* K slots (K BOs / addresses / mapped spinners / done fences) */
> +	/* K slots (K BOs / addresses / mapped spinners / done fences / submit timestamps) */
>   	unsigned int slots;
>   	uint64_t *addr;
>   	uint32_t *bo;
>   	size_t bo_size;
>   	struct xe_spin **spin;
>   	uint32_t *done_fence;
> +	uint64_t *submit_ts;
>   	struct drm_xe_sync sync[1];
>   	struct drm_xe_exec exec;
>   };
> @@ -101,8 +103,9 @@ static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
>   	s->bo = calloc(s->slots, sizeof(*s->bo));
>   	s->spin = calloc(s->slots, sizeof(*s->spin));
>   	s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
> +	s->submit_ts = calloc(s->slots, sizeof(*s->submit_ts));
>   
> -	igt_assert(s->addr && s->bo && s->spin && s->done_fence);
> +	igt_assert(s->addr && s->bo && s->spin && s->done_fence && s->submit_ts);
>   
>   	base = addr ? addr : 0x1a0000;
>   	stride = ALIGN(s->bo_size, 0x10000);
> @@ -136,6 +139,7 @@ static void subm_fini(struct subm *s)
>   	free(s->bo);
>   	free(s->spin);
>   	free(s->done_fence);
> +	free(s->submit_ts);
>   }
>   
>   static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> @@ -167,6 +171,8 @@ static void subm_exec_slot(struct subm *s, unsigned int slot)
>   	s->exec.num_syncs = 1;
>   	s->exec.syncs = to_user_pointer(&s->sync[0]);
>   	s->exec.address = s->addr[slot];
> +	igt_gettime(&tv);
> +	s->submit_ts[slot] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
>   	xe_exec(s->fd, &s->exec);
>   }
>   
> @@ -212,9 +218,11 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   	for (i = 0; i < s->work.repeats; ++i) {
>   		unsigned int slot = i % inflight;
>   
> -		igt_gettime(&tv);
>   		subm_wait_slot(s, slot, INT64_MAX);
> -		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
> +		igt_gettime(&tv);
> +		stats->complete_ts[i] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC +
> +					(uint64_t)tv.tv_nsec;
> +		igt_stats_push(&stats->samples, stats->complete_ts[i] - s->submit_ts[slot]);
>   
>   		if (!subm_is_work_complete(s, slot)) {
>   			stats->num_early_finish++;
> @@ -322,8 +330,10 @@ static void subm_set_fini(struct subm_set *set)
>   
>   	subm_set_close_handles(set);
>   
> -	for (i = 0; i < set->ndata; ++i)
> +	for (i = 0; i < set->ndata; ++i) {
>   		igt_stats_fini(&set->data[i].stats.samples);
> +		free(set->data[i].stats.complete_ts);
> +	}
>   
>   	subm_set_free_data(set);
>   }
> @@ -384,16 +394,22 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   	struct subm_stats *stats;
>   	uint64_t common_start = 0;
>   	uint64_t common_end = UINT64_MAX;
> +	uint64_t first_ts, last_ts;
>   
> -	/* Find the common time frame */
> +	/* Find common window from completion timestamps */
>   	for (i = 0; i < ndata; i++) {
>   		stats = &data[i].stats;
>   
> -		if (stats->start_timestamp > common_start)
> -			common_start = stats->start_timestamp;
> +		if (!stats->samples.n_values)
> +			continue;
>   
> -		if (stats->end_timestamp < common_end)
> -			common_end = stats->end_timestamp;
> +		first_ts = stats->complete_ts[0];
> +		last_ts = stats->complete_ts[stats->samples.n_values - 1];
> +
> +		if (first_ts > common_start)
> +			common_start = first_ts;
> +		if (last_ts < common_end)
> +			common_end = last_ts;
>   	}
>   
>   	igt_info("common time frame: [%" PRIu64 ";%" PRIu64 "] %.2fms\n",
> @@ -404,8 +420,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   
>   	/* Compute concurrent_rate for each sample set within the common time frame */
>   	for (i = 0; i < ndata; i++) {
> -		uint64_t total_samples_duration = 0;
> -		uint64_t samples_duration_in_common_frame = 0;
> +		const double window_s = (common_end - common_start) * 1e-9;
>   
>   		stats = &data[i].stats;
>   		stats->concurrent_execs = 0;
> @@ -413,29 +428,20 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   		stats->concurrent_mean = 0.0;
>   
>   		for (j = 0; j < stats->samples.n_values; j++) {
> -			uint64_t sample_start = stats->start_timestamp + total_samples_duration;
> -			uint64_t sample_end = sample_start + stats->samples.values_u64[j];
> +			uint64_t cts = stats->complete_ts[j];
>   
> -			if (sample_start >= common_start &&
> -			    sample_end <= common_end) {
> +			if (cts >= common_start && cts <= common_end) {
>   				stats->concurrent_execs++;
> -				samples_duration_in_common_frame +=
> -					stats->samples.values_u64[j];
> +				stats->concurrent_mean += stats->samples.values_u64[j];
>   			}
> -
> -			total_samples_duration += stats->samples.values_u64[j];
>   		}
>   
> -		stats->concurrent_rate = samples_duration_in_common_frame ?
> -				     (double)stats->concurrent_execs /
> -					     (samples_duration_in_common_frame *
> -					      1e-9) :
> -				     0.0;
> +		stats->concurrent_rate = (window_s > 0.0) ?
> +					 ((double)stats->concurrent_execs / window_s) : 0.0;
>   		stats->concurrent_mean = stats->concurrent_execs ?
> -				      (double)samples_duration_in_common_frame /
> -					      stats->concurrent_execs :
> -				      0.0;
> -		igt_info("[%s] Throughput = %.4f execs/s mean duration=%.4fms nsamples=%d\n",
> +					 (double)stats->concurrent_mean /
> +					 stats->concurrent_execs : 0.0;
> +		igt_info("[%s] Throughput = %.4f execs/s mean submit->signal latency=%.4fms nsamples=%d\n",
>   			 data[i].subm.id, stats->concurrent_rate, stats->concurrent_mean * 1e-6,
>   			 stats->concurrent_execs);
>   	}
> @@ -665,6 +671,8 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   					.repeats = job_sched_params.num_repeats });
>   		igt_stats_init_with_size(&set->data[n].stats.samples,
>   					 set->data[n].subm.work.repeats);
> +		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
> +							sizeof(uint64_t));
>   		if (set->sync_method == SYNC_BARRIER)
>   			set->data[n].barrier = &set->barrier;
>   	}
> @@ -760,6 +768,8 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   					.repeats = MIN_NUM_REPEATS });
>   		igt_stats_init_with_size(&set->data[n].stats.samples,
>   					 set->data[n].subm.work.repeats);
> +		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
> +							sizeof(uint64_t));
>   		if (set->sync_method == SYNC_BARRIER)
>   			set->data[n].barrier = &set->barrier;
>   	}
