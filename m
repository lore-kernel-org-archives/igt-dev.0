Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF05D21680
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE01510E223;
	Thu,  4 Dec 2025 21:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwe4Xrch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35110E1D0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764882704; x=1796418704;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/nEUvB8RHcpJdyIna78NxtLr9hD8palFQzYDgKix7hY=;
 b=fwe4Xrchh8KwPzYar9kbFhqlRnQLau3ep/ERzjLLHfoDKSo5RIPquOFf
 Tw7+24VNGPyqPFCP6RYAQ0Ic+8j7x2Gn01xyEHip8DQFjhA5pZHQgl/a6
 f8Vl24zx4QEn2vX4JZHsQlM3rcg3Dm8lSHshvkO/01Zq2/TtyjX7epVsH
 +pnTFSMuTsRLiS5pyjdebK6GoWuVisIx7vYBf6NIxGYX3NJx6IDqapVwu
 rNM2j6//g/vC2KhNr3XyI+mG5JsXMBSdixsX+1IQURgaH+FWOIeiPeELQ
 Copsy+yww8g/0rcae/RFRJskXoc8YpJixhuYNSM6j1E9Z9IECBf1hkHDW g==;
X-CSE-ConnectionGUID: 3pZlystLSOKqoF17Slk8+A==
X-CSE-MsgGUID: Xdp/4bnZTgOLK/SRGDnlog==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78380812"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="78380812"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:11:44 -0800
X-CSE-ConnectionGUID: ZW/vIzP0RxS+405N7wmutQ==
X-CSE-MsgGUID: qjaL+L2KQ9WJ76LctYPXhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194370340"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:11:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:11:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:11:42 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0R/hgAJh07bW+Es8S7bazTDf+8/uMO3yC0uAoK/lZR3Xl2uHwS1e/DGNm2QFRGI4ElNd62QwhSAKHVnrfsRQkFmXZDLhkFXCQbDqF9EG7CWWwAgwFns6WLyuFp0m79S4tnxr7BZnhdtjP8kM2OEgzZOd6XJS3na0zOb3WlDwSUor34r/Use9H7OL8UnxI3wIjcoV/ysrDaPvjOZrkJKaGL36mFpUFEviCNHJGloadrVAqCqajvKF0umHet76V2U7jtSkmtG9iK9G1tVCyehoigDCYwP3tuMF9fFmHjo8XTEW8QxYirmV2uVpWyHlxMcstM9Y6oR8SaIPzJgXWT4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qH63h2z5iYFbR7110uPdpt9nmlz4bqexi0ai3JdD8E=;
 b=LJ8nevLxf3trf81YW1y6X7q4pydzVtOw5qJrj2o5652DroYqR4R5HcZ07o/c5RVGE55w05y7ksqB8RVtRBZlErrP9j9NUoUOQAMRvaxZVXbe0/2FjeM9SJMElKfEfJ0WsejwkRWrNfF8Zeq+yvf6+EMwT2FkbNFNiyIqk1kiNYFao2hwDhPtdTvYeAIRG7iG+nOYoWX6RVj3AAMMC4YDqdxyCPg0cZ038svP01k/flUxd5DbO7PPFQvzmVEzxo0Gn6TveR/cIgpbuBOWtmK6frowhbb1Tduf2vUmBASCa2WTd4Mpt3LqhT8ogRqRX3tMmswKuM3W/uaaVEKJ0kF8QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB9477.namprd11.prod.outlook.com (2603:10b6:8:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:11:41 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:11:40 +0000
Date: Thu, 4 Dec 2025 13:11:38 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 19/19] tests/intel/xe_exec_queue_property: Update
 invalid-property test
