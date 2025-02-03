Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BA9C02190
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 05:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E648D10E05C;
	Mon,  3 Feb 2025 05:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W90n0m+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6300A10E05C
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 05:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738559074; x=1770095074;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K3eWnykLO4kBvFsxqAjqxHy5TZR7i/wP7yE0074LEpg=;
 b=W90n0m+ZDCMrqS2CvEYvc/O8LoSbGanoldAhIH697RjqLgq9EPm00uFB
 iBWCw/p+teQK6a0AipLNeV11IW0K3yHans4Qw9fMCIbXfpwBTZJFM2WLm
 6r30a7clJQtRNjsZqLzj3EVrsqCxGpSqK7D7ddnWZ+Ul7acubY3AVz0hJ
 rEEon3meGWt1f56Fzmrx2gyhq/BCNWmdfHo/IuVBygxvISFk+tFEREUAy
 uUiqWmL6kxRQBaJ+FJXDTKO6QTHOJs8GlgPE53R3sbmNqVknX0MggZroK
 g92eJ95rdF+4D2P+v8ZCfx3zp74Y7Dw237CiBOOxekGQvUZF7SlP37DRC g==;
X-CSE-ConnectionGUID: N6AWSEfgReq2QCG4tUFb8g==
X-CSE-MsgGUID: AC2i/dhnRrqmfQ0aFUbnyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39072410"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="39072410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 21:04:33 -0800
X-CSE-ConnectionGUID: fF4lW0+QRVCqcoZ3JgWBwg==
X-CSE-MsgGUID: 6yGquKfsQG6cVWUq3QATrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133436950"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 21:04:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 21:04:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 21:04:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 21:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVsUfyRVvQwlu2vrTAEB5ocAP8RljcYSWrmPlAacPvzGOfsM82X4YLW3L5VvfljY443P9JflDgxmfyV2CdQDh2SJLcR96gFZwP1Cs7pRz2CVw2Yi4N/Qz4fEjK3K6ZcL71Lp3utrXnzeZo+FLi8aePFC2ljPeH/wvZkGGtfj6zXIJ8b8UuT9+xuOmpt6TSY2P+S0MSRRWAC48JgPKjnwgwk16fRo8zN/KdvRvORGnsrQpQvkTCzLcfvLZFQAGaqfAp8XD9mfyAaGUnLkS4s6SSOnvElLdJRdwOu5QxIIDxyLGzSRNe0rX9w7bpmL2Mi57zwRc59+u7zCfXOWgGA9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1NfdJWBNj5wGO+NDZt3NUpspIX2JIMwt9SrI9nGXyo=;
 b=QAeZ862CRY8o+r47/pT4KJ9dGNLKueADWEwWIJD2AER9HErdoIDmGBEAuSsFheTgX8OGZ0jFVCFgI76DrJbQpPpOwIP+JKM6YoTeSHFN8Tj2B/KNnobzJRz9Ag82rnYF7jmfxzUPeeZw475Gvw0VokDbV+Va0Gb7fGIZQO1BEeGnvwZGCnWVzrPG3+7CvHOsdKQ444+8O5+oWIMTmq6pMmopfbpQg1cgMDwmsJ/dToMOx93JVZKNqfIS2TA3Rtqbr9v8WeZqAd0Vmt8VEOPrd+Z59VWC+qtfC/SFI5T6nXAYaVCnZjXzRBaEHOF6GLIKH40zxlrLDPGg9Hj2/STKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 05:04:29 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 05:04:29 +0000
Message-ID: <1b3f71c4-154c-4538-ad82-704bf66fb497@intel.com>
Date: Mon, 3 Feb 2025 10:34:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
To: Louis Chauvet <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>
CC: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, <nicolejadeyee@google.com>,
 <seanpaul@google.com>, <jeremie.dautheribes@bootlin.com>,
 <markyacoub@google.com>
