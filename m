Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F9BC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 14:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF7E10EA45;
	Thu, 20 Jun 2024 14:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDdMVTno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8C10EA45
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718894696; x=1750430696;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=g5bm+984pdkZpnPR0GaoPRMj/WBUon79rvwDfB0qMXY=;
 b=TDdMVTnozw5lF9ThpPFpE8utjJFwgR1qixQlYXhdNKNtqMVwElgu7+x7
 XWpxVDUI09NiibCK2PgYSvBaO26k4DjBoOHuJBUiCdfl7VOK5ZhqdgVEd
 Ws1wINs4rA1njne0dwwBOKOF9/3VkxTAwliOfUD01K/YhM+Y4rn0oQ0Q8
 k/jY/k3lTVoqWlwPUVaU02dKCYNnrQ08OI+0maD/n8XxJS8/MOFuLdq5t
 WEUlVuS2Gatpnmj4diuqfWOA7K+PBE1NqRJAIdbpA4k4KCF588m4NNon/
 +a0sjMJi47eWw4RjcbFjvpK1BTLvj2qHW1MyH4h/nB4sgMCHqH1vygmm4 w==;
X-CSE-ConnectionGUID: KukU8VadT+qYFQJwX1bu+w==
X-CSE-MsgGUID: pfsPexUDSAiEiuzpDWkSCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26508735"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208,217";a="26508735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:44:53 -0700
X-CSE-ConnectionGUID: Dm2L8xPaQxyejTgyRNcf6A==
X-CSE-MsgGUID: 6wxprKppR0KDpIIeFc+UkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208,217";a="65510486"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 07:44:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 07:44:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 07:44:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 07:44:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJGOciA67u6vv+/F6t7gKFcBksRm9Li5ZvOvR0xVYX9pe6GsNWvhtpeXVjPG5VxyHXp8oI1096XiWonIVw9oIPMTLikjKN2sIiWoNqjD0r6xWWlX4XwkMX3FVhlZ7tgM6nWL6p6xnsfD0MwF9ZqNIqsySqQPnsovHsIs5T1wDkcWpcdmCNigajFwRLprYIG99C5XFWW03O9m0p8XedyB+9xzOCqKGmM29HkbL8WutMqkZc4D0bwBXvq0hM/07SzQLpe3L8pNd/nn/tkTVUOj/1gWXT9gkepYWUg23hHbXp5h0TzbZpGOKdlnT6qcFBJ+Fa4hInSL4pNsCQHOBV1G+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prv+cmm5jryNDN59c31fPwApF11oQHQJA39spZABJ6g=;
 b=MuaiKRwoTmrl87QtuT6aJOjp2JTVy4+Bmy6H+YhQm0OP6+BA4oyAtK3MNv8KM0PS7HuYPaMReN17MgED0v5n+X27hkx4beb2ccIGZNhfn6hif0aWQHgKTO8CFR+dTOvKSz2Va8w0qDaMOgnhNtBQl3PIWZvtNojo2gnc1Mjn2A0A8Yfd7B/lziF62WtHGxRGwt7jSf3vbjm/tIwWU0xyuJ3XvO0T9tFU9a97SMuf1ALo2oK28uV1W4crRL1EUNqtGNpdq9OSulT6gXERLlGNpkiROJDivG6SICUxZZsLEgFvhVQenEjhddOO0TcY/DyCySTs7YxvvlAqN0vOxl5WnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Thu, 20 Jun 2024 14:44:49 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 14:44:49 +0000
Content-Type: multipart/alternative;
 boundary="------------Y45amnmAFZIkD30zGXvy5pRO"
