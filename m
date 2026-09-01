Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315B1C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 09:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF4410E3C6;
	Tue,  1 Sep 2026 09:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNpPHUDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD96C10EC48
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788255963; x=1819791963;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BlXEIlDR4ZJMln8eecOMJda8BSTH5e+/wj4CdfDTPOo=;
 b=BNpPHUDLFsRDHX0g33T3O2FsOTiUYVvZXrtcYQXUB8k2Gkk5Tws9PPSk
 bHeDl+3ZM9b0ChM/m7UaCsqE3ez9jRiHPBJNrWemRHFccljp8mL41CU7A
 d523hPwQ74Mf+y0sTdeFy3MoyprzvuI8VnLn3nfaBiCKBoJ2HMFtanQfd
 YtJB7Jz9o3Iuuj6JZTvCgvBQwFAAr1DLJVPXEiLOLsBSEPRbq2GF/F4r0
 leSr34Q4fcfNdfTWIUvKz+pDmWt7+WJjX9kTHolSNfrT0++VzlUoupBbr
 IMrdjpMD6xaiw9VbHfDbcSzvJ6bCRRgpK/d8fTm5XlK/xLoSW7WHnw6Il g==;
X-CSE-ConnectionGUID: 9olJUWbxSkO2EcjE8l3bgA==
X-CSE-MsgGUID: rH6ZYBGjQnKpzBS3pB72ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111449647"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="111449647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:45:56 -0700
X-CSE-ConnectionGUID: vrUakfyIR56DKRki1RB+Lw==
X-CSE-MsgGUID: 3iMTr0dlQVSsyGZ1RGMGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265329818"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:45:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:45:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 02:45:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ71j/yltcXJAgKkuQi5ynQofsCOPLVKJkLFgH9ibrYw2ttyRkK0eXqEAnqQ+akA+0CIe/QNLis6RVV/QObvfxkujhra36qkdl9Xem33gu2vqv5N25lfAUsaDGwWCkfHy0Hm8wRmqQaSVq2Y+wOmWPc45parkqLWqqJDOAFKcX+IDFDgH6+HrhN1lsxIJcEJWl4gBJhHnzO0L6Fw/GkLQIjh46h5Qbata+wkTKYxWLx5JIV8ZcVjpsmRRKo5WtHYS9NZ1eYNT5H9dubWDEZ7zh8bTMyOsigB7/vfCj1umdz4kqnks+nTSsdlgZdHe7eQnd9f8ZyAm3AGLaFsp9NoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQocR07HBSyp1sWj5bRT7sTrgOYMJhiTHp0kpd2+zPo=;
 b=x1GZVuXHJfpN9jQFJ7yQGPXe0XC0oUoWbSBjjrVybCzG11ZkTIvFqj3KFCgnMsByauKn0vNfieQ+uWlZOCNd9qTfVl70XQrzU59TeFpduaTiLRcAuegWo9nuAoJ1j4nR2X3jUjC3z0qoeruL0Wcv98usOGEsGpKkMuMBhqofqJK7g75HuNNkIHzXEspC4rj64ZMNbTlesetc4dBEcO9pxD/JLRZ5O4PHWWDb5MqpH0WLSAkgwwNhpHjIy4jBE2uZ02lvG7fbh/xFiF+MacjMjee37V115WEjKo3651j0hPvevVhMoh9iBMsKDHS2nWBZngEfpy344ut56HxxYYNvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:45:53 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 09:45:53 +0000