Message-ID: <aTH5CpqKRs3CmODB@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-40-niranjana.vishwanathapura@intel.com>
 <56a5f6f12eba5afb1e6aa8f2909a969f6c824f4d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56a5f6f12eba5afb1e6aa8f2909a969f6c824f4d.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: dc703f03-494b-44dd-db98-08de3379b82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6NFVp5u3qr8i0BAw32yaNnULptre6EtNBrowfsIxsIK30r142B5y7D2VkQ?=
 =?iso-8859-1?Q?E7XLOBaPmuDos3KDPT4FXKd/4gHeTGxrfk/3DU9vvpR1bsz1mNSDFjKel8?=
 =?iso-8859-1?Q?Ye90KrX3+PNVHgwwY4WbJNB+/mlMpAGWwOqeUxIoTa57ntAiNV1/KOvCZL?=
 =?iso-8859-1?Q?MbY7hG7JBxu76DvBVq3uV+UbQgV6us1fZdoBepfOcAHu4c2BM7BF4QXVED?=
 =?iso-8859-1?Q?gHRGSgdsRmLIpjjeiNxR+oCDerMZ6UrvJlJC6SyQH2k0FiQW309uVKg1ll?=
 =?iso-8859-1?Q?9gEeCL/MEyfTfdUBSIv3HTSr75r2lyM0ScksIa3a3UrFAb7Jvo3osGt3ug?=
 =?iso-8859-1?Q?qKh426HRm9ukMlQas02vfa7c9vfYPq0Jin4HhjBiYDjyRFOFA7YRxNTFRg?=
 =?iso-8859-1?Q?mQZhgOO08mMvfIUZI6W8dqtT9bPcBcB18iUNlI/h9mORNBulUaGk5sUNOv?=
 =?iso-8859-1?Q?tGSz6lCQHIzVOvtYpqIwbifGYIXfg3y9I8YM6lQ/HaByGbk4sDIfgsSm88?=
 =?iso-8859-1?Q?wOvxz3xC/m5cs1bnPl3mgmP8HD+7DWodERSqiHY4cASftywerGHdWJFOjB?=
 =?iso-8859-1?Q?tgeJD9cAZXboNJfGVM0W/GcF/MMflt0V2yhoWBCWH75yXJpGYpIK9k+kKb?=
 =?iso-8859-1?Q?TWNQJ1JC8clnloNKU1A+2ukPjQP9QGuUFCmkZM5NizjBx6Vsx3QDkneX00?=
 =?iso-8859-1?Q?5b22vSn14Ayx1BEVRi1X9Ojxrub7Dzg9DKlVE01rUt3IWSFyWax/Xjw7Ab?=
 =?iso-8859-1?Q?DDPz7QPAyd1Lvwc9oJw7uPLKyrlb4yyVZ2VX9y2qotGRDa2i8MZlbKO/6P?=
 =?iso-8859-1?Q?FKSLCPzW9NQR9kPgq7W1g4xLfITw6v3rWucwIzjAmGQjJEGrVsV8hfLm+X?=
 =?iso-8859-1?Q?zpOV9/P0hlh7UIyT9be8s26Ox2xox6WcFSPVlZtBqf+2Qo9m8PssVroSwo?=
 =?iso-8859-1?Q?p5OaPkv7mdEJwKXsAXeBpmtoOlw6NYJoeC4JQQAErw+DRAboz3Ot0nwpde?=
 =?iso-8859-1?Q?rAw5obxZp1/pGJgL4NQz+VOjzqZiJqv0HCS7LvUKlr/FJdSmOWaxIcVhA4?=
 =?iso-8859-1?Q?7PesWaNCiOoYfZZPTa6OSh3qNklg2x7B32ylpW0tSFVsTV6WpQUmN9MiJA?=
 =?iso-8859-1?Q?ujkmkkIWnbrPb6grRsVtjuDPCkvrQbL6ijSW74rmYNpiUbuNmKQdGh0exB?=
 =?iso-8859-1?Q?1tGGJvYyrqvDwN4pSyNMRKIFZorj90p0zejSaenKUYLM6ioP10Bk+ZlpJk?=
 =?iso-8859-1?Q?nVE1F44foLF3QEhpM4ialh6J6MZ5RvmW656NyuO0ckcDB0oiz8vsmNTPyE?=
 =?iso-8859-1?Q?Ra6fNswVq+ziuFfDrt+OZbxrgE41L/iqQV6tUaJoZWD0NH+LEyH7qOpoDx?=
 =?iso-8859-1?Q?6adHKGGkS+heEdEwCgj5qYkv7/pJQ2FzdC8BCCf/kGWrRq0WnrJCydXL2B?=
 =?iso-8859-1?Q?f4Ugw50weT0KCGacqK53OKcdcdPrNwTh091QxqPb1whNNbBt2afDjsEqN5?=
 =?iso-8859-1?Q?ha1TQsoL+HvnPsfeejlWQu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?N62LIkvBG/sAGVu6rgpJRATX38j3NlYoS1An+sH+pDIA+ButL8FeV06CCx?=
 =?iso-8859-1?Q?6n99NjbDM2yW7kjMS3NtMI06LiIet0hJR0mjX5JcHrdxGay33z/iE2rHd3?=
 =?iso-8859-1?Q?PGQKmLxaopM/x0JswBrfltPKW00DNnZPdYoAicOh1nyJ/e8mewk3b8mnlG?=
 =?iso-8859-1?Q?6JCk/wyI1EP3h4NyQ26fbRFv4AuocwjyKY5yokczO3Q/LwAKBIcuGNgFO3?=
 =?iso-8859-1?Q?J39qxSQ0uc7i9wCTf3kdOsjcdR1fFqJNoSdyB23kReumZqHl+c/YcoFPur?=
 =?iso-8859-1?Q?75YX0USE6TbxH8n1UE5umcTyvKZGqEOTMR+21MeFbC4zxnEyKdV3RY9jQd?=
 =?iso-8859-1?Q?zmb1fGzLmZl2IQ2d8SWEVQeUOs9CchTP6AQlOqBdgf70ADg+9KnEeBI5UC?=
 =?iso-8859-1?Q?xAXoWNQesagUCfiSHaByajPCecOPsu7cwNzSbQW7BlVm3fEOzucL+uq0Bb?=
 =?iso-8859-1?Q?rxX9z/yqbfvQNog4NOzjtQzbb7dPh4IqgV+snxN03RdVX/6VkAnbXzTVBH?=
 =?iso-8859-1?Q?GkClMM0mO17ogH194NnKgeTifFQAzryywxXajc/Lsh/It6Inmeh65i1c3E?=
 =?iso-8859-1?Q?OKUPxt4R7MqW77OyJe+P+C+zPAe1GAaT9OT7vNxzwS0PqJ+wMVaVTQ2KnL?=
 =?iso-8859-1?Q?giDl8GTR54wKBqouKglT3AoT3zpl6VgQxjtmaPsVbdmzNWZ8GpnwATQtxj?=
 =?iso-8859-1?Q?Srqgaa5VizQ8KHa5tFgMMzwDJm0ID0rUYAhVgIZihr3ckhRT4MMWjTNJ2R?=
 =?iso-8859-1?Q?JzFaQbF71sQ/ivWmDKNn85jiOqfMIeT9sO5SpjrxJf3oejeiMQobnVwu9w?=
 =?iso-8859-1?Q?71Wy3FEMHoG2iKK2BCg2r/bxbwno6Hnl2VA6LUssQCO5uzi2SbF2PUHkZa?=
 =?iso-8859-1?Q?Gd0OSmklhqhdHZqQlDM8zHYoqvpggIVPjzxXo5lwMd1wS7TFyOEyFqNJ/L?=
 =?iso-8859-1?Q?ac+b6WJoX7Xtdwbm9rZDIQkivxrPAcKLJ2ADBQ9lYKCb6hwMRdNe9mZfMk?=
 =?iso-8859-1?Q?PvyTx+wPOO/qTCjWlBwAs0jnUIfGLo1DW0yhDGMYFRc847F5xJ0BPm1B6c?=
 =?iso-8859-1?Q?k1PZRtDHKZU+18jOJQ9EwIyspfdGfrDosONllwQHUtLzQ1wrW4Ufyu/sqP?=
 =?iso-8859-1?Q?oiaKYbNWuGeuqLULm2tVQ6ecZHAHXESvSd2+YR3iqZrioX5sOlf5g0wXBU?=
 =?iso-8859-1?Q?T7IigDCCU9c5pvosVWjg74mHgSMuU/3g9X+RediMsfIFU/KUeljDQURR2y?=
 =?iso-8859-1?Q?TIulAvLt96r0DcpY9BNIiMgyTbFcjxXaBi1SFTcZWQtEFpHmxfztcrcWvn?=
 =?iso-8859-1?Q?ZT3VxyBeysuzI4oF4GRCFtNlVakuPxcokd1cLPd65Ir/e8/bEMow/n4sTA?=
 =?iso-8859-1?Q?LvlKbiW6d3aCDFWAP8n5d7iaLTPkucUKY0lGJovBmh2uKL9vCcmR6jTK1N?=
 =?iso-8859-1?Q?68nhf6nipglPj+VI1RrFjOBY8OaR3Vpd2FMxhWZCQzkcVNRqF3+UEPXKnK?=
 =?iso-8859-1?Q?tT41zDi86CzGBXRYnKPmW9Ila0XKU4IHt0SbplY/UhiTpHCYkTDEYRS3sS?=
 =?iso-8859-1?Q?v+KgvkJxqogn2XFduV+4kXNNRJixoWROjOUaS3idEbaROrBHpdG1ZMYUA9?=
 =?iso-8859-1?Q?17aNXxpRVutbIO0srj+YGX7KIrpy7jBeH4rYKphiBg+8vUGcYXBZYnq1pH?=
 =?iso-8859-1?Q?d24XvxIGYnlVfIvWsrM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc703f03-494b-44dd-db98-08de3379b82f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:11:40.8806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzgcg9/ULIJAMbYFKm0qv2+8m2jsgN95kOMiPD7myINfi5CVLlVWTAbgcytjQD+0iiSVUkHnyIyvyyHqBh2kRigCnls3LVB8lr4REj5Jtw9sX2XFS4N15KySFBQo9jMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9477
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

On Thu, Dec 04, 2025 at 11:25:21AM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Given we have new multi-queue exec_queue properties, update
>> the invalid-property test accordingly.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>I don't like that this is all hard coded. But also we aren't doing
>anything revolutionary here.

The below patch removed hard coding.
tests/intel/xe_exec_queue_property: Use single invalid property

So, we no loner need this patch. Will remove it in next revision.

Niranjana

>
>> ---
>>  tests/intel/xe_exec_queue_property.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_exec_queue_property.c
>> b/tests/intel/xe_exec_queue_property.c
>> index 4dfcf09e2..e1be1c9de 100644
>> --- a/tests/intel/xe_exec_queue_property.c
>> +++ b/tests/intel/xe_exec_queue_property.c
>> @@ -189,7 +189,7 @@ static void invalid_property(int xe)
>>  
>>         /* This will fail as soon as a new property is introduced. It
>> is
>>          * expected and the test will have to be updated. */
>> -       for (int i = 3; i < 16; i++ ) {
>> +       for (int i = 5; i < 16; i++ ) {
>>                 ext.property = i;
>>                 igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1,
>> &instance,
>>                                                     
>> to_user_pointer(&ext), &exec_queue_id), -EINVAL);
>
