Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9E4C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB9010E91A;
	Thu, 18 Jul 2024 14:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIVcbAWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344EA10E91A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721312590; x=1752848590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b6OV/xx1QjWY/IWrjTTq5g47nKynwlPxMGNFw/47rDE=;
 b=DIVcbAWGxnpJf1EeOW6jsv/xWjAYjcqAL6qXkhcQ2R3QkyS8QgJTpH2L
 WI1u321GEUSB/Md/g3riivTp784bX2VR3bEo7oTkfyScz3kWdZwShx38u
 NyB8BgC+K20k0IbdjupmCetH9GB2u9mfowhZw98X/8b5Hz3nofTYz6scS
 eWez0jcOyz+6nDqkVcnjW50EMP47vUmoV3laakcSP6DZg7HTbCwAn2Fj0
 aFGNt+ZpLv78pbjzbUAKylN/V3fS4ZBHYAuxIFDdysTWBlLz2nMtxNZqT
 vcSfJwEXscn83lwWyI/hjnYAiAMtMI3ufbY9voZIw//hW07w93jNN7oxx Q==;
X-CSE-ConnectionGUID: mSjcKEmRRUOTwzrWMtBDsg==
X-CSE-MsgGUID: 46EX5pLLQFSfnfM/BTUigA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18496946"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="18496946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 07:23:09 -0700
X-CSE-ConnectionGUID: 52ZiAmCfQ/2X+7w6AE8xXg==
X-CSE-MsgGUID: N7JkHKZzQx651ExZwy7y4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51397720"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 07:23:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 07:23:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 07:23:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 07:23:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 07:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tj5WUZ2hAMk/zYRWA1gwmVeZoqgLGnOs0NWzEj2lY17rkd5/5otuUM5+SixQDLSUW1qlbpqW+DIbcnhP1L/FrZVMJJZXOAWgWJdh3xsaIQjcl5+sTiXu41Zhp3QvnS0wMu2BR+KyV19gtv6yCfsnur9EY/1n5+bT+QpESJyD8r7qgIzBAMpQzhm5mUqirLr9cAMHwrUA/WGzhRsEopV/acOZ3T7pbxngIEDqICOIW3B35RlMMeMnKxb3dZXcVB9PpUXYF6N/E1g9u521VABMy3pOAFUv/zQrKR9CWvE/dJttJhWrieg+tfLbYeFlj6LSK4/A3ZihX9LnD50qTsOAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h9vXcDDdIwYzHvCwYxZT8wb57Ql3Zc1HfqOKQGX+0Q=;
 b=gTGDQjzoBLMfXMra38gYLWFXEd5t4GYjcjOPiEbNf62ROVeNqAqCPZ2Ap9wgNLxfW9pFdtEh/8lC1huHwb0HctNScD4oo9XtPfJaPJMldULNK3lOmESpasMCRD74kwBeIRt9Xpm4GqOJkBeT8/iCR/aya01rRE4RfLZ2G9s5YCssfTwPLGoVQx1RPmp9n79kZsPdDDBPUsqPfvkfCfug0iMLAKhzqdOQA/j1ihM5jTzpfBUzln3aWWvdN1ntA3GBcXT3FT4SApka20Ug8ohT5bZmJVLufEG+fNcaoVVVWOXI1gv3YV+4Wo+2nv+rFATfiAMoQLDlthxuqOdqDqYL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Thu, 18 Jul
 2024 14:23:06 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 14:23:06 +0000
