Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56578C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0C112189;
	Fri, 26 Apr 2024 11:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emXBiPOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3101B1121B9
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714129480; x=1745665480;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0V/CsTVdzaWEio4Y8O0njZNRvGnW2/xZwK9SMlUgnoA=;
 b=emXBiPOvaRWSF4TFwtpHnoQn47FT+Q1D2JU/CybEhVjfXGyiF1ksdk8u
 VA3sWp7cvGqUpwwLiLpSzkKpZEw7YRzNlr3S8XakRv4xRtxmHo+IqhngJ
 KuQ7h6nRC9wI5WfeEZAi44qk4ZHtZg4SuKno6/OYM1aXfsoRC32QwaxjG
 p5oHATk/uQLya0gGrLsSYcJ0LRDw2YXGfO61x0yfTBGHqq3yqi+tNEJoa
 2iUARyV5tZzMrWNJXrcRi83bcqDsPCw2BbBuzftaNw+lz+bauPDdF0x1g
 quIDnvc+dPTKx6mm/3daa0rZEkoq2Y1kykWJ1dx66S7Ni4x3zr0g6Do+h Q==;
X-CSE-ConnectionGUID: qP4Ev8nrQzOlkcVpih1JlQ==
X-CSE-MsgGUID: L6bhzV00RWygBEWLAGNCTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13649149"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="13649149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:04:39 -0700
X-CSE-ConnectionGUID: TTe59cJBQxqRXcQscSjBgA==
X-CSE-MsgGUID: ntPiVvTUTHmiWZOgU9dWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="48624514"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 04:04:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 04:04:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 04:04:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 04:04:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 04:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/7tBqnco/CR3GkBqI+u8qwkDmcoIJJYHTEcAamh2zyMyo/kuLdKeYd3XOuTqOUQDmpGEOdWqj5cYcXrPZpf3LJ50D7a7uVc7EH9pvJCuLnBb4B2WpcqsrkSPTp0135VEZeJx7enX7aocxmK+SnZFz6CmuHqWGA87MxI0vCs7MA1ytOeKpHcldDjz9UMMz69QQKgaJEVGnvCAbKpcWaS7B0gqlewp9EOh+/Jr0fsmhK2H0ShTqpM0eL9HU7JnILxTyX/SPseEJ+ODUtAHtauP8v43dD4A/alAqpP3R8Orxheo5xlrBZd0tmt7Y1bn1eBKoiVtIA1tYTYNTki86teKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZpgUAaunArTBcPiuAb9BUDOX3worMgkpBwoDl0zFrw=;
 b=O3hnUYS3v1U8ergj9oBabdUmU5GOeQGtB6KkFnNnvh+9AP9N0MTlCv23128c9X1/Jm3BJFVSaayyyTHz7kBnVGtCLY7tTfdlCsNOgKC8eeoHHv2gEB6ttHPmjZ4yMj0NwNhtxCl0ORPsWjLcLELSsEXI54ez413Uv/CHCX1wtbVa23Oorn9gZmT70HlkLCYbnI94b9YlIYzg6eq8KpYEaLvsLQ0S9nqxz1ilHvW5StmPs4rnpbpGF3PCMBy80PaGFcj4c0p8tuVsIfOZ8l0FCoJdfMkUJ7XwdeaL0ho9g22CfRGBj85ej72QTjA4FyeQy2Vgaqqfkd98bllB04ZgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 11:04:32 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 11:04:32 +0000
