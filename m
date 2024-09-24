Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3BDCF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 05:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA010E25E;
	Tue, 24 Sep 2024 05:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTyIhRx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D4010E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 05:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727155650; x=1758691650;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X0RXO0gcxoB7hEg8D6lm3n4+RfYX5r10fnTM11+TYoo=;
 b=nTyIhRx4DGzUtFvkz8fvAXCz2p6dPBCe1Nr1hZ8rWxEqkSp1FNPneEXU
 Hpj2b9X0vZtyKErfjB++UQW5K/q+OwyhVYqwbcsh+0T9CXfM8WxNBrk6+
 swJD+M9ouKi6wMg+ZD5xsVOLyxJQAVas65lZ9yAsiTZEFkvLBH90sWaYi
 zYW5Jx63wlznSgPfEmPxcIo3fYvR0lXcHqSGXTfDlX6wrIPWp8QkHWyIe
 2vzB/nhBuNjygORbrlErodlmbq2z6HyvO2OCHkMloPqWoelwUk3j9hn9u
 z45nsvPKF2Gc4t5WxjZnXSTLsw4EFJAazpMj+WNBtQ9TNuL6l87BlR+I1 A==;
X-CSE-ConnectionGUID: x7Trf0IpSoq7ERC1RNZouQ==
X-CSE-MsgGUID: 3GBqOYFCRZai8bt4WonkTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36701399"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="36701399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 22:27:30 -0700
X-CSE-ConnectionGUID: qLqSyZMzTeafRGeqEKBpUA==
X-CSE-MsgGUID: nG5qL2sSTJqsh1GRnG5A8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="70896899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 22:27:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 22:27:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 22:27:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 22:27:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 22:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7MO7xGmIjY/ybc9P0F6u/EsmXww3HBbL/vDFaHqHfYBptwub52rnVFGUbDhzPEgUMOpYxgU8r/txNRSzRZ1rjvOzaUVGZov71SbM+YB/lCKmbZgHT10y1cwkBfz6MatxtwXECbCC+KONSXp/T86S4ZZQf2TpTdY56CVNB9rMVmcMP89c5TiIPkpPYM7dHPvw/+DJHlmDBNM0HwkooKxY35huao2tgRZJb8LmYD1Ciex7GXbx+QKytNc98SHz0/vikiRAal4VnIeEDHPU4Xl87RVFbKbfJvxSDhoFpA8OhdHETnU8YaXQEOA4IO+2+XiPuUcBqcItCdknMcy4Q46sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyjLwOWzSVHAMfUVrL9ZdMuGAlOpDPCsi0tzPbusg4E=;
 b=sdPcpZDZBYZ1QpBUJxEwXidhReDW5qvQdbN4Y16I+u+d6xor0ilVintv2cRz0q8vG2z/oWfQ8pT/hPELpePARXk5uycJBEtfsLziKCB/EPeAAbY1gCwy1FG3P8RmXQuPOtmI3lc6GyeJvadqavmPm9bz0aVg15LI7fIdsBU+lFCT76ypPw7bN84Xf7SvcCH5X5ieLvYTgesLvT0XMd9SjNbgw6S2nC9XY1PfWNl62iAm7rYyYdpLc/Gus3gEFplR+2HQctqA6kXd0FZeiffI29AKs3eaiar+X8BWYemRljUr2ztf4ThOOfd6dX2lAETOZCwSgYlW9u4J6VedWCXfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.27; Tue, 24 Sep 2024 05:27:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 05:27:18 +0000