Message-ID: <5834802f-36f9-4e4b-85fe-71b812fa0415@intel.com>
Date: Tue, 1 Sep 2026 15:15:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>, <soham.purkait@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
 <apEAAXg8re_KxkUB@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <apEAAXg8re_KxkUB@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::9) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bb56be-9fd9-43f5-0017-08df080dd017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|6133799003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: fs+t0ix9zZ9sE5Eh94g7AoNYx2ZPJmA8H/gqVMBnv1BeujcSJZX3osycjNtbxK2sMlLwSXwwdwgOvdjiiKuxEKFG0ruxiVE8Ngziow91XRYwLT8IopHD5EqFve4nAclkUiGgeghtBFZIk/RCK3nj3cbSiiG/7JNb8UJLsJDHJxAFmgfa7UVa40kJyGXvG7Aww1We72my8Hv1itnn9ZcBcG30glN1ldDdTwB9e/34XMcEnE+Q3ZQb45+lnnCs2a+vzaUcyOV1kOWycFqLAZ0p/flujfEzqrXQbmgTtfotEM6Ul/iCz6qnnlaeRu55oSczrBXm+TOIz6mq4xUDEckr9eG5ZqIs+SNuIhrk1BAtIrY58C7FbGfsQJ/WWLfI+LyAWPIk6q8SVzQPV/SDDeuCXf2vyqQWrpp/8TpyLZI4yptsKEpa/QOmaC8aEravL2SyTUXFhHKRneLpO8S74lRSeiwnSLtlNw++0tE0sRxS+0qvjLNK+FLoREXLw3BHxVOMK0WkXZmM3MIewzBR9bjo9ISk1ssKvHhwkeJXK4vCtHNtSuBY/SVP70O1lVZvobHgkMbaupPzONjORofyxd+8kI/SZLqH9PGbXsInPPWeOPx4D4maopREt75YZM+BGHM9LttvLsSmcVX6wThe/nQinel4FCKaNeoYVXRpA4ZVeqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clZLM2ZvM2RPaElRa2dBOGdIN1pTVmI1SkVMRWkzQmgwMDRnTnlHSFFhTElZ?=
 =?utf-8?B?UEljZVJpbkV3Qm1hSndDeXlaT0JDRU53QmhyS0Fudk5icS9HcW5oWHgvN0tX?=
 =?utf-8?B?azZ3QVRHVVJxUm5UeVJUOWovbTYxQ0pqS3Q1Ky9VYzJSbmZpOHMrZ0gzU2JH?=
 =?utf-8?B?OGNzaE9UWjVsN3NBM2djTkFRamhYRXBkbW9pWi9HL0NJV1dTOTlxK2p2UHlu?=
 =?utf-8?B?VlArZnVGektaUGR1R25FRUZtQ1pmVmFNVVhLTFJ2dTFyUWlUQXd5T1VYOVpO?=
 =?utf-8?B?eERIeFNZdVZUbFVJaEJjRVg5VUpHdWVTUDNvVnBUcmNOZU02eHdkeC93MjFQ?=
 =?utf-8?B?dE1YbU11U2ZaMWRjRXBCSzUwQ1Z0MldLbVFrZlVpQ2Vremc0eWZUa3dUUlhv?=
 =?utf-8?B?UTkrejMwSUU0TW1pMU5VdUdOM0xhemg1UUNQQzkraUVGdys0SHdJUFFualg2?=
 =?utf-8?B?Uzh0eUR1NGZ1TmFBQkZOMkF4MWNqTG42ejB6Uk9TcVkwMXRKRlNKcnlHWUJn?=
 =?utf-8?B?WnhZMFVXNEdlNHRyOGptMkh2VXY4UlZzK1NYN3pnNVZiM1hJVnUwN3I5aGVp?=
 =?utf-8?B?eWIzV0o4MXBadUR1cm16THBkNllWVGlUNHRHMzFqR0R1NDdpY3lmVjMrTUkx?=
 =?utf-8?B?RzE2TUlDWWwwVVlPKzZiNUN2YWZhUmh1anNtbVlkYVFQYy9FMW9hd3VndWZ3?=
 =?utf-8?B?U3dsakVwS1hCVlNmVzNPRy9BSnlMcjBoZFhIT2VLQzhNOUFYTjFhQ1BhTktD?=
 =?utf-8?B?NmdDc1kzdHBHb2dtWHR6Q3pJNkpoQS9EOHpBV0tGbW1MNCs1NTlnQVRmdTR5?=
 =?utf-8?B?Wlh0QnI0VDNGOUxIWDV3cURrYUk0M3hqWFk2YTVsdXkxU0s3RUJxbXNOZ3ZP?=
 =?utf-8?B?ZWpPSVBvZitzYVI1NzBoVVlEOWVGZFByWU93c2thY1VnVlpnTTJtcUFad2RZ?=
 =?utf-8?B?ZXhQTE9EUHpDaWhXZi9BVHhVYm5uZE8wKzhwWEdqL2RyYXdQajhPVGtVZDVl?=
 =?utf-8?B?eEh2R3BTODVFSUhmZmNOWnNlQUZ4dTVQZ0JzTTh4RnA1MWNTR2lEQ2xabWo0?=
 =?utf-8?B?ZlFmdjlGK2N4VDc2SDZ0dExXTnBhajF5M3BPQVhhRUtrTDYrNDBqWTg4Q2o5?=
 =?utf-8?B?Ty9vMURTdVVTcjNhc0hyaUV2SGZpWVY0QzhuQXJiRWo1bC9GU3lHKytxOTlU?=
 =?utf-8?B?bTdlSm10REdJOVVPVjFLL29KSGNYRzdBU1NRcE1GVkt5TnZzVXZPb1RUR0sw?=
 =?utf-8?B?VHZhTWx5TnBJSTBOT2tBbE9GMTgrc0VueGp4WXB4M2Z3NEJPZmdyVHA2anB1?=
 =?utf-8?B?NjcyWWs3alU0U0NWcHFkUjlVeFVrOHkyQ0RsRXJENXNJME90NnJtVStKQ09v?=
 =?utf-8?B?SEpoZWNJdkV6d0lDZGprNElpODFLUG9KRzYxOHVxbTVKNE5hS0QrM3YyajlH?=
 =?utf-8?B?TVN4bzl5aDhmenRVeC81Sm1KT0ZDODNFamZqd3g4bjBuRGhIdkVhNzZyYVRO?=
 =?utf-8?B?L2s0MG9GSDV6bEhrV0svc2RpOHdxaW56SXd5bkhQMkg2M01Mdzk1aDZYN0s1?=
 =?utf-8?B?SHd2Y1U5QWFqOEZEQXdROVY1OVVFeS8rUUJQS0lwRnh2YkkzRExYM2YxTFg5?=
 =?utf-8?B?N004RGQ0OUNELzlnOUpXYWYxN3IvdmxZblVCcjlaa1UrNVF0c0dxWkR4bTNi?=
 =?utf-8?B?TjlvR01WV08yVkFNdHc5YW1jcHF1cW5RVFBseHlWMVdkMXV0WXU0SU1PaTMz?=
 =?utf-8?B?Q3pZc1JRa3RITEk1Y2ZSOUtxTCtoRUJjZE5pNTZPdWwwTW5yMUtqQVJwMnc3?=
 =?utf-8?B?ZDBIQ3Z4TDJzMHVyZDBzTFN4N2s3bkY3aFcyNVJLaXFoR0FPU2xoSWR4emVi?=
 =?utf-8?B?cCswNkxtdTRPczg4OVJLblNjbHF0T0lDSnNsNXZKZ2lERGZETjBHZVV5eUc5?=
 =?utf-8?B?bWpPTk1JVnJuekZtMnkvOGxmdTRWa0lKVmpHOXorRVhlOWtOcHdtRlFaSU1a?=
 =?utf-8?B?QVExTDYxYlcrTmdkNDN2ZGVFemZWVnpsdCtSTy91WCtHZU9UWGhuVmpwTEU2?=
 =?utf-8?B?a3RzcFJ0alhpV3ZJbEhyQThGdldtSXNRdjREYyt6U1E0RGZUeVpuVG5UTExN?=
 =?utf-8?B?OVQ2TjNoZzErTWRhMUM1ZFlXTzFsaTFUY3IxYUFNaDVEVUNFMW52RG9uWUJ0?=
 =?utf-8?B?Y1lhVmtOWTBCUm1hRHpkUjMyQmR5cnRaUTRqYytueUMzSWs5bHczV1lSOFFy?=
 =?utf-8?B?L3doUVlhVFZ4ZnlxemRpc3U5OU9VOUY5N0FSSUNjNjNQb09wYktOMHNzNWlD?=
 =?utf-8?B?ZGhuMlZqSDB5bXhNV0IyT21hU2lRMHgwWjcybWJwRG9mTEdNQWErWXNHVGZQ?=
 =?utf-8?Q?WSKESyZycTu801GItbFSfoGaJDp7gjkMkC4T1?=
