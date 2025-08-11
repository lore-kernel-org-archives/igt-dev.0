Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D9BCA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 18:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432910E196;
	Mon, 11 Aug 2025 18:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cr6htu8a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CB410E196
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 18:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754938275; x=1786474275;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=qipWR6AjRJpmZxxKEbJKvjJSBOCpiK0nWsbCutqnG58=;
 b=Cr6htu8apmsidT0ZFfFS0dLGXOFmNG4F24eDw4Qia566dpIfVjseCCBd
 NdlbiVfN7EEwv/AZLpcQg1ALvgpZ4DRuZWLQGOq0hN86LfK8vGoruUUfG
 Yhw/d7uUYqB8xGk582sOpIL4bqQliJtbHKRnCXFw7KG3MJUhhUkBoXDa7
 8hCoUK9ujDg9mRorqTkxHpAqxoQxYH7R/zPw3axVeyFZ/w4OHeb9oamGC
 vBwk9H2/8xIbyTqaqP33qsqIKol1dEovesB2/f3B12N69cC1j/6ws5Sqr
 YYpxELktJffK1BUf1ddhlkt0sb6zPgPf4LvJKykhpLE4JHEgPCblDDHqo A==;
X-CSE-ConnectionGUID: aU7vxB6lRD+5mdAUkEBl1Q==
X-CSE-MsgGUID: BPGTkuMvQjuk/OnxcetAnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68656168"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208,217";a="68656168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:51:13 -0700
X-CSE-ConnectionGUID: b7oRNm84TJOUhMtGudADNQ==
X-CSE-MsgGUID: tmqrj3vdRNGB109ZA/bmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
 d="scan'208,217";a="170127118"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:51:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:51:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 11:51:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIOvM2MPNFxKB3IRXHEbNuchbh4gmvfNMViPPU6WzBkmTHeSsmOKRZVXKAqK/X2s/GrjsoCkDdygpt25bIB1oQjQPWtYJJpSYQfuRjEEAYyzLb7rPpIuQw7GYQFKPHPM8tIo9uatHVhkHC4VfOzu5BtElLXgtE4vIZrZ2G1ddvHtlDWj42bGkY3vTY5EwIpgRGfbwrLuAGo/uAS4cKApI/thfqMB/ESeeYTGhfO/7hEv1J59nRRxUBwClpg+MkCG46xQ7ycBvf8FdXkMWCxAlx18aM0nLPKfd7WbQDxUleWWEifSfKqMYhPgAsnZKQzu5itRc6atsi5cC91Mx0UKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0am0jiHkd/xO2eLu758lPZmjN5U31Pz0zVxTVAPX2s=;
 b=fDAQHulWnxRuCDOfbZmKG1sAGSZUp65lLVPRL0ayOmi8b6Z2nVs4rJ3uv6e6jWvzmi7HV9KzSgdhNABW8BqWQjtEepaCUx83dFA2J+MOL7RRhcgBNdil464mY04KpxLbyYoE3oAD+pmcypjm5lntg93B+skUECU5w5mJmqmc+S7tPpNSEnLbUniO0BKvb/XmDMbOxK3jIUd8Xf34NVWoqE5dP7/FYTsaR2pd83fkSY02zR2IexROrgUy3Tlc92uVBWv+cC8B/N3EYk7qVm+8NfSIQbi7SUVW5JyLctfpFCVMsd1FACrXkN4Cch9hJAtmp5z4/crA0F1V+Lvn9RKNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by SN7PR11MB8065.namprd11.prod.outlook.com (2603:10b6:806:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 18:51:09 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 18:51:09 +0000
Content-Type: multipart/alternative;
 boundary="------------xJMLK07ag3lccmXLAmPadSDx"
Message-ID: <98047ab1-49b5-4371-98a3-88e37ea5c7bb@intel.com>
Date: Tue, 12 Aug 2025 00:21:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_atomic_transition: Change debug mask for
 multi-output modeset tests
To: <igt-dev@lists.freedesktop.org>
References: <20250805084131.1512658-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250805084131.1512658-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|SN7PR11MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a197656-5984-43a4-f694-08ddd9080938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejdpNU5USlY4QklXMWJSWXorQ3JuV1dUMWNPYlM2VWpMNzN2MEg2MWpsNkNP?=
 =?utf-8?B?RnUrRHFRS1UrWjRDTVNFN0VWbEgvQTRnTGszZmJCQjhHVXVDQUc0R0lGY0lt?=
 =?utf-8?B?b21LSG9haHQ1bHpyZ1dsNllRNGJhVFY2ekRDSm5EemdhYk5ITFNmWWtNQjhI?=
 =?utf-8?B?Y0lUUDRSaitXb0daWS9NRkk2WkY2RUVLQXY3aEhJbm5GUC91d2JBdnJoSkV0?=
 =?utf-8?B?WnBUdXlBWk9CV245WkxmWStiRDBINDk4ZGpRM3l4dEJ3SEFuOENnaW5QbUNZ?=
 =?utf-8?B?dUUvYThzbXc0UWRYbkZFVkZ2L0ttWk11MkVxTDE3U3ZzaGszLzF6elJHbWF1?=
 =?utf-8?B?elVjM0xXY3d0cFRObG52THlSYnY5ZkNSTnpVY3B3aEVHcU1oYmFpV0k4ZWpG?=
 =?utf-8?B?eHVUZHN1N3A5c0lDSmxTU1gybXk3T05XZUlpdmxxNVFTZnN6dFpBVzdLd3c2?=
 =?utf-8?B?NW04QkcyUzNUZ2wvUGxsZ21tTWtmdjRPVzZydnZPTjVIWlNxcWhZVDBrYU8z?=
 =?utf-8?B?aC9IRGtKTnpIWHphaXllY0JPMHY4ZVpyaGpFQ3E3b0tMZEVuL2lVcSt6V3BZ?=
 =?utf-8?B?VVFTb1AweWtHRnZIaEgxdEM0eTFtaWdDNWRobGhZUm5RdlJVdnRMQkdCS1pT?=
 =?utf-8?B?Um41SWNDeW1EYmk2R3VSaFFHSWZpeUM1R3RuZGk5YnZML0o3bjFhMjUwOEtI?=
 =?utf-8?B?WGFoTnd1ejQyWER4UFlwdkRWeE5OaTdyQTR4TVVidkxwSkZuK3hRc1lpT3ll?=
 =?utf-8?B?aWFhRmk1K09LaUtsQnBoc1ZlZUtxKzNnSGoyZ2ZrWTlaNkVyM3YwcFMvSDIz?=
 =?utf-8?B?K0tFYkgyOWhNLzc2NjBGdWN0RldZdDBYcXlMcURQSE1JQWsva25oTzBYRG5w?=
 =?utf-8?B?WmNwVTh1TkE5WHdsNTFqdWg4N05XSU5JeDNKa0tiOWdtYXFydVRoQXBHWE1I?=
 =?utf-8?B?eS9lWWdHNjViWnVDMy9WNG5lMVNoOXV0WXRESGdPdXgxOWltZ0oxbnpaaDRt?=
 =?utf-8?B?OTFycGd3dkIyT01HY1VubkVMY3IyTjFoQW1ZeVI5VUpjWm12R1pIOHJwd2NH?=
 =?utf-8?B?RFFscEhHV0t4UEE1VVljUktoSFkzRXVlZFVTN0loTTBUNVNuaEY4MFQ1QzNs?=
 =?utf-8?B?QTVrU3ZUSTBOUHhSWnBwc0VxdHhYNmVZUkp4dFd2ZmRIWUFtS1dJQ0tsRWdJ?=
 =?utf-8?B?MzFjbjdCSHY2NXEyWVVjR2EwSFExUmRJS1RUcnp6V0tGdk52ZG1CQXFaNFJy?=
 =?utf-8?B?TVhWNG5POUloMTU0a3lnSk13VXZGdWRCZExURWVGRUJZRkRqdy9zOHM3K2lV?=
 =?utf-8?B?bHRERnJ4SFB1RVQ0RGNrbFNWeUwzLy9OeHNIUHEvRHlCZHZ1L1JWRVJvN0cz?=
 =?utf-8?B?eDJGanRJajhlMit2UDNEN2tyZWFWM3Y0bU1DbGRMTFlpVHU3clA0Y2dibWMr?=
 =?utf-8?B?TFpYaHhCMENtSE5pc2JGSjB3eG05M1BPejVFL2NTbHRRSjhYNjFqeUVsNTRG?=
 =?utf-8?B?OUZzTXJrVk5VSE80MThzZUlRTWt2ajZ0UHRtMWoyQlVYTHlUYlRLeFVZY2VU?=
 =?utf-8?B?S2xHM3FsQkQwamJHUEp6Q2xURWdzNGJBNW5heWVoS1hrTTFsMXNoeXEvWmw3?=
 =?utf-8?B?cDFLczJKczl3NERuMytzU2RWaEdmMGdoeEl6Wk9BbnN5b1RGZ3oxb25wT1By?=
 =?utf-8?B?cUJ1OXcwQUVJZ1V5NXhGU29vazZGTnBldTZpK0xLYkhQUmlYZDgrZDgzTDdI?=
 =?utf-8?B?cGhyalRUUnFERFhtTjVwS3RuWTd4YWxCbW80V3A1bjJoWGFPODN2SVR6K3By?=
 =?utf-8?B?S0FLRlRJaWVrMHZEL2MwQzBzblRyb3dhTUdubGU3MkRMN21jZUFpcXVZM0ZC?=
 =?utf-8?B?ODhiZytmRVprY24wZk15anZsYjA0aFNaNUpsLytzVjhmSFduY0ZqZE1MM0VY?=
 =?utf-8?Q?37vdbH201SA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBGNFNPcWtTeUtqd2g2OVpWOWY1SzV4bk84ZngwR0sya0tZL0dJeFpHVzN0?=
 =?utf-8?B?cFhpZGsxUEJmcnd1eTJESXVQWmlLcU4vd1doMC9CWitlT2tmL0IyUFpzTGNw?=
 =?utf-8?B?aHJGWmtWMkhtUEk4Q2p4UlNqWlV3QjB3NFg0UXpGbUNxMWNsWXBNUzlaNFQ0?=
 =?utf-8?B?Ulp2VWdsRi9hSDZ0bzBJeXdxN0xkN0d4N0FFUDRuT1pSZ0o2RmxJblR4cnBT?=
 =?utf-8?B?MVE4dkNnTVNmajNXZm1MTlBnM2toSTN5MWR2cXo2eklYMlEraTJ6UVlsL0Vl?=
 =?utf-8?B?V2dtVElrRkpZZVphN3F3UkVkOXFHNmFMcjFReWJxSlBBN2QrekNEYThHcUt3?=
 =?utf-8?B?OW5yTThVQWM3NDI5WjMzZS9KUUh0ejIwaXhvWHZDSE1LSUIvdDNyN2cwWHhV?=
 =?utf-8?B?Y3RWSWJYRHpIMHRRWHExblNXOFpUMXV3MEM2T2kwcTkwY3ZOWkY0WlNnZUln?=
 =?utf-8?B?NWFsMDNPSnhtbHJjay92ZUU2dXkwajAxU0U5YlNEWDZCc1NkYzV2TUhXNU5v?=
 =?utf-8?B?cXZFbWxyNkphdnR4N0owTFI0MUE4d25GT2FjN3RnT2F5cldjeE9tTTdqWUc4?=
 =?utf-8?B?V0xZNVZIeGhkcVZUa05wWVR3R3BHOFN4b290V2gzRFVUUWhBNmQvUm5jQzBK?=
 =?utf-8?B?dzRaSmVEYTl3bTZQa1BrQXZyRDkrVTllbVNGa0dRMU1uckpGZTdObldQL3py?=
 =?utf-8?B?a0hRbFNYYWRBOFdPMWJWNTdnTkF1WjNDYTQ4SlVoSXp3b09GUlY5a1lHWk43?=
 =?utf-8?B?TlV2NzhlRmtCTi9nQjlGSE4zR1pTSEJmeUU0Z1lUazVYZnhVbUk0bTIxTTR3?=
 =?utf-8?B?dzBKdURRZ1lWdFUzUkZVVTNRSFVzb21OWWFJM1hrbEMvMmhoNm1yWHZoY1Z4?=
 =?utf-8?B?Z1hsNElMRExGZEVSbm9vTUVyaUwyN0poVXpVQmIwTmlwV1BhZUpWa2JOK1JO?=
 =?utf-8?B?NWREWEk4ZjVydmN3V1hKWmd4Q3BsMW1GbTVLMEJUNmlNTXp5NUJ3TWFVOGZ0?=
 =?utf-8?B?SGNvRDlYZU5VdHB4WUVYRDZxNmFIYktCV1pybW9kY1d4a05rTmVCdTg0ZkVB?=
 =?utf-8?B?Q0JFY29PZHhBdktjYklmRk9vQjMwMmFWcFRHTHp2bFkxdzI5MHpzbDRpdHgv?=
 =?utf-8?B?d3FpVFBERDl5M3UxZjI0THp2M0diNlAvQ3NwSXFMMTZ2elNjMlJ2MFJMQVE5?=
 =?utf-8?B?UnVONkt2UUlEL2gyYXd2Rlh2VUZyMkMwQmtsdUhDbG5sRmtNcExOcDZycTJX?=
 =?utf-8?B?VFFMSDdTSFdGY2N4UDlGTnhjTVJlMW9OZGFpNFpoN2NKMVZBRmZVQU5YZjhW?=
 =?utf-8?B?eFJnVHZFVjlpNEFXY3F6RFkrK09GZzlrRmZRZm02Z1FjYUQ2QmhwOFdNazVp?=
 =?utf-8?B?cWpPM2EvRC9yQ2NGWjR3WDJacEM5Y2ZKazVJeExEa1grMEw4d3UwUVpkZS92?=
 =?utf-8?B?ekQ4UDE0MXU2R0hDRjIyTjVVQ0pPK0FLeXczaU8yNTBIU2t2L0JZaEhsN2Zo?=
 =?utf-8?B?eFNFRGFBcExzMXdxQ2Jlc3pzUXZGcGZEU2R6aTJ6dEE0Tk9QSlpQSTZtZ0px?=
 =?utf-8?B?MDRNdDcvNDJKdFFjMCtyUlIzbXJVYnEvbTJ2K0t6WkR4aVZpVmkzaWZlQ1Bt?=
 =?utf-8?B?U2FwRFFPV0lCa0ppWUQzbms1QzlKRzdONlhQTEhqSElWaXpJazNnZWJLc0hT?=
 =?utf-8?B?cTNOeXdxbzZOQkFxM2FrUmJQL1VkTStYelB3YVJid1JRMzlGT1NRQnltVCtI?=
 =?utf-8?B?ajRGZnJDWmwrNFZvZFZwTzlqeWdDN2NvZVQ1WlNYTGFJdW1tTjZ6bWR1Njdz?=
 =?utf-8?B?M1ZGWDNzQlNEdDBhcGJWeDlJcjBOYjlwdG1wa2tuODVzQ1Z6SkJNZnI2N0Nu?=
 =?utf-8?B?bzg1S3lzWWJuM0lLenhlZStrK2lrR1hZRjlpMklrRFJ2dEdpZ1lZcGpDblkz?=
 =?utf-8?B?NUZ5ajNrakVHZTdXajdnZ1VadThDa1JBWUgvRFRMSmlxTTlOeXF2Y2wxbHdP?=
 =?utf-8?B?L3EzWWllRmV0WUZ5MHR1RXRrYTZqcmtiMnpXVVN5RHpqTFBFR2hLZ28xclB1?=
 =?utf-8?B?Y0gwbXE1YmdYZDJVZXlMRUpvbXF6NUhUSlJCS00xNEIvaHhLVzJUeW00SGFO?=
 =?utf-8?B?bm9oQmhFYUxBZXlxWFBsY3ZWQ1FhdnRkcHM5TnRRUEJRbDE2YXJ4a1FqeXIr?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a197656-5984-43a4-f694-08ddd9080938
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:51:09.7385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G03BUQwLaYKg7H1dpGrsD6IjeARArhvq+EEhtfnsWVlBPt103iLnAIu41m43vUPyNmy/29EM10VSm40JQcLU8Y/VYWq0yEs2QCH920x62Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8065
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

--------------xJMLK07ag3lccmXLAmPadSDx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 8/5/2025 2:11 PM, Pranay Samala wrote:
> To prevent disk usage issues during CI runs with multi-output,
> this patch limits debug logging to DRM_UT_DRIVER for modeset
> transition tests when more than two outputs are connected
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 8c6094987..2bb2cc63b 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1096,6 +1096,19 @@ static bool pipe_output_combo_valid(igt_display_t *display,
>   	return ret;
>   }
>   
> +static int count_conn_outputs(igt_display_t *display)
> +{
> +	int conn_outputs = 0;
> +	igt_output_t *output;
> +
> +	for (int i = 0; i < display->n_outputs; i++) {
> +		output = &display->outputs[i];
> +		if (igt_output_is_connected(output))
> +			conn_outputs++;

Use direct access to display->outputs[i] instead of a temporary variable.

if (igt_output_is_connected(&display->outputs[i])

> +	}
> +	return conn_outputs;
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -1210,6 +1223,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
> +		if (strcmp(transition_tests[i].name, "plane-all-modeset-transition") == 0 ||
> +		    strcmp(transition_tests[i].name, "plane-all-modeset-transition-fencing") == 0)
> +			update_debug_mask_if_ci(DRM_UT_DRIVER);
imho, All modeset-related tests or on more display config should reduce 
the log level, not just the two explicitly listed. change if condition 
as below:
if(strstr(transition_tests[i].name,"modeset")||
count_conn_outputs(&data.display)>2)

> +
>   		igt_describe(transition_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>   			pipe_count = 0;
> @@ -1250,6 +1267,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(modeset_tests); i++) {
> +		if (count_conn_outputs(&data.display) > 2)
> +			update_debug_mask_if_ci(DRM_UT_DRIVER);
> +
>   		igt_describe_f("%s", modeset_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
>   			for (j = 1; j <= count; j++) {
--------------xJMLK07ag3lccmXLAmPadSDx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 8/5/2025 2:11 PM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250805084131.1512658-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">To prevent disk usage issues during CI runs with multi-output,
this patch limits debug logging to DRM_UT_DRIVER for modeset
transition tests when more than two outputs are connected

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_atomic_transition.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 8c6094987..2bb2cc63b 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1096,6 +1096,19 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static int count_conn_outputs(igt_display_t *display)
+{
+	int conn_outputs = 0;
+	igt_output_t *output;
+
+	for (int i = 0; i &lt; display-&gt;n_outputs; i++) {
+		output = &amp;display-&gt;outputs[i];
+		if (igt_output_is_connected(output))
+			conn_outputs++;</pre>
    </blockquote>
    <p>Use direct access to display-&gt;outputs[i] instead of a
      temporary variable.</p>
    <pre wrap="" class="moz-quote-pre">if (igt_output_is_connected(&amp;display-&gt;outputs[i])</pre>
    <blockquote type="cite" cite="mid:20250805084131.1512658-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+	return conn_outputs;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1210,6 +1223,10 @@ igt_main_args(&quot;&quot;, long_opts, help_str, opt_handler, &amp;data)
 	}
 
 	for (i = 0; i &lt; ARRAY_SIZE(transition_tests); i++) {
+		if (strcmp(transition_tests[i].name, &quot;plane-all-modeset-transition&quot;) == 0 ||
+		    strcmp(transition_tests[i].name, &quot;plane-all-modeset-transition-fencing&quot;) == 0)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);</pre>
    </blockquote>
    imho, All modeset-related tests or on more display config should
    reduce the log level, not just the two explicitly listed. change if
    condition as below:<br>
    <span>
      <div class="scriptor-paragraph"><span>if</span><span> </span><span>(</span><span>strstr</span><span>(</span><span>transition_tests</span><span>[</span><span>i</span><span>]</span><span>.name</span><span>,</span><span>
        </span><span>&quot;modeset&quot;</span><span>)</span><span> </span><span>|</span><span>|</span></div>
      <div class="scriptor-paragraph"><span>&nbsp;&nbsp;&nbsp; </span><span>count_conn_outputs</span><span>(</span><span>&amp;</span><span>data</span><span>.display</span><span>)</span><span>
        </span><span>&gt;</span><span> </span><span>2</span><span>)</span></div>
    </span><br>
    <blockquote type="cite" cite="mid:20250805084131.1512658-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f(&quot;%s&quot;, transition_tests[i].name) {
 			pipe_count = 0;
@@ -1250,6 +1267,9 @@ igt_main_args(&quot;&quot;, long_opts, help_str, opt_handler, &amp;data)
 	}
 
 	for (i = 0; i &lt; ARRAY_SIZE(modeset_tests); i++) {
+		if (count_conn_outputs(&amp;data.display) &gt; 2)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe_f(&quot;%s&quot;, modeset_tests[i].desc);
 		igt_subtest_with_dynamic_f(&quot;%s&quot;, modeset_tests[i].name) {
 			for (j = 1; j &lt;= count; j++) {
</pre>
    </blockquote>
  </body>
</html>

--------------xJMLK07ag3lccmXLAmPadSDx--
