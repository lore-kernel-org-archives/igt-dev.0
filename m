Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02974EA719F
	for <igt-dev@archiver.kernel.org>; Sun, 19 Apr 2026 15:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0A610E170;
	Sun, 19 Apr 2026 15:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGUqeE8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B5E10E3F6
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2026 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776612234; x=1808148234;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=N4zXeGifK73AD2oOCNqe+ZIk+XH7iGQ3RsX+R9k+3Q0=;
 b=TGUqeE8JR6APjpDp4aru02Deq/yHAgduS2z24ScE9Cxfh145sAanxlA0
 0pn3Do86D2oXxdcz0hVsp/fZdKt3pXas02j8OdWJzSHcj9xpox0LIM9fc
 lBjHORTF5Dh4mUr95O9GhXmxSc4HBL1h7KklcRh+5tdoYHvyEDG7j7BDe
 K/4s9/0rLfdLmZkOPj6ubwQ03+3RE7ZtLRcrf6J7/wU7D076q93X0zBIO
 ZBRi3CDa8AMS9B4da94YPW9zXSe+NZQ5HwYg/OctwNPCQ4bku5vawzBU7
 VZrbp1uZSql8XsKbfYAyFIPhRodCalwa1Jls1MpTWDWOTHKgUFcXendgK Q==;
X-CSE-ConnectionGUID: A2qHSEYAQSaxEC0e8kSzbg==
X-CSE-MsgGUID: glqTYcpETRWuKPi/k2HgEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88159845"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; d="scan'208";a="88159845"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 08:23:53 -0700
X-CSE-ConnectionGUID: cTMRKB+JRxCxRoSRF0PJbQ==
X-CSE-MsgGUID: C9/o9dQ5Rlu4BWx30io4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; d="scan'208";a="231418959"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 08:23:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 08:23:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 08:23:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 08:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBTua8j17cM5GXNzWCxCi4AR1g/G2KuD0Ky2mw2KILobyCqm/1hJIIK4mOkEsfKRAOJomGOaQxxPSwZiYnTb9ok5l9HqCjMOmJpljP3oVvr5AiUuSBNAmETfdkVXwUfwQbCWpxNDS/ZzpHk2DRKw/pb/+OSAi9AabjtjuSrZLuL1aCHdYQvb3XUyGkXXoQS7mJdQsn18m0YKiy9LSvtm+nezSi1hUV8+cO4wg8MfweYWM0xVox/iIT24BUU9/SUVPYoTvfCcodFtOriixy3xYfOdjmi62toYnQP8Rlv2Jw9CEx62Y/QgI7hi/ZyXBTTELqRR9JAPMjleVQjtjQ0X5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj/qgBHJNpOBghhWq8+WxkO7VEEYbtb7TFFUYv+SVhg=;
 b=V9l4geZqxJwQl48b09Z1Ma1EWjdsTXEKkywOvGNtwDanXRawcALaNgQQ+eWiVp0/xBwM+5rI2jdjTLlv9pue0PzcuiDvkSBuBwZbqb78KBbRJRBz3qReijZs/r4Rzd9Y08cN4DGtjP7rFRCd/Sx5o3uvCzz7gNSe/D3zFmkxw3CbW9ThI/WK+mP93sxMTVmWBt1Mp8ifJ2u4XYfTKHcHL5VWI+bjC+5Ee5yLhOnM8r7h41nxYX4k5clhcZmFfyz9Rjt+J+uwamJB5FhkQcuFNk33NUPYucGbgCETm1RXWb3OBVanNFGN4Ul4omyS4+5hE8Zg4x5erQ7HlpBbcUzJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Sun, 19 Apr
 2026 15:23:47 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.023; Sun, 19 Apr 2026
 15:23:47 +0000
Message-ID: <1abb67c1-d275-466e-829d-64891016b2cd@intel.com>
Date: Sun, 19 Apr 2026 20:53:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/8] lib/intel_batchbuffer: add
 intel_bb_create_with_gt function
