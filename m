Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6270BC282D9
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 10:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224F910E28E;
	Wed,  5 Mar 2025 10:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrZdj2tl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8105389C5E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741171861; x=1772707861;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LyABQ6PnN0+X/RKcLW6W5obBH4hkmlYJ0Grq/cH3QJU=;
 b=MrZdj2tlTZu0ixyWz/xkOD1SmnX0ntYlcnhctZga8vMbR+kaAwGRTfVC
 v5rF8nPsa2H4flb+RAB/5UqJRF5NYwqNWBjzdplVAYSb+B3vcXY+yQs2i
 unSmSfYNgxjLCU70+TBLLyIVrD53Nggn/k1EQp/od1NQ1/8IE+f5CaCyF
 mnb8/dgdBn8M6yeKpS88/UOp8BP252PJkSXovJ5rDpA5+RTn7v4pyWjlu
 22GjAfi8YRRH7p5TriweFBC2ok/UYlIKfWoX0vAa4VVqa9qXr1TxMdoRC
 m+FYALOsJS5uElmkEbARVaTdJEe9cO6tZyybe6xCqtxd/gqfZlbngic82 A==;
X-CSE-ConnectionGUID: BFAbc6D5RYim9GKXRvLSVw==
X-CSE-MsgGUID: 2KMsM2OmRZOQrnwQ3f3+5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29712134"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="29712134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:51:01 -0800
X-CSE-ConnectionGUID: T/GqZI0oRNePkGk0JP6lFA==
X-CSE-MsgGUID: LDhOMagfRPeMmMnspEpZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123859958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:51:01 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 5 Mar 2025 02:51:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Mar 2025 02:51:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 02:51:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5VhXkv0dLD4F2uOw3LARiFVzGEekrSvAPxETusRDn9rOPh5DyfA7pgU3FI4ckP+jnSJsZNkRmgtNcMRhgHk/rx3qrmBsBdm2yFMzYmdwjAREs9i71Ctm4MNDev9C6PsNxcr+f/ubALOILworYEsZmjVq0PEw2okEmJJRv7rG/WHxc7h7o9xd9/w4QBY4+EjRkxlBw0mChFc6q+OBJ1SwDJDgyDA1S3JrL5r7tOoXysFygsTFhPga8cAL+5DBi07/zlCPTRovem3xaKW1R9JB4Jr2CMUkUsZFSv/q2JfnPMAPyhaYSO2tCO9PJbAcYjQ0pOj6j0k2uUzP/+fNyIRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUSzhkiTT4d/7bwE2BYEZrUxRjihcs4zTbV2J3jfdaU=;
 b=VBG4yQKpEx922unPfVW9wYxOEFu4Q9tFNWQgOrXDrzZQDC7dm1v0td1qNr3moAjfuBMXId3uo/WNqdGcAAf1c/0/jxpYOVl1DJmSiWeJ3gQI2xssYggZWrQhYe4ovvM00sUGlCDQCxfRZt/CsnC8nvrk8dGKFVbuZY7QivnDX14ro3ZbWrPWHfUhw9jlWkC6dDxu/fOC+3tMxSqPwYfIbNqbPK2FlXJBqjxI4C1wiEvq3mrf4lZZ2lwdoGlI6GdPi6saTIOOwrK7f2uW9EcVszIbAPSQ2kJ/+olVugPZY6X1VXs2e9ihmuQSnctj+xUvDpNS70Fn2O70k5TSadF1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 10:50:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 10:50:57 +0000
