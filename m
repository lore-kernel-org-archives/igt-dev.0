Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8316EC61DD3
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 06:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE49710F872;
	Fri,  4 Sep 2026 06:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6+GP44V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C67B10F872
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788503688; x=1820039688;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lsAeqMC/gckNZT1sNgwxYsTMR/0r7Zq8G7friyWpzzw=;
 b=b6+GP44VG3b41nilqxcgmPcdrUp4AaI2PjfLzNJ8mYyIPu2hAzX2gepP
 inkNCzkFmaLA0joPox5Cye6ZgRu78PKjktKP5OZ9i8qOgb8r16uG+T/Zw
 0AMwwhFqmqY6o8zEb8GkWawtjFywZduEq3ag+5nYrlGHkZDb13/8EkezE
 bcFfd/cPGsVd4mSMnPad3hKXgZic6hKuKnF++sJtEl6XO3fXmTcaz9C5I
 LVtRlY0AedU6PqycBr5y0YJOo+8+ek693I9b5iad4t4+gdMNctAqPKKNU
 3Hfgk8U4KVsImUyHa8C3+niWQ98/a8DWgUiGXB5uH8Rv0bkWWtTeMgXNW w==;
X-CSE-ConnectionGUID: 7Ze7iAjgRIikUVhLpcLpUQ==
X-CSE-MsgGUID: 4wNM4jvUQk+sEmRiY4hWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99596401"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99596401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:34:47 -0700
X-CSE-ConnectionGUID: /lWX8gKwR7K3Rmnz4YWQwQ==
X-CSE-MsgGUID: vKbq7hQXSaW1o7ITWSxiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="270484705"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:34:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 23:34:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 23:34:47 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 23:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSbA6zs7kikHcRg/QkcfrnKcC8Wu77vAVSH/9NbvVLva5csU6jGy/26cyLgc2sg8RxU2FLj1yw4iLgTUIMjut85TCTcIs5GyqRrjh3Wp2lbvGqZLCagbcotLl5hr5YY6EtHJq7RhaLsZ+4ejtZgG3RE2TmHrx9y/uKQgC7vB/Rgvmh7zaoK6+Vp+2iklmAPYf6uvQHzXkbBudki2DzhRb71mvKga0FYdfRqCt82jr8oeswRklQa2gW4FN3OLgcbnGzs4qQ0ASiEtJcIHhPdWYXoIgZmPKliELpRGC7HkbXZT1IQYPjD8xAy2qpdTfXGEwUGfK+/oL+u3TjiEVjxYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kfl+n9q7AdaI1dqFvtQydZzBvXtYLddPijetXh6tel8=;
 b=Uctjxyh4JOoETx3qpKjoj/2CQCQGvgVoPRg5kr/080qs+sym9NCOAKcQeUoubJrlpPGcHj0HVeY65I3RQS/sgop+mmF0zG4YrXmPxwK/OLla1w8yhUBbpAm68NO4Rg5OL9Y0ENEE9GaTQENH+cYNkphzJr5UDIO2RSnbKXEO7sjJxx4TDu9t+7u2WYTCi5+LwW2YQTlsbrLuL48GGY/EN2Cc7P+8Tfaf3Fc/EwyVq1p7R4mbb4R39gTED1RELnJ9HYDqHfD7fwJRiUOeLth+yyU9SuruznZHdgIfQa7zvbafwR6+4X0AfSV7KwquS24GDlxFTE4C08yaT2Vfd0X0Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA4PR11MB9178.namprd11.prod.outlook.com (2603:10b6:208:569::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:34:39 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:34:39 +0000
Message-ID: <3a88925b-980e-4ee8-ab89-8b4f4b01dc9a@intel.com>
Date: Fri, 4 Sep 2026 12:04:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_ras: Add test for GPU health
 indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260902025813.1795134-2-soham.purkait@intel.com>
 <1b4d63c3-bef7-4576-9947-49931878353c@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <1b4d63c3-bef7-4576-9947-49931878353c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA4PR11MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: a3861433-217c-4022-4721-08df0a4e9814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: igI92NFMmHvzYULPTxfOxgr95GpogrPZ1bgLaNB5F6SZqkfd/3Mlq5oXURZkcQruB+pz5SL20IGujAZEPobapHI8vjRO4oFTUERCWmlTrplBki57GyGLGiGeSe5iwToyb16cbD8Bfotp0a/SlUOt3Iiq8l07DsME9dgeFa0cBTorGVz3/+Rloc2k94bX3gESVtW2G0C2w9HCJrKVPaCVfL6DYDgRdPTEYjGPOFRgChZlc6v7qnpdA8FzqrOMHcW60svjzlhLjP0LXvkwWy/QHOQq0OrKtcRbo4XOvIQ5iDJkrW5MltjIERVpzB3JCamugyeFJvEEulEOaJqb+AP6rIZgccdS6Jdax/BWxZEw3Lb0RfAATA7ru2Q4QI1myfCPkHi6iJdVZCGyDdvR6i6750oc4EIJCDR0rxjhJcVmRVLzrsu+jK0W3nsNode9WpQsTtwThJaxERTegLDUhuQBkPbtru1lUqftyPlJ9IvvgM+svOAVJIyUkKL2El7cRq6Xo2tETW+KnAx52Y+8UOP7ObnzrMdTQmjBkjE4aOGQBxDaQCtw8kUknQzB/bzFYJrtNeFQexbSheWQgDj8Zas1DW7+0d0aslXHzrXu6yGbgiPvWJz6gYI/yNzAwyISodKSVxuGB1KguwJpD7hP8hBcXVPx+oJYaz3rJBVeWhE54kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUhONkZnZzZZMCtWSmNpeG4vVjZ2bFNsV2V1NUR3UWNQTmM3b3VJcDFUYnlt?=
 =?utf-8?B?WFIxbVV6NTJNc0RET1pmY0FFUy9WSFVFN2FydlRZcGZuM1hDQ09rWDJsdlF6?=
 =?utf-8?B?bXhYcmswTk5sck9PdC9aKzZEMC9yZ3p1Qnp0UzEwS0FpcDJub25xZDNIYTA3?=
 =?utf-8?B?NmluRSszaWsyQVZhVVV1Z3dwMnVJNlBFSzRSYk52czgycEsrT2NZK3dMOE1L?=
 =?utf-8?B?dm85T3dMRHFzK0g3NElTOXdRU25MNFhNOXNPbngzZEFSeGwzZVkva1dUSGFi?=
 =?utf-8?B?YTJ1c2tiODBBaEJkZVl1UmZqMEd0OHZKQndSeStYZkR0Qzliajg3VjJNdUdE?=
 =?utf-8?B?UEhhSTNUTWwwaFVNcitMQjVkUnd4M0pzVUNtU0thWDFNeDdseVhrZGZUVVBn?=
 =?utf-8?B?MmdMTWtCSE9pTGhWcnlzRXFPMnlWVE5tMVp6OC9JZlBoci9scmJQaTVIam9L?=
 =?utf-8?B?eDBid0QvOVQvQzZvQURIcnlGU0NsQnV2bEQwUTMzK0FiYThXRFNyRU9VVzJ5?=
 =?utf-8?B?RGhjZ2daY2h6cG1qWVpJVGdOTzRxR3o1U3Q2YmhuQ3dIVmRnRXF0VU9DLy9u?=
 =?utf-8?B?ZVU0V1JzS216MS9ncG1HUWI3Wm1UWW5Relg1bHJybEhjRmdyVDB1QW9UczUr?=
 =?utf-8?B?UXNwVVE0OEliZGRzZHFrYXN2bjVJK3lWVXk1aWFza2JOcHhSWGFHN01QQnor?=
 =?utf-8?B?ejhCUHVvT1FRanFDRWZ4a3VnSHphZko4UzhEVGdZRUpCK2lob1pJeTErb0lD?=
 =?utf-8?B?Y05GVjN3dE9VSm1qdU02SFVpSlQvVTFiY0Z3dUFWN0o3L1YzWkpjelJsQkwv?=
 =?utf-8?B?RHVKUnhONFlFYjl1VVFJazBXQ3A0ZlJoRndNUDRzZHdWRHpOYW5UQTd6c3dy?=
 =?utf-8?B?b0JoQ09Bc0xEbElmU0FrS095RXkvN2xCUWFWQ3ZURGlRT0d4TlpVQ2UySXJP?=
 =?utf-8?B?R2V0TjRVcWZlWU50ZFltRkw1Z01uc1JZY1FnWFFYTGJ6bG9SR1dUTmludlNl?=
 =?utf-8?B?RGRzN0dqelZOT1FYRm1pb3lLb3JiWHJaUXFkUlI0TzhlQ2pFN0w5Ym5BWlhD?=
 =?utf-8?B?SmV1MEdXZG1FcXNXdFlOcndqNElTNU5yT3F0U3k3Yk5mRjExNkYycjIzam01?=
 =?utf-8?B?dVllcnQ4aWlPOEhUbHRhNk1jV3R6d2l0cm1oWGZobEpJTHN1bE0wVjhXd1p1?=
 =?utf-8?B?ek52WFhwOGtjUmdrZWlGT2FFTnljVXFMaVRYUU9Hd1lrbVNTVHZVbE55ZEth?=
 =?utf-8?B?REJEVmtoVGhkazBVVytaUWs1aTRzMGpYNzZPdVFrS1BrTnVzTS9zcXpQeHJh?=
 =?utf-8?B?aThsekI3TzNiaTgvaFo4RHhTYUhoazdrMXpZTXBiVEVtaG84eWV0OVAya2xS?=
 =?utf-8?B?UVhKS21vbXl0QVFkcEpTeGlOUTlUempnYlgvSG4vZHUwUDhPYUZ6Uy9DUG12?=
 =?utf-8?B?UTRXLzhaVm9RMmxwOE1vd3J4WGJ2SEdNdDNUVDFtMmUwMys0N3RZMkYyR2g3?=
 =?utf-8?B?YlF6MERPTklvRExTTGZPY3BCaXJkUjZkNkJUc2FUQkxxbGhhUW5ad1A4ZzZP?=
 =?utf-8?B?ajdUcDV0VnhoemM2c0RIejF2KzFCTE5GTXBNQnR2ZCsyaG9hUTN1YW9rQ2c1?=
 =?utf-8?B?b1NrQktUM1gxVGgxSGQ0eDd5ZEJDdmdqRmV1NVNtR0VHVFFHWjhHb1JxeWtN?=
 =?utf-8?B?TUcwWEdlU1puNmVzY0RCdmp5ZGF4Tlp3NUN1SGswTmljd0FvVjBwK0pldnAy?=
 =?utf-8?B?bEdjVnpHaExhOVNwVXRvaVZ4ZTEzTW1sdmg0WXJCcjF4dWxoaEFLOFYyMGc1?=
 =?utf-8?B?WE9TcjMzMEtEeVhUNnJrZEU0clNHajM1ZUdXcHJHMG5YRld1bUladkRySmdJ?=
 =?utf-8?B?ZkttaHVaMDdpMFE4aHNLMGVaNDhEdURQdHI2N09ha0U3KzdXUEw4RFpUYStp?=
 =?utf-8?B?T2kySm5hajlPV2RFZmMrNG95MlFseFhmbGdkMVM3TXpWb0kwcjVLZStDYnFK?=
 =?utf-8?B?S0JMalc0TlVjMDdrdmhPeVdvRDVodHBUdjMzamV4dllYL2JtY1ZzZ0NCbWlr?=
 =?utf-8?B?SGh6ME9OWUxtT2EreWNpWStvUXZtRHBEZVJEa3lzSmk2VitlZmFocUJheW1T?=
 =?utf-8?B?WGliaGxuaDFwenRHT29DWFRITTZYODMxWlhuNnhFQ0hkY2U1UzBlYnVJYjYy?=
 =?utf-8?B?NGMxSFQ1NzR4SllibzhHN2FOWm14RU5nQVdic0NHWUJSdS94Kzh1ZEp3TjBu?=
 =?utf-8?B?cTB5WWMvZFdHaTcwU21GSnQ3K1NLekQ1TTh2U0dPSFkzZnFUS0FnTm51dFda?=
 =?utf-8?B?bFVZSEhIUHlkZC8xeG1CaDFQR0x1R1dYTnJGT2lPRmhISWhNQnFTUT09?=
X-Exchange-RoutingPolicyChecked: j0aHIlqI6WDyD7i2+UoVrjyxKxm9DssolrEWBcP1H+/+AYlJdP2nc9tmLhVW47/YvEmK0yZ63d8yqI+wfLpQqQ+I9CVY/Px1DUG0M8JfDz26xOcllseifuNamYgWL2OPiZn3X/CkB59TA8gX1H7OKe6sCIXBjRPLMPivwlmP5zw59acLiE2r+3IkvViGYgs4kvlmJVjZguVEEmDh95v076TiDVgzfsAPa6wQuCtpFOrVCEI4FZlPSQRem8VE9NG7P3TZv85H9TpQEvoqBypqm7VLBNfWRPPzqOcpU+5UVzt86q2lP9vld1MSTf6V9nUl5gSc/zCXyuB1T/nY7XzRbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3861433-217c-4022-4721-08df0a4e9814
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:34:38.9233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXo6M05Ih9VmIHBpuE4cMZk/hJptXdEQOVTYTwjod5/UQUj1lke+o6eWajrxegwzMQ2+MWXhDHQGARhMCCFuqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9178
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


On 04-09-2026 11:54, Tauro, Riana wrote:
>
> On 02-09-2026 08:28, Soham Purkait wrote:
>> Add a new Xe RAS test exercising the gpu_health sysfs attribute
>> exposed by the Xe driver on platforms that provide the system
>> controller. The attribute reports and allows updating the GPU
>> health state.
>>
>> The gpu-health subtest validates each valid state by writing it
>> and reading the value back, and checks that invalid writes are
>> rejected with -EINVAL, guarding against regressions in the
>> implementation.
>>
>> v1:
>>   - Platform-conditional skip w/o fd leak. (Anirban)
>>   - Restore via exit handler. (Anirban)
>>
>> v2:
>>   - Remove dead-code and extra comments. (Anirban)
>>   - Initialize exit handler under igt_subtest. (Anirban)
>>
>> v3:
>>   - Move igt_info to the normal cleanup path when
>>     restoring gpu_health. (Anirban)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_ras.c | 131 +++++++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build    |   1 +
>>   2 files changed, 132 insertions(+)
>>   create mode 100644 tests/intel/xe_ras.c
>>
>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>> new file mode 100644
>> index 000000000..f3b507ce0
>> --- /dev/null
>> +++ b/tests/intel/xe_ras.c
>> @@ -0,0 +1,131 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>> functionality
>> + * Category: Core
>> + * Mega feature: RAS
>> + * Sub-category: RAS tests
>> + * Functionality: ras
>> + * Test category: Functional tests
>> + *
>> + * SUBTEST: gpu-health
>> + * Description: Verify the gpu_health sysfs attribute accepts each 
>> valid
>> + *        state (ok/warning/critical) and rejects invalid writes
>> + *        with EINVAL.
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
>> +
>> +#define GPU_HEALTH_ATTR    "device/gpu_health"
>> +
>> +static const char * const gpu_health_states[] = {
>> +    "ok",
>> +    "warning",
>> +    "critical",
>> +};
>> +
>> +static struct {
>> +    int sys_fd;
>> +    char *orig_health;
>> +} gpu_health_ctx = { .sys_fd = -1 };
>> +
>> +static void restore_gpu_health(int sig)
>> +{
>> +    if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
>> +        return;
>> +
>> +    igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>> gpu_health_ctx.orig_health);
>> +    close(gpu_health_ctx.sys_fd);
>> +    gpu_health_ctx.sys_fd = -1;
>> +    if (sig)
>> +        return;
>> +    igt_info("Restored initial gpu_health to '%s'\n", 
>> gpu_health_ctx.orig_health);
>> +    free(gpu_health_ctx.orig_health);
>> +    gpu_health_ctx.orig_health = NULL;
>> +}
>> +
>> +static bool valid_gpu_health(const char *s)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
>> +        if (!strcmp(s, gpu_health_states[i]))
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void test_gpu_health(int xe)
>> +{
>> +    char *health = NULL;
>> +    int ret;
>> +    int i;
>> +
>> +    gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
>> +    igt_assert(gpu_health_ctx.sys_fd >= 0);
>> +
>> +    if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
>> +        close(gpu_health_ctx.sys_fd);
>> +        gpu_health_ctx.sys_fd = -1;
>> +        igt_skip("gpu_health sysfs attribute not exposed by driver\n");
>
> Won't exit handler be called here?
> Wouldn't it be better to skip on gpu health sysfs open.
>
>> +    }
>> +
>> +    gpu_health_ctx.orig_health = 
>> igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +    igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", 
>> GPU_HEALTH_ATTR);
>> +    igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
>> +    igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
>> +             "Unexpected initial gpu_health value: '%s'\n",
>> +             gpu_health_ctx.orig_health);
>> +
>> +    ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>> "bogus", strlen("bogus"));
>> +    igt_assert_f(ret == -EINVAL,
>> +             "Write of invalid value to %s returned %d, expected 
>> -EINVAL\n",
>> +             GPU_HEALTH_ATTR, ret);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
>> +        const char *state = gpu_health_states[i];
>> +
>> +        igt_info("Setting gpu_health to '%s'\n", state);
>> +
>> +        igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, 
>> GPU_HEALTH_ATTR, state),
>> +                 "Failed to write '%s' to %s\n",
>> +                 state, GPU_HEALTH_ATTR);
>> +
>> +        health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +        igt_assert(health);
>> +        igt_assert_f(!strcmp(health, state),
>> +                 "gpu_health readback mismatch: wrote '%s', read 
>> '%s'\n",
>> +                 state, health);
>> +        igt_info("Verified gpu_health state readback for '%s' 
>> successfully\n",
>> +             state);
>> +        free(health);
>> +    }
>> +
>> +    restore_gpu_health(0);
>> +}
>> +
>> +int igt_main()
>> +{
>> +    int xe;
>> +
>> +    igt_fixture()
>> +        xe = drm_open_driver(DRIVER_XE);
>> +
>> +    igt_subtest("gpu-health") {
>> +        igt_install_exit_handler(restore_gpu_health);
>> +        test_gpu_health(xe);
>
> Wouldn't it be better to have dedicated subtests for each value 
> instead of
> adding all testcases in a single function.

Yes that's a good point. better to implement like that.

thanks,
Soham

>
> Would be easier to find during analysis as well
>
> Thanks
> Riana
>
>> +    }
>> +
>> +    igt_fixture()
>> +        drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 1ac89bab7..3c2d4fdda 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>       'xe_prime_self_import',
>>       'xe_pxp',
>>       'xe_query',
>> +    'xe_ras',
>>       'xe_render_copy',
>>       'xe_vm',
>>       'xe_userptr_pressure',