References: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
 <20250110-b4-cv3-01-igt-kms-v4-5-0b0474708f9f@bootlin.com>
 <3a4ee176-d941-45e7-893e-015727fed23e@intel.com>
 <5191beb1-a074-49d7-9662-4c6bee6d83f4@bootlin.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <5191beb1-a074-49d7-9662-4c6bee6d83f4@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::23) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b5312c-8577-437a-6884-08dd44103d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkUyQXZXcW1hVkdDM3hMb3Z5aXpDNkEyVlJ5NVhiUW5iU2JxWFNrS2Y2S1g4?=
 =?utf-8?B?elRGYUprUVZyYWllTDh2RVVLMVJkb1N3ait5NWdsTFBTK2srajhOUFVrU0lO?=
 =?utf-8?B?cEY4K2lWeStTMjh3cEkrZ2JHaUY4RTY5U3RHam9WMmI3YjVoUk5MVm5FY3hS?=
 =?utf-8?B?V2Zad29ZM281SGJUbnhkZHRRR05TejQ4MTA1YktjbElCMm9lSysySUVmVzAx?=
 =?utf-8?B?U0svQWxxMkJaM201eForT1pJNThvMTF3blk0NnMraEc2a1YyWk1BWUozN0Vh?=
 =?utf-8?B?eENaRnc0bDJXOW1TMmtnWGRSSXlrcVNXQXFlQ2FzWmRpTDArS0ZmRU96VDZJ?=
 =?utf-8?B?U1MybEdzbUI0TXR5cFZWRWhYUVdzb1BQN2J1eWtoT1ROS3AwTk1nSkJLbGJm?=
 =?utf-8?B?eThCTTFOR2xSSGtJcmUzV0ROZHdPQ1Y5Y1NuUVZNSllEWWY3MUJCTlhJRm5R?=
 =?utf-8?B?SWVvREErajZHODlMMUk3ZWZETUsxNGJYL3Z3MVhGcFgwc291WHF5RjlQYVl3?=
 =?utf-8?B?NEFETEg3S2hpUnQ0VmZualhYQXB4TkNtR2ZLc2laNklKUU85M3JCa05RcUdo?=
 =?utf-8?B?N0hIMGZOL3NmWmYxNlY3UXlKWFp1bFI5UHdMMk1qZjVrS1dUTTlTSW5FWUdz?=
 =?utf-8?B?WmV3R2JLS3l3WGhHLzlLQ2g1Vys2VWVSbXFxdGx1dmtEQjI4dGVick5pVktn?=
 =?utf-8?B?Q2R3Q0RkcFBSYitIYXFTaWY2bEpkTmZVclhCVURGbCt1MzZBd3VadVdheit0?=
 =?utf-8?B?MUhiY3YrdnI1L1dDR05Gc1QyY2xQTlM3Uno0U1NNRWI4WkZHM2Q2dlB2ZVFt?=
 =?utf-8?B?eDVxamRpK1R1Ujdrc21ldlEra2h6cjFRdm5KK2ZUdWpzamcrTDNxL1lnZ2Q0?=
 =?utf-8?B?K1h6V24wYlZIMHdGdnhYTWdNWWNkM3hsOGxMc1Vza1hOQzdNY0I0VXJpY3h6?=
 =?utf-8?B?eXN5c2lFZnllSnBCb1FMQ2k2U3VaYW5OUTNBYUxsUWhtamVaUXppZnkrUWJT?=
 =?utf-8?B?L1ZJYmU1b2hPT3pKTWRBRG5QZVp1cnNVbm02Sm90bmh2VEg1czRxZzV4S0dM?=
 =?utf-8?B?UUJkbGNjR01BdWtpYlZpZ3haTjVOTmNyak1jdHdDeHJMSmFCM1AvMlRRaWln?=
 =?utf-8?B?dGR1MGNEZEdOSWV6RjhTY2srdEZjOEFjRzE0VGZKd01ZbWdXWWk2eC9HNGlN?=
 =?utf-8?B?clN5QTY4L21NYUZTKzVWWTVMSXRtNzZGSXpjbS9jTmNDajdTSmxnT2Vkd29H?=
 =?utf-8?B?dmFCbkpMMzU1b1I2SExaRlBwTzRqQVdRR1VnTWdYSlQ0b2FKNHNheXpybk1W?=
 =?utf-8?B?bjhqamNUZ29NTjMrVzc3THc0UTY1ZGl0cXQvN1lFWE9vSWc0ZmxiWGM4bkV4?=
 =?utf-8?B?R2FsR25OYkUxcTNXcFBMbUI4WHBlcFFyYks2UEk2SCsyWVJ1KzY5YitIN0sv?=
 =?utf-8?B?YzR5NW1VUlYxWHNmanFxaTdSQ3hJeWxFS3VWUHdpTmhFUUtWbXQySEh4Zmh3?=
 =?utf-8?B?NjV6dit5UVpIbnEvTlVmaStvZldNMDhoZ0k4MklFQVZQNXdwQ1liNFpWT1pm?=
 =?utf-8?B?eEdocE51RlREQ2lDVTBKeXNZUnRJazhpS3BTQlZJd3pDU1ZZYkk3UVJWcVp1?=
 =?utf-8?B?R0did0JzVzRKS1FDSTE0c1liRnVTK0xSeWRpTU52ODAxekZ2aVI5U2E1RDlx?=
 =?utf-8?B?Y0Rsck0yMTJPS1JmUUx2SitwaFg2SnZwaEw5cXlhL0dlRjJSaE1tMXIvM0tl?=
 =?utf-8?B?aTZmVlVPMEpZbXNvemNKWmpZL3Zwek5WNjRRQmtwc1RqbkZRM3JmQmFRcFdD?=
 =?utf-8?B?ZTdSQnV2QlY0enAwcjJzQXdPTXBTMi9aWFBsSnhJNFNPeHdhMHdpTi9HYUZX?=
 =?utf-8?Q?yOJoEqwKD/lPk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmpZM2F2amh1K3JVeVZrV3A0Mm8vQUNGL0JnQlVZdURVOWZWWHAxd1ZjTkp5?=
 =?utf-8?B?ajJ4OXBTL1Z1UmZmVW5ma0Q3bnI5d1p5ZGRCSEJkdG9jbFdzd2EyMzE3OS96?=
 =?utf-8?B?VTlodlpIdnBldWVDaElEQmlUbHBsL21qT0VRNDA0RjYrTEN0YW04aVd3Y3ZI?=
 =?utf-8?B?ZElQRXN4dVNkU2Q5SWVvYjFGT1llTFlBbmtLUHU0YmUvVThRdTZGRW92RFBQ?=
 =?utf-8?B?dUszRmF4alpKSHEyV2cxeE1uUXp2dGg5ZHJYK0lOWmN5MjlBOVJ0VU5SbjVR?=
 =?utf-8?B?dkxhUS9XeWduQk5lVmQzUGcyaUNVTGRHb2cwbGhoaThkMklrdkVORFRvd0k0?=
 =?utf-8?B?SU1wWWxwWTJCTUdHbi9hRnNVKy8xRi92RlBjcDZVU3JxVTZCOUNtSkFFeE1N?=
 =?utf-8?B?eVNmT3JaRWl2aWJBZ0RZTklGa0JKQ1BJNndLVGlSR1lDU0x1cS9KNkQ1ODNG?=
 =?utf-8?B?eEdVWkc5MTdZaFFXTXBoYjRzbTF4d2JiQlcvallCbW1YWEt5cTkwM0pjZi91?=
 =?utf-8?B?TnZsWFZZa2Q5YStPd1ZnUkVUTTI3ejk5ak55NDhlMUQzbW9jMUpRZDVxejUx?=
 =?utf-8?B?ckhicEQ4RWtxbmJsY2ZLZXIyT0N5QTMxaCs0REo2Tm50M0dBbStOVWpKemQw?=
 =?utf-8?B?QTJ4ZTlWMlpJaFNjd25QOUM1aUo3OCtXRGNEdUpLM251NjVZVHRHYnBKVkU0?=
 =?utf-8?B?SU5sSTA1djZUTkdabnUxb2o4THNyNURvRFB1dTc5KzRJb3hxWXRHclMzaFda?=
 =?utf-8?B?aVAycXpLeGFadDhqZ21NTTgvczREckFHbnVsdnUrZGFTazVpQXZnMzBlSUdX?=
 =?utf-8?B?bkhyeFVycjl5RnVoaUpkL2hNWm9wRVhDZGRFeExlM05CQ2JNdERiUzJsR3Zo?=
 =?utf-8?B?a0EwRWxUSWRZclFwakxjWnRlbC94SXdsR1dvVUZISXRqd21jTjJFZHU2Z25x?=
 =?utf-8?B?UnFnZXJIWDR2bmpFaW9Vemd6ejlqY2F4V1pzaGh1bWJTbkJxbmFpZVRLODF0?=
 =?utf-8?B?eCt1eWNweFcrbVp3elFERnlwbFE3aXgvdHNpRllQSDFOdzNsVzRiUlBHZHFt?=
 =?utf-8?B?NUZ5d3JWT3ZVVG5XNzlNZ1pxZDNFQ0FZQkdLb2lJOU9keUgvYW1rcmp4MERj?=
 =?utf-8?B?Z1dUeXp1dDZmUFpFYjV0RCt3dmpiRE9JRThpNk0vdUxqN2RtL0pqbGhRMmgx?=
 =?utf-8?B?T3VLTkxOclVZMldZZE03VURJL24rRW9EelFDZGQvcXo2bnhWVzBVbk9TQmtR?=
 =?utf-8?B?eWdVbmZYYWd5bmJXK29XWkswWGJmMmlkdEVCUU9YbmIzQWd3alJSVWZPSHZn?=
 =?utf-8?B?OTc3TWtJYlVNUEp6U2FuNnVYWUR4WUFhV2wrc2orWUk2N3VLdUZhZGVzb1M5?=
 =?utf-8?B?RVpLbnQ2c1lxcHFoZWNPajl2T00vYU9VWCtBdFRNcktmT043ZTA4Q3lLNDVC?=
 =?utf-8?B?ZTlWd0xFcEc2T3pmY0FsTUJ4UUc3MDR6eXdPMjFyT0NlNWRiTXdJTUZCaWtK?=
 =?utf-8?B?TFNSQm1OQ2pjekRPRFNYKzRHd1ZncFkzaWpqNEZkbE5xQldyNDQ4YWhkRzZu?=
 =?utf-8?B?Um9yV2o3RkhEVVRMcGF0SnU1eGlEbWtMYlJoSWgxNlZqYitoVFVUc2YxU3Yr?=
 =?utf-8?B?WWZ5N2w1dmIzc0pFVkNGaFRmK29oUFpQanRweUxSOVpvdHo0RGxKcW5PaC9p?=
 =?utf-8?B?LzBwSWVQb2ZObkNuSkxTa1VGSFlGc0VXNDlQWXNuc1U0djZCMzNFSlg5bFQ2?=
 =?utf-8?B?UE8xY1g4VGdPZWJvNjJGWWVqb3VqeFI2N1FhU3JiR1VHUmVmdUVpVG5iR1Vx?=
 =?utf-8?B?SHhiZHNwTVhEUHVhWmVwRFFhR2ErYVZHWHpoVlVjVmFRbnl2M3diL2VuZVcy?=
 =?utf-8?B?VXV5aGN3bDRqVEhraXQ1VTlZdjkwWUNBcEdJWlVIT2FocVhadGQvcit2U1px?=
 =?utf-8?B?NHUwdzk4VjBLbVhWSGN4V0V5bk1TYUxhc092WDNhN2I2QnNzNFlVMWZXdlZD?=
 =?utf-8?B?Z28zUkw0amtWUlRmNWxGSzZKWHpaV2tYVnBzZTVmZW5WbXByVG41bkZFello?=
 =?utf-8?B?WnQvcXE3ZU1heFpBam9yTzd1NE5rT1dkbEZPL0FydWlqTU1ld21RZzlHMG13?=
 =?utf-8?Q?DEAEGMAZLYU6we1glu3AZHBkW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b5312c-8577-437a-6884-08dd44103d0d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 05:04:29.4633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdcp0rV9Q36BwRNyA9wHgMH5a5RznxRRLZa8SJx2ZG9HbDWf6hoVkYjX7+KrGUFIzmCCAaJxG6dR2/CB9opJwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
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