Message-ID: <6de50f86-e7ea-4b1e-86c6-dd4addb44072@intel.com>
Date: Fri, 26 Apr 2024 13:04:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 03/10] lib/intel_blt: Add i915 -> blt tile helper
 converter
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-4-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::17) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 28de5952-05e5-41e9-9342-08dc65e0a65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1cyT1YxYkJDbmRKV3U1R3h4Q2Ztckx0UHdjOHhycFNyN2xTLzNtbVJmYkgw?=
 =?utf-8?B?SCt4OWs5cWVYTEl0QlZpenN5VWhvYjFvVVBwNlhlVllNUU1OazRtV1k1dUVV?=
 =?utf-8?B?MDBaREw0UExBSkl2bmZWZmM4dzlvQVZPR21BZks4aGhFK25iWkcyK2ZqL1M5?=
 =?utf-8?B?WGtvM1cyaVlCUy8yMHBBSHlKd1RaTGk1MkU0VmNxSXJXOHBzU2orNW4xMHIr?=
 =?utf-8?B?QytuRHNLU2dJcHFqZmtQdXNwdXZzYmY0UmJvRmRRTWVLU2pCcFBTbGd4VVFj?=
 =?utf-8?B?MGVLaFgwOTNKc0JiUnBKL0R4L2lERkk3Ly9lbjhvQ2g2aVpUZy9YRzdlWDk5?=
 =?utf-8?B?NFVOQ29Nd01abUk1M3Z1TGd2RlJhaFJkdktuSXhXbWhtZHJ6em16a1FaU21q?=
 =?utf-8?B?eVBQNmh2TzIzRnhYNCtXaldxYXYxOUlnVTRrTXRoOG5WdlpqelBUWXlCTlhZ?=
 =?utf-8?B?TEhGMzFQclNNZ0pkVE1tSDVOeHAyTTZOTFRaeEZZa3FsQUxrbWtiM0ttS3hr?=
 =?utf-8?B?UndNTUNlVjh0cXlMVEtNLysraTA2cGJWYTVwb1pRRVRERUlLZjBGNUp4bUh6?=
 =?utf-8?B?K3pZMFJ4b0pvK094Y2xrZnNLamlHRDRiSytJbjQ4QjM5RHBuN1V2R3hvU1VB?=
 =?utf-8?B?UDRheU5vRy9yK2RtUHJFejBvWVRVcjExYkh4dmFoZUFadWM4Vy9sN1FEOEpK?=
 =?utf-8?B?MW1JUGY0RDZKOVVSWC85VklWYXN1SjB3T2FuVW4rS3ZYNGRwT1h5L3M5MkVj?=
 =?utf-8?B?UjhEdmlNUVZLVENpaDRENzdEU1FXOS9Sam4wbkhzcTNiWisyL2haZThLazNi?=
 =?utf-8?B?QlFjQThvcWFEMTFUbFRFMHhESEh6YXIzbWNRU3pHSWdkeE9KaVRObUhHTW5M?=
 =?utf-8?B?akVCTjhQODVCc1JsQ09YYTJpc2FVbEd0U0pFNmZXTkZtVHBTSkYxOWl6SndE?=
 =?utf-8?B?aVFrcEtNUDVZY2NtZlVVemhZMWpSUXQwQnU5bC9YWXE2WVlkaUpNUmI4OEhX?=
 =?utf-8?B?MGkyUzlkcGpZOXVjSTRid0UxQmdXZnlMdjFYRzE1aGJKSHU3NitHMGg5aXBk?=
 =?utf-8?B?UlVYRk1hbEdXMzdoOEZqRW44RC9YNUVIMUZUaFV1NDMwTk1vRGg4ZDZPRlNV?=
 =?utf-8?B?TGhHcWdYdGpaQnF6UzBOZzFyc011b1lPMUJhUy9UQzNuYUZFdVVHdThna05X?=
 =?utf-8?B?bE50YUQ0djJaMjlWU2xocHF6NmdGSVg3VnNvaHNHY0dTVUZoVVExblBWVTRq?=
 =?utf-8?B?M3lOTkNXeU1HY285amMwSW4zWndnaHU1OS8xVk1tUkVNRE1ZQTJ2d08rMUZx?=
 =?utf-8?B?Y3VNREhmMXNrRVpjRmQ2S3N0cEdXNWVuS24xcWV2eGJ1OGczWEpjeklFRDFV?=
 =?utf-8?B?b3RDMnp0MEYyNHQxdXhZUDNxelNKVERSM2FyT2NsdHhIY3lxM3M3ZVFnMFdt?=
 =?utf-8?B?cm5kWlRWZ2xHWWVVQ1pPUC9PYTNLbmgrait6VTVvZ2g2NHgwZnlTMk84T2d2?=
 =?utf-8?B?bnhJRW9UbjI5M2VKbFdIa2ZxcGlzQ3FpRHRrTjQ4YVYzdUpzc2dQMzBXQTI3?=
 =?utf-8?B?TFpZT3F2WDR5R1krei9leDdSTHVSR09GalJySjQ2MHZ5MHpJRU13Si84TXNW?=
 =?utf-8?B?Y0dlRmw2dGpINXdMOVR4bUFTeE82YU9VbE1mNFBrejRzcHV4dUs4TjNna05o?=
 =?utf-8?B?VC8raksxejlRUzZyTWttWDBYUnViNEdONnA5cVBUZkNuaUoyNlVoNnpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3VuVlhWcVJMQlNFZzlCWkRWN1BjaXdtaGgrYjZFTGNWZktLUmI0VVlWaW96?=
 =?utf-8?B?MUlwUEhCWitUTkZLcFFkYjdXTTRBeHFsY2dTM0cvTFc3S0w5NmdrcFJ1dmFL?=
 =?utf-8?B?Z2tCWlFrcVExclQwaUd2Q2czK3NzMGk3RWJHb2wyRnYrQ2hOWk1XQVQ4cTJQ?=
 =?utf-8?B?MVgzTzIxelo0N3l2NDVjanZrQTNpMEV4dDFKQ2VydU9SdkZxOEV1TExSNHFZ?=
 =?utf-8?B?ZHljeXlxZDF1K1RVY0ZUMC9tTWxockNrOVpSRDYrOURXcjFRR05KSGZBOERE?=
 =?utf-8?B?RnBYUlkzRm9YdkR4emJyMFJzZXhwUWJxUXpSNE1nQjBaVFR4V3M3Mzl1anY4?=
 =?utf-8?B?OTBMT1Nqc2p0bU9JRW03S1dVTTlqUWgzSDN3RmcxQmw0UTN2MStYaHlNQjVI?=
 =?utf-8?B?eUU5QWoxUTFmMkU1NGRjMFZXRjJ2NXB4aTh2Q2pmbG1jZkVaQ082NnlBYk1K?=
 =?utf-8?B?QkFjN09xVVJYempwRXNXWlNLSHhMUnIzK21HWCtlV3QwSGQrTUFHMmc4cnBz?=
 =?utf-8?B?VDY4WTltZ2xiSFdQQlQyemdMdU5MZXpQMUNHejNoWHc5WC85M2xMaS9tVWlj?=
 =?utf-8?B?bGNWeURIaTNLaFJtQ0xaU0lOZGxEdFk5ZmN3UUdiV1o5RHBVZ3ZxaDhDekVN?=
 =?utf-8?B?czJjMUlIaUxRVXMrZHBKK2JsRDM0Z3p0b1FsL0dvNW9WaCtiYjNrWWk5UEhL?=
 =?utf-8?B?bjErMzZTNTVKSnBFb3U4aEFaSEFwdTRoRXc3RlUzeEtGZXIvb1Q5RmE3SXh1?=
 =?utf-8?B?Szl1TXZKMVpSbFFVMFFkZ3NFci9iODhMTmZhR21JRG42a2RNOUN0Rms4SjRx?=
 =?utf-8?B?UkE1aVBNQ2JCNkgwa0YwUXA1M0lVN3Zpc2JCQmlmbk1KaUlhU0R3U3NLNlR0?=
 =?utf-8?B?K1JlWkFRdG52cFJaVlRqQlRSVzh3QmprbUZkdGxsWnl0OGNjSzBKak5GWEFz?=
 =?utf-8?B?a2FtaTV2SHlnd2Nlb0x3VEU4MkxERStDbFoveGk5OWVwdTJmdGFjRFNKTnBw?=
 =?utf-8?B?MDRKRWt5SVRwcXc4Nks0dVh3RE12V3htSWZLWWQreGo2WjJWQkVVOG92ejI2?=
 =?utf-8?B?U1pMWm53YVRRV3BUZlc5N0huQ1kwSWFCemJJRHpPaW0vb0RQVVByS3BPczRh?=
 =?utf-8?B?TUVrNlNzalVnRW83Qnk1NHFJenZJdHNTYUJYZ0d3ZitwQlRqRjNzU3ZOMzQ0?=
 =?utf-8?B?LytvQmxMcHdMbnFFYStkY2xmZFJEdG5NQWRyL2dkZFdCV3dSdUNlc0xXanJT?=
 =?utf-8?B?cWZtUDRBaU9LR09Va2ZJM1pUVXl4NUFvUFVJTVh1cUpIREgvUStaOW5LK0Ft?=
 =?utf-8?B?UEVXdEh3dWF1VHFXSEZwZEFERVp5QWJ1cGM4K3FocGJlS3dnT3c1bm15aFJt?=
 =?utf-8?B?OEcrck1wT1ppNjZZUE92QUpmY1dzd2pFSGNvK0JOQzFOK1BRZ1Y1cFNmSFFX?=
 =?utf-8?B?ekdZSThHZll3Q2FheEpEZmJTc0hRUUY0R2NOdGFEeWFQclBDbk9paVlCUWIz?=
 =?utf-8?B?b1FWOHlaNVNLY3o1cXJjN3J0TGpRaVUxV3luTy9TNXk2TVJ6NnJNOHZFWG5G?=
 =?utf-8?B?TmtOeUZjNWhmU0thQUlvcTRqREtQbTlGRU1XMVkybFQ5OUI5MlEwSkJSMXhE?=
 =?utf-8?B?eVhNWWg4ZmwvMVpSOEI3ejdXa0NmSURUMTdWM1NZb3hYZExEblI2bGV6ZGhW?=
 =?utf-8?B?MlhRT3BDVnl5STd1UFBMbG5MR2lxM0JreHMvVnp4NENXOG1PaGE3WGU0eFFX?=
 =?utf-8?B?NlZQSjhGZ0E1QnFFSFdTSE8wczJacHM0TlVYVG1zZk5XbWcvNmFLdEJ1algz?=
 =?utf-8?B?enN0a2RseHFDdzBBRlZuNG9HNHo2LzFPdlA3dnBpTjNnaFY0a2I1S3NNRy9p?=
 =?utf-8?B?NXdUWEw1ZzdhUFRUNHpoR21xN041cGphenBkMGFSZGxkOSt6THZwajFIMjA4?=
 =?utf-8?B?NUNtbDA2T3ZucnN1ckhsNW5SUzFZczZpZXJLdEZ4cldhZE1HNXRBNkVEbWtO?=
 =?utf-8?B?RGxHa1ppVlcyMDljRDN0a25pTWRQRnVHRm1waE5OMzlDblpzbW5veGRYa25D?=
 =?utf-8?B?UXZxbjFKRUVVUkg5RDNUMnJLcWh0c3RReEpBNCtIYmVwL0dIQUJjMDkyOC9j?=
 =?utf-8?B?YWNnSllQUldGNUlkK0hjcjVQRWlCRnVyRXJWSVE5UzVSY2c1bGd6RmI2WXNB?=
 =?utf-8?B?ZWtMNWMxcldyb3FEK1FYa1NXdmN2SUNvUjgvTFI0aXg2eEZQNmN1STBhV1Av?=
 =?utf-8?B?THNpb0drVEloS1BsejA2QXZ6T1VRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28de5952-05e5-41e9-9342-08dc65e0a65e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:04:31.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrBUwNj5MJJfkEAufX17L4k8ke9FLnBpn6UGDLXtkiiIPJ8JINlBzmkqJ7lqvBnezQoSCqom2vTHSifc4dUENlrYQc0l0YOm03sjby5Wjsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> We have two kind of buffers in IGT - intel-buf for render and
