Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F66E9D3EB
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ADE10E17C;
	Wed,  4 Feb 2026 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu9wVCBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F91E10E17C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770215956; x=1801751956;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=6lkQLGIsWmcO6lO3ihPxfcDqaTExba+DV4vy6CHaAN8=;
 b=Qu9wVCBBfKqEZvh79iU1f88qyP8xkP4PdApnbQ8NK77v7JQORlafVyjR
 bD7N/ACvZyyp4ujpupZT5QbUqhJIUs1f/7XFrlvHm/FNW3nnEWYM/MzHp
 xYzn6Ly+kS15vot5Flxe9TId+1Bwp4nBFL5DjiOxta63/4GEHgR0wEGr7
 ogcwm510301pmiLA9NPcuXZtQtwQ3S9RYjR2Ehs6uKc5b6mGE4Jd6w0sq
 0loGGyWIJf8hldsybgPhxUytCZ0Fj9psSKRpD2zySc6+1JLbbYlstitzt
 Cw9dPLn3puQRsTj7sqO/sDbE1FR90aBcFkRxe3+1SNMFNe2qM3XgswVDT Q==;
X-CSE-ConnectionGUID: c3HX6NqaRaqcU54i6C2l6A==
X-CSE-MsgGUID: TNOQuPisQvicANEktg+xSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74007291"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208,217";a="74007291"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:39:16 -0800
X-CSE-ConnectionGUID: WiI8ao6pS0a8uYLN8TrgDg==
X-CSE-MsgGUID: zW8+2XdOTSKay2iA/Iu3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
 d="scan'208,217";a="210288282"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:39:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:39:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:39:14 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:39:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE6fupEQ7lJgKseGRsX0xtV4igRYdzIuR0pP5+BmDPGvAHaCp57B8S5GLMQ+jJSxXhBIHJLsg/BeJCmURE3Rnp7BaR4lqcvLy6Y12IUXZ4z8OVUyc+214IbNagH6ELtmh2v4uIWgBCtXLslLoOr6rlXgxm4O1cRY7yFet5l1fd7xZh/PGmvBEvybaNW0gDNjhq8xcTjhVKG+nV1PcVs5ojoQsxm8mOJyuZHrGSOrTGz6wm3j0+cgP7kx+XgjwGcigRGH+5uvm5Yq5NkN83ao9JAWJ9XqwX3VsnyHcL0lmitO9vemJglFvR+nlP4Pea8AMs+WS6c/3d660QM+L/3XOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RedXvkV/MTkoz5rzLLSqoGl/0rfiLMhKH+YopJHiaEE=;
 b=OatPbA78Q8HKeFN9WQa2ujRe/9VZcQF2+9BfUw0pMRGKEmfSewoRbisyo+R6wZ/sa+jwC1zBEwX3NwZ66ldcd4kRTKh/0vQOM1Z6F5D5auxuAnaNLGioA/ohXf4U6oSV8Zqdd8HiRNJTifNe40MIyEE23u12qtm2b5lF8HdWqoO1oqLjZZVaTjmw+jhIUNuF2EattvT3xlLuvxhXfUYP1XG7cucMvuSHqZFFpinhfc2PclwFGXinqa7BZfpZxaqQboKrCXUoX/toSLKIc9czfop1Yg06+I9sOtDa1tSFQ9LMz5QQv5P98JncnLkI3aurqDEPWgfHV9zdfDXBkp1FMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 14:39:11 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:39:10 +0000
Content-Type: multipart/alternative;
 boundary="------------ADPjyy0bPUst0M56V0MoU5ve"