On 1/27/2025 8:14 PM, Louis Chauvet wrote:
>
>
> Le 24/01/2025 à 05:26, Karthik B S a écrit :
>
>>> +/**
>>> + * igt_get_pipe_for_output:
>>> + * @display: display to fetch the pipes
>>> + * @output: output to use
>>> + *
>>> + * Get a valid pipe for a specific output. The return value is the 
>>> pipe first valid pipe for a
>>> + * specific output.
>>> + */
>>> +enum pipe igt_get_pipe_for_output(igt_display_t *display,
>>> +                  igt_output_t *output)
>>> +{
>>> +    enum pipe pipe;
>>> +
>>> +    for_each_pipe(display, pipe) {
>>> +        if (igt_output_is_connected(output) &&
>>> +             (output->config.valid_crtc_idx_mask & (1 << (pipe))))
>>
>> Please use 'igt_pipe_connector_valid'.
>
> Sorry, I probably extended it to debug something and forgot to 
> unexpand. It will be fixed for the next iteration.
>
>> Also, this function is mostly a duplicate of the existing
>> 'chamelium_get_pipe_for_output'. Could we reuse the existing function
>> here instead of adding a new one?
>
> I know, but:
> 1 - chamelium_get_pipe_for_output is only enabled with the chamelium 
> build option;
> 2 - chamelium_get_pipe_for_output also enables the pipe during the 
> process.
>
> For 1, I can simply replace all calls to use the new helper.

Hi,

Agreed. I don't see any added value keeping them chamelium specific.

>
> For 2, I need to understand why they choose to call 
> igt_output_set_pipe to get a pipe to see if I can simply replace the 
> chamelium helper by mine or if I need to change my helper to do the 
> same thing.

'igt_output_set_pipe' is used for the 'igt_check_bigjoiner_support' 
nested within 'intel_pipe_output_combo_valid' as there are a few 
restrictions in big joiner usage. Although most of them are applicable 
while using multidisplay combinations(which shouldn't apply in this 
case), the restriction on last pipe would still be applicable IMHO, if 
we've an output with a default mode which would required big joiner.

Keeping this in mind, I would actually propose renaming the original 
function and moving it to a common lib to make it generic rather then 
having it chamelium specific. With this we will have a generic function 
to get_pipe_for_output and also have the intel_pipe_output_combo_valid 
check.

Thanks,
Karthik.B.S
>
> Thanks,
> Louis Chauvet
>
>> Thanks,
>> Karthik.B.S
>>> +            return pipe;
>>> +    }
>>> +
>>> +    return PIPE_NONE;
>>> +}
>
>
