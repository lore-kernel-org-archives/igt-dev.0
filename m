Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C254CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 07:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE1D10E822;
	Thu,  6 Nov 2025 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+0V7sXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1DB10E822
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762414357; x=1793950357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QOIYGwnHP1TeM+RHBHNGzgLjLYy7pplKmHIwOyJvQvw=;
 b=b+0V7sXYQqlYXoTti+enAM//qilJVmKWpBZTN0LNHghnXtlbJVW2GmwU
 bzPXSGWJ0CLgoEle7rnReM0K16ENg2cKC+EqvJw82mmBO2v7sEN0A0nqV
 MLfYr1OyRTOGN30VWwUAS1EhcmorgFEVtxH0VzsTYwvc6QxY06xMjBfNo
 yMfsrDYgiPTPYFEtp8CBXGXuRDW+537SxhniA10uKFDeVv6CLXUsSgqKd
 horl6Dq7K+pa3XmhcsQ7DwFia8uS+ZkMVZDcLBR9Xu7Bw4EnPIrSVSRhH
 0Cv/yfg/CqM0e9ahv8yr/n5e2p7/bGhY8GyvtlW6NE8wZCJNq97rsidRw A==;
X-CSE-ConnectionGUID: kLkNznrMRWuCCdd/O+P4Zw==
X-CSE-MsgGUID: uyn/cthhS2m9J5WRm4pTRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87173249"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="87173249"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 23:32:37 -0800
X-CSE-ConnectionGUID: pIzPA4+lRJS48ptfVGoVbA==
X-CSE-MsgGUID: 3nRC7BcdRJGKCOpPfw4j5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="218347243"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 23:32:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 23:32:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 23:32:35 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 23:32:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYKlRsgXQcW0ZmwPNTrAulLwy2O6lcvt+zElxVYZrPrzAAd2G1mtPeLSwe7p98cQbBK+269K0ko7HWo5740btfHE2fdaQMajAuf2C1iRzoKZCT4TMvvPfbyrNzvBPVPJXnPTUfbq8lsy4xET5wwbxgMoIy1NKlny2I2rzou6z3sQ9YpLwQ0HyNEyrkRg2Ydu4+iDJ+ow1eTq7duhcM0TPPyXepd+iCjN9gUxEKnMGR6T/L2VnGSBa7tTTLsnKIHoAXl4hw5Cbu2OLs4HFkt6r7B81zIhRmjpGNBX4h3u6N4AjOA8h14lx/sW5C408RhakE6Xoz07oEqiE5QcGQ28LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTNKhb4R5Oyt6iP3hnG4GhpAvrqdFTY8oDeAV892rqg=;
 b=m0JqXqsCnh+LOl3sMEm5k1yw8dgGaSyhnzRxDcmLR90g8QR5bcjVC/Ot3HC9kiVe/fChgv1JfJcVcQUOaNoAVG6KbriwejZFCg7aD6C2NbspVSy47NTjSNzMqLqgENT5Catq4CeHnbLeHbwIlgM7bidoGqioXS0vvSpthWs3tr5L5aWubsU+OJ+7deTF2MqjzVlVQqwQfZHS3pQb8Z+hZKU7be3Bhl+nKPrAO0euLfhEk6HOjB5DhKhqVyKmUdw6x6uIa/KGGecWuFSkc8HZTggqBFJ3HxWRdlIntty9jKeRrokFiwCqFZM2ZnRXZD+tHkO1s4NrremrlkJdK2gywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 07:32:28 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 07:32:28 +0000
Date: Thu, 6 Nov 2025 07:32:18 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Simon Fairweather
 <simon.n.fairweather@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3] tools/intel_gpu_top: Add iteration option -n
