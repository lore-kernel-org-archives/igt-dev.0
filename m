Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6855C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 07:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A310ED4D;
	Wed, 19 Aug 2026 07:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOGKOg9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7541810EB10
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787125868; x=1818661868;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KUaZ3HkyvKkJKnddquf4GuWtH2I6SEXzxeJAk0NzPYs=;
 b=aOGKOg9hEZrRdcgA11GiH9jnxrDImU4GE6vktr/H3DpxWFWZHheQ/1r/
 rRWvwhzGv+uOpbJ9DvEMzLNg53+7byQKCOamzkrRbuPj3SWCvk4CL2ym6
 eFVHEhI0KRI972+5OVSQQUCkZ6oUJ2gzfxvuAuK0jkyCD8w+SL+5slorP
 CUwNwmVjqJQpTL41QyduM/ssO7SiNIvPahNZlrWxaZsn4wuW4wRcET9mx
 w7KBxATlrxS6JzbJPCrYqzlwnHuD9ZqDXr2bctLGU+ye27QHenJBVOTQe
 uDfnl66FTO33IvwI1DBEGIwfZCPUjlz0cj6r/rYa3NE2VxRHNY2UKX5U3 Q==;
X-CSE-ConnectionGUID: eqe3BOzTQmCjgZeo5JjVNA==
X-CSE-MsgGUID: o+Xe98vTQyyU0uv/j23aIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87694804"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87694804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:51:08 -0700
X-CSE-ConnectionGUID: UENOyDfiSn+4RgcoX0Zhgg==
X-CSE-MsgGUID: 4p/TWthBQHm+3jZkrMTCEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="290274941"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:51:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 00:51:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 00:51:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 00:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UW0cVtVtnOqbXFEubXbN52hntW3zJ4Fd2zw3NIs1EcS3RfIVbFnNhN4xjx12NpjKhW6XHfMl5fXigDyDbgnsOnCsViLxurOvoPErzoVlmSYuGD4+3ujS8pYGwt6ohef4bSjLi4Em5rnRDSNbK7Pr8XY+65MbZdfinJQT2acB8cbJco9rErRabS929qF1svHbCHDZXpPO2O0KDjKaCJh54RsCABVdoZghfyiH2H2NjFoHLTFRsC6aDhtj59kwADqTZZ143yD/6WPhsrk+c9SD5PU9g6QfwM56TiO+tBOiGk5qxuDqKclZQVIjeZmnEdJz7shE/JgFZx3I/blOwTh80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW5ymuyaoYtcWSdG2KkyRn3xVXtT8uuEfWqBEIBkQEE=;
 b=WzgiEKduskiLUNjG9DCSqF4V3jHyUojFgeGHgrsZXwsa0z11m+hb7rbNwpLUTL3gqMVj02gTAx8qbpk2lqI+mvHQ7zRGI2bb4f3D034hHACt4KgKvUED2QM1Ph+Sitsl36goUWhW/wf0K8r9JqK5g6WNfH9Zb941+lpFSfpeKZeBhkridVhYziWnI5APWjjU/qAV3bp08XmAS9nKBdyg4oDMu2IUMln5O61ORA/WLgubKRdFNP5xe1I5coV/6Mokt/p7BVS3e5mz9sH0VGrCZntGiBN4E2CN7IucSEZuQeUfABQTgfXooKAZkPEfYNZky/Cp2+pMrXt8qIREsJzzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DS4PR11MB9603.namprd11.prod.outlook.com (2603:10b6:8:34a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Wed, 19 Aug 2026 07:50:58 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 07:50:58 +0000
Message-ID: <1254eb6c-481d-417f-b8c4-847c8354739d@intel.com>
Date: Wed, 19 Aug 2026 13:20:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [2/8] lib/igt_drm_netlink: add get_error_counter support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260729121959.603890-3-ravi.kishore.koppuravuri@intel.com>
 <98fd2a7d-340d-4419-9a63-c20ec8f5972e@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <98fd2a7d-340d-4419-9a63-c20ec8f5972e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::18) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|DS4PR11MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc2969a-4535-4dba-e44e-08defdc69b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Be1pCJFd5Mdsox1L4qVmL+EUbfUpWj99ZEFCmGirhNLwbi7gLR397hhxO7DblIFwGV+kcuVy7fVkKZMm15MEdIIDlKFZnoxsCvF+xXfKsouDmg23G1vS2XMajOPB26LdjI1hWYw1QaCvWXqm4hqSbtQAzp1kVE77h4Y9dh9+I2AxsjuqjEAbXQ6eeeAsFk4nlZXCdNNJ2ckWyeFw2pCAOdG2RhTqOqXuh9jSsKkahdnEz8FOpXMhSbxdEc2pUOP10Kj2Z4MoU3QNxSE1Gw0eJClOa/Qdnhu94rAYHk8SCmhtzFOGtEk9ADdhjgxJah3rF1J1+70hX+ZwIk9qV8/R44P33Jqx7zLye2ePhNfgtmTagmRa9jnchIb7EWqvNXmjIswWGSNkiJKOpjxXHX5BruojZUDAcAdMXCHXO1QMawx/+RrA9EF765g4Z+gSwvQFq0x59aNcQMxK0tCpU/+y9gesYmsztwKq4l57j8HMa/M4gSHn+yjk7ZUlHkCPFu7/TEgqOdnjT1Vx+wlehCQbzK/39sMejAYtb0GOtr+Jd92xgJovU8qcZyE8Z7Tkxdo5JRqSbFBy9ZodcC4iO8kWTdTUkgvCrj09W4XdnJans1EXnboH6KZvTQ+Rc4GuupaxFYDdF/LVYti87Umrd7EbBykknfvZEErLa8AV92yfEm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNmTkszZHpCNWRWbytyTy9zT3FZY2FFU2JPRHRHSHlrc0FmYWR3RE5pKzhE?=
 =?utf-8?B?clFPRFFrZUVucXBuVEpTNVUrYk90NTBIbDFpMFFiYzlIaFArT2FWZTJUdVdl?=
 =?utf-8?B?eFJlQnRzN3NaTnkzS0RFQmVWYmVzK0VBYzhNUmFZdmN0dXBqS2RBWURRRks1?=
 =?utf-8?B?L2s1WGs1VTFpdVFFcTZEWkpGZmtDZGpOTUJMWWdFNjQwM0orWlptN2w2dHdn?=
 =?utf-8?B?WDJBQnVRN29VZDBsdTQrTzlxbUs0WEkxZGxyTHAvZTJ3TWFmaGk0OE9lOVls?=
 =?utf-8?B?dHZvWFVidXBXQWw3YXFCdFQvdVY1eW9SWU80dGFaTEtpc1E1MFpqWXJpSEdU?=
 =?utf-8?B?TVRvemo1QVdQb0JwakhwV2NOZHJXZUl4cHBrQ3Y1R1NIZ2FRd1BXNHhzRWpo?=
 =?utf-8?B?QzljMjRpK1JvUVRsUVFieGtyUTBvdGdIdHp2blFJZHJxRXBkMFo4dm9LWE84?=
 =?utf-8?B?TGt5T0RSOTQ1ck1DazVsOEpkZndRN1NORFBsd055aERMZitJZzhpZmN6UnhO?=
 =?utf-8?B?NEszbzVYdCtZZXYzaTRnemVqYzJ2dHpMS0V3N0RUczQxa25CU2drbW5oLzhz?=
 =?utf-8?B?YnF3UEVoSGNSd3MrZnJxN0QrVTdvQnZmMzA0aHVBZEgzd1BUckxHSmM0WjB5?=
 =?utf-8?B?cEVyL1JUd3JJU3R1dHppWllBMnp2NHhhZ0pIWVNmREVkWnJMNFd6RGpWVnd5?=
 =?utf-8?B?T2R1Nm5HMGFYclR1Uy9XbzFhL0x0cUx1OXh2Sk0rVTZlNkVBbGtFWFo0TjRY?=
 =?utf-8?B?cTNuNDQ1bmxZZ3p4Z3ByS2loREZCREZIanlYZlhzQlJ5Vis4bWltbjZDQ3ds?=
 =?utf-8?B?NnQxOXNtZ2RDN000QlVDNVk5WE00dW44RGZTVjJqMjZZREVJdmdIZUxJNGpD?=
 =?utf-8?B?cDExcC9XQldXMUUxY2R3R2JtczdQaXAweEhxVm9lR0I3Tm1naG5HeklVNHpX?=
 =?utf-8?B?dEIyVlRzYnNFQWsvUysyVVZveHdQUWpyMUpkcTVKcmcxQ0hvYktTVjN5USs2?=
 =?utf-8?B?THVxZzhHK082TEsrdEhGQW1pbHlGNFNqNGJyTVN0bEkzNW91a3hLclJaS3Na?=
 =?utf-8?B?UEdiU1d2ZHN3eWRWV2t1YWpmdGRIWDhBUnFTL1lNd25EYlNQT1pDNjR5SVFU?=
 =?utf-8?B?UlRxbTBUcDZKbGFwQkNTWG5LYXBhTnhPeklQS3FrVnNWcVhlTU5RNFh3WjZR?=
 =?utf-8?B?SmRQbWdPckRDT0FpNG0yc0ZtWllBbGtLR2ZkbGUzOUE0UVl4N2ZWNXBqT1Ax?=
 =?utf-8?B?cjB1M1h6aWoyS1pMQnBaaWxGNTdMaWVEM0MvY3JZVEhqWGJRc2MvZGVXamth?=
 =?utf-8?B?Z0M1Y1NuU2VuWVdwc3UrczlxNjk1Y3VWUm1yb2JJcjN2MG9pcHNEN2pQaVB6?=
 =?utf-8?B?b2wvV2JDamRGZE55NFVDMXZHeldDaDRPbmIyZDF0TjJQdGdOM3FsZUJDNHdk?=
 =?utf-8?B?bGZ2NnJac1U1OVNmQzhZdlRpZzljanZuVS9DeFpPb0ZGM3VUbWpnbEJDS0VM?=
 =?utf-8?B?TWNBc3Y5dHpnM3A0S1lmc0Nkcyt6YUpvT0llTmhIWXBCOThxRlJBQ0Z1R1Av?=
 =?utf-8?B?YmpZUFRZV2ZNRHNNSFowQnM1aDE2UlYyejByd20zRS9LQzhRTTMxUnVrczYr?=
 =?utf-8?B?VDdZdjB0aXdTdENDNFRldERJeFpVdFVocW9JYzhMK1RoSHd0SW45YlZUaXg4?=
 =?utf-8?B?K3dPMUowS0JBc1JaR2xkd2dkK0wrZVBxVEdaNTNXVjk4eTRaaVE5RU02VC9v?=
 =?utf-8?B?YXFCanJ3QU9Lem5aK3VOSklibkVZL3RFVTlsWnFJTTFzL3BZbStEbFpTWUpj?=
 =?utf-8?B?c3VVa05zL29XWUZPdU5YNFRmNGYyd2oxM0djNjdTV1dSa204eEtoUmtOa1BG?=
 =?utf-8?B?UFVJUTRJSVRYZnFZbXVIclVrTzJ1d3lWNy9zemMrRDNKVWQ4dldiZi8xM3lm?=
 =?utf-8?B?K0svUlRnT1R1YzJySUVpV1NLZzk0V1ozendGSExNNVd1aU5LajBlaDFoUUN0?=
 =?utf-8?B?NkwzWmNFdUIyaDhMOE15S3lBQkdNNDJSbDVVd1U1eXNaWW1ONTZPUUFUNkk5?=
 =?utf-8?B?b0k0VmovbHNucWdIL20zb1JrOGJiS1hHZEpCS0VRUlV4b2tERkNEVElobWY0?=
 =?utf-8?B?UHZwVDFTR01jY2IxNmdNVS8rWndmSzRMa3hIKzE3MEVKemp1Y2dzZEFlS2RL?=
 =?utf-8?B?MHVmYUViQm9uTndOK0pHS1I3eHN4OFBFcE1xNHM3R1hZN3VwVW5jai9qMUk4?=
 =?utf-8?B?Zjh6aVVCcVQ3Rnd2dnk1K3ViK1NCak5IendHQXJJRzZEbGJsVVhYY2hxR2py?=
 =?utf-8?B?WDEvTzFvS293bmJKckJZWWs2OVVWekxzVW1XaUsrUy9ScTByYTIrL083cG81?=
 =?utf-8?Q?Vwz9V16uzqgjjWlEnTE7YVbakhCcnpKsSHVw4?=