X-Exchange-RoutingPolicyChecked: lfKamt4f+sMYyKag1x62lAeeR8hkvmJUih99uBWI1+Ke7aqwF319GxTeZDZmJyC9SXetKcY++GcKben7PejjMOEKmRS7ZBZrp6q3fDRlkWk4OcbYLIwIYbXYL4OssXoFt2ivHjgahuXhKtQ+eCZXJUpv0ZK7EU5R1AkRzKfXVDA8oeEoKaTF0xe3qyMbRh5k0IDwaCUoB/q74HFIZY5B9WGz6y4WRN9Be9sUbVnoiiUH/L9DucGTOe8UkHGrAUTGEURxD+84cC2LDPKn9T1RFWAhjKMm+iYaxtgFrGae9t13w8gy41f3Ft/EV7eRSe31JLsP0G1KBKat6erAU5VXzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bb56be-9fd9-43f5-0017-08df080dd017
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:45:52.9748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPGCIza4tG78bHVz6g4CVcgz1gU74vrA33vMMF7cUKlZeqQNpMDvYr5lQOErcLfxNzlfmx8JUq+1tU/J72M0H1b6iFKOmtYGYAljfGabIRv5gPK7mvroD2uiri0EdBj6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
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


On 28-08-2026 08:56, Harish Chegondi wrote:
> On Mon, Aug 24, 2026 at 10:11:30PM +0530, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  18 ++
>>   tests/meson.build              |   1 +
>>   3 files changed, 340 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..ded5f558f
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,321 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +	RECOVERY_SUCCESS = 1,
>> +	RECOVERY_FAILED,
>> +	RECOVERY_TIMEOUT,
>> +};
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +
>> +	if (state == POST_ARMING_INJECTION_WL)
>> +		igt_info("Running compute-square on all engines post injection\n");
>> +	else if (state == POST_RECOVERY_WL)
>> +		igt_info("Running compute-square on all engines post recovery\n");
>> +
>> +	xe_for_each_engine(fd, hwe) {
>> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +			continue;
>> +
>> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
>> +								    EXECENV_PREF_SYSTEM),
>> +								    "GPU does not support "
>> +								    "compute on engine\n");
>> +	}
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
>> +{
>> +	xe_mmio_write32(mmio, reg, value);
>> +}
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +			   uint32_t bit_mask, bool set)
>> +{
>> +	uint32_t regval;
>> +
>> +	regval = xe_mmio_read32(mmio, reg_addr);
>> +	if (set)
>> +		regval |= bit_mask;
>> +	else
>> +		regval &= ~bit_mask;
>> +
>> +	xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +	int fw_handle;
>> +
>> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +	igt_assert_lte(0, fw_handle);
>> +	return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +	if (fw_handle >= 0)
>> +		close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +	struct app_context ctx;
>> +	int ret;
>> +	uint32_t error_value = UINT32_MAX;
>> +
>> +	ret = igt_init_nl_socket(&ctx);
>> +	if (ret < 0) {
>> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
>> +		return error_value;
>> +	}
>> +
>> +	ctx.node_id = node_id;
>> +	ctx.error_id = error_id;
>> +
>> +	ret = igt_get_error_counter(&ctx);
>> +	if (ret < 0) {
>> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
>> +	} else {
>> +		error_value = ctx.error_value;
>> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
>> +			 ctx.node_id, ctx.error_id, ctx.error_value);
>> +	}
>> +
>> +	igt_cleanup_nl_socket(&ctx);
>> +
>> +	return error_value;
>> +}
>> +
>> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
>> +{
>> +	char *buff = NULL;
>> +	size_t buff_size = 0;
>> +	ssize_t line_len;
>> +	FILE *fp;
>> +	const char *success = "AER: device recovery successful";
>> +	const char *failed = "AER: device recovery failed";
>> +	bool marker_seen = false;
>> +
>> +	fp = popen("dmesg", "r");
>> +	if (!fp) {
>> +		igt_warn("Unable to open dmesg to check recovery status\n");
>> +		return -1;
>> +	}
>> +
>> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +		(void)line_len;
>> +		if (!marker_seen) {
>> +			if (strstr(buff, marker))
>> +				marker_seen = true;
>> +			continue;
>> +		}
>> +
>> +		if (strstr(buff, success)) {
>> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
>> +			free(buff);
>> +			pclose(fp);
>> +			return RECOVERY_SUCCESS;
>> +		}
>> +		if (strstr(buff, failed)) {
>> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
>> +			free(buff);
>> +			pclose(fp);
>> +			return RECOVERY_FAILED;
>> +		}
>> +	}
>> +
>> +	free(buff);
>> +	pclose(fp);
>> +	return RECOVERY_TIMEOUT;
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +	time_t start_time = time(NULL);
>> +	time_t timeout = 5 * 60;
>> +	int time_interval = 30;
>> +	time_t elapsed_time;
>> +	int status;
>> +	char marker[128];
>> +
>> +	snprintf(marker, sizeof(marker),
>> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +		 getpid(), (long long)start_time);
>> +	igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +	while (1) {
>> +		elapsed_time = time(NULL) - start_time;
>> +		status = check_dmesg_for_recovery(marker, elapsed_time);
>> +		if (status < 0) {
>> +			igt_warn("Failed to query dmesg for recovery status\n");
>> +			return RECOVERY_FAILED;
>> +		}
>> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +			return status;
>> +
>> +		if (elapsed_time >= timeout) {
>> +			igt_warn("Timed out while waiting for error recovery\n");
>> +			return RECOVERY_TIMEOUT;
>> +		}
>> +
>> +		sleep(time_interval);
>> +	}
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>> +{
>> +	int recovery_ret;
>> +
>> +	recovery_ret = check_err_recovery();
>> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +		     "AER error recovery timed out\n");
>> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +		     "AER device recovery failed\n");
>> +	if (recovery_ret == RECOVERY_SUCCESS)
>> +		igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +	if (val)
>> +		igt_info("Injection: %s Success\n", err_name);
>> +	else
>> +		igt_info("Injection: %s Failed\n", err_name);
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +	int fw_handle;
>> +	uint32_t error_counter_before_inj;
>> +	uint32_t error_counter_after_inj;
>> +	/** TODO
>> +	 *  Fetching node_id and error_id dynamically is pending to implement.
>> +	 *  For now, using
>> +	 *  node_id=1 (uncorrectable_errors) and
>> +	 *  error_id=1 (core_compute)
>> +	 */
>> +	uint32_t node_id = 1;
>> +	uint32_t error_id = 1;
> It would be cleaner to have #defines for UNCORRECTABLE_ERRORS and CORE_COMPUTE and use them here.
Sure. I will add them in the next revision. Thanks
>> +
>> +	fw_handle = acquire_forcewake(fd);
>> +
>> +	error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +	/* Arm the injection sequence. */
>> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +	modify_reg_bit(mmio,
>> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +		       true);
>> +	modify_reg_bit(mmio,
>> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
>> +		       true);
>> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
>> +
>> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +
>> +	release_forcewake(fw_handle);
>> +	print_aer_recovery_status();
>> +	error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +		     error_counter_after_inj != UINT32_MAX,
>> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
>> +		     error_counter_before_inj, error_counter_after_inj);
>> +
>> +	igt_info("error counter: before injection=%u after injection=%u\n",
>> +		 error_counter_before_inj, error_counter_after_inj);
>> +
>> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
>> +		     "failed: before injection=%u after injection=%u\n",
>> +		     error_counter_before_inj, error_counter_after_inj);
>> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
>> +	gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>> +{
>> +	igt_info("Starting Error Injection test: %s\n", injection);
> Can this be an igt_debug instead of igt_info? There are several
> igt_info()s in this file. Do all of them need to be igt_info? Or can
> some of them be igt_debug to reduce verbosity?
Ok. I will see if anything can be converted to igt_debug(). Thanks
> Thanks
> Harish.
>> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
>> +		wkr_cmd_parity_err_injection(mmio, fd);
>> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +	else
>> +		igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error injection.
>> + * Functionality: workload validation
>> + */
>> +
>> +int igt_main()
>> +{
>> +	int fd;
>> +	struct xe_mmio mmio;
>> +
>> +	igt_fixture() {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>> +		xe_mmio_access_init(fd, &mmio);
>> +		igt_require(xe_mmio_is_initialized(&mmio));
>> +	}
>> +
>> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
>> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
>> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
>> +
>> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
>> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +		igt_require_f(gt_uc_wkr_parity_recovered,
>> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
>> +	}
>> +
>> +	igt_fixture() {
>> +		xe_mmio_access_fini(&mmio);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..d7efc2fd2
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* GT Uncorrectable unicast worker command parity error injection */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>   	'xe_debugfs',
>>   	'xe_dma_buf_sync',
>>   	'xe_drm_fdinfo',
>> +	'xe_err_injection',
>>   	'xe_eu_stall',
>>   	'xe_evict',
>>   	'xe_evict_ccs',
>> -- 
>> 2.34.1
>>
