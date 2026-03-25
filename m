Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AB8109C023
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 14:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB3810E21E;
	Wed, 25 Mar 2026 14:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIhx7481";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDF010E21E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774449078; x=1805985078;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KLU/or76/AAvtp7hmHybXiImfp0I/YzUAZUWZ46MbE4=;
 b=AIhx7481XL0Og+OwW6uWJlzjrvn1h3i+nbKHEDt0xAv/E2m7+6YWo1Su
 rDtp+W4d3xuGzc5dm3bWOnJKKPW9ViLeZgfAfypz+/F/e3tDpdT116lsg
 PaUa6RbWVnv0Q1I7baVGZkiV5VFljQ/wwtMCJj84UaKwatOAFgZoqnQKT
 3lopHqMNfFogGfvhZYBYAOAqoFB5urFQrZ0ZKgq6Q1KjbfL/4gSVRLs/N
 1AesZkbtxfegFIkGIIfyQ1ssWcRE1Wq/xeuQ8DlhiorN4hQEnV4cAnBDa
 ue23iJUd+W+OVrmkH+56Bm9t/nPtNWj/zIEKnvT8wfbQGiWB66CMKvump g==;
X-CSE-ConnectionGUID: 98a1NhBYTCieMQjBu1S77g==
X-CSE-MsgGUID: 9OwpI6X/TbeZRCdJMdbLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75604051"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75604051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 07:30:47 -0700
X-CSE-ConnectionGUID: zjmhn2kaS76h0joIUBHAOg==
X-CSE-MsgGUID: XyYAmUbwQvmvTj0Dz3d2Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224650102"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 07:30:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 07:30:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 07:30:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 07:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx5RUA5c5vaHcDm/Go8c8q14ThRM4z0y9yjxvS8oth2sKuAYqdWMJ9QN7NzIV4sUETu+kHW3sXLiRcYcN8/IMrhwwroHmUpkj8aN6I2QW+S8yUva7T8dBGFRDV8oP1B7pPVLWhfy3Ox95eJ9Q2TWCoN1IQvsEiuRTC+k4gSGw1rtz4C2Dgc38eTMwfEw9kCrtKFLjlG6565LFZ7RhnHDKlN3nam+r4zbc8mRPyPN3JAcBO0NmMtBqnCgQ2cazpnfeip9onMP2xfPrM0e+UOHk2x/hYfJBZBj5OQLkpTlh64xlNeG4rSMMUYtBe1lq4zRV8I1qM51HDFb3p2zDUs6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB/iV3iXGkoDiQjd4dj5G1J/iZXAyHJmaoGBP9I7t5A=;
 b=IOWP1AbYeiA2ieMRVjq8BcqKDTCnue67Q1WuSNp2sw9iHwm7MyRGHISG+oKnQGX6plRvtTcbv3udXZuDcoKSLXl9JhoBKxX9HZmQ+rTfClqSbZODFG2apN0r31Zhzj5a5LfO6pg9w4uUUBuv6mrX2pgQf22oCakXmsJe9ld0ium/PVMbIw7wvy6Yne0PqUaLkhYcI2sisoTcJwsnNBdSPr8lIxZ7pM9prS/2KnQTrPkcGhdmayWsO0PHXIDjFyurW26yzmTq/yRY1TtHzRvWeXXmma79qLnFl/AaRBdDVBPm1K2IrkjTnpLx7OkO9FtjEyfVoCtWQyRCn3U7IxBG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.7; Wed, 25 Mar 2026 14:30:42 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 14:30:42 +0000