Message-ID: <1da8d3f3-38d6-484b-857a-61a13a5bf56a@intel.com>
Date: Thu, 20 Jun 2024 16:44:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_store: Add
 basic_inst_benchmark
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240618173247.8233-1-nirmoy.das@intel.com>
 <20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: DUZPR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::12) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: d64582c6-0f5b-48b0-709b-08dc9137897c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UCtFZENnM3oxd2lvNDFneEEvVndESEhlTjdobWp6cjg5d0E5YkFrREJ3U2V3?=
 =?utf-8?B?ZGJhaGFkWU9rUTFwQm5pc1RkcjBwZmY2Tzh5MCtQUUdVcGgrbHczbWxyMW9J?=
 =?utf-8?B?S3hhek9GckhQaVZ4a2V0aExycWVPMHlwSUl1LzhVNGxEZFNlcllNMDVYdWxl?=
 =?utf-8?B?Q1hXWlM0UVFlaXl2SHd6TVpKVjZHTHVMbFlLcHA4V2hWN25sUndnYUhOcmRB?=
 =?utf-8?B?UUtrOUJ4UmY3aW1MSjAxRm41QXVvZEtEWW9vNkdKNWdHZkc2K0dHMUhVcVZZ?=
 =?utf-8?B?a1kzeWJDYmxLODhDSlJaTDBDQisxeHZBeUtkaHp5bzlwRm1pNlhLWjY3bng2?=
 =?utf-8?B?bWpZVTR4U2UxeXZ6Qm9NbUp1c1NyOFByS2pZUFVxNGo1VDBjK1pNTGRsYWtt?=
 =?utf-8?B?azhBd1BveW5HUkd3eExBQzI4WExnQ2kzSm1nOGQ3cmRwQStwL3VJaWtZQzhM?=
 =?utf-8?B?Wkd0VFNZTHFRdTZEUW81R0dna2IwUkZFb0NFa3ZOZEEyc0dLTmQ0ck5VNlRo?=
 =?utf-8?B?QXFJZWsrTEJhY0xHRFBDUEgxNzFYQm5xQ29WZWZYWUpjbE9CMGJGamcya1ZU?=
 =?utf-8?B?RzRhUDh2VkpVazlyQXlaV0tPZDBqZEVGVEJFSTFieEIxcHIwUlQ0Zm1yempP?=
 =?utf-8?B?RUJ1ZXNPWlBEYWxZN3BkdTFaN1lSZXBibEM0alVtY1JiQmVJVFBsd2ZOUitR?=
 =?utf-8?B?eE5DdGNhaTl0anJ2RHkrK1dST0g5SEhjcTI5bEpFV20yTDN0bER6cjgrbmJy?=
 =?utf-8?B?NC9WUzhLZG1NZjdCVWF1bldJYjZxc0dpUGVBd0d4NUIyYlNqWUVoWEM0UGlM?=
 =?utf-8?B?MTJ3Zkx6a1Uza1BJY2YzYjJ3dTZuZU53emtaeWk0bTJycEFqdzBJRmJVRlBt?=
 =?utf-8?B?NEFqb3M2Z01keVRFc09iQkJOV2djNWs4ZlZkQzEySkdjSC9naEpVN1lvVEll?=
 =?utf-8?B?NDM4d0I2T2N0eWNKZWlTMmMzZHZURzBTVEFBYXVXTnR1WXNtMStkdS90Z0VK?=
 =?utf-8?B?TFhwZ0IzYm9CcS8yMzJXRnhKR2wyLzEzb0Z0MWFBb1ZVRnBBYjV3R09XaTla?=
 =?utf-8?B?UVE1U01JV2xpUm9JV05DSFFGYmlNSDUzOUs2L2VQSitJTm5sczZ1Umc3c2xO?=
 =?utf-8?B?SVkyZjlRcUpvSURjU2s0YWhzZUZCRVl5Qmc5TWs2Vm9PdFZnZFpuVmVQaDBl?=
 =?utf-8?B?cVpxcjhaNEZaSi9oWit3Q2lrd2MzY1FDZGNjdXk4dnVEVFdOczJjMTlUaWll?=
 =?utf-8?B?S1hZUm5WOTlOY29sL0NzNFQ5THZOcDZlYVdMQWJZR093ZnZNQVQzSk9BdkRT?=
 =?utf-8?B?ZVFZSkI3NTlKNWFMT0trZjhEb2F4blZzeHF6SGgzK0k3bUt3VEx4RUVuMWNM?=
 =?utf-8?B?dHF1cDJUSmRsY21CZlNnTHlzaXVRTmtvajFMa1VZSGVoMklLT1dmRXpXOUJ1?=
 =?utf-8?B?dHhPbU9DcnFVUUhaV09seFVqNURRR1E3QW9Kd2VjUmF3cG9yUmt3UXJlWlZD?=
 =?utf-8?B?UEM0VUtaNGxJNXRMSVpRUHErYjBCZ3NhUnFVTFlBd2ZweUhSZHRpTDhWc2Z0?=
 =?utf-8?B?Ym4rekpCdTdZU0pjaHh2eHh1dEN3SmxaUTVaNDR1Y0VQL293ZzdqQTZuK0xO?=
 =?utf-8?B?Y2hJdG5JYlVvRlhQUTlYVnM4dlJYendVY1FydStGbC9aS3IzWDJZRXlIeWUr?=
 =?utf-8?B?a3l1SlV3T1hUM1kvSkFFV0tqb1lTWklZTitMQ24xTTJDYjlnWXQwN0tkRWNv?=
 =?utf-8?Q?is/k75SynrV9RX1VhZLoIuSwdiilHJaySqKwX4S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDI1REYxdkhIbk53NmNvb2NERzltWWl5Vklsc1ZnWUJEaytBd0UzV1ZZWi80?=
 =?utf-8?B?OXdkWEdoMlpQaVppR1BQaDhYNEFkUkNERWE1V0pyMVl3d21vaHU0cGJyNWEy?=
 =?utf-8?B?WXpvLzZuVWxGOWRwZXdxb0RaUHBrSVRCR3JvQTZFRGZtMHlmcVh0RnRVT3JP?=
 =?utf-8?B?akxaRmdmZ0xzRWRxbWQ3QWVhUlJjYkE3UFpXQnUvVWtNM2Yrcm41WFhlOFNp?=
 =?utf-8?B?MWtIbkxiSGVOYlg0c2RXNGc2azVucmJnUTNWV0Q1N28wTFdLUU4yN0N0TWJT?=
 =?utf-8?B?MGswTFdpVjRjdDJUazRucFlOQ05VaXplL1Q1ZW1wMW9ldDFQZ1BIYnY5SStP?=
 =?utf-8?B?V3o0dXhYbTZUNGV5T3E3VGwrRVJ0M001T2ZUdHlTdGdSa2FYUXJMRFdpOFhY?=
 =?utf-8?B?dzBPVktqcU9aRGxYV1BqOXFWRU5jVkhRWDUxY0lZUXJIZmxyMi9HcEpZenp6?=
 =?utf-8?B?NzFKVDRqSVpBYTVyOTF4aU5Nd2xOL09oTWYwayt0ZDNwWjk4bU5jM0xkWnBh?=
 =?utf-8?B?UEo4Wk15OXFUczZyNkZ5ekJQamxEMmpkK0pqMVp0Mmp4Qm8wTXI1ZHVjZ0Jr?=
 =?utf-8?B?SnpGV1ZJbThUUUFFVzQ2NE5DMjVxenlvMWlUcXg0dVdndmFKNXhjckthOEFh?=
 =?utf-8?B?OVRmNGo1M1dMNFFrelovLzNsZElTYnBsajRJSzlNaEV4dkNWRnBUSzNRYXNh?=
 =?utf-8?B?Wk5xWkVieTgyRU5tL0Rwd0xUVVl1SHUxVWx2SHZOUjFsZFMvbzhtb21zb2Yv?=
 =?utf-8?B?cSttUWxUcUJ2WENPMURPNXoxOVVDM1VmUDRVOFdZR0p4TndBOUNJOHN5dHZX?=
 =?utf-8?B?TWcwMHFhb0dCZGs4cnVaZ0s3bVJyMXJhK2NzdUhLNnBQanpjdFRnbmlxYWJY?=
 =?utf-8?B?Y0w5UWVta3J2L1l6SlA2ZFljcFJBZkpRV1pmcEVJdTlzTFNiVWlZM3BKNE56?=
 =?utf-8?B?NSt4aWU0S0xKK1Nid25rdWtXcDczTStvTk1uYitQWFBKZGhWQjk5RjFwa1lV?=
 =?utf-8?B?Zit1U2V4L2NmNWlpRzhqcEJYMWFZbTVidUlnM2o5YkJiMUNGb1VncGx1cHlw?=
 =?utf-8?B?b096dlBOTzR4Y254VTNDck53RFY1d3dtaXdPMGdaNlY4WWtWNUxUQ3FiTDND?=
 =?utf-8?B?OWdVVTZDZWpram5ESzU3QW1ETmorcU4yNHhiZVNxY3h2eStHWU9jUi9LcmZP?=
 =?utf-8?B?dDZqam5VZk9LbjlLSTFLU0V5OFVvVlpHR2VENTM5T1JBRmh6UnA1V3hTVDln?=
 =?utf-8?B?ZmhuQ0dzMCtNcEYyN0xlb1ZIQlZjZmRPTmwyVVB4ajZKY0t4TDJkWWs4TVR6?=
 =?utf-8?B?UG9RWkZKVm9JcTZweHNNV3JleGhiU0tyb0VZVEwrYkpuVlFxaDh3aWtVdVA0?=
 =?utf-8?B?Q0pEZ2RJOWVqVklONVQxK09NTEYzV0VjL2E3U0V3MlJzeklRUTVwbWNWYldv?=
 =?utf-8?B?OThtUmdxa016WWhyVHVoSjRRcnNnOUFoZTFFQkVrVWZDN0pLQUw3c0dOZUo5?=
 =?utf-8?B?OEhEMk1ic2tabUQzOW41YWFaMzYybkZOZVZOVnF5V3FMbEpPNS9lQ29vUmJX?=
 =?utf-8?B?SnNlNDNhMVdRUllicHhGa2o4K09tQ2VVanVZUmlBY2xkbWJvWUxIUlp1UXMr?=
 =?utf-8?B?SDRQcjhrTmhFZm41bUU0aHU2ZVlYTVRvdDg3QUJtUzdkOXJ0WjZqdFFSYjRC?=
 =?utf-8?B?VDFGdE03dTl4OUlwb0FLUnMxeXkzNTljY0l4bGlsUzR4VXRjOEJUbWExRmRl?=
 =?utf-8?B?TWx1TnR3aXJKemFrYlIvMVkvRnBvWTZNL0JzWnU1WXlIRW9JYWp5Q0g4U05J?=
 =?utf-8?B?bWFvME53T0ZLQVMyV1h1WFcwSS8zSUNTZnRQeCs4NzhvUmxtSVREWTdMbjFE?=
 =?utf-8?B?cnVqcUlBL1BhNFNrUFJrOWNOaHhyZWtzSTNTQUtiV3Nqb2E1WjYvUXpsd2dp?=
 =?utf-8?B?V3Q0NjluTFBrcXgrdm5DRkZVWFFuU3daOEwvb0JjL0FvZUJuVHljdG5uc3Rj?=
 =?utf-8?B?ZFFjV0tZU0g5d2ZNRllvbHB4cUJSSi83UHVQTEJkK0ZNVWtPRE1MU3RWNlNv?=
 =?utf-8?B?MFA3cXUxTFN6R1NkKzBMMkVyN3BtYVN2Z2hDaVBUOWlPc1A5UG9mTUhSOGtM?=
 =?utf-8?Q?GB8d5tQeidXf+9teg36zEPbjK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d64582c6-0f5b-48b0-709b-08dc9137897c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 14:44:49.6761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M595xI9NSKnODOlK/aPzTpmPWH+uxc3FyzN1uXUkBXSpLgxdTnmNkeodHYHs3TdpOo/LKFQAFttSy1UM+w7cWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
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