Message-ID: <1c355bf4-80c9-4052-bc63-65e114622c12@intel.com>
Date: Thu, 18 Jul 2024 19:52:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 1/5] tests/kms_plane_scaling: Update the single
 plane scaling function arguments
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
 <20240718140546.676903-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240718140546.676903-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::27) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: f13e5306-a0f6-489e-dc53-08dca735241d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmhZUUJRT0s1b3BFeUNNdlNwUldyYUhFWmFVRmlJTHRkcUdUSWF3V2lIWWRN?=
 =?utf-8?B?aGZ6YW9WTzN2dUtaOVErY0U4eWwzd3BwSG11M3kzbjVSaG1nMHBEYzdtSVZV?=
 =?utf-8?B?cE56M1kxMStzekVHMHl6U0dnM2dpb1FFVWl1TDArbE13T2JLWkQ3ME10MGQw?=
 =?utf-8?B?dGsyYlBRUDRiSHRNbWU1VU5ac2xCdFlDdHh2QTNhQ0xuMWo1UmdWR244enp0?=
 =?utf-8?B?VjE5d2IxZXk5WE9MbkxYQm1FT250eXNvZzU5WGNBTDEwVElBajRhYVZYeE53?=
 =?utf-8?B?bTZBbWVSVy9RWDBJYzVuRmloR1BPL29uZ2tDY0dNNTF4em9nQkcxamFJcW92?=
 =?utf-8?B?STZ4QXg5cW5KbDUrSUVnVEdUcGhscWorbm9uNU1JVXJ0NVNTbnZDRkJIZm1C?=
 =?utf-8?B?UkgvMDJYWlh4c1RpbGdLVWNQWEVIUXlzczNnVGdTL1luQkJGRlgyd1IwSGd4?=
 =?utf-8?B?WXNBUmp3Q050eG12RVk3UHlpNW4xT2JsQjE4VFZkVEhhcFdSSWovdWsxTXUx?=
 =?utf-8?B?dFZvbStTNnNaL0FicUczMWM5aXE1eDg1NHRtVmE1LzRoejZwVkh3cXZqWVR0?=
 =?utf-8?B?QjloNFhuYVRLZ1lIWG5XQ3ZOR1Y1K2V5Zm9haUJob2U2VlEwdGk4Z09vQWhW?=
 =?utf-8?B?SGtXRFlpSVdDbytZbUd5cVdDc1RGUWMvRXRKQXRHa21pd1praDl6NlBkRXNJ?=
 =?utf-8?B?aGZ4bnYyUlo1UnNNRStZYWtCTk1ib215U05iQ0RMSUlUcTRuVTZSMjlIWksz?=
 =?utf-8?B?TTdTZE9ZTTJpSnFJeWFjT3ZNOVVOTmlIYXB6aXYzTlFZbWtjV3FpZzliaEpk?=
 =?utf-8?B?alBUNXBtdGtlUEhpck9QeDlweTZQYStpNjJHNkhnc2ZnRHI3RHp2eHpCVFBN?=
 =?utf-8?B?T3RrYlM5Q0NkYnV0Vm5MeW5OekdOWXFZMUllUlZIdFpMaHlibGNlSEVJNnl2?=
 =?utf-8?B?VjFuY3ZERUlEU0xOVzNhVzh3bVZtQk5KOFd2Q3E2dUhWOUoxZ3ByTGdReHQ0?=
 =?utf-8?B?N1MwZzdCZUczbUZjdWZoSTRUWWhCeHIySUNmVkR5cUNSZExqQk9tRU9nRWVT?=
 =?utf-8?B?eitCc2JmTVZieXorMWFtWnh0Z043djY2MXZQTDhINXl0SUZ4eTdtZXkxb0pr?=
 =?utf-8?B?eE9WV2ppOXNrRzhXYllNMWxtM29ldmhHZWd4eUxsN1AvKzJ6cll6d2k0amZE?=
 =?utf-8?B?bHluQTBvVnYvME85N1JCVGRPMk5QSWN4REQwWVRiY3diZGhoSTNZMGVVS29p?=
 =?utf-8?B?L3lhdVVqaC85cXQxTmhWOVZyY29rN3dTNTVFSit4cEJLUE9NTmVaSnRrRExO?=
 =?utf-8?B?bzlCcVRUMkNsenAzYk9qaEtMaVNDS21NNm5VYTRNWEVlVHFXZ3VudXRoMlFY?=
 =?utf-8?B?TmJZOWI5M0QxNXpWdXhjZ0pwZHMrRHE5WTFIV1JFNU1TbVpwd29UcTFseDRO?=
 =?utf-8?B?eEtpNm9GWGdibkxOTTIzOUlvYlFETENaRk9NQk9ncTRzUE8vdDFrOFVHcGJ0?=
 =?utf-8?B?RzhueFgzOWFhU281UUJld2hiKzhlcVhNQ3ZkaEJzWXZDRVpxU0dobFplajEy?=
 =?utf-8?B?eU1PZ0FTWU02aDgreFBsRVV0ZUUxNWpmN2FTUDg5VWZFcVJzc2U4c2lrUFdm?=
 =?utf-8?B?eUMzUzQ3cEZlazlIQlJMR0JrQ09DNnRYaHFPMm53SjhtVEFJUmhTNGxrRkY1?=
 =?utf-8?B?OUdDaUFSN00xbW0zdnM3RWF6QVZGZlZiazl6dEs5YU1sZ0hKUVp1R2lEZEhC?=
 =?utf-8?B?bmcvVklmcFpST2Z2Sy96V3dsWTltWjhQaWc1YjAvWHNvU0hySHIyM2lqbm5k?=
 =?utf-8?B?S2ZmZWFzNHIwVytCdmYwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBlOElrWE9MNjB6QTVxUWZjcGxXWXZYQ3QxRUI2eGQxZmF0cmxkejVjYUEr?=
 =?utf-8?B?MEhES1FTN094NGlrbWlJNWZsSUhwdlBZY0gxcG9mV3F0eEsrTitrQ05kMDlG?=
 =?utf-8?B?NmtDd2pNWmJGcnhtbWFXNGtWUi9qRFhreTVzVm1lUlpZdGpEZERBVW9hMkZk?=
 =?utf-8?B?a2Z2TFc1ZEl4UTk0N2ZWSk5vUVVxTVVNUDZnMjUzUi9HZU9Rb3RqWlk2czFz?=
 =?utf-8?B?a3hDTk5nNm90cVpNQ3dyc2p0M0l1dU9OcDJFeDZTSjc5cHVUdm9CMUxqNXFw?=
 =?utf-8?B?VzNNRHRaeGRjMVNZSC9JaEllcnJqKzBBbHp3cFFMdmFMbGNMOE9OSTlCcVM5?=
 =?utf-8?B?R01vN2k4cXREMHcybXVaNkEwTFdKeGRSK1o0WG9VenlHVTRmTENaQWY0c0FU?=
 =?utf-8?B?QlNGQ3JYaEFzd3UzWjNCcEsreUtYUzM4UStqeVJCR0NROHc2MzNMeWdkSFRk?=
 =?utf-8?B?SStSZ0Rvd2ZlUzhMcmJadU54QUp0d3FqMks4NTQ4eW9WVmg3UXl6VExZdnFL?=
 =?utf-8?B?S3ZXbDdYdDJRSzZrLyttbzBCUTBkL2lmNUlmd3NzU0FNbTlFWUp2ZUtxMDlT?=
 =?utf-8?B?aTU0MDBwMlFRNGxKNmJ3N2NQT2t0VDZiamhaOHBMMkRsaXR3L3FBcUJSaDYw?=
 =?utf-8?B?MXRXWElNS3JZQnhTbUprZFptMmQ0cFlWamdXRTRSZllNR0Y1QzR3bERVZ2Ix?=
 =?utf-8?B?WkIyYXJpR3U5UlVUV2wvUEJMSTNoMkRqMksxNlNZZmhEbnd3VjJySTRCS2hj?=
 =?utf-8?B?NHNTNXZDNUdKbGllWHdSVDlpQjlTMmNFRHJWVlhta0llcUppa0M5dUk4LzVV?=
 =?utf-8?B?TTRSdEEvekF6UjFQaDVQRnFJaklPdGZTVURzSlE2QnA3Ynp4YlRrcytIOGNp?=
 =?utf-8?B?L2piZmlqc2hQWWhWRHViQVpBc3pNZGNyN251NzFxOUVzVGNqTVFsMi85WWZE?=
 =?utf-8?B?c0JLMDlROVJabmpLNTF2QUlsdC9CaWlJakNBU0dMQ09Pak5RdGNFeHhyaWxW?=
 =?utf-8?B?MHZISnBwUkJ3TWpwOHZMTmVSYlBmUzlSY3czODZNVVY2VzFxaThQWTdwaWhw?=
 =?utf-8?B?ME53QXMvcUJxL2RDdVZnTzdBZ3l0M3NTcFFudU5GR3R3NmFqenhxeVdVNjFi?=
 =?utf-8?B?MXNNRC8rSHJXRXEzTWZnSzYraUxvcXVFMndRd3JyNnErU2ZDL2pFWm5MWFFk?=
 =?utf-8?B?TnlWZzhuQTRTUDY2YXNNelo5Z3A2emRnTU9ZZnhwUmV1VnhQbmUyU240VnEx?=
 =?utf-8?B?OURhYURxQmR0TEJVZlROSVJINnRRcHRRVUtiOHoxK2JVTDZqZU1TUFcvZlZI?=
 =?utf-8?B?a2F4WjJ3ZEd2Q2U0bm9XbHRBOFFXVEZFY0tMa0p2Ly9PMXVBdDdVbUYxVzhP?=
 =?utf-8?B?RHZlaERESFE4dERGVFE1ajl6c0hVK0VBT05LbUtJSkVNcVpDUWdvQlY3SFZx?=
 =?utf-8?B?ZTdEN1JyRU9tOGtRM3FIeEw1S3A3ZEtmcG5VSHU4RGg4bjk0TUtSTmxka0tp?=
 =?utf-8?B?TVFiNTJZbmh1WGVlSkt1YVdoNjJ3Z25JN2d0VFFOY0MzaEt2N1p6UUtuZDhY?=
 =?utf-8?B?RmFjWU4yeFZDWC9OQ0Y0ZjhHcVZKOUFxVk1RWTVPdHRhRWZKQ2src3VmbnU2?=
 =?utf-8?B?OUE1ZkJraFgrVXliWmgzbWlqOGh6akVRYU1CRXhWenBxaU1jeEJwUjY1RThL?=
 =?utf-8?B?dEdsUnJvR00zeWFwb2RBV2l2V0M0WTJURDcvVGovQlpFM2pXZjRJVEd1Z2JD?=
 =?utf-8?B?aTZvSng1QnpIUmZmQ0tQQWcrQ0krRnViZStMZTVZVVpzdThtVCs1b05FWHJa?=
 =?utf-8?B?K1g0ZnV5bm5hUkt1dkNzSm5MZlJycXlGdmNiTEpTUXlYSDRycSs0WkNFT2ha?=
 =?utf-8?B?Ynl1K0pLWkc2dWszUGZGQzQxSERMS1J5dWltMEdTYmhqYklvY2RhK0hTQlM1?=
 =?utf-8?B?cDI4Nlc1M3pyWkt1aHJlc21FZGtXSHE2VGw0UDJCc2srT2hpcG5mUTEyQWZY?=
 =?utf-8?B?M2ZvSytoelovYmdYaUFOaVpyMWRFbzJuR2pNcENZWXdGa0RkbDRpL3BFQzF4?=
 =?utf-8?B?WWtKazREdEtQbzNYYjIvaWR6bVF6c21rb1JYTUdCS3BKdzc4aUJFc29FYWpr?=
 =?utf-8?B?RUlUUWRLNnBvNjlkKytybHR3d09hT2I3ZVNtNXVQNUJjQVN5Z21GU2dYMmtC?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f13e5306-a0f6-489e-dc53-08dca735241d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 14:23:06.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdzZp7JaeRA+Znbv+18HdNZIswCsOkyd3H+M77XQCbm7NHCykZiz18fKo6EyMyZaHNoh7DMOgGX4YhM04AOsJPXBXzUMpcfU0/S7khLjYVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
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