Message-ID: <f1e146b4-2462-4042-9b8f-83782b3a9260@intel.com>
Date: Wed, 25 Mar 2026 15:30:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] lib/igt_core: flush output on each line
To: Jan Sokolowski <jan.sokolowski@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>, <peter.senna@linux.intel.com>
References: <20260325114901.256229-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <20260325114901.256229-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0106.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::35) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: b872d298-fbfd-4431-84bb-08de8a7b180e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: igy1haQbd0O4oTvHs+Wxt5QUGNVDXsgVmKnB977mcYOGSrahSFQjGDkeql7Rf5GC2QLGkve2h43o1d2zL3O5antswH4wOCh98VbUbi90Zy9lPNGwiYJOvUmU3GFSPvCKM6rlKtP+Atnz//VjXZTqgH2iQ+qSUVDDBqqb+gwyOiK+3lsAzxVdqNDPO0R2V7tM1iImxbNmvvvoWsBhKeyMcvgZ+EDCgS3x66WA5yL1r0MQD5aFoAjUqDslh59iWNl6BPjrqboAM9rz+Rib3KyGYJ2UyFP42rP2dDeTfkIbtWerqYUwmjsVKvLHZZ8EYwe59wJ1DTKwzRRFHblTJ3V8itRe32mErgPXLnXmUqvE45YZZ3Ybvkrgm554bSREnLGQtVGxtW1DI0Jxd0WTM+8oyIHAiHBNaw9f+ISdN7nFHDKPYnb+uDFDJM+7KutiboEWOhTA/aItyZsX7fHFDjY3hZc7UeY2rpxh3GOc8onGQnzTu5fmagsxnXHImh/xDmj17RElf8g73XWswUYUU3z3gvJEDncN5SNi4VVwoZfZ1B44UQ43z1a808zZpwXaF39+UcAJxOeWWmfxygxxtEx0WunWmw9PEX6i3MdjInyaiBcjK+31gY6yX6ONe4ReWoL+796cDoU3XNuZdm08ACHyTamOV1kV4tdZ7G0uy3My8IPVHcFCwerrVH9JSoHzUk1EkrTx2Y3bebTDOYw9tfYyYemrftppZshShtuwloXekgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmt3R2NKcHV6NU9iRXJsUCtHc3ZNcjVTMmd4amxDeEtFbjhLWWVwcW9Zbk9M?=
 =?utf-8?B?dnFZMjlTOWFab0JGZnNXVk41ZTlaY0o0VDZjUzlwcG91MFhLZ0c3dGd1NmNa?=
 =?utf-8?B?V2lYTzNkelFyVVJ1QWZzNTJxallUMFBqVEVqUUY3T2VJV0lqdGRaK2pCNjQ2?=
 =?utf-8?B?a1ZUYUNGa3JjZEdxOGpia0Rxd3lhZ2kxbEtzazJxa0ZjZzV5Z2RFbjBqV1JE?=
 =?utf-8?B?cUJhRktxb2VkaWVOUkpENytGOUM3MzZUd1A0YkFWMVU0K1V6TjgyN3VHOHRY?=
 =?utf-8?B?T2RDa09tTlhKT3d4SlpQZFQycUNsU0xFM3Y0NHVpVkJtQ0JOSWlKSnFhVCs4?=
 =?utf-8?B?THh1WHJLMmhxS3NaNVZpdUYyRDY3VGNHRUE4OWVjek9EN1FMdklqelhMc0Zm?=
 =?utf-8?B?cDlmZ1ltK3l6TDNMREZ1RnVjdEV1R1JYZlBVUVVOZXdwWHNPcWF4VGJNK2I0?=
 =?utf-8?B?NS8ya1BVM2FxT1Fha0JxVWdtWjZQMVZ0TG5CRWFNL0ZOUHVlNWp4SXhxWnJE?=
 =?utf-8?B?MW5wUS9XV2hNKytpU2ZCZHhBSEczSUl2WldlY0x6OU9lb3ZxdGNqbTdONkM2?=
 =?utf-8?B?SnEzWFZxaEZCam9XdHpSajVYOXh6NzJNUWpsaXVmUXpZZlBCdlEvQmx4RmxK?=
 =?utf-8?B?ck1CcXN0VUNFeU1nQ3lUcnNrT3p6RlNSR2RGRU5kNy95UXp1ckhJT1Q2NUdp?=
 =?utf-8?B?ek1oeE9WdVNTR1lXdFV1VVFEUVJpSW9BOVE0YkRBVWtSREFBRmdXUjZhTGhY?=
 =?utf-8?B?dGtoK0RtbTdZNzJNek1OaW8xRUxFY0hzZEJ6S0FOdWV5Nll1R093Rkh1a3pz?=
 =?utf-8?B?eUNscEl4QXErMHBsSHBDNnB5ZGNLdm82TG1mSDVDUlkyckZpNEI1cGVMZFVt?=
 =?utf-8?B?ZGlQYkdPZG9qaTBZb1dubnhYZDBCZzU3UFlTV0V2VU5Lc0FLeG9FYTJqNzlo?=
 =?utf-8?B?ZjFrUmE1QzIzbWlJUEErdG1sQUNYUEVmNzMvbHJBWHZBSkxJM3ptTUl2Uyts?=
 =?utf-8?B?cS84aTZINjBodGcwSzl5REdTVzRSS1h3ZzIvNVc5QklkZExpYzB6ZzdqMW42?=
 =?utf-8?B?clNSMUFPL3F2Q3NGMmFOVERNNFZNT3FDUVROV3VVWGFzWjIvVlBvSDlsZ1Z6?=
 =?utf-8?B?UUxMV3pBdFR3b1I3QjJsMXZZU1diVytoNjJjdlo0NXVhQTNBY1JmR1AvQkRZ?=
 =?utf-8?B?aUUvQVZMUTNiajBiRmxYSkJsYytkUENMT3drQVA0UWRrR05iYmltOWFtYWtz?=
 =?utf-8?B?R2ZrdXh6T29Ucm9rWnJZRXU2RWlYMitpbEFCZnJ1RU43bHZTWVd2bkxqT1FD?=
 =?utf-8?B?TWRuSlo5a05CaUN0dmcwTitQV0dFTHlqeEI3UjIyTXMvU0h3a1Nqc1E0b2dM?=
 =?utf-8?B?M1lmK0FXaUxaM2dwWTk4eEh2STBUa21oMm5PQTY2NytQMzh5c0RUUnVUcVEw?=
 =?utf-8?B?NlU5L0V0anhzMFRjREdKSmdoS3pGS09YR1RqYUV0TmlNeGw4MFg4ZHVDbytD?=
 =?utf-8?B?TlhLQ0Y5bUlOSGFNc1RFa2JPdnlTbEt2OVJKL0RvYTcxRWFZZER5b21CRE4x?=
 =?utf-8?B?ams3MW0zUUg5dXBGNFdpTFBWNko2RlhrOEFPL3FnMXhDWUZsckFRWWZKZStz?=
 =?utf-8?B?SUdkc1JuTkQxbXpzL2V1ZnhVMDBOd1dXTWoyVlVuZFlWN0tMbUlobHJXR3VQ?=
 =?utf-8?B?UWRUaFNyQ3FWS0dreEFPS2w4SnVZMEdodUpISHJnNGRGamZCZkkyNGRkT2ZW?=
 =?utf-8?B?QzlwazlIUzdFM3RRYUQ1b0IwZi92SUpGU2VPVGpmQnV4bkNxbTNzank0c290?=
 =?utf-8?B?VzJsbGhKRzFxZjN2WjNyaEUvZFBvTTRKeXRSakpBOEZDUWNWR3ZuaE5MR0tH?=
 =?utf-8?B?NmRXZHI5YUM3d3k1QVk3QnVkd1VoZk5GdG5tWjhRVFpDbTVtVU9jbDNTcXlC?=
 =?utf-8?B?YUNQbzJrZUpmeFNLUDgyUG9VVXRZOHdrZERhSnVOK0RqeXQwWC9ROFRGSlZw?=
 =?utf-8?B?ZXplVENYS05vT0V1VytjZjlqd0NNYlBIN0VFaE5ndG1mNmhLREQrQUhOSVFr?=
 =?utf-8?B?a3ZUMDNiY0JPVU1QWW9YM3FBb2g1dGllUmpiUittYmVTd2dJUWQ3TFlYT1Bh?=
 =?utf-8?B?SUZEL3hTdEpEeXNDL1JNTHFXMWtOZVRKbldNYnR6NExxZFlzdGdNaWxwUXZL?=
 =?utf-8?B?TUh6REhJdXBJSE9SM0tXYU9lR0cvVDJwbVJmZ290VEdrSmpXdFVmSkFxOHNN?=
 =?utf-8?B?RitpQ3hYYTdmTDBxbVl1YVZkV1E3Zk9BTmdtL0E4L0VDaExkQ3hQNWx4NDhq?=
 =?utf-8?B?N3A1WStyYXVxd0pMU0FlWnQwYVFaT3Nka3RuWW5ManhhdDhMQmNrdz09?=