To: <igt-dev@lists.freedesktop.org>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-5-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260323162911.1912755-5-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc57b1d-f27a-49ad-7816-08de9e27a6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8vTllwX6pEkYht0G2yVnAtImSEZoDqLa7ax5JYSINo6sFnzvQQ7KKKfXCt7C4WpX9hEykQOu41LBGDU4Igi/DH1clZVlN9kAZv6G1s8Qvun6x7+XuhbcktAeGdkPkW4gcMZ2EqiTh55moJb1faWZa46xlcQv4OMvIDfjEpWqC7GP8yhRMV6DqJqUq01PlQ+bGmH6IJgTV9EUOuLixSRU5SA5VRT81RBZdvT0huIdSHfgCz6Ol2EvoI7qhHoymPPPC4fxoWBtllX5fs6W9b8IFW+r0VY9T8Z7d/1iGxBXydekgKmWym3wA6RdVY3eK2go4PLbWvjo88bpNeCLIB3AJL6Q2eqtA2foYoP2dns8E8cgf3HcLaL2MfI3qmyJ3TJ8CuSDPUdEcCutN2dwrfRyA7P6yKotvSBg//Q0HOtXVtFwq0+PW4TSxa/PosBmdC6Y+SR2HpvW/EjFDgMGSrVRc+Tz47+4tKrbcG64JmuIYtn2uPryy65kHmORVI1kd6L4tTTLPtU4hY8UNODGDDN6Ma4L7lkndorBhOKyKrUudHqqW35kEe0CWHCU8p8BjySMwThpm4fklqn6KbWuWjsgKVw53h79vAVQtCmWQDOmB8oQExB9d41yBUkH/zoQdC7yn6DL23a8a69aKKKTvF4jNT9SY6EoELbV0F1utgn/FICnJru+4oTWK+GJUaoCgNfHIXBohFV2MHIil2MC8MiJt96p5k1pKBiXR+xT3aZIht0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2syK1dZSXJvdkFHL1crR0dmY1FyZnh4L08reVZnUUw2M0ZyaldGMk9HNy9T?=
 =?utf-8?B?bFdxelRsYVlLSEVLVHlTNTY5WU1XN0duUVlaQ0NTNDIzb3llUjN4YmJlajZV?=
 =?utf-8?B?MHUxUTByUEwzN1E2ZEZ4Mk5WZGZ4aHpjMmpqMzcwRDI4R2pzOUJqVlRpT1NV?=
 =?utf-8?B?Rko4Vi9oT0dzeklYSWc0NGJvUFNBQ3ZUWjlsVXpvYTRtRDRqTzNWZGIvTWJY?=
 =?utf-8?B?K2pMWmorblBDNnV5dTQxZGs1T2hyS0R3MVd3TnR3dFJSYzRmQmk5MGF6T3F0?=
 =?utf-8?B?SDlvdzJscnN0dGZZd2s2M3VLcXp3bjFCSkNhNUo2eXdjODNBUU1jNE5salpk?=
 =?utf-8?B?Z0pqS3BWQWplczNNZDV5M1MzUEMwYmRRZ1VkTVVYYy9mbXdaaW5kL21MdEtU?=
 =?utf-8?B?UkVNQWcyUGhwZlA5K0kyQS9sUWZWOC9rWFZMaTFnV2U1WDdGZmZNVXRCQ1Qv?=
 =?utf-8?B?T3VVYjN6a1FvQXIycGwwWnlDbDR0bUZFQlJrQk5Uak0vWDJFVk50ZmJMOER3?=
 =?utf-8?B?SU9FVmxRd05HSUdEcUJyWG8xOVpDYUFoU0NVSkhhL2h0a0s1WStiYU9aYm42?=
 =?utf-8?B?YS8xSWc5UVZQdjNreUxMN2tXVnhNM1A5L3RSYjlaNWRHNVJNNzlaU0wwZUho?=
 =?utf-8?B?SGlZUVVVUXJYV0JEdUY3MUYvR1YvNHlwbFlCMXlZa05XbGUyK1J2QUtNTjNJ?=
 =?utf-8?B?MVRrVVFQK3ZMRzVSeUpmYVNBVTZ4eGI2Vm80SjJRWHdrQWluOFAvV05uMFgr?=
 =?utf-8?B?b0kycDROYnJxbU5HZnF1K2hPK3hzQU40R3JNYTlSdVE0ajVEL0xTU1J6UjlX?=
 =?utf-8?B?RVM4RDRRV3NFRWdNcWVUcktGelZkU0JUNTRLNGVqWE5QRTBBZ1BtU1NjTzlP?=
 =?utf-8?B?ejNPVEtJOTI3MUFNQVB3clJma3BMMVl3NTY3c3pwY0hJSGNjVW1XWG0rUjlu?=
 =?utf-8?B?cHQ4czZDQjB1V0dIYXpicjU1Ukh0cTR4aGtKWmRZK3Z3MTVhNUF2TithRCtS?=
 =?utf-8?B?ZTBUSUdTZjhZVmk2SVgxUEVXbUlQOWREZ0d4SU9xVDhCcEx6TEpqNFlxMHRV?=
 =?utf-8?B?c002YlV5Vy9naEIwKzZCRUJ2cE5aZk1MMUdFb3ozbjB4UEhwbHB6YzZNVFFJ?=
 =?utf-8?B?M3JTREcyTnVsdGhNbEZpcTZwakNIeUxFSUNvOGVsLzZQMDUyWjNobmYyY2xH?=
 =?utf-8?B?QnMrTVBYOVdnUGdidDEwamNQa3AzRWx6WVNYdWdBb25GSTZXeXdiVFlXSkJs?=
 =?utf-8?B?ak9VTndwcEc0UmhERnBZdEg0OWFrSUVVSko2TmVWTkpFVlVmeTBwYVpGMkt0?=
 =?utf-8?B?NDhJWlh2UUwvcGMzOTF6TFdiekNmUFhFcURWeVdzQVp6Y09TbTY2cllvMEQx?=
 =?utf-8?B?UXplSDJKL24yYzlIRGw5STViWjNUUEZHK3FoMEh2M0F6bnNsdDB6NnlHK2lt?=
 =?utf-8?B?aXFtZFd6dThacy9KRzJRQVR5ZW92U2xnUTFkYnpnRnZLS2U1OGZHM1habW1N?=
 =?utf-8?B?d0l3T1MrZ05maGtZMExQSXdiT0JVS0M1V25qNmIzQ0RXNVd2WFBmRzRJQUZr?=
 =?utf-8?B?YnF2M3JGYW8yUHUxcTFvZldiN05ob1hPc1Q0K0JKdVdyNEQ4dTB1UWtyemlm?=
 =?utf-8?B?WDFoUFN0L01JZzB6STR4RG53djdWTGxzZnkwZVl1WUlkU3ppOTlGZG9iTjFs?=
 =?utf-8?B?eTJvbUpxdElreE9FSkNLM3VvK2dlelBFS3NjNXNZdjZ3V2pWeVBRNk14MVRV?=
 =?utf-8?B?OXZFcTJZczdHdEtTdkpTbjV0V0hReEFtRlFvL0VBcm1DSWNCVFVEamdQejBm?=
 =?utf-8?B?YlpxSVpZQ2VBblF0SWd4SXJHY0phNi81VWFJU1IzaitDZUlRb0FMa1B0T3g1?=
 =?utf-8?B?bys1UE1XZEgySG5wQ1BOZDBnMzRuOU1hbUFnZ3JVUlZrOGNheVBmcDlRNGhP?=
 =?utf-8?B?aDJhR1BBbVhVeEdvbU9NK0J6NE9GVWFjOFRLYU9tbTFPdmoydmZOZklER1g0?=
 =?utf-8?B?clBycUduZ0toNDNDNHNOSTVUa0VsNitSYlhodk9XbmRCUkFGYkdoYkxLeng1?=
 =?utf-8?B?MlJDZGtDZkVZZStNQzFFTFY3amlaU2p1bVJaeGdVRXE5dHRabGRxY0o5T3Zn?=
 =?utf-8?B?ZDcrQmp6eXdFanFTYjdaSStHVTBXdFNyaXduSzRFd2ZjQ0ZaNDBDcWtCdXdv?=
 =?utf-8?B?OWJ1Tkc2SG81RXVxY2pQZGZ2aDJoNHpFWEVGblE5OGtZVWJUb2dlN3RobGRm?=
 =?utf-8?B?OXA3T2J6d1pMZEZMOUtXZ0U1dW03NytFUzhvYXNwVUNrdVZxR3g4dEJlSTFZ?=
 =?utf-8?B?NUwxQkh3dnBmRWU2eWI1eVgyczAyOUJNZ1h1WEw2SEhGQitSZlhGc1FOWTkz?=
 =?utf-8?Q?QEKpDAuh4oc6lo3o=3D?=