Message-ID: <db428992-d9f5-4afb-82e2-b69ffe2fc126@intel.com>
Date: Wed, 4 Feb 2026 20:09:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] test/intel/xe_pmt: Add testing for BMG crashlog
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 <igt-dev@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20250904172625.1024127-2-michael.j.ruhl@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20250904172625.1024127-2-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MA5P287CA0178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::14) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dcc99ab-52e4-4509-15a0-08de63fb28b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDlDRndCTEFNMXduVitVVnFLc1J3YkhHMzJBZ1AwdmRqc2dwVjBPYW8weTVF?=
 =?utf-8?B?RWpOR1c1Smt4SDN4VzJQTEtRbUx2cE5LRytkU3pmTlRSVW5tT2w4SkhWcnFX?=
 =?utf-8?B?dkR4QVVLdllUeW1aUnBBTzAvaFA2UkN6VGZWR2RaYVVNR1RxQXEzbDBhSjU4?=
 =?utf-8?B?WTM3cytEdmJaU0RYcWxSMmUyRlVnTk5OT1ZMeHpNQ2ZqK1NxbVpLR1VMMjBI?=
 =?utf-8?B?TDROYWlKaGcyVGFUZEtLOGptc3N6cVdmRnY5eVhudUhsVTI1UXNLamdvdlpi?=
 =?utf-8?B?REhxQnpWRE9RTUtzcDNkYk1IYmpuNWFOVWg1dEZ1SjgvZi9QMmVSUDkyMTZD?=
 =?utf-8?B?Q2NRL0haTkVpOWtxMC9tczVaK0trbFlGTnd2dmxOQ01oQjA1NXFXZWZFT3Vh?=
 =?utf-8?B?SVJLOWt2bDFQNGo3OWJmSkFVZlFmL29LYWhQRmxpUnFNWENrSDhtN1Nrb1dz?=
 =?utf-8?B?VVVSdWRGbUE1WUQ3QVp2OFBSalVidEl5cVovaWxBM05ITUJuODNsRVJneXhh?=
 =?utf-8?B?OUlZdFV2SngzZURaemJkN2loL1JwTVpuN2d1MHFqNWx5U0MxdVF1NnpVVktT?=
 =?utf-8?B?Sy9UNEdRTUVBUnUvREtRcjQ0VmpCc3cvSWgvSDdyaFVObE1YZVVrRW5mNnN4?=
 =?utf-8?B?c2xtWTJ6bGxBUjBxQTlQSS9Ubm0zYWpROFV4dW5iZ3NZUzJFViszdVhxQVBY?=
 =?utf-8?B?dllIbUl5Nzl6dlh4aW53R1crNkZPTG9FS1Vya2tkVXltcVBON1NBS0F2c1ZL?=
 =?utf-8?B?bEhpN0RKa1AvcDRzTVFXUEI0U2pMNmtmUUJTWndaQlVaRFJ4enRaTUxzclYr?=
 =?utf-8?B?dndBL1pQM3hhc0QwcVlVSldmc1lXa0h4a0hjMjk1OHVZQlpDSUxwd2Y3ckFo?=
 =?utf-8?B?cVBBOVhmMU1BQlZ2d0VNRVFHSDZ0ZUVpd1VXdkxDTVZtTVo4K0MyUVpSZ0NW?=
 =?utf-8?B?ODc2MEcxZzN2bjJKUHRpeFA1dmJSdDVxVXdoTE1LVzJubXAzZU42bXcwVGdE?=
 =?utf-8?B?aHdhN2pLSEpNYW9sOXhQeHZjMDNQWUs2aFZRNlZBRmNHWmk5K1BVaU1xSW1Z?=
 =?utf-8?B?a0htQzd2YzRJK3dsWmpDdzdqR3JsUEQwM0JZUWxLVE1PYytyVFpuaGkvazZZ?=
 =?utf-8?B?VXo5dE5HTVpaaWZJRENBaFpZaUR3Y1k5OU5iZUxVMG5INUU3Ny8yMzh0ak9H?=
 =?utf-8?B?TzNhTnVaNnd1Q1ptQ1p2RkFQeUNQTkJLaXVMSHFYOTAxQW84Z3VHKzVZbWhG?=
 =?utf-8?B?QjEvZjM0dnNEUytWVTZOQnJ5RzdKMG5PU25IOGdyaWhHdC9oSzJseXhKSUxL?=
 =?utf-8?B?YisrNFR6Z3B6M0xtSkd6Z05EZmZoTEZmQWVKOUVEYkl5cVVOOGRkYU5rTFcv?=
 =?utf-8?B?Q2c2V2xxbEN4YTJaQ2dFVUdoRm5sQU9ldE5IclFZb1ZXamFXUWxIMEkwUWpa?=
 =?utf-8?B?VktLeWR3NUFCT2tjNWloYW0wMWRIU0w3TGZNbU1NTmF0US9ZVms1MGxQU3RO?=
 =?utf-8?B?ODhvSEJOUm5TNlBuOVRJNFJLb0tWWEZlY25oazBlRjdadDRGM1EzVGliakNm?=
 =?utf-8?B?RXVzK3d2ZU1ZbXFTRmRtZkRRWExseU51Z1ZYbkYrOTdmbjhsc0RvWFBCemtq?=
 =?utf-8?B?Y0Z1VkdId3FQK0p6S2RnemJ1RFZpNDZXR3RValNDSmtqZC95TnVWK3lWYy9z?=
 =?utf-8?B?YllmMC9aU3lYUklUQ3dHRHdCdFRmNW9EZk1yOWkwY2xOMnZsODl0WXE3c2tm?=
 =?utf-8?B?VUNkakg1Y1lyakExbjFaNW0rb2JXMUVqSFArVVA4RzVlYm1mdTFKOXZPKzVS?=
 =?utf-8?B?bkpyTlFLYnY2RDdZT1Z1NnZpTWU4cER3TGREay9GeHJaejJGUVVkNUVxYTRj?=
 =?utf-8?B?MytMdE1GU1ZBSWpHQzBHS3g0UGpsdFdqeGp3MHg5Q2loWFM0UlpMaFpITWFv?=
 =?utf-8?B?Y1NaV0VKS0JMSVMyS0dqZ1Yrak5IeFFETThwd3hVTHkyTzFyTUJjek9BR0FD?=
 =?utf-8?B?M2FOK3UyVjJEbSs0SHFaVGtlbE5yekhDMnpEVkVFZXBYTmM0Qm1sdUtnN2Vs?=
 =?utf-8?B?cmc1SlNsTnE5TXd1RXpCdFB0d0UyclJEOXFnOWd2dHQxdUlWc3lmbnlHVjhq?=
 =?utf-8?Q?qEOE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3NWNkpQNi9DRXpwVm1tMEk5TklWWUxyZGtNSXBZK3h5V1pUbVlYUUtEVW4r?=
 =?utf-8?B?MVZmUmdYYlorOHBEeHlSRU1RT0FLemw1QVg2d1cvcUdXN0ZBYTZBc1BzL1V2?=
 =?utf-8?B?TnVXVk1FVUlZQWR5RWNxc3pmUHpyUG9kUVVxOFF1eU03Z09xL3Z5V3lhRTlI?=
 =?utf-8?B?emM0RWNkRHhXMDVNdFFyRUdVcjZvNEVhNkIvMDZMcWZHbWR5R3pwYzBKTVpN?=
 =?utf-8?B?di84bDNsL1A2TFBJdWdUMk8zVnFaLy8rdVdXUkdLRXkrL3JLanpLemUyUkFz?=
 =?utf-8?B?azd5WGlBc0VpUTkwblVUOXRmSEFsTmlwdWNkVFFzbXZ1ejBnVVd1V1V5ZXZD?=
 =?utf-8?B?MDBkbWRpOXZlR3VmdlBNYXVKeHZPZENLOU1kREpLZEdpb1VXL29admhJaFJl?=
 =?utf-8?B?MTZuTjNYN3RGOFdxWThPTHVoK05iNm10Q2dwcUthdW9DTUVQRVJybExxQlBu?=
 =?utf-8?B?SzhUNjVTMzdEYjdYVlJGVW4xZjZrVVYwM3hRcHFsS3BsK1FrS3B2VFN5N3F2?=
 =?utf-8?B?R3pLVjRtS3V6bldsekZXRVBNblV1MUw5MittWjU0SkxQNFN4VVZjMklEQ3Ro?=
 =?utf-8?B?VUNwKy9OODBsWWoweVo4RXhxZ2s5Y1VBNUlwM0NiVXBkSXZKSFM0N0poMHBt?=
 =?utf-8?B?L3h0dGxIdjI5SGJTb2tJVCtBaU9idzJ6SndweVp0ckZTa2xpUTkrZU93R2p6?=
 =?utf-8?B?dEU0Y2Q0b1F5andENXVDZ1h5ZXpvYTRORzBacHk4NW1PRGQrTk9jeE94Q084?=
 =?utf-8?B?YzlaVkJhbWlKSUlGZkRhM2lEbmNmODZIbS9oY21lbHN0QmJ5eWhzaFUrQXRW?=
 =?utf-8?B?a3pUMGN2WDg5alg2bjZ6QlUxTS82V2VySVRsZExaeHNDMG82UmNjTFl0eWtO?=
 =?utf-8?B?RXM5Q0dXMmdEdjYxc2gvVURzQkNCU0NrY3F3cE9hOGZzc0N4MitnNW5MVG9E?=
 =?utf-8?B?WGIzOEdTSHZPTEZIajdjd2JQcEdaZ0tDYjJ1YUNTZnE0SWdnU2w3WkZldzJr?=
 =?utf-8?B?UzlhUGpvYlVWRmRrNU4zVjlON3FXUHlmZmpUZXhQQU8rQkNyZHpqZ3UzQ09X?=
 =?utf-8?B?bmh3dTIrRG1Gbk1xaUdwRUZqM2J3U1N6NVplYkEwUlNVVnY4M0Z5bUh3UXdT?=
 =?utf-8?B?ZnRtVmFBM3Exdjk0cjJQdVJpZmJOQ1dHM0d5LzQ1bHNrRmw0S00xbFN5Y0N2?=
 =?utf-8?B?bFQzb0FsQ2VySXN4andPZFVzaXdJOTVrYTBJbkZqbkhSWHFtbFlDeGE5MHJj?=
 =?utf-8?B?dlBRUkZRRlRzRG40ay9YYWUvc0JXczhFRWttdG1Ib3lkcWNyWnkzM1NpaW40?=
 =?utf-8?B?R3VzU055MERUN3RXOWdFRm12K1FubzhoOGdOVnFyaElWS1ExQ3dhRytBaHJS?=
 =?utf-8?B?YXlMczlYTzk5N0RFZWtkaXJLbmNCR0txZnRIV2pGcjlacW5KUy9jWWIvNi8z?=
 =?utf-8?B?cHBzai8xekN3MXdNdVhKS3hVMWJTWklMbDdFVjJZYmtnRjRiRDlIYUpCUmV2?=
 =?utf-8?B?U2xVeEVyT1d2djhrNitVUjUwanFiYnJ2NWx5KzRrRi9XWm9lamhES1pTU0gy?=
 =?utf-8?B?ZFNxdXRqS0Z0b3pJSWJlcGVyWFN2RW9IZ1h6VlArMmlZalo4V1h4dlRPWnZv?=
 =?utf-8?B?S1lyY2FVeVlOcWt6NlM3cWxGYTBMek1DZmJzMDMrZjVsbVhVaXRsdlljS2NB?=
 =?utf-8?B?QTlNMjNRVDZLYk1RWDlFZ2MvTzRTTkFkSm0rODdwTmkrWG5wQ0dnZkU0bTdH?=
 =?utf-8?B?SExwNEJIdTVkdmRSNGRYaStSNytFK0ZVL2VqUzBrVDBVYSsyNWFYZE9DbWN4?=
 =?utf-8?B?cVg1WlNiTDE2RFJHSlVuUkFqd2ltSFNhZXdMMjZPVHo4VDFMeTh3Z2xMZEIw?=
 =?utf-8?B?QWZqOW1mb2lXcTkwY1FFTkw1alFHUmNES3FsTFEzME9zbDlEYk0vSEs0ZTk3?=
 =?utf-8?B?dS9nWk8yQXJVV081UHZ0NjJuVnRkeldMM1hQYXZVbEFFM2F5RW1NbytyS2Vn?=
 =?utf-8?B?blE1Z1MvcGhoQ0gwWGhLSCtpd1M2Q2lHenhyVjA0ZzgxOTVkcTFVMmZtelZj?=
 =?utf-8?B?UTljdUE3RktFbXJhSWFPSHIwcmlGNDdlNXhiV2ptbjYwRE5aM3ovTmh3V2do?=
 =?utf-8?B?RTZqYXFLczhESjNnUkViaTRBRTMxQUwzSlJQdGkyaGIxRzBSNWZ5ZkR4aFFB?=
 =?utf-8?B?aXlrc2hOWG1yTnRzRlE4Sk42dW52djNwNUx1L0o2amJSTThES0dIU1RidDNu?=
 =?utf-8?B?d2VBQ0JTSDRGRHdGZ0t4b3BnbnVXWnJBdGpaSUNhS0VXNytVbTNBNmlBeVpI?=
 =?utf-8?B?OWNwMlhyRkFvYVc0S0ZXUXJIVitOY0d1M24yWnc0bmlySmRIYjdWdThZbkN1?=
 =?utf-8?Q?XJoEBIadwt0puzgg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcc99ab-52e4-4509-15a0-08de63fb28b0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:39:10.8487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RirtXfV8HT46HuG3vCP1yMpFVchV7LAP6DJETNAAMXu4PLPoFS265yyAu2MprhMAnzu+U9WVoLNHTZyOaCo9+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
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