Message-ID: <waoe2s5ere3bcpkbzitkfhgpxc3fgrn7rbuwlqbd46ducnmhpq@64a6znrilzha>
References: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
 <fzr6737mjmdkhfmkxh2uawj47gtzcuig3t4sqqtvtuqzme5pbx@evlm4bcue57t>
 <20251104092043.prlqk7teecophc5r@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251104092043.prlqk7teecophc5r@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 3986e301-d038-4622-7c9e-08de1d06a2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YU00dHEremQ2WlBWc0hmY2dTZC8zRVk0QUI5WTQrZExiRGlWNTAzdExuRXl0?=
 =?utf-8?B?M3loMGF6c1VXNU9GNHg5bUFKUFM2MjFZRDdOdWNrbGxpVUpXSjhjeHdEajhW?=
 =?utf-8?B?RXdxTzlNNlBCQXQvTXcyKzRvbUQvN3poeHpXU042b3AvcGFrWGxKdzExbDRh?=
 =?utf-8?B?VW51RW5nYWN2TldjTFZYL2pKNkFraitXWnpiWDZySWFnSTdLSmtEb0J3d1lB?=
 =?utf-8?B?Vnl4akxnUEdKZUN6M0R0Y1lJMkxXdkd3TDNvTE1uRnRuck5jRVJWcWtuM29N?=
 =?utf-8?B?M2NqMndSNm1hQUdpZ0k3Z2NUeTBjRzNublV3VzVEeGsvSlAxcVQwemRYby9D?=
 =?utf-8?B?a0V1TGV0SXE2U3hBUklGd1NIdEdHZWxBbms1VlZDK3dUYzM1M1RaZU9hUmdm?=
 =?utf-8?B?ZDBYMGQvUGVMSzdQZFBGNlQ4UUExVjN0VDF1WHRhL0FFYlp0RUlwS0ZpdWNK?=
 =?utf-8?B?ZFNwQTlGUkU3UlVSenhPZGoxeExSVklscjhjMnJhbllVR1BYU3ZPckNnUU9G?=
 =?utf-8?B?cVdSN29YODB4U2w0RVBldCtqSjVFNFEyQk1CVm9lczJOdGd0QzV6M0VRV3Zq?=
 =?utf-8?B?MUtuZGppWVltVlpNQVlDUkxSTXQ2M0JmTStGUnp6UGtERnZ1TS82bmowZnFh?=
 =?utf-8?B?MUpMNVZPYkpWWkUzN1ZXa1dQa25EZHFtZnNDNHJnTnhWY1lrdVRlald1YWJh?=
 =?utf-8?B?RUdlR1VZQVlicWFONG9JY1J0OFNrZFlVeTV1aExkanQxSllha1lIVkY4TE4x?=
 =?utf-8?B?ZTBYNEx4b25tTGNMNWtjdXVNcXNhVkhZWkFmai9HSmxFN3NtdEJOak5URzRF?=
 =?utf-8?B?S0o4Y0NYSXBwbVluZkgvajdhUlN4NTZrQnNMdTNuTTFKZGU5N3hOUHlqN1d0?=
 =?utf-8?B?RlB3elJMMWZEa3BIejcxNmlEYzFtSEZuT0M0R3U0MVFJbVpUdUo4Mlg0ZGRJ?=
 =?utf-8?B?S1BkTEhwMi84MllsOGtmL1l5Qys5M0FuWlc5TDU5bkRuTXV5WU9NMFJlRE1P?=
 =?utf-8?B?TDF2Z0xHUDU2Y3gvUkNWUjM1MlJ1bkVkcldiWVp0WkhRNVp4aGd0cFh4OTNS?=
 =?utf-8?B?Tk1DblJ1NkdrVzVRZC9DKzg1MGFlUm5TbHorQUk4Yk5BRDlRMnBscVlXQTdt?=
 =?utf-8?B?ZXBOOHJQL2xxejBSdENDSFBCcWhYUFdBM1BLSzJKc0JNNFlKdElKQ21rVEl1?=
 =?utf-8?B?b3RCQ0hFYUl5Mkx3Z2diSnRRKy9keTR4SkliaWdJYUxWb1RoalVCN0luTm4r?=
 =?utf-8?B?d0g3WDZvVkVmM3dHL1FzUjA4REkvWEJvbmVjbUhGQlB0WWhUUllVeEdEenpq?=
 =?utf-8?B?dWFwOVlzSHg4UGFMZXhscE11dVlhSVZ1M1BlZ0xxRU1KVFFIVDVBaTRrSHM0?=
 =?utf-8?B?SnBwVXZMS2xBOXp6dUh1NmxiUGQ5OTRLU0VCUUtFVW5wWmJIeFRvT2tUVU9m?=
 =?utf-8?B?KzRPSGtXSUV1Kzc5K0YrMk12M0lEWnVRNFVJRkY1bjNvQXlZY2pHQUUvaFhh?=
 =?utf-8?B?bEdlZWNYQnk3dXo3WkJJK1U5WUFHVHE2M3Q5Qm1rQkE1Y0habDcvL3drcXhQ?=
 =?utf-8?B?VjNwaEtiZmx2cmQxUjIrMzBhTU5WVzlPeGFkZExFWFN6VFphQ1E0ZlhUMEZk?=
 =?utf-8?B?ejhjbGl1T3hDMk5iS2J0ZkMxaExpcTBISE9KWTBhL2tEUkFmUHcxL2lzbFd1?=
 =?utf-8?B?T2ZadWVQeVpOemdHZ3J0R3VlYjNkdzRDN05KSUplWk5MQjVNeVJTS2Z2Z1gx?=
 =?utf-8?B?OGxqL0ZMSElHeGNVYkdwKysvNjdSNkNsS0dDLytSZGR4VnlpbGpHRWpHVDd2?=
 =?utf-8?B?Q24xZkJBT0VPNi85VEdiSHJ1MDBGMGNqd3Y4SnpSVUNEYW8rbUs0NVVJQlla?=
 =?utf-8?B?T0U0WEYvUGdrbWRFbWJTd1BPL0swemJvdmdLQjl1alpTaExEdWV2MFFnK2xk?=
 =?utf-8?Q?0wporPlnaCVaP4F4t8SXpnaoX20PtzsX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZSYnMxRU1NU3NPS1FFeEwxL1ZaK1M1MHFwM2txTm5EbDNOZFFyNms4MjBx?=
 =?utf-8?B?OHZrU0J2eU5Dd3VjQjVFMFp0K3AzU3dVOVZwUjdXUVd5eFNReE01bnUvNzI2?=
 =?utf-8?B?OXZwcW9YNGk5RTRTS1pIT0JmY1ZjNDFndG44aWRRWmFoV0twU2hEU202aVpw?=
 =?utf-8?B?MkVoNkJFWjVLMDlOWVRsZ1JxMEJiS0dJeXNldEowdUxTUTlESlBPb2NjUy9X?=
 =?utf-8?B?MmFxMHlyZzFEaGV6TDNURVVsK2RMSEFJYzk0OWRhTGxEd3ZEWnZsSFB6OTBT?=
 =?utf-8?B?VzRqbHAzNDdLL2dCS3N5ck9SR1M2V2lCNDdOMkRkSTU1U1M4VGpCTUpDU3Iy?=
 =?utf-8?B?WXcwbUhkb2xuQ1ZUQmhkL1dmYkttU2x6MWw4dFo4VUNzbFAzb0pwTzdBZnpG?=
 =?utf-8?B?VTkzKy9ZY09IOWp4OWk1TFREWHNIUXhTMHlxdTY5b2hhcVVlOXhpQWlhVFpM?=
 =?utf-8?B?dnZTRTd2YzBJbDBWalBKM3IxN2FlRE1FUFQ5Wk1QMDFQOFV6TWtJak5KWmtt?=
 =?utf-8?B?Y2Z2aTlJVjd5S0Y5VnZiOEhKY2Fmb0RLUm9sZXpDekF0dFJ3US93QmZ0UWVu?=
 =?utf-8?B?VEdWSm9rZ2pTeDBDOFU1Q2p3c0tGWWlRKzlTd2xzRHIrNXNyeGtqSDMwSXZ1?=
 =?utf-8?B?QnJSVVBzWUgrU0pFWGRHMU1DeTF0UDNaNXk2NmU0ZGRiZmEvRzlvaURvVjVE?=
 =?utf-8?B?ZjI1dTliRkZrbFZVaWpxa1kyWFI1OXg4K2ZwWTBvRFdxN0FEYjY1L3BIYTlh?=
 =?utf-8?B?ZjJzeFpNOWlRVm1YYTlJdEpMaEFmcTVvNzU4M3ZmelRCejBxMldRK0Rjeko2?=
 =?utf-8?B?WXZOOSs4M2lza2VCYmZTNXBGSUVIMlVnbWN1REk1a0c4Y3R4VDk2VUpPdWVs?=
 =?utf-8?B?K2FxL1d2Zi80Q2ZvY3Q5Q0M0TFpiWHUzYVg1MkVXdUIzTVpsL3NmaWQ2dnBK?=
 =?utf-8?B?Nk80djR6SzBPWkVPenFwcDFKQVpoeFdpWER6TDZMOGVldUVpT3dFK1NLZG9N?=
 =?utf-8?B?MC92cHp5KzBxSWN3NzlERXFzc2l4Nyt2c05VZEpIK0lmWXE0TzdFTU5xV2F6?=
 =?utf-8?B?MS95bG5JamtyU081U2RHSjNCNHRpSXY2K2JDaDN6TXhJdFRHWHk0aFZsWmpP?=
 =?utf-8?B?d3RoblRROGRMUWJMaGxIejg5Q2pLZWY5T2JINmhYTXpRVjNlVHhhb1dIdnZS?=
 =?utf-8?B?V0plcm01dWV6YVh6RU1RRGZjdjlGb2R3L0NpYTVYeVk5RGp2RXQxTHlJdnJK?=
 =?utf-8?B?QUNNZ1pLVklWUFJwT3AwRmVOM1VzQUZCNDNGWjVCTDFoMWxnaGt2VDRyekIx?=
 =?utf-8?B?YlA1dXQ3MmNmYThuUzJsMWhXWXE2QmwrbHlBa1lRRnh3TCt4NE5GT2piREZt?=
 =?utf-8?B?QS85ZldtdWdvUC9FN2ZRUENEekxuTFVJdTdSKytRSjdqcW85RFhGUmsySDdK?=
 =?utf-8?B?WUU3ZTlqZlJsZ0NwTFAzak44eWhMRkpvMmhJc1N0dmkwSi9Od2JLaUNCSEpn?=
 =?utf-8?B?WW02MG1oR3RGdkRJMFdRZk42V0ZSU3ZSa3RNZElRVU1NVGIxNndpNmRSVGJt?=
 =?utf-8?B?YVoyQUp5ck95N1puWUQ5WWtKb0FScG8wSkU3clJUaGtJWEg3eHpXVVdPTGlU?=
 =?utf-8?B?cWtUQllFSTRtOUJtTG8rQ0VCZ2FYTlN5NmloZUdoeG5ramIrcjBnaUh1dC83?=
 =?utf-8?B?VUdwUnBiOTM0UzdPUVRYRXY4SmlmZlU1Z1lMYVlETFdBaE9zdjFOT25UcmQ1?=
 =?utf-8?B?VGJPeXFxVk5CR3F5QkFYQ0Z2S0hKcm8waTA3b0lhS29xVGs1WG9pRC8xa3JF?=
 =?utf-8?B?ZXQ3eExRYm5VQ1Z0UENtNC9xdDM4Yjk0TVkwazB0dEl5THlXSEVVb1BHWGZF?=
 =?utf-8?B?QlQxMVNTRTB0RjJiVDlwbEdqNDdBMC9qeitUOGk4RDhOUkhiM3BSUmNGNjFM?=
 =?utf-8?B?aTB1ZjRyWFdCM0RMb2FCamlrdnh0Z0w5bzl2Y3k3TXZMOGtCZ0lFS2xFNWho?=
 =?utf-8?B?ZjA5Rzl3WVJqRVJQd1JQeWlWUjVQbGEyUU54WHk4THlMMDYwdk5sZU1YYW5z?=
 =?utf-8?B?RlF1WVU2ck9RR3VhMUZJLzFib3V0eTVzaUR4NElKVmpLR2tqZkNYdFBuQ2VN?=
 =?utf-8?B?Q0JiU1oxcmp2QVRhcmFvR3pyc2p1aWxneEQ5bDBnN0QzQjFkRk9FeU4yRldv?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3986e301-d038-4622-7c9e-08de1d06a2ee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:32:27.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LoS4/pK7aBXdA+dEjUvb1BdAOOhKLHLztE0I1BaWhnTjW0lB0FO8qnmOX778I4YnUleRMNUIXjmXzvfmOozxElnAHun5OH1tRkX96XJflo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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