Date: Wed, 5 Mar 2025 11:50:53 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v2 4/5] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Message-ID: <Z8gsjZarIvdxWlaw@fdugast-desk>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219073445.31423-5-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0032.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 69294b94-9489-48fa-2a4d-08dd5bd39c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3ZIS1gxZ1ZwS3kzdVVDNGhEMi9Jdng3RkpSdW56cU54TFpXUGVNRWcrRTRY?=
 =?utf-8?B?VzVoeGNSaFhqNGpmc1Via01nZFpjMmEzVjFuZzVGQzNkQjJ2UVhnRk8zdjVP?=
 =?utf-8?B?emVkaDZTZ3ljNUV1bjV3UHRVK3JjY1Jnc0k1ZmxkclZIS2V5cXVHd1p4K1RJ?=
 =?utf-8?B?SFN1ZDkzNjhBWGdMSzNWMjY2WlB0YnliV05OTjNmMzBSWk1FSTNoWkpBTjVU?=
 =?utf-8?B?RFRNQzdhWmhhMHVsMGw4Sm1uWjR5MCtKbktOZGU0Q2FBL1R3a3pBVUh6enNn?=
 =?utf-8?B?NkNMUGFDajd2T0F5aFg3Q2lxT0Uva2dMaDQyWDdOQTc4bVpsam41dEtDSENn?=
 =?utf-8?B?anBXNjQvZnMxNE9HZXdjajN4T2I0MmNXanhRaE1OOUpkMkdHRGNQVWhwNTh6?=
 =?utf-8?B?R2hEUWdGV0N1VTNjNGx6bkdTKzdZbkJyVEt0QzdPeituTGlhaVhsQVdxUWtj?=
 =?utf-8?B?amJOc3NHUGZXMTRORzZlNzN1UHM0Q2F6NWNVenJkWkJROUx5bTllcnl5UlNX?=
 =?utf-8?B?Y09YR0JSL1Nnb3hOZXUrWWtKK1EyL2tzVUJkL3YvQlozVjlQWFhHME15UFh2?=
 =?utf-8?B?M01MK3I3SE1wYnN2S3JTeUM4aXJ1dFFaUXJRYjlEMWZxcjUyWlhqcktGR3VF?=
 =?utf-8?B?L3BPQTFCbmJFcTJEUFpFQ0VoYm0zdDQxQ1dGVjducWpSdlJ6b0xXYlZSd2Rj?=
 =?utf-8?B?NVY3YzVGeWZvMUxVRWVlWEphaTg4QXNieTQ0MGtGNUtXUW5MTzg4NUZheGF2?=
 =?utf-8?B?V0IyREp0ZGRMUzZqWGFJYkJmZC83QkhDMlRXNW1pM0lmU2VodFFKODVTQlla?=
 =?utf-8?B?eE10TFk3OGt5aWxqalVHUWdkeHRuK3BDMWY3MzVLcjhOMXZhZlF1T2ppa2c4?=
 =?utf-8?B?RVR2b1VqSGoybW9GcGJOK25FaDdaZkdCMkdWVWdzdTB1RG9lZ0IvaTZubERE?=
 =?utf-8?B?SGdXTndna3Rqa3Q3UFdSaXJQMkk3ZzliMGdBeTVKKy9tQjEvTDcyMzZ2M0xl?=
 =?utf-8?B?WTdqdlE2NlJtdzhBOGZPTk9yOFBoUUJabXhyejVLU2hMYWsvZGJiWEpBYjNN?=
 =?utf-8?B?bnpIeU45WDBKdHdrNGdCeTNWTHlkeGVBOWxRempvWnU5d0NqNlpmRUFteVdF?=
 =?utf-8?B?Z05wdzliTFJoOWdGMVN6NkpYeWNiS2xhdE9ZbXFCODZ2TW1rb0pPaHhzbWJi?=
 =?utf-8?B?bnZXOXZjQWZSYW43YWk1dzJKREFqaklobVhydWZCNGJRSmZ0VUZIWGRUQTJw?=
 =?utf-8?B?MTZDeXd1b2JUWHJqVEM4N2NBNEk0RURoa01OQWdVL2p3OFRZSnpUNktLd1Ax?=
 =?utf-8?B?N05NYS85Z1FNN1NjQzFuZDY4aTVHRU5xWDBiSFJ4OFdIaUpMcDFlS1JlTEJE?=
 =?utf-8?B?WGJqYmNMYzFITDJpRWZ3cWtYb0FKS2gwMUNwckQvRFBnWUdxREovMy9rQklF?=
 =?utf-8?B?aGFocEdFYjRWL2JSeVpwbmdFV3NkNXZkVnFNZW16S3VBTk5QM1NvRTF2NnE1?=
 =?utf-8?B?M2FNMWlMZ1dKNy8rODZxOE1ncll0UzZyM3ltd3FvWHpwcjR6U0p0Qnd5OUlH?=
 =?utf-8?B?aTUxdU45YmJnMDU1YkY4ZTNHQk9pRVJOcGpOdnpMeFR5dE1VbFU5dFh4WDVK?=
 =?utf-8?B?K2ovVTR1UTlGSklMWklzSWxzRC9jai9kdTlkOTF0K1hpTEowb2dWWDA4cVNp?=
 =?utf-8?B?UnBYaGh4V2xaRGh6T1BwU1g0WWRDYUw5YTQxOUpmdFVsK2o3UHdWVFFUTnUx?=
 =?utf-8?B?RUZ3ajJZOGZLS29hNXVrQ0FselFoaEFxdHRzQzhkNnVCanRHLzhPaCsycUNU?=
 =?utf-8?B?YXAyV1RDUUM3TlRKaXhkMFNETVJQSEExVFdMOUszUi84RDZTbVVYVFd3cjNM?=
 =?utf-8?Q?qvZfdPNJE17zp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGc4R1FZNG1udXBtOC9PTkx5UmdMTEFOc2VNNTc0ck5lUzZJeXdzRi9iekth?=
 =?utf-8?B?VlIwKzlJdlY3VVhCZnBtT3Z3cEIzVXhUamNZVEZ2OW41cmNjS21yOXhXd0hR?=
 =?utf-8?B?eDFZVTJ4N1FzWG5VbmtHYmxDTVNIRXFOcktlRTQ0SXBTM05LbTZOeVlkeHZo?=
 =?utf-8?B?K2xwNkpUQVNQTmFNdmlmQ1BSNXRPbExwZVpmRndjRFNXUDVUUXh4d0J4dk1P?=
 =?utf-8?B?SDNUbTA0YTNPbmRpamMrQlBpYXgvc05QenZxOG1aVkh6M25VU2tUYnVsMHlX?=
 =?utf-8?B?VEdlcUYrOHlhWnBtdml5SVBnTXUxL3FneWJTcjhvZ2lNNm1GM2FjTXRXR1Jk?=
 =?utf-8?B?ZjFPbWRJZlZYMnAydHpoSnZhMXVwZXVIMkRDbElZbkZNYWRsc0xMWFVtQnlQ?=
 =?utf-8?B?dnJ2M3NnbzBSUTZDbURqSnNrcW9NRDBlcnlESVdpUXR4WlFkaHp6Qkdza0FM?=
 =?utf-8?B?N3hRem5nTGpBTFJ1WGRZdnBUMXZMckdkUm0yRlVHM1VWM1E5K3M4QytWMzNX?=
 =?utf-8?B?WUw3QVF6ZFQ5LzdHL05leFJqNjhNbWVuZkFLRWxkUUV4NlVSeVlhLytCREpO?=
 =?utf-8?B?MmNRcjZjcDdnMGtOcWRST3hRVXFnZjY0SHJZcHN5UmVMRlQ4VWVEMElYZ21T?=
 =?utf-8?B?VnFKUWlNbURZL2Qyc0hhOHRPN0pCSG03TjJlWEtyZlJ4YU1xdkMyUGJtR3dI?=
 =?utf-8?B?UHJpcnQ3TWJMUU1TTDNQb1dXaGZLYXdzUHQ4ZDN2TGtOQUY3am1mS09VSU5m?=
 =?utf-8?B?eWVkTUFXczdXalRvbXZ3T3ZUR3o3aHBtdUswWjlCNk0wSTdKUHFKMGIzUDd5?=
 =?utf-8?B?R3NUNEpueDFwL2FnUklSdHl6alZMdXBZSS9TNGRhbmRQRFZBMFFUUExpMDhM?=
 =?utf-8?B?dUo4OGVBTENWYTNXQ2tOcUt0MktMeVFuY1NzTVBvWjBibnZZTU01YXBWa05E?=
 =?utf-8?B?Sy8xbXZNMURyRmQ1QU81N2czb2QrVUg0UUpGZG0rRHhrWXFDVUxSRW1tUG1h?=
 =?utf-8?B?T3d2Y3lOalhPQ1hHSWVSbno5cVNJbVQ0M3J4N3VCMXN5UXMrMW5WVkhFTVV2?=
 =?utf-8?B?TTZrYzlHdmpnZDJ4MnNKOWhKVkdoRTJmcTZVU1lVWG9RSUMxcG42d3lveVl2?=
 =?utf-8?B?dUlGc0tHbzdSendUZVEwSDUwODJ5dkRiMlNQWVdZb3VvM2ZRMEVSL0ZhMHZ5?=
 =?utf-8?B?eUhkV0l3a2x4Y3FibTRwMldCQU9kUWRRY3BScWpTRCtXbDNxeHVvcVBZT3Iw?=
 =?utf-8?B?RmJDbjlWa3hGcTlSaWtGVVY0YW5MY0xIRTUvN0JlQjdpOXBrTnpYSE8rdW9B?=
 =?utf-8?B?clFoSG0wQTE4UlpxTzcyL0paZ2VkK3I3ZjY0d25KQlBydUJld2xyRGp5T0J5?=
 =?utf-8?B?YzN2UFVsSW1GTGJYWWNuVDZYZktvOXVNY3ZqWjhOZW1nYkcrSEljejNNa213?=
 =?utf-8?B?MDBWc3dYdFRqbjJ5VU96SjRLeEtLUmluRlU3alByUCtDTklsQ2dxK1FWUTNa?=
 =?utf-8?B?SVFvMzQweW45aUFTVnNyVWNxaFhXd3RWbWhwdktEMlB4WnFFZUxYNG5CSUlI?=
 =?utf-8?B?MC84SnI0bnFVNFFoTjk2Wjd4Wi9wZnMyUUt4cWk3VFRxVC9aeEpveUNNNWZm?=
 =?utf-8?B?TldTUHRkeWNvWHlYY3EzMDlwdmticTFvd09KZkhFdVQ3Rm94SWtYVlJCQ0Vt?=
 =?utf-8?B?WUdkcnQ2anZFWEtGNWhMZjJOaXA1ZnBySW5IcjNFK3l5NlZrRmtOV0hVK29M?=
 =?utf-8?B?bzBtOU1WVkwzMlRxMENLOXZxZ0kvczFtUkpUWmRiNktoUXN6MWE2b3RnRVVS?=
 =?utf-8?B?Wk1zMUEzN1RyU0ZFMTJkS3IrKy9hR3BSNkJRcU1VbEJzRUxaeU0zd09vY0pK?=
 =?utf-8?B?ZUkwdmc1UkhoVFNYRDN6QkFWaTlqSkdHampWUW9IUW5Ec0JKL3h2V0xHTmJz?=
 =?utf-8?B?VUdQNmlNcm5kUytBV2g0V05iQ2F2MnNQMW9xQWhsTVp2SXZJQWxtMzZmckpP?=
 =?utf-8?B?MnlOZVpEVkpKWnA0Q0xmN3RXdnZVVlVOd05peTFRUUVhMHRaYmVrK2FYK2tH?=
 =?utf-8?B?OVhvaDN6N0tZK29tcHVBa0pnMlpnL2p3R2g4S3JlZDdNdVRDcGo1WXVMbkNX?=
 =?utf-8?B?UitUVCtKandTdzRReC9qZGRHUjgrZHdiRk5rTGYrYlVZM2EvK252cUlZM01t?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69294b94-9489-48fa-2a4d-08dd5bd39c7e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:50:57.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4sRxyxzMFzpN7svMjpVK2C3hHJBVyNJNwuERQ9f1k45MU2ZC5jV7nEBW6KY+1SFb74IA0M8NfLY/AgNLdmy5LBz3s4mlj9xkx/LcXKmDBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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