Message-ID: <cd1d46a7-25d6-4dad-81e9-352cc041de8e@intel.com>
Date: Tue, 24 Sep 2024 10:57:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Add an assertion on
 MI_STORE execution time
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240923164703.1923050-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240923164703.1923050-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 832b5be4-58a6-49ea-82dd-08dcdc598e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGprS0RSVThGTGlydWtBd254WjFMMWlmOXNXOTNrYmltNEU5QVFwR3BIN0FQ?=
 =?utf-8?B?TW45OWs0dWx6bUt1RlM0MVg4UFlqSDVDbWZTNWdqNXM1SlFkbkRsNlE1MGdi?=
 =?utf-8?B?MjJ4VTlpRk5uK0dLaW9Samx2MDBNWndUNVpOU1lURXdqeGVycnhlTU40SlNl?=
 =?utf-8?B?NDJUMnRvTm1EQWc0WDFMeVpjemZnaitkTjR0eFIxNlJxaE5vYnpRNDFTSXU2?=
 =?utf-8?B?VXFlUmwzbFpEYzNlcjlvWTVyN29YNEJsYmdoZlNMUE53Mld1Rk5kaGRubmcv?=
 =?utf-8?B?SDV5czFnOXhDaU1FS1AyRCtlYVhIQ1ZNR3hnY2dQa2dWZnA2anduQnlvSWxN?=
 =?utf-8?B?QnU2Mll5SW5JQTdBb2dLSEE0bmF4UTV2cnR6ME9LTmFzemlqUS9MdW1ZSnJN?=
 =?utf-8?B?aGlNTGRsSkVyNjlwM3ZMU2JUTW8rcVlyeWpFbXhKMGxYWDBxWnZRZGFBbFdU?=
 =?utf-8?B?VmMwZWhFZE92Q3hoc3ZuNGlBcjBNeGVjR2tSTGsxSUh6T2dRVDBiU05uMndH?=
 =?utf-8?B?QndGcHpHYTdQVTd3bXFqbUVLcHNYNlRVYWhNbkNSYThwSzhCc1lrYy9ZaFMr?=
 =?utf-8?B?aElGREdMM29nZGVGYStrY1d5NFRIK2tjejdyUzZYbHhTRDNOcnRQV3BObldk?=
 =?utf-8?B?RTZmeHBiT0p6Qk5sQ2FKN1N5Vk4xSDVxN3pmSGJndzA5RlJoN2p2R0FLQ0Nu?=
 =?utf-8?B?SGNkR1RsVjNLN3JyeDZDRG5LN2Z0Wnl0WUVkSk5UcC81R1ZTVFpXWU42UTFu?=
 =?utf-8?B?RThkdE94cmdCdVhxdW5WMWd3ZlcwR3dsMjM4eUFYNzBzR0Q0YTZrbkNlUFp5?=
 =?utf-8?B?ZE1yL1pHbEkyd3VXbS9Ka3drSytrSWwyby83R29sNjNSVWtxTTVmUjhJd0la?=
 =?utf-8?B?SlJKMGFETGxFNVVWSGNneHJyaFNhZTU0ZnZZNkRvSXFDaDlaYjFhRjNSb3NB?=
 =?utf-8?B?ZmVCZjY1cXhyQ1JXZ09FVU5oTWpENm9hOU9YSzQ3VCtLTHRuVEEvbUNETzhP?=
 =?utf-8?B?cFZWNzRWZ2ZJNFFHazVMMHgyWjdrTDlZamNaQ3R5S3g1ZUl6bzVwRlZ4N2Vn?=
 =?utf-8?B?OHM1RnlsVmp1WXBqV0tSVEZ0NFQ1c2dXeWhkanRyUHBSQmswallSc0VZOHg5?=
 =?utf-8?B?R09VcE4zbjhoNU9BZjBMUTlCb2VQcUJEbTBBdHFCSk81L1BnTWMzV3l4TEx3?=
 =?utf-8?B?S0N4a29GT21VT2xRckJQVDhHQUpqWFlhV1VCWGRKNHBwTnVBZEJ5bStadzFL?=
 =?utf-8?B?NnIyV0NkM2hFMm92NVIxWlEwOURsK0tmREdyd1p0OFVKVDlRdmFtY01JNVM2?=
 =?utf-8?B?TDFSYUtOZFRwZTRpK01jUkVCWUtQazA5VGlhOWYwcFd5aURJVUlhb2xiSU02?=
 =?utf-8?B?TmRXYWhyMkduR3prajEySlRLN0l4ZGdNeXVQNjg5ZnNhZVlUOGQzVW1aZWw5?=
 =?utf-8?B?L3prOU9mTjg3VkNJOGJIM1FWYmFialhsTndZQklvTFZLRFd6OGhlUTJaVlN5?=
 =?utf-8?B?VGlpNkhNSmN5eUFYc3g1WDNwY3RGaEJERWhSN3B2RllGL1BObDZ6d3RySGVw?=
 =?utf-8?B?OUNIcmNEZm9nREJORUlRd0xBbWJZZjVlU1ZKaHdwMTZENCttRThNdXJFc2g2?=
 =?utf-8?B?aWRwZHE3M0Y2UGlPcEJUcElmcXdjSUNYbEZiSzNwYzVZTkFvZldvdGRlY013?=
 =?utf-8?B?OFdnd1N6VTkyVkNIRHdFbHRJT0IxWWpkZ09PMVVPMzY3cUZjOUwxWGVOenhw?=
 =?utf-8?B?MGh2WVBIczVMcjUweUZDL3RNY0JrMWxRZ2dJMTdtK3RUa0dRSnQ0S2FlWjFq?=
 =?utf-8?B?TFpkZVZRSkdBMWVvY200QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWxDem0raGYzdFJ1VStTbnVNbTF1S1E2MUlGeGY2LzQwQ2hrNzQxMFZKdlkz?=
 =?utf-8?B?ZytWY1pmcUN3Mk9HRVBmYTB0TGlxZHdOZlRPRFNHeFRVTGw5YUNmeVQyajlv?=
 =?utf-8?B?UUl5dC9RZjhEbGFBOHU5cEsxdFpiUTFrT2NZTHNSbGxoUWNKUVJRaWpvTyta?=
 =?utf-8?B?SzYybmZkb0htNTJEd3dRTWJtRTh4ekpYbXNmZFMyWG1NWXR1YllSQUFnV0Qy?=
 =?utf-8?B?MW1nUkNPaUFuR251QStkR1p2bWwvY2c5YWFldjc2UWdjM2p3bnFueXNRbTBF?=
 =?utf-8?B?NjJ0NTRwb2ZmUUduTEhyVDlSUDZlRVlFY0JjemtEZDRrQmtUd25DK3Bld3hE?=
 =?utf-8?B?aDFLMnZyR3IrR2NOcXVjUmxhdlFaVmdmRWRqcm5GMjg5UWhRVVBBTUxWMG9F?=
 =?utf-8?B?TVdSMjdyN2RJZkoxREE5VEtoUjlCU2JhSFJ3WWVzVjl6SUJ6dzkwaEFSR2I5?=
 =?utf-8?B?TVpYdDhoUkZwbEhYOUQxcDFnZHN3VlZQNGlFeEl5OERBd29XOEhOL3hiR2Vr?=
 =?utf-8?B?S2pXdEJnb3EwMXBuNDViUHFZenFHWHNKVFRxTHZXd1J1TTkyNkFYZ2Zhd09v?=
 =?utf-8?B?RlA4RW1nSHFoZW9nQmhGNnlMRFVlZ2Z2RzNIeTZ0alFaTDlxTExPTWVENTNl?=
 =?utf-8?B?OEhqWlBpWUcvSGh0Z2tEZjlpQWZKMUh0RTJDWlk4RkNzWEJCMXIzU1NJSXNB?=
 =?utf-8?B?WnY3THgrdGpQYlZCNEYxd1JuZ3lxSjVkZ1dxT1QrZTV0TkhHRkJ2SnJHYlhh?=
 =?utf-8?B?VXVzaHQ2dlluN3hCdnFJMXoxZEFCNlYyc200elExM3F2M1JYRTQwV0FDSmdq?=
 =?utf-8?B?eE44dGkwaUUrWDZrSUJkUHlvbUVUSUtOWjdGZ1ZRdWRtdDRXdU5WdTFQSWh5?=
 =?utf-8?B?RXRvNWprT3hmRUxVTWlRV2ZvTDNGTTRuWE9wTWJQZnFTbGIyU21QaGEyMFRE?=
 =?utf-8?B?N08rdEtmeWdwdjdUMnI3UU9ZY3J2djZKZG1sR2lwZXpHanZDUCt4bkdPM0kw?=
 =?utf-8?B?N2owcG9yWXpzNlc2QUJsMGdkekNjSER1VldrajcyazZaUU5DVEJSMmJaZFpJ?=
 =?utf-8?B?L2VGZWUzZk9FeTdpYzJoQjlyY0J0L0RDWTVzdXFBZ0FaWDB0UGJ3c2VMeW5i?=
 =?utf-8?B?Zi9PaEhQdGcwVlBPTHNmbHc2L09mT1BlZEQ3RFZZdFNrZ0RmM3d5VzRKSG9s?=
 =?utf-8?B?K0NkZ2l5ZlZZKytyNDMvMFVNaGcxRjlPbzNSZ3JUKzFHaDF4Y2dDM2ViU2hw?=
 =?utf-8?B?ZGw1VXJnSFZnNlZrQldNTFZhR1AyVE9sNGkvRWtxVi9yZWEyK2JMVW9NR2JM?=
 =?utf-8?B?RUZNRnowMHc5b2Jqb3JqUjMyTis4ZjRwdTd6RHFRemx4NTJhZnBrTkdUek91?=
 =?utf-8?B?NUUzb2duQWV0UW5NbHplenJjYzFrTnVickM0T1VjZnRnb2RMUVZUK1QzLzJt?=
 =?utf-8?B?ZnhqWGt1VkFUN0RRMk9UZUVtS0N1L05QOUtwU21kbUJGbTlrd0pBaDV4cDF4?=
 =?utf-8?B?MGlxRmIwOGxUYXcyZ2w1cUhScXFnVVl4cU1qWFN1UTRKeGczaGlsVXR5amI0?=
 =?utf-8?B?TEFQUWkrNFpvZUE0M0JVcmNKRktLQjcrZXpsQlRrejJ4TUhZTklrOGU1T1M1?=
 =?utf-8?B?V1FoVWRwRVMwZjM1dkRRb3B5TnNJeE5WckMvRm1aRldwdjUzN1h4c3VhQ2JD?=
 =?utf-8?B?SHpwejJJeG9yRExxOVNON01QTFFiRkVXa1F4dzJQSHNYYnExZS9pUElmeEdm?=
 =?utf-8?B?VldOR3poQWtpdWhERDNOWDZZeU1oWVd0TVIrYWUyVmRrZThubkxJT3kwSWVY?=
 =?utf-8?B?LzAvOHM0SUtVUmt0dXkxMmtuMFFKdlEwaGpaS2ZibWdtbUdJVnlndXBNcW93?=
 =?utf-8?B?eHNrUWdCbTh2a0JRR0o1SlZqVmQ1d0hLQnIxcmhTM243RXY0R0d1ODgxMDdG?=
 =?utf-8?B?b2JOZmdSRjVPM0VFd3J4WlVHNnJtRFVWOXBkSHhmNXpKS29vMmNmYXVMekoz?=
 =?utf-8?B?eHNUeTFiZFU2MzVJRmErTWFWdTJwQjl0UndIR3BSbWtMTmVoQ0I5ei9sRWU5?=
 =?utf-8?B?NXpEdlNZN2J4T0drYnZZbHNXYTE5dklGLzkxVTduOFVPaWpnZG1PNWNYdE95?=
 =?utf-8?Q?V5oA8tDT6GMdvGMcu8hWgXZlB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 832b5be4-58a6-49ea-82dd-08dcdc598e5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 05:27:18.1817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /s6Y99DbJLlrHn/nwGvyCjSYhEdMEq5KADwgAg2JLKmCLmyhcelhXmupznSQ31oHRUgz5M4JNwV1gWW3aiSMtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7382
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

Hi Karthik

On 9/23/2024 10:17 PM, Karthik Poosa wrote:
> MI_STORE_DWORD generally completes within couple of ms.
> Assert if it takes more than 1.2 seconds, as it will cause
> IGT test to timeout due to sleep of 120 seconds which is
> the current per task timeout.
s/task/test
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 0e687558b..29c35f617 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -144,6 +144,15 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>   			  1e-3 * submit,
>   			  1e-3 * (elapsed - submit));
>   
> +		/*
> +		 * MI_STORE_DWORD generally completes within couple of ms.
> +		 * Assert if it takes more than 1.2 seconds, as it will cause
> +		 * IGT test to timeout due to sleep of 120 seconds which is
> +		 * the current per task timeout. Current there is no way to
s/task/test
s/Current/Currently

With that
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> +		 * read this timeout from IGT test.
> +		 */
> +		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 * NSEC_PER_SEC));
> +
>   		syncobj_reset(fd, &syncobj, 1);
>   
>   		/*
