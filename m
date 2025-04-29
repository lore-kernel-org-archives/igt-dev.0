Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE55C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 15:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129210E4D5;
	Tue, 29 Apr 2025 15:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/rqjnFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B1110E4D5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745940969; x=1777476969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aCn7eG/4hBy0FPwPe3FIWrp/daYi3Bw8u/Bdfq6v+qE=;
 b=H/rqjnFDSyMBasKb6JYfIzvQmppL2ZH2B3tpw0oGlxLTtaLBxTmnyIab
 NrJj2JL+GoqaFVEy5XR9fph+rEvXvKw3aAeBx4+DodP7p9bveGXy8bqdw
 bM0Hysoiv0zKhcOiO9b3h08EpQmmG74/eYv5te3gUhC2gvHg8PtO6UG+5
 FKNP8qpZQT1N+67t4nwc1ahwzFSrWNvAaRyQp0zF/MXi/Ib3jVc9tVzer
 uhuLyHqiyfWrDobni0vA8Ml29pul8scFRjDihIcgA/L/gGOubXu99Dkt0
 rv7q3NLT8E+F30aE5o4MCK3yD0sjIGAHnmRedFQ/EfpCPaxJ6SDl+ke3p Q==;
X-CSE-ConnectionGUID: Ql/5AL1eTwO7pQCFgCzTrw==
X-CSE-MsgGUID: 30Ke3lcWS12QP3HzFMkXGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50232549"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="50232549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 08:36:08 -0700
X-CSE-ConnectionGUID: QPNLjQzORGaRUULDI+RBVw==
X-CSE-MsgGUID: 6GEAb52xRI2OBIpehesTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="138840656"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 08:36:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 08:36:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 08:36:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 08:36:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsG9PnEOA+NR2LmWoQgNERLIFQ9B3L0Qsh99mzec6ly6IDt6phQVwKtYZC6zsia/aI8PUoaMvU4s27Afx4gh61aB0o+2IzFCuPbMUwH4G+eTEk9fb2njYmU69d1+G0Utj7iFuLX9HU31Zrew0Ui0QP+kWMbVeEnp/gsG6eeWq6JBvGHc+RLRK/ddfHU7N/5s9u4DBJyVFxIFA5Il951oRh5RdPRVvO70F1kF7x4d/09zhret7rwtjUH/7rnqIx3tdG1VsZwy/RZd8/5irIY2IVeQQi3Ql+vnth8LSbFnXyXW8iEvLPLAQCJMQiZARKSvoSAMjAr7iV7HNUkZxVGcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q0wf4FNdkg6/C8ZnPuzWghZHAr1WLfhySDaO51rdcA=;
 b=vDosTWwZIiIcVXNTd8PMcx2oLd1VrSOaYa7/VhlyWpztwM8D5R9BvStVza0mjf7TcibLWgy1exEnWoJFKLPGLH9Ekq0kuVB3HsXWDCzlUfWJ5kavnfTGVjPV1/bZfTbfMJ8ZbV4j/5iGLhw4TaNxm/dzt/55iluiZUEu2HMVYE+LIuPih225VHWX7EQOv+8Ujjex0JBHsTMC0QnAv7PE1ZMnv/g53F9g6Nqt5RevmzDSCXLs0Bb0PAHyquxdvF9EvpwiWm3FKTSPDc6t9UZ4wgezjL6WGMhWtoVqH8XsfoZZ9ObTcqOEl1P6ziEHsaHhAyVgzKDedgKjnotIVQ0CHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA3PR11MB9274.namprd11.prod.outlook.com (2603:10b6:208:578::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 15:35:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 15:35:37 +0000
Date: Tue, 29 Apr 2025 08:35:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Add a new mmio triggered test
Message-ID: <aBDxvufSG8NZmxb3@unerlige-desk.amr.corp.intel.com>
References: <20250428083248.527879-1-sai.teja.pottumuttu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250428083248.527879-1-sai.teja.pottumuttu@intel.com>
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA3PR11MB9274:EE_
X-MS-Office365-Filtering-Correlation-Id: 68014512-7a0c-4050-49d4-08dd87337d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE5MaHYvVDVuZUw3d04rMnBndUNDU2RNNTBUUDZ1Q1gyWkI2TUp1YjBBak9w?=
 =?utf-8?B?cFRTcGU0Z1ZkNHp6eUh6ZXV3NFl2Ym5IMHNqRkFROUwwOEpiWlRVZVArQXVh?=
 =?utf-8?B?NVFQUGVyeU5YdkVIMmlxYVhsK1FkMmZEMWFlYW1FbE1aa1l4bjM5RitGNnM0?=
 =?utf-8?B?Y09KUWhiMU9OTXVMbUtwb21Jb0Zra1NSeE1uSUl0UVYrZGg2Yjhvb1lSMWtW?=
 =?utf-8?B?aTVENnJGNGJ0MkhmdkJ5Z256OTVKalhmMlZ2WnBObi9aYWc4emd1Ym5mSzgw?=
 =?utf-8?B?OWtaai9YZTBUdDUxbVY5ZWVBL0hEbHBDZDFBaysyL3NmeHByQzRpMWVhT0tD?=
 =?utf-8?B?NDhzUlhzL1NmVjRPQVhCdytZZkg1Q1IxVFJ2SEh3MzJTbkUwUWlWOVBjand6?=
 =?utf-8?B?bUdxdGIwSEY4NmtsTHc4M2dpUm94MUZIVi9WaUhRWVBNbCt6ODBRNVR6QXlT?=
 =?utf-8?B?VmZoV1BYMFJlbHhJTVBJODl5bjhRWU84Q3p2Rm5mZ2pXMlZtbVQ5VVdsblFE?=
 =?utf-8?B?VTB6cEFVajZyR3o5Y2w4UTRBVmJOQi95NWJvSVluM29PTDlZb0tMcExFd2p6?=
 =?utf-8?B?L2tlVzNNbWhJS1B6T0hvcEYxZWNmQVdDOWVJN1BWWjFyMkhKY1h6ajNHWHlX?=
 =?utf-8?B?dEwvN2N0UE8rSjRuUFZYMFZTU3lsa0xHak5Bd0hqR3lEaHhLMWhxZHpZNHcx?=
 =?utf-8?B?bTNFS2JVenVHNXNObWx6akIvb0NZc29ET0xaQXpGUHQwemdmbzR0UUQvOUgy?=
 =?utf-8?B?S3dIU0dDUUJiR2VzUHh4bzZ0VFpxSzJQOVVNb3hNZm4vQzE3UEVTeEFGb29i?=
 =?utf-8?B?NnBzV0llK3RGRFU5S25MUWhZNjhDZVdLWUpOeENsTWNrVmRhUlRBY1pyRmV1?=
 =?utf-8?B?K1NBZEd1WmQ4RW5EOHFTTmdmWTBSL1lGNWlVRTFWOEdSSm8wUmhGdkUxUEFo?=
 =?utf-8?B?VDkxTmF3a05yQnN1aDU5YVJrUUN6VlJ0bElTRzBXZHhMSUZ1SWFUWEN0OFJC?=
 =?utf-8?B?bEY1eWV2WXhFVHBtbGs1d0Rjb1V0SitGcnBTaDExbmNKU283MEJDUFNqbHJo?=
 =?utf-8?B?c0duTmk0WWNjMDM0WEJkazRJbVJFUXR2S25zQVkxb3J6a1lZR2tHWWpPb1BQ?=
 =?utf-8?B?TkpLaC91cG1vNERCQ1lXYmh3QWpQRmViZGRLQmFMN0lTb09ibGJTWUxzNnlJ?=
 =?utf-8?B?NytpejBYbnVPS0VVUGhXNG5uREJVL2RlOFQ2YVFZY0FDcEVZQmNNUG1qM1Vn?=
 =?utf-8?B?MFRtSXc5Qmw0WnpCcXZIWGxleVRrd1FaZmkxRmwwbi95cE5ZRGlGMnc1aVRB?=
 =?utf-8?B?aERMdCtpaGZmNEFCbkl3Q3ZPK043OThqNXVqVFFCSVFZYStZRTY3SE9jOEQ0?=
 =?utf-8?B?R1lkM0MrVW5BMC94MnE3eElxVzB5aFdJb0w1Vk41aVRDbC9jWER5dytoWXlv?=
 =?utf-8?B?MWcraytXTlJDeU96ZmRYQlcvUlNHYXpPbFh1YkNJMGFBQkNMY1k5ZGtVZVBm?=
 =?utf-8?B?djlzczNxdzJvTTkyWm5Leks3L3dRV1poWWlqODV4ODBWY3JOYVVxUEIwN09V?=
 =?utf-8?B?WkFsV1EvMU9sVmVrTnBOb3R5eEc5eDdTYWRlempmLzArQy9jN2gyNjBHakVp?=
 =?utf-8?B?UW80Rk1BaDBVckdWZGwrSlg0Y0QrQWpYc1kzOVJjUHczbk4yTHdpV09rMnF1?=
 =?utf-8?B?c2ZBS0ZBVy83aEpQVVJNV0EwQkUvTEU2REZ1dldXeU1HQ3F0cmMxRTB2MW05?=
 =?utf-8?B?VWZMQmFaeXBsRS9xR09pellKS25lVjJQWUxNejMrYUY2ZDFMMlFpT3krZnVt?=
 =?utf-8?B?OCtKK0NSeW80dFBzcVZIZzVLTjNjbWwzcWZkbFFncVNuNzVSMmNrNUFSOHF3?=
 =?utf-8?B?a2lJQ0F2bUg2UXRrNDduMHhXck9iaUc5aTBXYm4xWDQySU0wTEVFWXF5SlRY?=
 =?utf-8?Q?zqlU7hH5mK0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjM1bnpJNm8zRVkySEtMTVpzbHNXRytEdEpHeS9JNWVKUC9VT0NsaUdKazN2?=
 =?utf-8?B?aUZrS2pHRGpmY0Q5bG1ROTJMQ3d3YVl0VXBBdDI5eVFIa0RnbU1neEh5SHBo?=
 =?utf-8?B?MHlrYzJHY21YTnR1MktoNGZFcFMvZ0thTlVFODVRRCtKNTNYcjJWSmZXVVZi?=
 =?utf-8?B?Q0NUNFVhR1JSMGQ4dzQ3d202UFQ1ME1CVXBsR283aDVPVUk4UnNrWURGcGNN?=
 =?utf-8?B?b3JURTNBOXg0WHczV1dISU9JV1dVd3FFck56cytndXJOOEdpQ2xwdUdtcTBa?=
 =?utf-8?B?RHBkRWVVZ0g1bjVoeUhkYkpHdWw5Wm82bnZhaEY2eGJ2QkJsUldCOG1UNTJa?=
 =?utf-8?B?VzVTSHl6U2J2dEVpa3YrZ3FzSUo0TTBtNVFOcXJ0YU5XSVpMbG9pZzNOYXM3?=
 =?utf-8?B?cFRQSXpIOWhpZ2FNVjIvdFdWejRMaGppYy90dmdFYndtT0t0WmppdS9adG44?=
 =?utf-8?B?dkRONzhUQjIwYWhsZXpKb1Frczg4SnM3Y3NNVVBMRFQrRVZGVjdRNkdQZ2Rz?=
 =?utf-8?B?Z1JmSThwVlIvb1R2cFFQTm1kWmt4SVgzTllmUlJyMEhLMGtEZkF6bXpuY1hM?=
 =?utf-8?B?ZU1xRzBVQWVEd2Z5bjVHcERVUm53NnBGZi9wQkxOUEprV21QemtqamZPbW1s?=
 =?utf-8?B?Yi92OGR5MjZNSHpzaWtwN1hXcWlSK3RpdVJ2b3oweWxsS3IrMWZmcTlHUWJu?=
 =?utf-8?B?bXVsNTFjRUlUWFIwVjJoZWM0ZkZ5SjdhemZqUWVpOGMvNDl5VlV0Qng0SkpK?=
 =?utf-8?B?NlVjd093UVBHa1BjQ3Vjbm45RHgyTFJkRGMyUEhWa1JlM3IvWDJmOUFKVVUw?=
 =?utf-8?B?cTRKSENJdVMvaENPZVVyeERhdCtFZnRyaHovL1hMQmFPV2ZTWHhYLzdVYzdw?=
 =?utf-8?B?cXdmWVh4bHBFemUzaWNKdndFdTRheng4a08zM3ZlUDZxbytFQkowQ0VsYlRR?=
 =?utf-8?B?Mk1MbkVIeGQwd3M4UGVVSzBqNTcvQ0duenN5WUxsNTFVMkUyODE5c3Zxa1Ax?=
 =?utf-8?B?cFlUSUV4dG82K2kwTUkvZmlKZm5nN3kyeXFvbW5BVmxEK3ZCRmNsZmU5QTRZ?=
 =?utf-8?B?OVdqdEQ2eStnb3EwWkNPbDhPQUtKV1RJL2IzT0YyRFgrbWtrOVAwSWsrZGZh?=
 =?utf-8?B?NDUvbEJsdzFibWZ0ZkVpRXVCRE9jU3JCZ0RHazFjK0wzSUZyMFUxYlBYNE51?=
 =?utf-8?B?V21lMEc4MGhLdHpZZXloTEsrUFNPK2FXYlQxYjVpK0VSUlR6eWhnNXc1bktF?=
 =?utf-8?B?eU9wa3J4Qm5MVEpnK3BjUDVzRmJRbXl0ZGRySmdvajNyekRvbTlQRG9CRU1y?=
 =?utf-8?B?NExlS2lhNjkyQ25qSWpTTlJHZjQ0VzNOUmNGd2taSWVzU1JWTHF4RGtsUitt?=
 =?utf-8?B?dmgwbTFpcUJmQXNwVkZqVHk4ZXZ2dFRkRDNsbEZ5emJrZ2lyNTdEYXFMUFNO?=
 =?utf-8?B?VG02LzQ3U3Jxbk52WUdNdWg0cUY4eThQTTBTdnh3UGxxQ1pOSWY0bEJFWlNz?=
 =?utf-8?B?OEswY0praXRYT0hxVmRwSWNqYnFJMFYvSGRjR213UG1aZ2ZxbFlaMk5GUHgy?=
 =?utf-8?B?M0t6R1JCell2bFFIdEVCa3MveFdsUkxCSk5SR015VnloaEtZRENKdHZTWkNI?=
 =?utf-8?B?Uml4UTRpN1BJZ0pTSnVjMVFmMFZWRytHNWpITVl0Vm5QTS9CY1ozVTYremRQ?=
 =?utf-8?B?cTM5TWd1NUlWSTU3ckdBdDZiWWRnN2FUWUdES0lybjk1cjhsRG9TaFc2ejJs?=
 =?utf-8?B?RHBhTmpTSlZQWlBjVlpHMUR2aXJjNjRoZURvL1VtQ0JEK2NmQjZQaU1TL0xI?=
 =?utf-8?B?MUNiRldPQVkyTjZtdW5SUXVPZmI3bWU0QWJkdzREdUh0azZRNDZuMDF4cGFM?=
 =?utf-8?B?WlFSK2YyV2k5d1pwemxMQklURDNoNGRJSm00Y3lKbnFYTFRrWkdUUEZ2K2Uv?=
 =?utf-8?B?OTAyTk54YTJWRTN2ZnlaZzAzaHpBOTh6eWlCclQvQ3JRQVBGV2NxNXZBMDFS?=
 =?utf-8?B?V0l4STlYMC9EUU1ZSmxEN25uTlNuUExJRGlHVXIzWVRVcWcrNEFnV2dOUVp4?=
 =?utf-8?B?RkRxVExyT0J4M25YZnJWK1VHRmtJMkJvTDBTUG04bzY4OVZtUzZQblcyRnZr?=
 =?utf-8?B?L2NTdE05Nlk2V2QycVdhMmxJYk5pWUVlTk9wbFBRcHovRlBPeEtwY3h5Tktv?=
 =?utf-8?Q?0VNgOlyplz5LKrdC3XxNfBA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68014512-7a0c-4050-49d4-08dd87337d6e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:35:37.5502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKyWZP2wAoy3yX2v2lelxznXEP0xO2bXprLfJkRNTgaeJ94Kieu9XmIfEokIJyUKa+La9yZbEyXxLkmQyjUvKyZpTJ/LEwdr15KS0uRySC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9274
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

On Mon, Apr 28, 2025 at 02:02:48PM +0530, Sai Teja Pottumuttu wrote:
>The current mmio-triggered-reports tests mmio triggered reports via a
>mmaped buffer. Add another test which uses 'read' system call to check for
>mmio triggered reports.
>
>Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>---
> tests/intel/xe_oa.c | 106 ++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 103 insertions(+), 3 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 766f81a5e..c854544af 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3959,12 +3959,103 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> 	__perf_close(stream_fd);
> }
>
>+static void
>+__test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = default_test_set;
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = sizeof(properties) / 16,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>+	struct intel_buf src, dst;
>+	uint32_t mmio_triggered_reports = 0;
>+	struct buf_ops *bops;
>+	struct intel_bb *ibb;
>+	uint32_t context, vm;
>+	uint8_t *buf = calloc(1, default_oa_buffer_size);
>+	int len, total_len = 0;
>+
>+	bops = buf_ops_create(drm_fd);
>+
>+	scratch_buf_init(bops, &src, rc_width, rc_height, 0xff0000ff);
>+	scratch_buf_init(bops, &dst, rc_width, rc_height, 0x00ff00ff);
>+
>+	vm = xe_vm_create(drm_fd, 0, 0);
>+	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
>+	igt_assert(context);
>+	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+	set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	emit_mmio_triggered_report(ibb, 0xc0ffee11);
>+
>+	if (render_copy)
>+		render_copy(ibb,
>+			    &src, 0, 0, rc_width, rc_height,
>+			    &dst, 0, 0);
>+
>+	emit_mmio_triggered_report(ibb, 0xc0ffee22);
>+
>+	intel_bb_flush_render(ibb);
>+	intel_bb_sync(ibb);
>+
>+	while (total_len < default_oa_buffer_size && mmio_triggered_reports < 2 &&
>+		((len = read(stream_fd, &buf[total_len], format_size)) > 0 ||
>+		(len == -1 && (errno == EINTR || errno == EIO)))) {
>+		uint32_t *report = (void *)&buf[total_len];

if (len == -1 && (errno == EINTR || errno == EIO)) shouldn't we just 
continue reading.

once you enter the loop, make sure len == format_size.

Thanks,
Umesh

>+
>+		if (!report_reason(report))
>+			mmio_triggered_reports++;
>+
>+		if (get_oa_format(test_set->perf_oa_format).report_hdr_64bit) {
>+			u64 *report64 = (u64 *)report;
>+
>+			igt_debug("hdr: %016"PRIx64" %016"PRIx64" %016"PRIx64" %016"PRIx64"\n",
>+				  report64[0], report64[1], report64[2], report64[3]);
>+			if (!report_reason(report))
>+				igt_assert(report64[2] == 0xc0ffee11 || report64[2] == 0xc0ffee22);
>+		} else {
>+			igt_debug("hdr: %08x %08x %08x %08x\n",
>+				  report[0], report[1], report[2], report[3]);
>+			if (!report_reason(report))
>+				igt_assert(report[2] == 0xc0ffee11 || report[2] == 0xc0ffee22);
>+		}
>+
>+		if (len > 0)
>+			total_len += len;
>+	}
>+
>+	igt_assert_eq(mmio_triggered_reports, 2);
>+
>+	intel_buf_close(bops, &src);
>+	intel_buf_close(bops, &dst);
>+	intel_bb_destroy(ibb);
>+	xe_exec_queue_destroy(drm_fd, context);
>+	xe_vm_destroy(drm_fd, vm);
>+	buf_ops_destroy(bops);
>+	free(buf);
>+	__perf_close(stream_fd);
>+}
>+
> /**
>  * SUBTEST: mmio-triggered-reports
>  * Description: Test MMIO trigger functionality
>+ *
>+ * SUBTEST: mmio-triggered-reports-read
>+ * Description: Test MMIO trigger functionality with read system call
>  */
> static void
>-test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
>+test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
>+			    bool with_read)
> {
> 	struct igt_helper_process child = {};
> 	int ret;
>@@ -3973,7 +4064,10 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> 	igt_fork_helper(&child) {
> 		igt_drop_root();
>
>-		__test_mmio_triggered_reports(hwe);
>+		if (with_read)
>+			__test_mmio_triggered_reports_read(hwe);
>+		else
>+			__test_mmio_triggered_reports(hwe);
> 	}
> 	ret = igt_wait_helper(&child);
> 	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>@@ -4894,7 +4988,13 @@ igt_main
> 		igt_subtest_with_dynamic("mmio-triggered-reports") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
> 			__for_one_hwe_in_oag(hwe)
>-				test_mmio_triggered_reports(hwe);
>+				test_mmio_triggered_reports(hwe, false);
>+		}
>+
>+		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
>+			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>+			__for_one_hwe_in_oag(hwe)
>+				test_mmio_triggered_reports(hwe, true);
> 		}
> 	}
>
>-- 
>2.34.1
>