X-Exchange-RoutingPolicyChecked: EHYeijwKEDiqxXx+3y9tjdnFCb9sDJVKq6wdk29llUewWxlXMYmg3zUmxVgOaJWysSYaWTd2aX/gSWz1LGTjtmcL85eqANimF87oHB1mkFydvFsQfq0i+CE8IuzzuUIKZTUcbeso7Fu/rGBdVcJoulrAQS4ViLiHldrTm//sT7FVe6qsPhO7QmnHl8a3l6tc0f1A/4YkCkwtYFqjFD/pHY7UiA4uYpRt87fRuktDM7Gp/lTTLLVv4dteBk0YhFx8azwtH0vnPG5gsP/DUukMjFoaeSvuj37VPQLXAnf+DVW1aDQVfzVg9uYPhACEyY62nbozCh2wbV+a8AZ/Q5yqrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc2969a-4535-4dba-e44e-08defdc69b3b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:50:58.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mxOhyYr8YNScXiHDtHeQafKkgP5T+U8eJ9+KMssD0urUOrE1+GgDftMAF0sMkoQpGY8wrvXBxR3XcT5U0njl4HGaZRB+0FZ1uML68W2sp7tCI6bLfey8ECMc6R6M4IX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9603
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

Hi Soham,

On 14-08-2026 19:39, Purkait, Soham wrote:
> Hi Ravi,
>
> On 29-07-2026 17:49, Ravi Kishore Koppuravuri wrote:
>> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   lib/igt_drm_netlink.c | 179 +++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_netlink.h |  11 +++
>>   2 files changed, 188 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index 1c07bb2db..4d543275d 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -5,6 +5,7 @@
>>     #include <stdbool.h>
>>   #include <stdint.h>
>> +#include <errno.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> @@ -17,6 +18,146 @@
>>   #include "igt_core.h"
>>   #include "igt_drm_netlink.h"
>>   +static int ras_command_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +    struct nlmsghdr *nlh;
>> +    struct genlmsghdr *gnlh;
>> +    int ret;
>> +
>> +    nlh = nlmsg_hdr(msg);
>> +    gnlh = nlmsg_data(nlh);
>> +
>> +    switch (gnlh->cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>> +        break;
>> +    }
>> +    default:
>> +        return NL_SKIP;
>> +    }
>> +
>> +    return NL_OK;
>> +}
>> +
>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>> +                struct nl_cb *cb,
>> +                struct nl_msg *msg)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_send_auto(ctx->sock, msg);
>> +    nlmsg_free(msg);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return ret;
>> +    }
>> +
>> +    ret = nl_recvmsgs(ctx->sock, cb);
> Is it blocking ? if so, is there any timeout ?