On Wed, Feb 19, 2025 at 01:04:44PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe during driver probe when executing xe_guc_ct_send_recv() /
> xe_guc_mmio_send_recv() so that more code paths are tested, such as
> error handling and unwinding.
> 
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 41 ++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 32733fec5..cf0337733 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -231,6 +231,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>  }
>  
> +/**
> + * SUBTEST: probe-fail-guc-%s
> + * Description: inject an error in the injectable function %arg[1] then reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_mmio_send_recv:	Inject an error when calling xe_guc_mmio_send_recv
> + * @xe_guc_ct_send_recv:	Inject an error when calling xe_guc_ct_send_recv
> + */
> +
> +static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
> +		struct fault_injection_params *fault_params)
> +{
> +	int iter_start = 0, iter_end = 0, iter = 0;
> +
> +	igt_assert(fault_params);
> +
> +	/* Get the iteration count from environment */
> +	iter = get_fault_inject_iter();
> +	iter_start = iter ? : 0;
> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;

On CI, IGT_FAULT_INJECT_ITERATION will not be set so iter_end will be
100. Probing xe 100 times would be quite time consuming. What is the
expectation for this test, what would be the added value?

Francois

> +	for (int i = iter_start; i < iter_end; i++) {
> +		fault_params->space = i;
> +		setup_injection_fault(fault_params);
> +		inject_fault_probe(fd, pci_slot, function_name);
> +	}
> +}
> +
>  static int
>  simple_vm_create(int fd, unsigned int flags)
>  {
> @@ -330,6 +358,7 @@ igt_main
>  {
>  	int fd;
>  	char pci_slot[NAME_MAX];
> +	struct fault_injection_params fault_params;
>  	const struct section {
>  		const char *name;
>  		unsigned int flags;
> @@ -363,6 +392,11 @@ igt_main
>  		{ "xe_vma_ops_alloc" },
>  		{ }
>  	};
> +	const struct section guc_fail_functions[] = {
> +		{ "xe_guc_mmio_send_recv" },
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
> @@ -387,6 +421,13 @@ igt_main
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
> +	for (const struct section *s = guc_fail_functions; s->name; s++)
> +		igt_subtest_f("probe-fail-guc-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +					sizeof(struct fault_injection_params));
> +			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +		}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> -- 
> 2.35.3
> 
