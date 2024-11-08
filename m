Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB47D64085
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EB910EA61;
	Fri,  8 Nov 2024 20:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IATO2xMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F9B10EA5F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097522; x=1762633522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=33iJLJSeASX104x1PM7rWdSssvUzk5nzhuMfKusJJ0U=;
 b=IATO2xMNS1aZVY1IfNHy20YdMVwMiY5zACm25Srt9kZ9knfak+8cCqrB
 LTq3U12QCBkBZLk48pahKbYlt0Q4isrmtrfsQNuawhK1M3L9fgwFoXMfr
 PGR2B1SwN0lkNx8RgB+eJKV7EyG+kL5SsuYwUb+HXIrxFTXS17Yub0v3Y
 u+sjvjOzfrVHExnotlq1Qgi8vhmJKpHy4kdk9Ywl8iVs/pjNVraKgVV7T
 RDIyWE2iPYBT/XYyU7VFVSLyak/qxP0kUt0wI1rkZqDUIIQpJDSEKCGzw
 FD3pr+rstB989E/ucT9YcWnCtRah6aEP3RcI+Y5WATJcuqBdCF4fNfv4w Q==;
X-CSE-ConnectionGUID: OKef/pPKQbm9AGwe2G9PFw==
X-CSE-MsgGUID: LrBBLr30QB+acRSjwa9Drg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41607008"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="41607008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:25:22 -0800
X-CSE-ConnectionGUID: TDt/4sMeSROnaDdQqhlFBg==
X-CSE-MsgGUID: PEgQXm9CTlSFlRbIhzA5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="109004451"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:25:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:25:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:25:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:25:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkXLEHEpnfzQ/RACqcUpZByrNU2sDG/HDCHepfKJ/loppPlzDFG3EgqLMPwo5Pv+b3ekKaiWwGXBYV6jyaX9yGqxqJ/8FarbA4hJ1OjNJp5kSIoBw3rbh0bGkrux7D0ybJXvH+Xit3wwtaNVOTgh08yizs6GVNJXO9HkbYFGniWKiA28Fq+e1kNprPX01IRDDWRztsdWy7qCiHRSjrVpanHm8It2mE6dHvA+Qf2jUcdxozYxddsteiw2KftgbhX3Ba17eU2c2dyM/hEmNT3Zmmu2Eb/DC7RCTGzIPzkRuK2XbAyPGjSt6jrGQ2ichhVRPnfNFKcsZtqZyViCbW9Y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpJPuU/u5lp7WvzGW/frWYGZhrmFW2+llv2zlTlfJDM=;
 b=kb8vd6kTUPP6X5ChiGQKhnrw5Xv8fWt6fIb8bUoZFi8ofHWrmBcP7tX641aVzxEVtsl92zZwOmIGpZAUbSOEaZ4WKz30KeEsUGxLOv3alhZeb4MWYGSuV9QB5kdrTmBzw/wFnLCp3Qi6pUwMZTt4iW/sohNW9xbzWoF+TtcWtsqz5IvxoVHQhCyJ5sQO38m0gDP9j1cpvGA5EE42uXgY9gqO3TsgEsam+OMepnVwAcnoEJ5OJf/UmcI6qtjOu3ugNNQwlAL0mOY8OJ+76rUP0n6IddsW4rxmHZijPxtau7oMiXbdvADq+IgOXacFKM/tucZ9nKdPPVvhMI2TyKGY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 20:25:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 20:25:18 +0000