--------------ADPjyy0bPUst0M56V0MoU5ve
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michael,

On 04-09-2025 22:56, Michael J. Ruhl wrote:
> Battlemage (BMG) devices have the Platform Monitoring Technology
> (PMT) crashlog feature. If the device present is a BMG, test the
> PMT API.
>
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.
>
> Signed-off-by: Michael J. Ruhl<michael.j.ruhl@intel.com>
Please address the checkpatch issues
> ---
>
> v4: address review comments
>
>   tests/intel/xe_pmt.c | 506 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 507 insertions(+)
>   create mode 100644 tests/intel/xe_pmt.c
>
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..fe303b9bb
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,506 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Description: Verify that the available PMT files (crashlog and telemetry)
> + *   are created, are accessable, and respond as per design.
> + */
> +
> +#include <unistd.h>
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "linux_scaffold.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* base directory names */
> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> +#define CRASHLOG_DIR "crashlog"
> +#define TELEMETRY_DIR "telem"
> +
> +/* itemize the available instances for the specific device */
> +enum bmg_crashlog_instances {
> +	bmg_crashlog_punit = 0,
> +	bmg_crashlog_oobmsm,
> +	bmg_crashlog_max
> +};
> +
> +enum bmg_telemety_instances {
> +	bmg_telemetry_punit = 0,
> +	bmg_telemetry_oobmsm,
> +	bmg_telemetry_max
> +};
> +
> +static char dev_path[PATH_MAX];
> +static char work_path[PATH_MAX * 2];
> +
> +/*
> + * In most case there should be a single instance of the crashlog and telemetry
> + * directories. If DVSEC entries are not contiguos the structure will be different,
> + * and the code will need to reflect the structure.
> + */
> +static char crashlog_vsec_dir[32];
> +static char telemetry_vsec_dir[32];
> +
> +/* This needs to be specific for each supported device */
> +static char crashlog_dir[bmg_crashlog_max][32];
> +static char telemetry_dir[bmg_telemetry_max][32];
> +
> +/* telemetry file names */
> +static const char *telem = "telem";
> +
> +/* crashlog filenames and descriptors */
> +static const char *clear = "clear";
> +static const char *consumed = "consumed";
> +static const char *crashlog = "crashlog";
> +static const char *enable = "enable";
> +static const char *error = "error";
> +static const char *dev_guid = "guid";
> +static const char *rearm = "rearm";
> +static const char *trigger = "trigger";
> +
> +struct crashlog_v2_info {
> +	int clear_fd;
> +	int consumed_fd;
> +	int crashlog_fd;
> +	int enable_fd;
> +	int error_fd;
> +	int guid_fd;
> +	int rearm_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +} bmg_info[bmg_crashlog_max];
> +
> +#define DEV_PATH_LEN 80
> +
> +/*
> + * device_sysfs_path:
> + * @fd: opened device file descriptor
> + * @path: buffer to store sysfs path to device directory
> + *
> + * Returns:
> + * On successfull path resolution sysfs path to device directory,
> + * NULL otherwise
> + */
> +static char *device_sysfs_path(int fd, char *path)
> +{
> +        char sysfs[DEV_PATH_LEN];
> +
> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> +                return NULL;
> +
> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> +                return NULL;
> +
> +        strcat(sysfs, "/device");
> +
> +        return realpath(sysfs, path);
> +}
> +
> +/*
> + * Verify the PMT directory structure
> + *
> + * BMG PMT directory structure:
> + *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> + *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> + *
> + * Note: different platforms could have a different pattern
> + */
> +static void test_pmt_directories(int dev_fd)
> +{
> +	struct dirent *ent;
> +	int index;
> +	DIR *dir;
> +
> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
> +
> +	/* verify top level PMT directories */
> +	dir = opendir(dev_path);
> +	igt_assert_f(dir, "no directories found\n");
> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
> +			strcpy(crashlog_vsec_dir, ent->d_name);
> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
> +			strcpy(telemetry_vsec_dir, ent->d_name);
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
> +
> +	/* verify crashlog directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	index = 0;
> +	/* find the crashlog<x> directory instances */
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> +			if (index < bmg_crashlog_max)
> +				strcpy(crashlog_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
> +
> +	/* verify telemetry directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
> +
> +	index = 0;
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> +			if (index < bmg_telemetry_max)
> +				strcpy(telemetry_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
> +
> +}
> +
> +static void find_pmt_file(const char *path, const char *file)
> +{
> +	struct dirent *ent;
> +	bool found;
> +	DIR *dir;
> +
> +	dir = opendir(path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	found = false;
> +	while ((ent = readdir(dir)) != NULL)
> +		if (strcmp(file, ent->d_name) == 0)
> +			found = true;
> +	closedir(dir);
> +
> +	igt_assert_f(found, "missing %s from %s\n", file, path);
> +}
> +
> +static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
> +{
> +	char file_path[PATH_MAX * 2 + 1];
> +
> +	sprintf(file_path, "%s/%s", path, file);
> +
> +	*fd = open(file_path, flags);
> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
> +}
> +
> +/*
> + * verify that the expected telemetry file(s) are in place
> + */
> +static void test_pmt_telemetry_files(int dev_fd)
> +{
> +	int i;
> +
> +	for (i = 0; i < bmg_telemetry_max; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		find_pmt_file(work_path, telem);
> +	}
> +}
> +
> +/*
> + * verify that the expected crashlog files are in place
> + */
> +static void test_pmt_crashlog_files(int dev_fd)
> +{
> +	char buf[64] = {};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
> +			crashlog_dir[i]);
> +
> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +
> +		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		bmg_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +	}
> +}
> +
> +#define ENABLE_MSG "1\n"
> +#define DISABLE_MSG "0\n"
> +
> +static bool send_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	int ret;
> +
> +	errno = 0;
> +	ret = pwrite(fd, msg, len, 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
> +			 errno);
> +
> +	return ret == len;
> +}
> +
> +static bool verify_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	char buf[32] = {};
> +	int ret;
> +
> +	errno = 0;
> +	ret = pread(fd, buf, sizeof(buf), 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
> +
> +	return ret == len && strcmp(buf, msg) == 0;
> +}
> +
> +/*
> + * Set enable enable/disable bit and verify usage
> + */
> +static void test_pmt_crashlog_enable(int dev_fd)
> +{
> +	u_int32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].enable_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* force enable so we are in a known state */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
> +
> +		/* disable */
> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
> +
> +		/* re-enable so we can do more testing */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
> +	}
> +
> +}
> +
> +/*
> + * Test the clear crashlog bit. After setting the crashlog data buffer should be
> + * set to 0xdeadbeef.
> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
> + * file is the "standard" usage, so test that usage.
> + * This bit cannot be cleared by software (i.e. reboot required).
> + */
> +static void test_pmt_crashlog_clear(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		clear_fd = bmg_info[i].clear_fd;
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> +
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (int *)buf;
> +		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +/*
> + * After a crashlog has been "consumed" (read), setting this bit can be done.
> + * Verify that it is set correctly.
> + */
> +static void test_pmt_crashlog_consumed(int dev_fd)
> +{
> +	uint32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].consumed_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> +	}
> +}
> +
> +/*
> + * The error bit is set when a crashlog fails in HW.  It is read only so only
> + * need to verify that it is "0".
> + */
> +static void test_pmt_crashlog_error(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/*
> + * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + */
> +static void test_pmt_crashlog_rearm(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +/*
> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + */
> +static void test_pmt_crashlog_trigger(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
> +		sleep(1);
> +
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +/**
> + * SUBTEST: pmt-bmg-all
> + * Description:
> + *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
> + *   individually unless you understand the underlying HW behavior.  Because of this behavior,
> + *   all of the test will be done in order in one step.
> + *   NOTE:
> + *     o Testing MUST be done after a cold reset
> + *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
> + *
> + *  Test category: functionality test
> + */
> +static void test_pmt_bmg(int fd)
> +{
> +	test_pmt_directories(fd);
> +	test_pmt_telemetry_files(fd);
> +	test_pmt_crashlog_files(fd);
> +	test_pmt_crashlog_error(fd);
> +	test_pmt_crashlog_enable(fd);
> +	test_pmt_crashlog_rearm(fd);
> +	test_pmt_crashlog_trigger(fd);
> +	test_pmt_crashlog_consumed(fd);
> +	test_pmt_crashlog_clear(fd);
> +}
> +
> +igt_main
use "int igt_main()"
> +{
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] = {
> +		{ "pmt-bmg-all", test_pmt_bmg },
> +		{ }
> +	}, *f;
> +	int dev_fd;
> +
> +	igt_fixture {
use "igt_fixture()"
> +		uint16_t dev_id;
> +
> +		dev_fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(dev_fd);
> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
> +	}
> +
> +	for (f = funcs; f->name; f++) {
> +		igt_subtest_f("%s", f->name)
> +			f->func(dev_fd);
> +	}
> +
> +	igt_fixture

Same as above.

Thanks,
Soham

> +		drm_close_driver(dev_fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..46d36962e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,7 @@ intel_xe_progs = [
>   	'xe_peer2peer',
>   	'xe_pm',
>   	'xe_pm_residency',
> +	'xe_pmt',
>   	'xe_pmu',
>   	'xe_prime_self_import',
>   	'xe_pxp',
--------------ADPjyy0bPUst0M56V0MoU5ve
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Michael,</p>
    <div class="moz-cite-prefix">On 04-09-2025 22:56, Michael J. Ruhl
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250904172625.1024127-2-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">Battlemage (BMG) devices have the Platform Monitoring Technology
(PMT) crashlog feature. If the device present is a BMG, test the
PMT API.

NOTE: the testing order is not flexible and must be done in
the currently specified order.

Signed-off-by: Michael J. Ruhl <a class="moz-txt-link-rfc2396E" href="mailto:michael.j.ruhl@intel.com">&lt;michael.j.ruhl@intel.com&gt;</a></pre>
    </blockquote>
    Please address the checkpatch issues
    <blockquote type="cite" cite="mid:20250904172625.1024127-2-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
---

v4: address review comments

 tests/intel/xe_pmt.c | 506 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 507 insertions(+)
 create mode 100644 tests/intel/xe_pmt.c

diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
new file mode 100644
index 000000000..fe303b9bb
--- /dev/null
+++ b/tests/intel/xe_pmt.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Verify Platform Monitoring Technology (PMT) files operations
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: sysfs
+ * Description: Verify that the available PMT files (crashlog and telemetry)
+ *   are created, are accessable, and respond as per design.
+ */
+
+#include &lt;unistd.h&gt;
+#include &lt;dirent.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;limits.h&gt;
+#include &lt;string.h&gt;
+
+#include &quot;igt.h&quot;
+#include &quot;igt_sysfs.h&quot;
+#include &quot;linux_scaffold.h&quot;
+#include &quot;xe_drm.h&quot;
+#include &quot;xe/xe_ioctl.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/* base directory names */
+#define VSEC_CRASHLOG_DIR &quot;intel_vsec.crashlog.&quot;
+#define VSEC_TELEMETRY_DIR &quot;intel_vsec.telemetry.&quot;
+#define CRASHLOG_DIR &quot;crashlog&quot;
+#define TELEMETRY_DIR &quot;telem&quot;
+
+/* itemize the available instances for the specific device */
+enum bmg_crashlog_instances {
+	bmg_crashlog_punit = 0,
+	bmg_crashlog_oobmsm,
+	bmg_crashlog_max
+};
+
+enum bmg_telemety_instances {
+	bmg_telemetry_punit = 0,
+	bmg_telemetry_oobmsm,
+	bmg_telemetry_max
+};
+
+static char dev_path[PATH_MAX];
+static char work_path[PATH_MAX * 2];
+
+/*
+ * In most case there should be a single instance of the crashlog and telemetry
+ * directories. If DVSEC entries are not contiguos the structure will be different,
+ * and the code will need to reflect the structure.
+ */
+static char crashlog_vsec_dir[32];
+static char telemetry_vsec_dir[32];
+
+/* This needs to be specific for each supported device */
+static char crashlog_dir[bmg_crashlog_max][32];
+static char telemetry_dir[bmg_telemetry_max][32];
+
+/* telemetry file names */
+static const char *telem = &quot;telem&quot;;
+
+/* crashlog filenames and descriptors */
+static const char *clear = &quot;clear&quot;;
+static const char *consumed = &quot;consumed&quot;;
+static const char *crashlog = &quot;crashlog&quot;;
+static const char *enable = &quot;enable&quot;;
+static const char *error = &quot;error&quot;;
+static const char *dev_guid = &quot;guid&quot;;
+static const char *rearm = &quot;rearm&quot;;
+static const char *trigger = &quot;trigger&quot;;
+
+struct crashlog_v2_info {
+	int clear_fd;
+	int consumed_fd;
+	int crashlog_fd;
+	int enable_fd;
+	int error_fd;
+	int guid_fd;
+	int rearm_fd;
+	int trigger_fd;
+	u_int32_t guid;
+} bmg_info[bmg_crashlog_max];
+
+#define DEV_PATH_LEN 80
+
+/*
+ * device_sysfs_path:
+ * @fd: opened device file descriptor
+ * @path: buffer to store sysfs path to device directory
+ *
+ * Returns:
+ * On successfull path resolution sysfs path to device directory,
+ * NULL otherwise
+ */
+static char *device_sysfs_path(int fd, char *path)
+{
+        char sysfs[DEV_PATH_LEN];
+
+        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
+                return NULL;
+
+        if (DEV_PATH_LEN &lt;= (strlen(sysfs) + strlen(&quot;/device&quot;)))
+                return NULL;
+
+        strcat(sysfs, &quot;/device&quot;);
+
+        return realpath(sysfs, path);
+}
+
+/*
+ * Verify the PMT directory structure
+ *
+ * BMG PMT directory structure:
+ *   device/intel_vsec.crashlog.x/intel_pmt/crashlog&lt;a,b&gt;
+ *   device/intel_vsec.telemetry.x/intel_pmt/telemetry&lt;c,d&gt;
+ *
+ * Note: different platforms could have a different pattern
+ */
+static void test_pmt_directories(int dev_fd)
+{
+	struct dirent *ent;
+	int index;
+	DIR *dir;
+
+        igt_assert(device_sysfs_path(dev_fd, dev_path));
+
+	/* verify top level PMT directories */
+	dir = opendir(dev_path);
+	igt_assert_f(dir, &quot;no directories found\n&quot;);
+
+	while ((ent = readdir(dir)) != NULL) {
+		if (strncmp(VSEC_CRASHLOG_DIR, ent-&gt;d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
+			strcpy(crashlog_vsec_dir, ent-&gt;d_name);
+		if (strncmp(VSEC_TELEMETRY_DIR, ent-&gt;d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
+			strcpy(telemetry_vsec_dir, ent-&gt;d_name);
+	}
+
+	closedir(dir);
+
+	igt_assert_f(strlen(crashlog_vsec_dir), &quot;missing crashlog directory\n&quot;);
+	igt_assert_f(strlen(telemetry_vsec_dir), &quot;missing telemetry directory\n&quot;);
+
+	/* verify crashlog directory structure */
+	sprintf(work_path, &quot;%s/%s/%s&quot;, dev_path, crashlog_vsec_dir, &quot;intel_pmt&quot;);
+
+	dir = opendir(work_path);
+	igt_assert_f(dir, &quot;no intel_pmt directories found\n&quot;);
+
+	index = 0;
+	/* find the crashlog&lt;x&gt; directory instances */
+	while ((ent = readdir(dir)) != NULL) {
+		if (strncmp(CRASHLOG_DIR, ent-&gt;d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
+			if (index &lt; bmg_crashlog_max)
+				strcpy(crashlog_dir[index], ent-&gt;d_name);
+			index++;
+		}
+	}
+
+	closedir(dir);
+
+	igt_assert_f(index == bmg_crashlog_max, &quot;too many crashlog entries %d\n&quot;, index);
+	for (int i = 0; i &lt; ARRAY_SIZE(crashlog_dir); i++)
+		igt_assert_f(strlen(crashlog_dir[i]), &quot;missing crashlog[%d] directory\n&quot;, i);
+
+	/* verify telemetry directory structure */
+	sprintf(work_path, &quot;%s/%s/%s&quot;, dev_path, telemetry_vsec_dir, &quot;intel_pmt&quot;);
+
+	dir = opendir(work_path);
+	igt_assert_f(dir, &quot;no telemetry intel_pmt directories found\n&quot;);
+
+	index = 0;
+	while ((ent = readdir(dir)) != NULL) {
+		if (strncmp(TELEMETRY_DIR, ent-&gt;d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
+			if (index &lt; bmg_telemetry_max)
+				strcpy(telemetry_dir[index], ent-&gt;d_name);
+			index++;
+		}
+	}
+
+	closedir(dir);
+
+	igt_assert_f(index == bmg_telemetry_max, &quot;too many telemetry entries %d\n&quot;, index);
+	for (int i = 0; i &lt; ARRAY_SIZE(telemetry_dir); i++)
+		igt_assert_f(strlen(telemetry_dir[i]), &quot;missing telemetry[%d] directory\n&quot;, i);
+
+}
+
+static void find_pmt_file(const char *path, const char *file)
+{
+	struct dirent *ent;
+	bool found;
+	DIR *dir;
+
+	dir = opendir(path);
+	igt_assert_f(dir, &quot;no intel_pmt directories found\n&quot;);
+
+	found = false;
+	while ((ent = readdir(dir)) != NULL)
+		if (strcmp(file, ent-&gt;d_name) == 0)
+			found = true;
+	closedir(dir);
+
+	igt_assert_f(found, &quot;missing %s from %s\n&quot;, file, path);
+}
+
+static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
+{
+	char file_path[PATH_MAX * 2 + 1];
+
+	sprintf(file_path, &quot;%s/%s&quot;, path, file);
+
+	*fd = open(file_path, flags);
+	igt_assert_f(*fd &gt; -1, &quot;failed to open %s\n&quot;, file_path);
+}
+
+/*
+ * verify that the expected telemetry file(s) are in place
+ */
+static void test_pmt_telemetry_files(int dev_fd)
+{
+	int i;
+
+	for (i = 0; i &lt; bmg_telemetry_max; i++) {
+		sprintf(work_path, &quot;%s/%s/%s/%s&quot;, dev_path, telemetry_vsec_dir,
+			&quot;intel_pmt&quot;, telemetry_dir[i]);
+		find_pmt_file(work_path, telem);
+	}
+}
+
+/*
+ * verify that the expected crashlog files are in place
+ */
+static void test_pmt_crashlog_files(int dev_fd)
+{
+	char buf[64] = {};
+	int ret;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		sprintf(work_path, &quot;%s/%s/%s/%s&quot;, dev_path, crashlog_vsec_dir, &quot;intel_pmt&quot;,
+			crashlog_dir[i]);
+
+		open_pmt_file(work_path, clear, &amp;bmg_info[i].clear_fd, O_RDONLY);
+		open_pmt_file(work_path, consumed, &amp;bmg_info[i].consumed_fd, O_RDWR);
+		open_pmt_file(work_path, crashlog, &amp;bmg_info[i].crashlog_fd, O_RDONLY);
+		open_pmt_file(work_path, enable, &amp;bmg_info[i].enable_fd, O_RDWR);
+		open_pmt_file(work_path, error, &amp;bmg_info[i].error_fd, O_RDONLY);
+		open_pmt_file(work_path, dev_guid, &amp;bmg_info[i].guid_fd, O_RDONLY);
+		open_pmt_file(work_path, rearm, &amp;bmg_info[i].rearm_fd, O_RDWR);
+		open_pmt_file(work_path, trigger, &amp;bmg_info[i].trigger_fd, O_RDWR);
+
+		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
+		igt_assert_f(ret &gt; 0, &quot;failed to read guid for device %d\n&quot;, i);
+		bmg_info[i].guid = strtol(buf, NULL, 16);
+		igt_assert_f(bmg_info[i].guid &gt; 0, &quot;failed to set guid for device %d\n&quot;, i);
+	}
+}
+
+#define ENABLE_MSG &quot;1\n&quot;
+#define DISABLE_MSG &quot;0\n&quot;
+
+static bool send_msg(int fd, const char *msg, const char *file) {
+	size_t len = strlen(msg);
+	int ret;
+
+	errno = 0;
+	ret = pwrite(fd, msg, len, 0);
+	if (ret != len)
+		igt_info(&quot;%s failed: len: %ld vs %d  errno: %d\n&quot;, file, len, ret,
+			 errno);
+
+	return ret == len;
+}
+
+static bool verify_msg(int fd, const char *msg, const char *file) {
+	size_t len = strlen(msg);
+	char buf[32] = {};
+	int ret;
+
+	errno = 0;
+	ret = pread(fd, buf, sizeof(buf), 0);
+	if (ret != len)
+		igt_info(&quot;%s failed: len: %ld vs %d  errno: %d\n&quot;, file, len, ret, errno);
+
+	return ret == len &amp;&amp; strcmp(buf, msg) == 0;
+}
+
+/*
+ * Set enable enable/disable bit and verify usage
+ */
+static void test_pmt_crashlog_enable(int dev_fd)
+{
+	u_int32_t guid;
+	int fd;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		fd = bmg_info[i].enable_fd;
+		guid = bmg_info[i].guid;
+
+		/* force enable so we are in a known state */
+		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), &quot;0x%x: send enable\n&quot;, guid);
+		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), &quot;0x%x: verify enable\n&quot;, guid);
+
+		/* disable */
+		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), &quot;0x%x: send disable\n&quot;, guid);
+		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), &quot;0x%x: verify disable\n&quot;, guid);
+
+		/* re-enable so we can do more testing */
+		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), &quot;0x%x: re-enable\n&quot;, guid);
+		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), &quot;0x%x: verify re-enable\n&quot;, guid);
+	}
+
+}
+
+/*
+ * Test the clear crashlog bit. After setting the crashlog data buffer should be
+ * set to 0xdeadbeef.
+ * BMG supports writing &quot;1&quot; to the clear file, but writing &quot;0&quot; (DISABLE_MSG) to trigger
+ * file is the &quot;standard&quot; usage, so test that usage.
+ * This bit cannot be cleared by software (i.e. reboot required).
+ */
+static void test_pmt_crashlog_clear(int dev_fd)
+{
+	char buf[64] = {};
+	u_int32_t guid;
+	int crashlog_fd;
+	int trigger_fd;
+	int clear_fd;
+	int *val;
+	int len;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		clear_fd = bmg_info[i].clear_fd;
+		crashlog_fd = bmg_info[i].crashlog_fd;
+		trigger_fd = bmg_info[i].trigger_fd;
+		guid = bmg_info[i].guid;
+
+		/* make sure the bit is clear */
+		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), &quot;0x%x: verify clear\n&quot;, guid);
+
+		/* set the clear bit (0 -&gt; trigger)*/
+		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), &quot;0x%x: send enable\n&quot;, guid);
+
+		/* make sure the bit is set.  sleep() to allow HW to set the bit */
+		sleep(1);
+		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), &quot;0x%x: clear set\n&quot;, guid);
+
+		len = read(crashlog_fd, buf, sizeof(buf));
+		igt_assert_f(len == sizeof(buf), &quot;0x%x: failed to read crashlog data\n&quot;, guid);
+
+		val = (int *)buf;
+		igt_assert_f(*val == 0xdeadbeef, &quot;0x%x: invalid clear data value: : 0x%x&quot;, guid, *val);
+	}
+}
+
+/*
+ * After a crashlog has been &quot;consumed&quot; (read), setting this bit can be done.
+ * Verify that it is set correctly.
+ */
+static void test_pmt_crashlog_consumed(int dev_fd)
+{
+	uint32_t guid;
+	int fd;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		fd = bmg_info[i].consumed_fd;
+		guid = bmg_info[i].guid;
+
+		/* check, set, verify */
+		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), &quot;0x%x: consumed clear\n&quot;, guid);
+		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), &quot;0x%x: set consumed\n&quot;, guid);
+		/* sleep(1) to allow HW to set the bit */
+		sleep(1);
+		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), &quot;0x%x: verify consumed\n&quot;, guid);
+	}
+}
+
+/*
+ * The error bit is set when a crashlog fails in HW.  It is read only so only
+ * need to verify that it is &quot;0&quot;.
+ */
+static void test_pmt_crashlog_error(int dev_fd)
+{
+	uint32_t guid;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		guid = bmg_info[i].guid;
+		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), &quot;0x%x: error clear\n&quot;, guid);
+	}
+}
+
+/*
+ * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
+ * occurs (i.e. setting trigger will not change its value).  Verify that it is &quot;1&quot;.
+ */
+static void test_pmt_crashlog_rearm(int dev_fd)
+{
+	uint32_t guid;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		guid = bmg_info[i].guid;
+		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), &quot;0x%x: rearm set\n&quot;, guid);
+	}
+}
+
+/*
+ * Set the manual trigger bit and make sure the data is not 0xdeadbeef
+ */
+static void test_pmt_crashlog_trigger(int dev_fd)
+{
+	char buf[64] = {};
+	u_int32_t *val;
+	int crashlog_fd;
+	int trigger_fd;
+	u_int32_t guid;
+	int len;
+	int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(bmg_info); i++) {
+		crashlog_fd = bmg_info[i].crashlog_fd;
+		trigger_fd = bmg_info[i].trigger_fd;
+		guid = bmg_info[i].guid;
+
+		/* make sure the bit is clear */
+		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), &quot;0x%x: trigger clear\n&quot;,
+			     guid);
+		/* set the trigger bit (1 -&gt; trigger)*/
+		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), &quot;0x%x: set trigger\n&quot;, guid);
+
+		/* sleep to let the HW do its thing */
+		sleep(1);
+
+		/* make sure the bit is set */
+		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), &quot;0x%x: trigger not set\n&quot;,
+			     guid);
+
+		len = read(crashlog_fd, buf, sizeof(buf));
+		igt_assert_f(len == sizeof(buf), &quot;0x%x: failed to read crashlog data\n&quot;, guid);
+
+		val = (u_int32_t *)buf;
+
+		igt_assert_f(*val != 0xdeadbeef, &quot;0x%x: invalid trigger value: : 0x%x&quot;, guid, *val);
+	}
+}
+
+/**
+ * SUBTEST: pmt-bmg-all
+ * Description:
+ *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
+ *   individually unless you understand the underlying HW behavior.  Because of this behavior,
+ *   all of the test will be done in order in one step.
+ *   NOTE:
+ *     o Testing MUST be done after a cold reset
+ *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
+ *
+ *  Test category: functionality test
+ */
+static void test_pmt_bmg(int fd)
+{
+	test_pmt_directories(fd);
+	test_pmt_telemetry_files(fd);
+	test_pmt_crashlog_files(fd);
+	test_pmt_crashlog_error(fd);
+	test_pmt_crashlog_enable(fd);
+	test_pmt_crashlog_rearm(fd);
+	test_pmt_crashlog_trigger(fd);
+	test_pmt_crashlog_consumed(fd);
+	test_pmt_crashlog_clear(fd);
+}
+
+igt_main</pre>
    </blockquote>
    use &quot;int&nbsp;<span style="white-space: pre-wrap">igt_main</span><span style="white-space: pre-wrap">()&quot;</span>
    <br>
    <blockquote type="cite" cite="mid:20250904172625.1024127-2-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