X-Exchange-RoutingPolicyChecked: LcU9f3p7cKIArki6rCn/F+ul8CZHQej089rNhynMZMvgCH/BF1zdo03NG/ftXfgzPqU9GP5JYtnF5an+/zrQA7Op1b1XGMkonpreIOl3PW6CHSe+WQj9XwlYPAvajJfV3g9BG0HInBsMWZlyd+Yk+jeupoJqDmcIrAmUHyWylgHk3ngdtSHaD9t/tI2kvvrB78CVIyh9r5fisLhkLpI7kAv6iVvuhZf/b2QScL83PsFwTVyUAHtCiia406gVPBiTA0Zm2F0dcRuVgOaWEFLakYZytY6i2+RnR2SWUvFWw4xCQozAq/paOwhGEuUHR2Us1nVD5rnbZ/Q/NYJoHnNXqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b872d298-fbfd-4431-84bb-08de8a7b180e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:30:42.6265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1jp5V9sHbZ8q/9tfxh0S4JcsOxi4Xz9hF5faqRPCjr3tgK8HD4pMRn8w+XEjzWrMIQLpYy+W2CxYaRaiTf6UOeznih6IRD4FAAT3ouQtzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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

Hi,

On 3/25/2026 12:49 PM, Jan Sokolowski wrote:
> It was found while running tests that if a test launches threads with
> even more subthreads, some igt_debug calls might not print their lines.
> 
> Fflush after each line to make sure we see everything we want to see.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
LGTM,
Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>   lib/igt_core.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 65325f08d..ed4f48d86 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3294,10 +3294,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   	pthread_mutex_lock(&print_mutex);
>   
>   	/* use stderr for warning messages and above */
> -	if (level >= IGT_LOG_WARN) {
> +	if (level >= IGT_LOG_WARN)
>   		file = stderr;
> -		fflush(stdout);
> -	}
>   	else
>   		file = stdout;
>   
> @@ -3309,6 +3307,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   		_log_line_fprintf(file, "%s%s", thread_id, line);
>   	}
>   
> +	/* Ensure output is flushed explicitly, as concurrent test threads
> +	 * may otherwise cause messages to be dropped or reordered.
> +	 */
> +	fflush(file);
> +
>   	pthread_mutex_unlock(&print_mutex);
>   
>   out:

