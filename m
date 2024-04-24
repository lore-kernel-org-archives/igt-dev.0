Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F370C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 02:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59310F603;
	Wed, 24 Apr 2024 02:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBWn4HhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023F610F603
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 02:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713927171; x=1745463171;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=t+SOkwjw24kWPb5Fnor0baWKcVTyIjyI23Co76M+DTU=;
 b=MBWn4HhPJK67IP9w43uu4wfLPEosIBSFMrWPaYxDfk8gMtTqWCvdxYUd
 D0KdjWqiiPj33rX9zODVyYeq4BJCEL8pcrpD7IBxz+84jwj4stubjyKmQ
 Bc7XhM35rlhZfkAXj90Sl6sRazpPw8mH556KEYd/AX82QeWvyrq2RG/zn
 CuWgm520JClJFk9biCTfj98cyApidR2R13m1ntWhCHy/9sjfLZIX0wehY
 zrwkuE+kzuvSE8Mw/XAw/Qqef7Tj9KGBDhF1FM//afrs7X5VC0tkj5I2i
 S/aeq3fZ/EF2oV/BrR3h+W8fH/w5tKzIndZ3fC600K6dLIKtd3cXX4SKr A==;
X-CSE-ConnectionGUID: eKUObuj9Q+ySsad3RlPRqQ==
X-CSE-MsgGUID: 9irZ42u5Q5K0M0gaXe7mDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9406253"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="9406253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 19:52:50 -0700
X-CSE-ConnectionGUID: FJDPo7+yQ5iv6mdxDCcolQ==
X-CSE-MsgGUID: OTVrKf7DR+K39b33cKSkEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="25082475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 19:52:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:52:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 19:52:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 19:52:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpok3f2fRCRfRjTQLztkpG8miS66ZIDtRoyAAtWzHiNH6vWkERwtDSqZ5jIhvZCWNWjz8vv0GElCcQ1n3pyz+x4y5OHB8vepaSFV1OayZ3NZX6kNL708CV26DGBco2huXtm4ELB5Iv+Xunj8Y5prOySXfxI3rTm11crjPlxKBX9vf+eU7cwd0owkkVW0HAYaMj/6zVP1sGwcmCKLR1ek5qo5FXiFvccCkK+670Wb51UIIYtx54c+/tseJxSeUJLzgMAhvjlwurwZIY/j3Tj4rWazARIiyAlWvhmGBd0X7gvuhmQhazuHCFAXtXiLDsiV5i4vqhpzWUitmck+Y89GHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B235AXHR5fFTBJ0GRKlTn0bT8wNQjhfXB58ZpqAR0M=;
 b=KteVxsQReeMZ5xeyrrtuxlb/WZNyBg9gglO1mlr0sqnXdwgkZrMiqrny0KSDbgd8nNCk9AUzZ78OXjmdkXY46iqAJaoDrjzBC0xY+KqH8ydJ2hY3EvNydlxPdQYOWaS7rRuHnQ/iMblehBS+MtTCsMuDUzIeRyvPQnEHGsr7ZjzbXQmuOLiaWUtnN7AcEzFjoiEfD3IjFT0dld5j6nTAlU7+Ij/YPJLV7Ge1CckaBmmLcSEZxKCORrRkWZObphQV2ZxPegUcuwMnPpZvdyXGYxOOqTpWUHdvLtd2FarmgG6mjpxcbn/iW6xzmBo7OOWu3dX/cMoDmQtgOPN3J/ukbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Wed, 24 Apr
 2024 02:52:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 02:52:46 +0000
Content-Type: multipart/alternative;
 boundary="------------gVa9R0vbsnaFdsrHUo6S2IFp"
Message-ID: <9513bcc4-3a90-411f-baba-de3c037e9b54@intel.com>
Date: Wed, 24 Apr 2024 08:22:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_wedged: Test wedged_mode=1 after
 had toggled mode=2
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
 <20240423222220.1285742-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240423222220.1285742-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f81bbfb-6f81-4674-fd83-08dc64099eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVpKL1EyNW1zSCtXOVVZSFArZm5WK2lMOFFmNEFSUXFBS0lnb3hIejQxbGI2?=
 =?utf-8?B?L1FycHlwT3Znd2tDUDk3NlYwWGdlbFd3OEE2SXFnOU1nNE1QU3gzRFA1S3U3?=
 =?utf-8?B?MWdreGx4ZE5YY1RLME1oWk9IVkVkR1BTemV3UmJvMjlKSlBUUHJPRW9zOUlj?=
 =?utf-8?B?QnVZbjR3Mk5CQys2RWNIZWFnWDQ2L3RRU2hLUjU2QWVHQ2IxdEFuRkxnTDln?=
 =?utf-8?B?QmZyL2FwemEyOGdTUkJyc3ZPUVVrZGMyT2FVSE10TWxnQml2dlJ2UWx6TGNE?=
 =?utf-8?B?VFhsU29URzU2Qy9rUm1QZEVMdVlZdnhucUJtcG9zOWhXV2o2NzNveG1ZOWlv?=
 =?utf-8?B?N1pPWlV2bGk3MWt0b1VKeFZkY1lEK3FMUGY5NG9zQzJuMkhTZzNGWEdNMW1J?=
 =?utf-8?B?QjdTSjMxa1V3WnhNaUJPSll6UE52SEp0Y21JdEFzbXV5OHY5aktEZ3QyeURY?=
 =?utf-8?B?OWdCZDNXOFZKMjNKQzUyZFpGUEtwSnRkOU03M2NzVXB6ZXl1Zm1WZkwyY2lN?=
 =?utf-8?B?d2dPRVZGUFZXRGFOOEh1bHc2NWFmQkV6VVd2Qm9ZMDVSR3hCUC9RUEpidHdr?=
 =?utf-8?B?NFBPR1l3S2txdXFZMnhwMEtQYy81MHBRRlRGRFphcnp6ZjV2VW5HK2I3TTlU?=
 =?utf-8?B?MFY4a0YwR3F2NDZvY2lkczViWWlFQzc5Q2Z5akM1TWhJRGlDWDF1Z0NXQ2RT?=
 =?utf-8?B?K1FKZ0VmNUlkZzNWYkZhTjArVmxRS2lCMTF4S1Biakh3ZUQvZFpnR09nYjBI?=
 =?utf-8?B?WG52SC92TW5BaTEwd0NXUElYYVR4OEdWQklmMlpmWGp0UzRqaVhHRE1jVEpl?=
 =?utf-8?B?Qm5uUndwc25qOE5GTHNTMFpnb3JBZ3BOdW9xU2NSTmNWWENxbUIrSC9PTHFG?=
 =?utf-8?B?am1ZSkVtSXNTRjBMZ0RRQ1JPOWh0bjFXZDEzQUNKamp1eWZOcUpVK1NWWFZT?=
 =?utf-8?B?WEJTUFJZRFdEbXhMaXltblBmaFlmVWFManlsbzl1djREdm1PTkpQRlN6dEFs?=
 =?utf-8?B?K3dhU3lrRkZ0R3J4VlE2Mi8rMmszbWcxazdwd2ZSZjJHUDVJeDhhSUwyQWQ3?=
 =?utf-8?B?Q29ydkM0N1FoaStSYTJCL0xzUU01aG5kRW5hQi82T1dZaDUrNmZCSys2SWM4?=
 =?utf-8?B?dkcvT2hQYzRsYlU4dldVZEt3NG9NbmVJUXRrOFJ2WkY5ajdPdlA0WTMrTTFK?=
 =?utf-8?B?TjZuYmRFNjJFRXdSeXhqK2lnTzJqalBVaFBvZlFacjE2cDlpWHpIT2w0Ukxk?=
 =?utf-8?B?Z1MwampPb1ZFWTlVUWxVK2EvRWZ6dDMzV3FoNlpTclJnQmQ4NmttM04rV1VX?=
 =?utf-8?B?OTBsSldNVmxreVJHeEdFQ2xxN204SUJtRUJVTFBWYlppam0wdlQrZUp0d1VG?=
 =?utf-8?B?ZkJ0QklqSkw5SFVPVm1wRUlpWk1OMHdCbk90V2w2MWEyTHdEZkFKanIrTms4?=
 =?utf-8?B?cXpKM3h5RUViTm90dnJ3SUQ4ejBVSXVIdDdET2o5ZHZvM1JWM1ZTeFhsQ0t4?=
 =?utf-8?B?cmprZWxRSDByOEQyaTNWRVJYNmFLeU9ib3BaTVkwUnhyZFh6eVhGMG90Ullt?=
 =?utf-8?B?QVlycW5odXdqWWhJOS9NRGRuVFV1MGJxdmVLa2YveW96ZjNDaVcrNVdNbVZS?=
 =?utf-8?B?cStjMVdVTWdKY1VkRVlocTk3RUtCRW4wM1l2MUxyM2IzaUlCTFQyNmhrSHhw?=
 =?utf-8?B?eVV4VEFjNGo4d0UrcG8rNExtNzh4UG9kb3NKbDdHanR6Z2pPUzFodE93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTlOMStGZW9vejllTFNGbHpHN0dYSW9KK0FLV291c2ZFV3h1UVdnQkVBS0w3?=
 =?utf-8?B?M3hSVzNBbVBOanFuOEp0NGdFV1o3TlJMRjJzVi9WaVZaY1pLSVhZN1hFVDZX?=
 =?utf-8?B?emlIajVBNlZWLzkrQTlVWHdLN2NjcGE5cy9GZi9wWGhTWnhORlZ6Q0hQczdF?=
 =?utf-8?B?MDFicFhaS2I3b0szMGhQYVVqOXlIOUFDVTg1KzVnZzVJekZBR2xwY1N4a2NZ?=
 =?utf-8?B?emNJL0NvN216L0NXVGdPaGJuYTFQSk9halgxcWpjWWc2UVl6ZEs4MXZCbEJw?=
 =?utf-8?B?K3ducDFLaFQ3eWZuWWJPQ21COUJ0TVJOczdXdlh1Z1ZLRVBBT1liSWFLdkNh?=
 =?utf-8?B?am9BZUg0aE5Ka0tTcjBhSHdwaUwwYzN2dnc2cGhlKytXN1V0K1J2N0ppU1A2?=
 =?utf-8?B?aG1MUFhlZGNUWVpTalRGRUZvRWp5WmVWMXhYaWJjSldVNjBpb0s4OGozVUxV?=
 =?utf-8?B?MFBqZ1c5QXV3c01aUUpjZXlQSVI2NEVYU0ZOaDFJT21VazFSNEF1eW92YWo4?=
 =?utf-8?B?Q1Z2R0FZVjlNNlFNeUlwTnZUNXM5NE5VelNMTGo4eCtCd0VRV3R2ZHdvdFE3?=
 =?utf-8?B?YUtJY0N3SnRwb2NiSEFkWVpvUlZMa2lyb0tZOTZnZWhRSSt0dzRtU05RQ1Bq?=
 =?utf-8?B?QU1lU1lJQXJKZ0JKdkxxa2hMUkFOTklUeXhyYVpsVDArQXJpSkV5MCtia2ZM?=
 =?utf-8?B?SnhqWjRZbWdqcjlaSlFuZkhDTFJPM2I2WWhJaEdsL3RtWFFwMVl4bVBYbFNn?=
 =?utf-8?B?d2Rqa0NLVEhTajNOcSs5QkQvaDF6M3BscVhvVS9Tdm9mTU5VNHlTSEFGSVFJ?=
 =?utf-8?B?KzBObFZ1SXFXdzNrbytwVlVreXp5LzlLYUpUMEVBTDdLSmI1MkI3WXRmVnZv?=
 =?utf-8?B?NkFrNVRFcGZCdlp0WmJBaytxd1NsSFlSWDk2Y0x1UnlGbGdHSzBSLzNXM0xo?=
 =?utf-8?B?V3RkcGs1aGVoVC9NeGt3WFRsclNhMDQydzlGbnEyMkJLUWd6WW9ib0VJcTZP?=
 =?utf-8?B?aEx0ejNxak5EN1d6UEJRdE4rRFBicmtyNTBCb21YRXFNSEVKRmZGUTlRZ0VU?=
 =?utf-8?B?QlNDSHRYYjdmRGVxREJJTDFMRUxEcTA5MExPZEo5K2VQQTlIM3lmd0lDYnFi?=
 =?utf-8?B?QVFwL2FxN3l4VG9KQjFyVlFyTGpROGlNNyswZ2RNWENVQjNTTE1kOTN2ZC9X?=
 =?utf-8?B?OE5Gbk9RZGVWK0NxVGVTdlFLSElMcjlZQzRZekNZYng5M2hOaE1pdGhBMnA2?=
 =?utf-8?B?SGxaWFNvbWxTcmVVQjBCSkFRQmRwQjdvOGVrdDBtNitjajNJOXBCdlhtd2pi?=
 =?utf-8?B?R3Y2Y0U1YWJIaGd0L2x0MFRkTXoxaEthVGRhZDZ1WXJHRC8zTldGNEZxMThG?=
 =?utf-8?B?UjFIQnQ4U3FwWnUrNHYyQ0NvblJtbnc3QUxyMjlNZ0Q4eGJ3Rm0wK3hsNGdQ?=
 =?utf-8?B?VDhMMHNOM21GWEtjUGppcHhJNUtLcWlrRWNwMnhkekphaWNlMlphaThSbGZ0?=
 =?utf-8?B?SVJNOFd1TXZ2MVB3ZjZGQlBhaVJoOXpqeFVucWpTKzhlZ2xMcytYbXBBLy9Z?=
 =?utf-8?B?NHlxY2NNL2N2bE5LNUk0TEIrY1BPT3MxT1FjeEJSMGFCbjBFNHc2WUtJYS8y?=
 =?utf-8?B?Rlg1TCtldEFPVlpFcWRuMXlZQTBqdGMxek9JU1F6SS9sdTZlSWZmejFVUkV0?=
 =?utf-8?B?Qk1Udk5maG9ibjhLREp3Ky9NQ0ptRnpaSzhlVTRpT0I1djRrMVdWTWYvVWVH?=
 =?utf-8?B?a0dhNkJMbmZZOHNwMFNyaHVhcTdzamgybGRpUTBxNWFmQzlLcHdyc2V4VkVS?=
 =?utf-8?B?bFF5MSswQXVOM2lvQnRxWkJJZG1zUjRwMGExTkFwUlpuK0dBZkZUS3pwSGFi?=
 =?utf-8?B?MUNjak5FZWFEL0xMb0JVeGMvZzBJZzIxSEU5SmF3N3lPZTNEY3Z1TU9uc3Z3?=
 =?utf-8?B?WGtpcHpuZE9tNy9WVHRKbjlNSGVCdEc4ekM1Y0g4c3djU1R0Y3FHUjFSMTJ2?=
 =?utf-8?B?ak9hM0RJbWRXN0gvMExFNlNlVzQwdHRCSnpUQnQxckZhUWpXQjBPTHZIaklJ?=
 =?utf-8?B?TkJPdlVHZFFuNXhXTUVNdjRBdnYvc3lIMStGRTEyRnFBM1pHNTJmbTEzRkl4?=
 =?utf-8?B?cWhvVWhYelpQekt4SlluQjAzK2tpazQwczQrdWFzTmE2TGp3KzNNa1VuS2pT?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f81bbfb-6f81-4674-fd83-08dc64099eb0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 02:52:46.3150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WC226UFcOxmgKATC1BxFwtG0mxZv8w7utTioWwaNxgO36HWaZ4zO5jZiVjfnX+c5yMpyDDTxjJkDfmqeFVY93MPbjClXEdPFU3bkMc7AagQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

--------------gVa9R0vbsnaFdsrHUo6S2IFp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-04-2024 03:52, Rodrigo Vivi wrote:
> Let's toggle between different modes.
>
> Suggested-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_wedged.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 35fc905e7..b9bd49fad 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -216,6 +216,10 @@ simple_hang(int fd)
>    * SUBTEST: wedged-at-any-timeout
>    * Description: Force Xe device wedged after a simple guc timeout
>    */
> +/**
> + * SUBTEST: wedged-mode-toggle
> + * Description: Test wedged.mode=1 after testing wedged.mode=2
> + */
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -257,6 +261,16 @@ igt_main
>   			simple_exec(fd, hwe);
>   	}
>   
> +	igt_subtest_f("wedged-mode-toggle") {
> +		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> +
> +		igt_debugfs_write(fd, "wedged_mode", "2");
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		igt_debugfs_write(fd, "wedged_mode", "1");
> +		simple_hang(fd);
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +	}
> +


LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	igt_fixture {
>   		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>   			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
--------------gVa9R0vbsnaFdsrHUo6S2IFp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-04-2024 03:52, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240423222220.1285742-4-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">Let's toggle between different modes.

Suggested-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 tests/intel/xe_wedged.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 35fc905e7..b9bd49fad 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -216,6 +216,10 @@ simple_hang(int fd)
  * SUBTEST: wedged-at-any-timeout
  * Description: Force Xe device wedged after a simple guc timeout
  */
+/**
+ * SUBTEST: wedged-mode-toggle
+ * Description: Test wedged.mode=1 after testing wedged.mode=2
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -257,6 +261,16 @@ igt_main
 			simple_exec(fd, hwe);
 	}
 
+	igt_subtest_f(&quot;wedged-mode-toggle&quot;) {
+		igt_require(igt_debugfs_exists(fd, &quot;wedged_mode&quot;, O_RDWR));
+
+		igt_debugfs_write(fd, &quot;wedged_mode&quot;, &quot;2&quot;);
+		igt_assert_eq(simple_ioctl(fd), 0);
+		igt_debugfs_write(fd, &quot;wedged_mode&quot;, &quot;1&quot;);
+		simple_hang(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+</pre>
    </blockquote>
    <p><br>
    </p>
    <p>LGTM.<br>
    </p>
    <pre class="moz-quote-pre" wrap=""><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff">Reviewed-by: Himal Prasad Ghimiray </span><a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff">


</span></pre>
    <p></p>
    <blockquote type="cite" cite="mid:20240423222220.1285742-4-rodrigo.vivi@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	igt_fixture {
 		if (igt_debugfs_exists(fd, &quot;fail_gt_reset/probability&quot;, O_RDWR)) {
 			igt_debugfs_write(fd, &quot;fail_gt_reset/probability&quot;, &quot;0&quot;);
</pre>
    </blockquote>
  </body>
</html>

--------------gVa9R0vbsnaFdsrHUo6S2IFp--