Date: Fri, 8 Nov 2024 12:25:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
Message-ID: <Zy5zrHZ5Wyru4Q0d@orsosgc001>
References: <20241108054350.3484532-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241108054350.3484532-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:303:6b::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: f30dab16-128b-4e84-6486-08dd00337625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZOek0vcmZQYkF6blhjWFE3Vm5BQTllaDQvejRybmx2VlZUTUpPbHFySWxF?=
 =?utf-8?B?K0loMjlTQzVLc1BoWHo1ZnlQQThaWGc1TmZwMGRBN1Q5RFBMOGhTZHJQMVhl?=
 =?utf-8?B?VHRvZVBhdU9kNytoUStMMGduZk1FSXY2aWUrbVo1U2hOV2xKVUh4aHg2bFFt?=
 =?utf-8?B?c0dpb09ibFVmWHEyNlJORGVtQVhYME8rY2UrWE1YcjVZQ2dneEk2dFlCWWJ2?=
 =?utf-8?B?MXM0OU1MSWtzZ1lnTVdUYmFXK2UrcFVCajFiMHV0eXZSY3ZJNTJCY2ZaUmJZ?=
 =?utf-8?B?Tmc1SzR6dFhDdlY1Rzl2elVEQklHK0UrN2pvYmRTTVYwMjdVL1h2V1paRDU3?=
 =?utf-8?B?ejB5RklvTUVERGRHT3VhamtUdmxUbTViNVVOOUtDUFVyaCszOUxiblp5czZT?=
 =?utf-8?B?SXRSZUpISHBDRnh2V1JrSXNhL0x3TDUzdncxNWpxUjFrdm5WK1pOdzMyL2xv?=
 =?utf-8?B?U0VqTkl2VDZvTUpKbGdLRi90WFpiWEk1MDBSVlYrSlFoQi85NjdXV2FRcERa?=
 =?utf-8?B?ajk1eldYOGRxZmdjUGdlaHIzeUdkSE5mUUVha3pUSHpmY2kxbGdDNDJlSTF0?=
 =?utf-8?B?UFN1TnpHYWdpVExHMy8zV0xZSUxnQ3V4bkp0bElFeUMzeHh6L3pnTXFsT09s?=
 =?utf-8?B?L3ZQRXBKWEJKVCtTZ0xHazc1b1RGT1pqM2xUYVFxSGdESmdnSTNNL0lpK3NG?=
 =?utf-8?B?VWRlTzJYNlh6RW1vNDRVVUpqK0xJalQ1NHkvOFJUSTJUVnFUK2UySlVOeGw3?=
 =?utf-8?B?TzdYTERXK3ZkSDE5Z0QyOW4zVFZuaVpqS0ZSRlEreUdnZmJ5MzdWNXBxWElo?=
 =?utf-8?B?VGVoUmp6cTFGVVRNMHVFcmk0b052QXlpWjJsN2JqQ1NHLzZxKzJna3pqTkZF?=
 =?utf-8?B?Y1A2WnpBQnRsakdLNUEyK1JJa3JXZFRoNWlsaGlpQnhTK3A2VTNLdWZKbkJi?=
 =?utf-8?B?dnplMVFPRmR6TUdKNS9mOGhjbVpMOEZNY0pFZkUzOWpuaGNIZ3BFM0FueWxY?=
 =?utf-8?B?ZjZTN3F5RjdtVmpQeC9DTzVEV2ZRa2NzSE9yOW1oR0pVaVVqSW4xMThLVzlK?=
 =?utf-8?B?aThTUTQ4QmVQS0JsK1dGTVFaeGF0SUVKM2xpOG9Ha3J4ZGFDSVNvbWFTbC9L?=
 =?utf-8?B?a0pwcVZUZkptSWppYWRBM1Nvb2pncUtaQWo2eWtITUF3OWRML1FiNVF1VEYw?=
 =?utf-8?B?VjlEWjZuT3lERWV2OFljTTdKRkZyZ0YrTHpiSi81UlhrU1BHWG9kd2R5cmR6?=
 =?utf-8?B?eUsxSmdDSEZnTDZQbFZra21oSHl0OUhyVW1YR3lqV3BJWEZHK1BvOStUczdn?=
 =?utf-8?B?c0o0ZXRzQlRFaDVkTkpNNnJqM1pkbCt4UWNPMDFYQzJLK05YU29HWkh2S04v?=
 =?utf-8?B?aU8yRHBnYitmOG0vSlFWK1RSclIxanlMaGVhY2N0c1pEVXFzRzk1Vnd6OFk1?=
 =?utf-8?B?MEtuN0JQbWNuUWRQYnh2aEk3T2NHK1prN1VLSjdRRFlZSlJadFRlN2xCLzRw?=
 =?utf-8?B?REF3eEVLMy9odFdnR3F4c3BlMUVEMk5qakhTTG9lemVsNnlIN09vWmI5OHpH?=
 =?utf-8?B?clNhUUFOM0s3TGR0bmd1aFdIM3oyRXVrUnhobkdjZ0JCMy9FSW9jaElqeEg5?=
 =?utf-8?B?OHRKaEIvUFpWdnRMa0FPb3BTemF0U1ZWMzRnSEsxRG93RTB5MGtnalFwS1hU?=
 =?utf-8?B?YklwcCtkSUhyUWhCRnlDdEFMTVBwcTg3dkJ3czZ1MVBkMHBzRFdIYVVXZGJ4?=
 =?utf-8?Q?kJL4Lnx0nwnZhuPb+jYJow1OGN/PYi96q1AZBZw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG1mQkNJZldjeXYzbC96Rk5VOGsrRFIrQ0E2VTh2M2hic3FFWnhJRWd0eU5u?=
 =?utf-8?B?N2RnZ2NlMXVTSG1rQkx0TU1LZWwwUlpqbzBsR0xRejVheFd1U1lGL2lPK1pD?=
 =?utf-8?B?bnRPRFFlMXBKWFVUUmhaVHRjcFRaNjhkMGxDZVdwd2Q4V1JlQVVNd3Y4M0th?=
 =?utf-8?B?dk9yOUJLVnJ3ZlRTT2FNajJzVUJaWllHWFRkUGlzUHpYcjVQY055bm9YTFJp?=
 =?utf-8?B?MlgvRXorc1FWazRLTUFBdml6VXIzQVVGOEZrZ0xkUUI2bkZqVEtFVmxoZ3Uw?=
 =?utf-8?B?eFprZ3poNzZGRUgrSEJDNmpRb1NpZ0ZzMmdheEZ2M3pUOEVqRDhXK2ZBbXZa?=
 =?utf-8?B?MTFwSDNOYjZLb1Q1YkIrRzlBc21hVjc1YUQzOGhWTlVCRzRGV2VyT0h2bExy?=
 =?utf-8?B?N3paTzg1djVHdzV1NlJnR1RLejlSUzhnRTJGNzVqU3g2MFBZQ3ltM20zODR2?=
 =?utf-8?B?SG90aWxBZU9STnYvV002cDhBUFpSYW1sVlJDc1NXcXhDR3BnZmdPYktPMHhX?=
 =?utf-8?B?SDFwU25Nb0c0aHQrOUhWQlZLQmQ0ajNzOFJOZDZCWU1jMXNjNTEwdXRWV3RO?=
 =?utf-8?B?R1JtWW8wOHFSaW1GL0s0citsS3dlZi9hM1lvU0dMSUlyYXBTa0NEbVNLSldP?=
 =?utf-8?B?YzBkNlBnZHR4UFg2L3dVTXJvU1EzTGhFcnlRZEdQNnRyUGUvTFA4R3pXQVBY?=
 =?utf-8?B?d241U2V1bFdOYnZCWnFpaTJZWUVYMzBoZFVPZTZ1UmRLblJEdElnUDJaRkpF?=
 =?utf-8?B?U0VkZkpld1dhOGNOanVjWHQ0d1R1TGlJVTdiVVFmSXR1TmZaT0pPdGJsRS8y?=
 =?utf-8?B?c1prSDg2MitHcG1XbDhRSkFCS3dJeWkxZnUrRjJaWTJEZlFCMmdsaSswRVVy?=
 =?utf-8?B?UTBvdzlRdmpmTFFzWG0zVStwZVhvQ2orckpSanFRTHVIYUhNWmZtOGtuUUhk?=
 =?utf-8?B?SnMvT2c0aU05SnlIQWtMTU0zekwzTlNZMzUraVBRSFNFcEpRWHNndSsyM2FW?=
 =?utf-8?B?cjVKN0tCUkJrMUxwdUFJT3YwT0MraUVCMzUzcnl4ZVJKOEFHYW9CSG5qb1VB?=
 =?utf-8?B?SDlEZjBjSTB2WFgrRU9jYnlhWE10aUtWL2tja2Rnb0ZXL2VVZXhqYlkyL1Yx?=
 =?utf-8?B?UWpYclZjaTVSWlBaT0RvbmFYcmdrbTMxaER3SE9qM2p2OTdvK3ludlJkUDND?=
 =?utf-8?B?ZGpTSVNnemdxMnA1VnA2VHE0bEJheGc0U3JHUFlLcGFKdHRTTFdJbytjdmZT?=
 =?utf-8?B?UG5aM3NKNEhPMnJoUHJQeDdUQ3BWNmJCdVdpb0ZZNXdOeFBIN0cwWURIN0ds?=
 =?utf-8?B?eG0zMXRsV1djczQvUHpnenVKaWdDQk9kNm8xUkE0MHZCUzhSd2o0Ky8xVGdp?=
 =?utf-8?B?cWNrMm9TNjdBR0tCQW9wK3N2SnBuTFhRM1VEWnI2ZHpEa05CNzRCT0hFWjdO?=
 =?utf-8?B?eDJSTlpGbDhhSS9CL1krWTVWUEFpTWM0UVNwcXRINFBRN3BadkczQmxXd3E0?=
 =?utf-8?B?ZnZzZDQwNVBobDhtWlBHdnJxdXE2ZXAzOW9OM1Vienh3WmZHUitoZnFyZ3c5?=
 =?utf-8?B?eFhLK3grdm9mRXl4bVlPaHE2WlZwVUMrTHpKTnVWMWNRZ0RwMlEzcTNXVG1h?=
 =?utf-8?B?aStpWExuQ1VhUnVFSEF2anFEMUV4WEhpT1BleEZIcmhTY3JBNWNIeWdIdTFw?=
 =?utf-8?B?ZHdNUklOS25YNWV0L2FGTmNzNlV2VzF5Z25DTFMvc3VRcEdXbGdTQzNhVGNX?=
 =?utf-8?B?bGJCOU9jZGlzTEZlVE8xa1U3VmNTcjAyTjBWb2FqY2hxRTU1RVI2SjlUREh2?=
 =?utf-8?B?R2R4dlczOERhRU9SSGJiRXZYM0h2VUlzeE94aDBYMXdnUjNaazVDaHJ0aU5y?=
 =?utf-8?B?L2ZsanRDU2RLTi80SlFpamxjYlBKUU8vTjY0bEpmbjJiV1lneW4zUXVPaG5K?=
 =?utf-8?B?dEhxaFJNQ2tWUUxQQVdaR3lNVk5BQmo2QUtwV3huRXZURkQ4SkNZTGZTSVJZ?=
 =?utf-8?B?TjBRWXQ2bHdRQnVZQzVwUThBamdkYVBkMzNWM3BGTXlDM290bm5ybjI5Qncr?=
 =?utf-8?B?UnFuVFhwaEJsYjJBOFc5SzNsVERSR0M2NGw3dHc2ank1VHllRDVDazU1MHBU?=
 =?utf-8?B?M09jK0VCb1RUWVpXUkY4alpwSFZkYWFUQU4ycWxjaEtacC9pa21Na1FZU3dJ?=
 =?utf-8?Q?DdnvVr4SNFUaIXKUsBNQV3M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f30dab16-128b-4e84-6486-08dd00337625
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:25:18.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAWnDkV6MuAmCRwFVAp9rK6P5UiBQqR5mSnWiY9tfRYnaz5RUs3v0I1Zq48IDvP8vd+ZaKdNXHk9G5jzJe+vd7PpRSJrNbklaZSgKWsei2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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

On Thu, Nov 07, 2024 at 09:43:50PM -0800, Lucas De Marchi wrote:
>This reverts commit 4f79f059766c ("tests/intel/xe_drm_fdinfo: Half the
>execution time") and goes in the opposite direction, doubling it.
>Although in some machines we pass consistently, others like LNL
>show sporadic failures.
>
>Even after changes in the kernel to improve it, it still shows those
>failures. Also, the failures can be much more frequent by stressing all
>the CPUs. Raise the period to reduce the error introduced due to
>additional scheduling delays. This shows a good improvement on LNL that
>doesn't fail anymore without CPU load and fails once every ~200
>iterations with 100% CPU load (vs once every ~3 iterations).

LGTM.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

On a related note, how do we let a dev know that the tests may fail 
occasionally due to scheduling delays, so that triaging future failures 
can happen in a more informed manner? A comment in the IGT test file?  
Thoughts?

Thanks,
Umesh

>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 5fd7c0416..ef9273e2a 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -82,7 +82,7 @@ struct pceu_cycles {
> 	uint64_t total_cycles;
> };
>
>-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
>+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC);
>
> static const char *engine_map[] = {
> 	"rcs",
>-- 
>2.47.0
>