Hi,

resending my last message in the thread, because I omitted CCs
by accident. Original message:

Hi Kamil,

On 2025-11-04 at 10:20:43 +0100, Kamil Konieczny wrote:
> Hi Krzysztof,
> On 2025-11-03 at 12:05:14 +0000, Krzysztof Karas wrote:
> > Hi Kamil,
> > 
> > > From: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > 
> > > When using option -J or -c default is looping forever until user
> > > break process. Lets introduce new option -n <number> and break
> > > printing after reaching given number of iterations.
> > > 
> > > v2: corrected whitespaces, extended description (Kamil)
> > > v3: reduced number of vars and changed printed help (Krzysztof)
> > >   added description to man page (Tvrtko)
> > > 
> > > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > 
> > [...]
> > 
> > >  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> > >  		"\t[-p]            Default to showing physical engines instead of classes.\n"
> > >  		"\t[-m]            Default to showing all memory regions.\n"
> > > +		"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> > Passing 0 or negative causes the app to spin indefinitely.
> > Furthermore, I think <number - 1> overcomplicates this endeavor.
> > We should consider a few scenarios and sanitize the inputs:
> > 
> > -n 0 - we break out immediately after a single print,
> > -n 1 (or any positive number) - the app works for
> > 	<refresh period> amount of time,
> 
> Could be, so for n=1 it will print info two times? This in turn
> is counter-ituitive, it imho specifies number of prints, not a
> time.
This! Since the value is not supposed to represent a time value,
I think we can use "<number of prints> * <refresh period>" or
something similar. See below.

> What you think about this help:
> 
> "\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> "		   With options like -J it will print info <number> times. The default\n"
> "		   value is -1 which means work until user breaks with 'q' or Ctrl-C\n"
> "		   or sends signal.\n"

Maybe:
 "\t[-n <number of prints>]   Specify application running time as\n"
 "                <number of prints> * <refresh period>. Passing 0 or negative number\n"
 "                will wait until user breaks with q or Ctrl-C or sends a signal.\n"
 "                With options like -J it will print info <number> times.\n"

I included the bit from my comment above and changed
"The default" part to be more explicit about what happens when
0 or negative is passed. Then, when reading the value:

		case 'n':
			iteration_count = atoi(optarg);
			if (iteration_count <= 0)
				iteration_count = -1;
			break;

We kill two birds with one stone by handling 0 edge case and
using a known value of -1 to cause the indefinite loop, instead
of keeping whatever negative number was passed by the user.
What do you think?

[...]

-- 
Best Regards,
Krzysztof