+{
+	const struct {
+		const char *name;
+		void (*func)(int);
+	} funcs[] = {
+		{ &quot;pmt-bmg-all&quot;, test_pmt_bmg },
+		{ }
+	}, *f;
+	int dev_fd;
+
+	igt_fixture {</pre>
    </blockquote>
    use &quot;<span style="white-space: pre-wrap">igt_fixture()&quot;</span>
    <blockquote type="cite" cite="mid:20250904172625.1024127-2-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		uint16_t dev_id;
+
+		dev_fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(dev_fd);
+		igt_require_f(IS_BATTLEMAGE(dev_id), &quot;PMT supported on BMG GPU\n&quot;);
+	}
+
+	for (f = funcs; f-&gt;name; f++) {
+		igt_subtest_f(&quot;%s&quot;, f-&gt;name)
+			f-&gt;func(dev_fd);
+	}
+
+	igt_fixture</pre>
    </blockquote>
    <p>Same as above.</p>
    <p>Thanks,<br>
      Soham</p>
    <blockquote type="cite" cite="mid:20250904172625.1024127-2-michael.j.ruhl@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		drm_close_driver(dev_fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 5c01c64e9..46d36962e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -318,6 +318,7 @@ intel_xe_progs = [
 	'xe_peer2peer',
 	'xe_pm',
 	'xe_pm_residency',
+	'xe_pmt',
 	'xe_pmu',
 	'xe_prime_self_import',
 	'xe_pxp',
</pre>
    </blockquote>
  </body>
</html>

--------------ADPjyy0bPUst0M56V0MoU5ve--