X-Exchange-RoutingPolicyChecked: UkKoj3UFjZBsm51T7guNiM6lolpqerCtHU+RXajKF5s+JFtG+//zIvcOfeSCDWDsUXl+wuHME9+JiuRQDtKrJZyIrzCLoF2QmOB2NrfeyLZ3LDXZNd5G3Z4eKKH/DRq1KZRG2wVlAL3xdnpwfzSS1caKkHAhq7U27/ZSCPbZBH4FNY41Ty3Iut5SpvScwTEHoapeNVqlwWdu7gcnxq7dK92jQcGPjzIydIwi4Hp8/gkIjoqbxVaWf66LOXUcIeVAcmUIerNPPdr2lrW3ICQkjheEL5CgThRz1Jx8ib2DaobZIrLg5mmdRH+cEcvmsBgsiCu30zqB3GDprfxz/syf4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc57b1d-f27a-49ad-7816-08de9e27a6b8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 15:23:47.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4fIKQu/HGBmcgQ2TLN/0YbR3i68PCe2pSAJ1ttCLtOjDekcjWmBOtfk2aj9uSQ6RXUPLTai7dpZ08mzervFU9bRr+ORqKl1dQaX9fUCQxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
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

Hi JP,

On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
> add possibility to use gt id with batchbuffer when on xe
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
>   lib/intel_batchbuffer.h |  2 ++
>   2 files changed, 28 insertions(+)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 802e771a4..cfafaecd0 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1162,6 +1162,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>   				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
> +/**
> + * intel_bb_create_with_gt:
> + * @fd: drm fd - i915 or xe
> + * @gt: gt id
> + * @vm: for xe vm_id, unused for i915
> + * @size: size of the batchbuffer
> + *
> + * Creates bb with gt id passed in @gt
> + *
> + * Returns:
> + *
> + * Pointer the intel_bb, asserts on failure.
> + */
> +struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, uint16_t gt)
Rename the parameter gt to gt_id to stay consistent with previous patches.
> +{
> +	bool is_i915 = is_i915_device(fd);
> +	bool relocs = is_i915 && gem_has_relocations(fd);
> +
> +	return __intel_bb_create(fd, gt, vm, NULL, size,
> +				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
> +				 INTEL_ALLOCATOR_SIMPLE,
> +				 ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0),
> +				 gt);

gt is incorrectly passed as the ctx argument (position 2)

  __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const 
intel_ctx_cfg_t *cfg,
            uint32_t size, bool do_relocs,
            uint64_t start, uint64_t end, uint64_t alignment,
           uint8_t allocator_type, enum allocator_strategy strategy,
           uint64_t region, uint16_t gt_id)

> +}
> +
>   /**
>    * intel_bb_create_with_context_in_region:
>    * @fd: drm fd - i915 or xe
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 7049dd2d0..8d54c6590 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -324,6 +324,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
>   struct intel_bb *
>   intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>   			     const intel_ctx_cfg_t *cfg, uint32_t size);
> +struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
> +					 uint16_t gt);
>   struct intel_bb *
>   intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
>   				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