On 7/18/2024 7:35 PM, Naladala Ramanaidu wrote:
> Update the helper test_scaler_with_modifier_pipe,
> test_scaler_with_rotation_pipe and test_scaler_with_pixel_format_pipe
> to use a scaling_factor and is_clip_clamp flag instead of explicit
> width and height parameters. This change simplifies the function interfaces
> and allows for testing scenarios, where we need to recalculate the width
> and height based on the display mode. Adjusted all function calls to match
> new argument order.
>
> v2: Update the function arguments (Ankit)
> v3: Remove unwanted changes (Ankit)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/kms_plane_scaling.c | 81 +++++++++++++++++++++++----------------
>   1 file changed, 48 insertions(+), 33 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3f63d3cf4..450381831 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -569,7 +569,8 @@ static void cleanup_crtc(data_t *data)
>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   					 uint32_t pixel_format,
>   					 uint64_t modifier,
> -					 int width, int height,
> +					 double sf_plane,
> +					 bool is_clip_clamp,
>   					 bool is_upscale,
>   					 enum pipe pipe,
>   					 igt_output_t *output,
> @@ -579,8 +580,16 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	drmModeModeInfo *mode;
>   	int commit_ret;
>   	int w, h;
> +	int width, height;
>   
>   	mode = igt_output_get_mode(output);
> +	if (is_clip_clamp == true) {
> +		width = mode->hdisplay + 100;
> +		height = mode->vdisplay + 100;
> +	} else {
> +		width = get_width(mode, sf_plane);
> +		height = get_height(mode, sf_plane);
> +	}
>   
>   	if (is_upscale) {
>   		w = width;
> @@ -693,7 +702,8 @@ static const uint64_t modifiers[] = {
>   };
>   
>   static void test_scaler_with_modifier_pipe(data_t *d,
> -					   int width, int height,
> +					   double sf_plane,
> +					   bool is_clip_clamp,
>   					   bool is_upscale,
>   					   enum pipe pipe,
>   					   igt_output_t *output)
> @@ -716,7 +726,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   			if (igt_plane_has_format_mod(plane, format, modifier))
>   				check_scaling_pipe_plane_rot(d, plane,
>   							     format, modifier,
> -							     width, height,
> +							     sf_plane,
> +							     is_clip_clamp,
>   							     is_upscale,
>   							     pipe, output,
>   							     IGT_ROTATION_0);
> @@ -725,7 +736,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   }
>   
>   static void test_scaler_with_rotation_pipe(data_t *d,
> -					   int width, int height,
> +					   double sf_plane,
> +					   bool is_clip_clamp,
>   					   bool is_upscale,
>   					   enum pipe pipe,
>   					   igt_output_t *output)
> @@ -749,7 +761,8 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   			if (igt_plane_has_rotation(plane, rot))
>   				check_scaling_pipe_plane_rot(d, plane,
>   							     format, modifier,
> -							     width, height,
> +							     sf_plane,
> +							     is_clip_clamp,
>   							     is_upscale,
>   							     pipe, output,
>   							     rot);
> @@ -757,8 +770,11 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   	}
>   }
>   
> -static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
> -					       enum pipe pipe, igt_output_t *output)
> +static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
> +					       bool is_clip_clamp,
> +					       bool is_upscale,
> +					       enum pipe pipe,
> +					       igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
> @@ -787,9 +803,11 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
>   			    can_scale(d, format))
>   			    check_scaling_pipe_plane_rot(d, plane,
>   							 format, modifier,
> -							 width, height,
> +							 sf_plane,
> +							 is_clip_clamp,
>   							 is_upscale,
> -							 pipe, output, IGT_ROTATION_0);
> +							 pipe, output,
> +							 IGT_ROTATION_0);
>   		}
>   
>   		igt_vec_fini(&tested_formats);
> @@ -1307,13 +1325,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_pixel_format_pipe(&data,
> -								get_width(mode, scaler_with_pixel_format_tests[index].sf),
> -								get_height(mode, scaler_with_pixel_format_tests[index].sf),
> -								scaler_with_pixel_format_tests[index].is_upscale,
> -								pipe, output);
> +									scaler_with_pixel_format_tests[index].sf,
> +									false,
> +									scaler_with_pixel_format_tests[index].is_upscale,
> +									pipe, output);
>   						}
>   						break;
>   					}
> @@ -1332,13 +1349,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_rotation_pipe(&data,
> -								get_width(mode, scaler_with_rotation_tests[index].sf),
> -								get_height(mode, scaler_with_rotation_tests[index].sf),
> -								scaler_with_rotation_tests[index].is_upscale,
> -								pipe, output);
> +									scaler_with_rotation_tests[index].sf,
> +									false,
> +									scaler_with_rotation_tests[index].is_upscale,
> +									pipe, output);
>   						}
>   						break;
>   					}
> @@ -1357,13 +1373,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_modifier_pipe(&data,
> -								get_width(mode, scaler_with_modifiers_tests[index].sf),
> -								get_height(mode, scaler_with_modifiers_tests[index].sf),
> -								scaler_with_modifiers_tests[index].is_upscale,
> -								pipe, output);
> +									scaler_with_modifiers_tests[index].sf,
> +									false,
> +									scaler_with_modifiers_tests[index].is_upscale,
> +									pipe, output);
>   						}
>   						break;
>   					}
> @@ -1381,10 +1396,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> +										   false, pipe,
> +										   output);
>   					}
>   					break;
>   				}
> @@ -1401,10 +1416,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_rotation_pipe(&data, 0.0, true,
> +										false, pipe,
> +										output);
>   					}
>   					break;
>   				}
> @@ -1421,9 +1436,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
> -						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_modifier_pipe(&data, 0.0, true,
> +										false, pipe,
> +										output);
>   					}
>   					break;
>   				}