nl_recvmsgs receives messages from netlink socket and processes the 
message using the callbacks registered (cb).

with libnl library, default mode is blocking until it receives atleast 1 
netlink message or an error.

>> +    nl_cb_put(cb);
> Why the callback is being removed on the fly ?

Here callbacks are getting registered per-operation and once the message 
is processed using the registered callbacks,

there is no use with cb object and so releasing the respective callback 
object immediately after processing.

>> +
>> +    return ret;
>> +}
>> +
>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>> +{
>> +    struct nl_cb *cb;
>> +    struct nl_msg *msg;
>> +    void *msg_head;
>> +    int ret;
>> +
>> +    msg = nlmsg_alloc();
>> +    if (!msg)
>> +        return -ENOMEM;
>> +
>> +    msg_head = genlmsg_put(msg,
>> +                   NL_AUTO_PORT,
>> +                   NL_AUTO_SEQ,
>> +                   ctx->family_id,
>> +                   0,
>> +                   NLM_F_REQUEST | NLM_F_ACK,
>> +                   cmd,
>> +                   DRM_RAS_FAMILY_VERSION);
>> +    if (!msg_head) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +                  ctx->node_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +                  ctx->error_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +        break;
>> +    default:
>> +        nlmsg_free(msg);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>
> The callback could have been set during initialization to avoid 
> setting and removing this callback on the fly.
>
> Thanks,
> Soham

It is possible to register all the callbacks as part of initialization 
and release the callbacks during cleanup.

That enables the persistent callback object and may lead to concerns 
with reusing the callback object.

As the callback object (using nl_cb_alloc()) is lightweight, and 
per-operation callback registration helps to

keep the callback behavior local to the operation, I have opted this 
approach.

Thanks,

Ravi Kishore K.

>
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        nlmsg_free(msg);
>> +        return ret;
>> +    }
>> +
>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>> +}
>> +
>> +int init_app_context(struct app_context *ctx)
>> +{
>> +    if (!ctx)
>> +        return -EINVAL;
>> +
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = UINT32_MAX;
>> +    ctx->error_value = 0;
>> +    ctx->family_id = -1;
>> +
>> +    return 0;
>> +}
>> +
>> +void cleanup_app_context(struct app_context *ctx)
>> +{
>> +    if (!ctx)
>> +        return;
>> +
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = UINT32_MAX;
>> +    ctx->error_value = 0;
>> +    ctx->family_id = -1;
>> +}
>> +
>>   void cleanup_nl_socket(struct app_context *ctx)
>>   {
>>       if (!ctx || !ctx->sock)
>> @@ -24,14 +165,20 @@ void cleanup_nl_socket(struct app_context *ctx)
>>         nl_close(ctx->sock);
>>       nl_socket_free(ctx->sock);
>> -    ctx->sock = NULL;
>> -    ctx->family_id = -1;
>> +
>> +    cleanup_app_context(ctx);
>>         igt_debug("Cleaned up netlink socket.\n");
>>   }
>>     int init_nl_socket(struct app_context *ctx)
>>   {
>> +    int ret;
>> +
>> +    ret = init_app_context(ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       ctx->sock = nl_socket_alloc();
>>       if (!ctx->sock)
>>           return -1;
>> @@ -58,3 +205,31 @@ int init_nl_socket(struct app_context *ctx)
>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>       return 0;
>>   }
>> +
>> +int get_error_counter(struct app_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +        return -EINVAL;
>> +
>> +    if (ctx->node_id == UINT32_MAX ||
>> +        ctx->error_id == UINT32_MAX ||
>> +        ctx->error_id == 0) {
>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>> +             "node_id should be >= 0 and error_id should be >= 1.\n",
>> +             ctx->node_id, ctx->error_id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ctx->error_value = 0;
>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index c20d5452b..e539bc030 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -9,17 +9,28 @@
>>   #include <stdbool.h>
>>   #include <stdint.h>
>>   +#include <linux/genetlink.h>
>> +
>> +#include <netlink/attr.h>
>> +#include <netlink/handlers.h>
>> +#include <netlink/msg.h>
>>   #include <netlink/netlink.h>
>>     #include <drm-uapi/drm_ras.h>
>>     struct app_context {
>>       struct nl_sock *sock;
>> +    uint32_t node_id;
>> +    uint32_t error_id;
>> +    uint32_t error_value;
>>       int family_id;
>>   };
>>   +int init_app_context(struct app_context *ctx);
>> +void cleanup_app_context(struct app_context *ctx);
>>   void cleanup_nl_socket(struct app_context *ctx);
>>   int init_nl_socket(struct app_context *ctx);
>> +int get_error_counter(struct app_context *ctx);
>>     #endif /* IGT_DRM_NETLINK_H */