> blt-object for blitter. intel-buf uses I915_TILING* whereas
> blt-object blt_tiling_type (T_*). To construct blt-object from
> intel-buf we need to convert I915_TILING* to T_*. Add function
> which does this conversion.

A looong overdue change, thanks for implementing this.

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_blt.c | 21 +++++++++++++++++++++
>   lib/intel_blt.h |  1 +
>   2 files changed, 22 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 5a281036c4..946adc538b 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -560,6 +560,27 @@ int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
>   	return 0;
>   }
>   
> +/**
> + * i915_tile_to_blt_tile:
> + * @tiling: tiling id
> + *
> + * Returns:
> + * id of blt tiling like T_LINEAR, T_XMAJOR, etc
> + */
> +enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling)
> +{
> +	switch (tiling) {
> +	case I915_TILING_NONE:	return T_LINEAR;
> +	case I915_TILING_X:	return T_XMAJOR;
> +	case I915_TILING_Y:	return T_YMAJOR;
> +	case I915_TILING_4:	return T_TILE4;
> +	case I915_TILING_64:	return T_TILE64;
> +	case I915_TILING_Yf:	return T_YFMAJOR;
> +	default:
> +		igt_assert_f(0, "Unknown tiling!\n");
> +	}
> +}
> +
>   /**
>    * blt_get_min_stride
>    * @width: width in pixels
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index fcfce69bee..6daf46aea4 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -214,6 +214,7 @@ bool blt_uses_extended_block_copy(int fd);
>   
>   const char *blt_tiling_name(enum blt_tiling_type tiling);
>   int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
> +enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling);
>   
>   uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
>   			    enum blt_tiling_type tiling);