--------------Y45amnmAFZIkD30zGXvy5pRO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kamil,

On 6/20/2024 4:20 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-06-18 at 19:32:47 +0200, Nirmoy Das wrote:
>
> [PATCH i-g-t v2] tests/intel/xe_exec_store: Add basic_inst_benchmark
> -----------------------------------------------------^
>
> You should use '-', also your subtest has 'store', so:
>
> [PATCH i-g-t v2] tests/intel/xe_exec_store: Add basic-store-benchmark

Will do that


>
>> Add basic_inst_benchmark to benchmark this basic operation
>> for BO sizes to get basic understanding how long it takes
>> bind a BO and run simple GPU command on it.
>>
>> This not a CI test but rather for developer to identify various
>> bottleneck/regression in  BO binding.
>>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_exec_store.c | 110 ++++++++++++++++++++++++++++++------
>>   1 file changed, 92 insertions(+), 18 deletions(-)
>>
> This didn't work on my ATS-M machine:
>
> sudo build/tests/xe_exec_store --r basic-store-benchmark
> IGT-Version: 1.28-g64414e4da (x86_64) (Linux: 6.9.0-rc6-xe-public-513ea833c201+ x86_64)
> Using IGT_SRANDOM=1718890917 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> (xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Test assertion failure function xe_bo_create_caching, file ../lib/xe/xe_ioctl.c:311:
> (xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Failed assertion: __xe_bo_create_caching(fd, vm, size, placement, flags, cpu_caching, &handle) == 0
> (xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Last errno: 22, Invalid argument
> (xe_exec_store:15881) xe/xe_ioctl-CRITICAL: error: -1 != 0

I guess WC cache is not allowed on dGFX, dmesg should let us know. I 
will check and fix it. Thanks for trying it out.


>
> Also, where are benchmarks? Do you print them only after
> WC and WB runs?
It should something like:

sudo~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-benchmark

IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)

Using IGT_SRANDOM=1718739607 for randomisation

Opened device: /dev/dri/card0

Starting subtest: basic-store-benchmark

Starting dynamic subtest: WC

Dynamic subtest WC: SUCCESS (0.000s)

Time taken for size SZ_4K: 8 ms

Time taken for size SZ_2M: 7 ms

Time taken for size SZ_64M: 15 ms

Time taken for size SZ_128M: 16 ms

Time taken for size SZ_256M: 33 ms

Time taken for size SZ_1G: 110 ms

Starting dynamic subtest: WB

Dynamic subtest WB: SUCCESS (0.000s)

Time taken for size SZ_4K: 4 ms

Time taken for size SZ_2M: 5 ms

Time taken for size SZ_64M: 16 ms

Time taken for size SZ_128M: 29 ms

Time taken for size SZ_256M: 49 ms

Time taken for size SZ_1G: 176 ms



Btw I realized --dyn doesn't work, the test executes WC always even with 
--dyn :/ any ideas ?

> See also one nit below.
>
>> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
>> index c872c22d5..4b1c619e0 100644
>> --- a/tests/intel/xe_exec_store.c
>> +++ b/tests/intel/xe_exec_store.c
>> @@ -93,15 +93,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
>>   	data->addr = batch_addr;
>>   
>>   }
>> -/**
>> - * SUBTEST: basic-store
>> - * Description: Basic test to verify store dword.
>> - * SUBTEST: basic-cond-batch
>> - * Description: Basic test to verify cond batch end instruction.
>> - * SUBTEST: basic-all
>> - * Description: Test to verify store dword on all available engines.
>> - */
>> -static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
>> +
>> +static void basic_inst_size(int fd, int inst_type,
>> +			    struct drm_xe_engine_class_instance *eci,
>> +			    uint16_t cpu_caching, size_t bo_size)
>>   {
>>   	struct drm_xe_sync sync[2] = {
>>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> @@ -117,7 +112,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>   	uint32_t exec_queue;
>>   	uint32_t bind_engine;
>>   	uint32_t syncobj;
>> -	size_t bo_size;
>>   	int value = 0x123456;
>>   	uint64_t addr = 0x100000;
>>   	uint32_t bo = 0;
>> @@ -127,12 +121,16 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>   	sync[1].handle = syncobj;
>>   
>>   	vm = xe_vm_create(fd, 0, 0);
>> -	bo_size = sizeof(*data);
>> -	bo_size = xe_bb_size(fd, bo_size);
>>   
>> -	bo = xe_bo_create(fd, vm, bo_size,
>> -			  vram_if_possible(fd, eci->gt_id),
>> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	if (cpu_caching)
>> +		bo = xe_bo_create_caching(fd, vm, bo_size,
>> +					  vram_if_possible(fd, eci->gt_id),
>> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +					  cpu_caching);
>> +	else
>> +		bo = xe_bo_create(fd, vm, bo_size,
>> +				  vram_if_possible(fd, eci->gt_id),
>> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>   
>>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>>   	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
>> @@ -167,6 +165,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>   	xe_vm_destroy(fd, vm);
>>   }
>>   
>> +
> Remove extra line.

Will remove it.


Thanks!

Nirmoy

>
> Regards,
> Kamil
>
>> +/**
>> + * SUBTEST: basic-store
>> + * Description: Basic test to verify store dword.
>> + * SUBTEST: basic-cond-batch
>> + * Description: Basic test to verify cond batch end instruction.
>> + * SUBTEST: basic-all
>> + * Description: Test to verify store dword on all available engines.
>> + */
>> +static void basic_inst(int fd, int inst_type,
>> +		       struct drm_xe_engine_class_instance *eci,
>> +		       uint16_t cpu_caching)
>> +{
>> +	size_t bo_size;
>> +
>> +	bo_size = sizeof(struct data);
>> +	bo_size = xe_bb_size(fd, bo_size);
>> +
>> +	basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
>> +}
>> +
>> +/**
>> + * SUBTEST: basic-store-benchmark
>> + * Description: Basic test to verify time taken for doing store dword with various size.
>> + */
>> +static void basic_inst_benchmark(int fd, int inst_type,
>> +				 struct drm_xe_engine_class_instance *eci,
>> +				 uint16_t cpu_caching)
>> +{
>> +	struct {
>> +		size_t size;
>> +		const char *name;
>> +	} sizes[] = {
>> +		{SZ_4K, "SZ_4K"},
>> +		{SZ_2M, "SZ_2M"},
>> +		{SZ_64M, "SZ_64M"},
>> +		{SZ_128M, "SZ_128M"},
>> +		{SZ_256M, "SZ_256M"},
>> +		{SZ_1G, "SZ_1G"}
>> +	};
>> +
>> +	struct timeval start, end;
>> +	long seconds, useconds, mtime;
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(sizes); ++i) {
>> +		size_t bo_size = sizes[i].size;
>> +		const char *size_name = sizes[i].name;
>> +
>> +		gettimeofday(&start, NULL);
>> +		basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
>> +		gettimeofday(&end, NULL);
>> +
>> +		seconds = end.tv_sec - start.tv_sec;
>> +		useconds = end.tv_usec - start.tv_usec;
>> +		mtime = ((seconds) * 1000 + useconds / 1000.0) + 0.5;
>> +
>> +		igt_info("Time taken for size %s: %ld ms\n", size_name, mtime);
>> +	}
>> +}
>> +
>>   #define PAGES 1
>>   #define NCACHELINES (4096/64)
>>   /**
>> @@ -342,12 +400,28 @@ igt_main
>>   
>>   	igt_subtest("basic-store") {
>>   		engine = xe_engine(fd, 1);
>> -		basic_inst(fd, STORE, &engine->instance);
>> +		basic_inst(fd, COND_BATCH, &engine->instance, 0);
>> +	}
>> +
>> +	igt_subtest_with_dynamic("basic-store-benchmark") {
>> +		struct dyn {
>> +			const char *name;
>> +			int cache;
>> +		} tests[] = {
>> +			{"WC", DRM_XE_GEM_CPU_CACHING_WC},
>> +			{"WB", DRM_XE_GEM_CPU_CACHING_WB}
>> +		};
>> +
>> +		for (int i = 0; i < ARRAY_SIZE(tests); i++) {
>> +			igt_dynamic_f("%s", tests[i].name);
>> +			engine = xe_engine(fd, 1);
>> +			basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
>> +		}
>>   	}
>>   
>>   	igt_subtest("basic-cond-batch") {
>>   		engine = xe_engine(fd, 1);
>> -		basic_inst(fd, COND_BATCH, &engine->instance);
>> +		basic_inst(fd, COND_BATCH, &engine->instance, 0);
>>   	}
>>   
>>   	igt_subtest_with_dynamic("basic-all") {
>> @@ -356,7 +430,7 @@ igt_main
>>   				      xe_engine_class_string(hwe->engine_class),
>>   				      hwe->engine_instance,
>>   				      hwe->gt_id);
>> -			basic_inst(fd, STORE, hwe);
>> +			basic_inst(fd, STORE, hwe, 0);
>>   		}
>>   	}
>>   
>> -- 
>> 2.42.0
>>
--------------Y45amnmAFZIkD30zGXvy5pRO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil, <br>
    </p>
    <div class="moz-cite-prefix">On 6/20/2024 4:20 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Nirmoy,
On 2024-06-18 at 19:32:47 +0200, Nirmoy Das wrote:

[PATCH i-g-t v2] tests/intel/xe_exec_store: Add basic_inst_benchmark
-----------------------------------------------------^

You should use '-', also your subtest has 'store', so:

[PATCH i-g-t v2] tests/intel/xe_exec_store: Add basic-store-benchmark</pre>
    </blockquote>
    <p>Will do that</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add basic_inst_benchmark to benchmark this basic operation
for BO sizes to get basic understanding how long it takes
bind a BO and run simple GPU command on it.

This not a CI test but rather for developer to identify various
bottleneck/regression in  BO binding.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 tests/intel/xe_exec_store.c | 110 ++++++++++++++++++++++++++++++------
 1 file changed, 92 insertions(+), 18 deletions(-)

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This didn't work on my ATS-M machine:

sudo build/tests/xe_exec_store --r basic-store-benchmark
IGT-Version: 1.28-g64414e4da (x86_64) (Linux: 6.9.0-rc6-xe-public-513ea833c201+ x86_64)
Using IGT_SRANDOM=1718890917 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Test assertion failure function xe_bo_create_caching, file ../lib/xe/xe_ioctl.c:311:
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Failed assertion: __xe_bo_create_caching(fd, vm, size, placement, flags, cpu_caching, &amp;handle) == 0
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Last errno: 22, Invalid argument
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: error: -1 != 0</pre>
    </blockquote>
    <p>I guess WC cache is not allowed on dGFX, dmesg should let us
      know. I will check and fix it. Thanks for trying it out.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">

Also, where are benchmarks? Do you print them only after
WC and WB runs? </pre>
    </blockquote>
    It should something like: <br>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">sudo<span style="mso-spacerun:yes">&nbsp; </span>~/igt-gpu-tools/build/tests/xe_exec_store
      --run basic-store-benchmark</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">IGT-Version:
      1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Using
      IGT_SRANDOM=1718739607 for randomisation</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Opened
      device: /dev/dri/card0</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Starting
      subtest: basic-store-benchmark</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Starting
      dynamic subtest: WC</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Dynamic
      subtest WC: SUCCESS (0.000s)</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_4K: 8 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_2M: 7 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_64M: 15 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_128M: 16 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_256M: 33 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_1G: 110 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Starting
      dynamic subtest: WB</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Dynamic
      subtest WB: SUCCESS (0.000s)</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_4K: 4 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_2M: 5 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_64M: 16 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_128M: 29 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_256M: 49 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Time
      taken for size SZ_1G: 176 ms</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt" lang="en-US">Btw I realized --dyn doesn't work, the test executes
      WC always even with --dyn :/ any ideas ?<br>
    </p>
    <blockquote type="cite" cite="mid:20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">See also one nit below.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index c872c22d5..4b1c619e0 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -93,15 +93,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
 	data-&gt;addr = batch_addr;
 
 }
-/**
- * SUBTEST: basic-store
- * Description: Basic test to verify store dword.
- * SUBTEST: basic-cond-batch
- * Description: Basic test to verify cond batch end instruction.
- * SUBTEST: basic-all
- * Description: Test to verify store dword on all available engines.
- */
-static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
+
+static void basic_inst_size(int fd, int inst_type,
+			    struct drm_xe_engine_class_instance *eci,
+			    uint16_t cpu_caching, size_t bo_size)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -117,7 +112,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	uint32_t exec_queue;
 	uint32_t bind_engine;
 	uint32_t syncobj;
-	size_t bo_size;
 	int value = 0x123456;
 	uint64_t addr = 0x100000;
 	uint32_t bo = 0;
@@ -127,12 +121,16 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	sync[1].handle = syncobj;
 
 	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data);
-	bo_size = xe_bb_size(fd, bo_size);
 
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci-&gt;gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	if (cpu_caching)
+		bo = xe_bo_create_caching(fd, vm, bo_size,
+					  vram_if_possible(fd, eci-&gt;gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					  cpu_caching);
+	else
+		bo = xe_bo_create(fd, vm, bo_size,
+				  vram_if_possible(fd, eci-&gt;gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
@@ -167,6 +165,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	xe_vm_destroy(fd, vm);
 }
 
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Remove extra line.</pre>
    </blockquote>
    <p>Will remove it.</p>
    <p><br>
    </p>
    <p>Thanks!</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+/**
+ * SUBTEST: basic-store
+ * Description: Basic test to verify store dword.
+ * SUBTEST: basic-cond-batch
+ * Description: Basic test to verify cond batch end instruction.
+ * SUBTEST: basic-all
+ * Description: Test to verify store dword on all available engines.
+ */
+static void basic_inst(int fd, int inst_type,
+		       struct drm_xe_engine_class_instance *eci,
+		       uint16_t cpu_caching)
+{
+	size_t bo_size;
+
+	bo_size = sizeof(struct data);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
+}
+
+/**
+ * SUBTEST: basic-store-benchmark
+ * Description: Basic test to verify time taken for doing store dword with various size.
+ */
+static void basic_inst_benchmark(int fd, int inst_type,
+				 struct drm_xe_engine_class_instance *eci,
+				 uint16_t cpu_caching)
+{
+	struct {
+		size_t size;
+		const char *name;
+	} sizes[] = {
+		{SZ_4K, &quot;SZ_4K&quot;},
+		{SZ_2M, &quot;SZ_2M&quot;},
+		{SZ_64M, &quot;SZ_64M&quot;},
+		{SZ_128M, &quot;SZ_128M&quot;},
+		{SZ_256M, &quot;SZ_256M&quot;},
+		{SZ_1G, &quot;SZ_1G&quot;}
+	};
+
+	struct timeval start, end;
+	long seconds, useconds, mtime;
+
+	for (size_t i = 0; i &lt; ARRAY_SIZE(sizes); ++i) {
+		size_t bo_size = sizes[i].size;
+		const char *size_name = sizes[i].name;
+
+		gettimeofday(&amp;start, NULL);
+		basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
+		gettimeofday(&amp;end, NULL);
+
+		seconds = end.tv_sec - start.tv_sec;
+		useconds = end.tv_usec - start.tv_usec;
+		mtime = ((seconds) * 1000 + useconds / 1000.0) + 0.5;
+
+		igt_info(&quot;Time taken for size %s: %ld ms\n&quot;, size_name, mtime);
+	}
+}
+
 #define PAGES 1
 #define NCACHELINES (4096/64)
 /**
@@ -342,12 +400,28 @@ igt_main
 
 	igt_subtest(&quot;basic-store&quot;) {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, STORE, &amp;engine-&gt;instance);
+		basic_inst(fd, COND_BATCH, &amp;engine-&gt;instance, 0);
+	}
+
+	igt_subtest_with_dynamic(&quot;basic-store-benchmark&quot;) {
+		struct dyn {
+			const char *name;
+			int cache;
+		} tests[] = {
+			{&quot;WC&quot;, DRM_XE_GEM_CPU_CACHING_WC},
+			{&quot;WB&quot;, DRM_XE_GEM_CPU_CACHING_WB}
+		};
+
+		for (int i = 0; i &lt; ARRAY_SIZE(tests); i++) {
+			igt_dynamic_f(&quot;%s&quot;, tests[i].name);
+			engine = xe_engine(fd, 1);
+			basic_inst_benchmark(fd, STORE, &amp;engine-&gt;instance, tests[i].cache);
+		}
 	}
 
 	igt_subtest(&quot;basic-cond-batch&quot;) {
 		engine = xe_engine(fd, 1);
-		basic_inst(fd, COND_BATCH, &amp;engine-&gt;instance);
+		basic_inst(fd, COND_BATCH, &amp;engine-&gt;instance, 0);
 	}
 
 	igt_subtest_with_dynamic(&quot;basic-all&quot;) {
@@ -356,7 +430,7 @@ igt_main
 				      xe_engine_class_string(hwe-&gt;engine_class),
 				      hwe-&gt;engine_instance,
 				      hwe-&gt;gt_id);
-			basic_inst(fd, STORE, hwe);
+			basic_inst(fd, STORE, hwe, 0);
 		}
 	}
 
-- 
2.42.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Y45amnmAFZIkD30zGXvy5pRO--
