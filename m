Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EDCD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 14:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AC910E545;
	Tue,  9 Jun 2026 14:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C72Eapme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDE410E559
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017130; x=1812553130;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bfDVsPIf1Rs3kO+90aha+zcnEUzjINaUIugegu1lnDI=;
 b=C72EapmeZOoAR4S3FDcDFpU97iGybQ/aJDuB437/0f3WXbvDDuIdPoZI
 C00ljnlcDz/uHtHZZ6goQ6QcdySWqpdCsDCF/N8wwX7SRtP9KHkYULbQ7
 7OtYPb0Yt9tGK+aAGKmeuEf+v+zsy/ph2Mch9o2R/gFne51gg9uAXJAHO
 pK2mVrwuCVSE9a23OrGueLPb0RFw6HIsrRc8hmt3W3VTxBY2sSCGfMV9d
 SmTpdIQLk884ELGhR4+OunJbOs/BZwoP9XOB/9P8lGQBVJ38/eYkm+78w
 K0PLSpr7RG71TFfIfqsMYZSX9XpqwMu6siW5/jc1uDTwPxlNGCzJDaNLT g==;
X-CSE-ConnectionGUID: IIgYm8tkQhaSMUlzX3zJYg==
X-CSE-MsgGUID: co6AC9AUTYyovLsCyWG0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85403546"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="85403546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:58:49 -0700
X-CSE-ConnectionGUID: x5MNIAT9QCaS+uvvaxKb5w==
X-CSE-MsgGUID: +GyvafPjSgi5B3TTizKecA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="249807137"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:58:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:58:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:58:48 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:58:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ams+nF/lYvrROcmEwwqhkQweoqMFucJgibdi8cLOzE3wNytrKWxmFzDc7InlEVDEsLCa/rvtVbkexHgdw6AJjYzCr3eJKEHZiZA1C+LmzGrpVwADBIxoaVy9WF7rzt4TuQdt8oNG2+sc2whFso/W/ZjfyPfyc83gesaiZdR9zJm/1M8rCVX8G788G4Y6lxcTKGa7eWJs3b6JEYpr/Wjd7JRm7NoYnHeC5E15zY0lwExgNhfyvctuUHU6/3LwyQw113npjeGzvUhSG2WS4mvbR8FwU4whIQo/yRpSaZxyk/7ZhRqRJged+VAh3Cri+VFgDKCZ4XdclpOMHjtvJi4sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gv3ALAvtHPjKIOHYzPOm2h7SjikbF/qtb25EJFYyG8=;
 b=CJA+p8+l26XnkeBet3vDmtiLAA8YqOMhyPNRbDvp7swtPX8Z1kn7rwIw/HMX4JQN4RYRVbp+tUlNnEE7rX8Kp7eSLytyCsspdhfS2ptD8q5vkeRSrozX2tGB08lPrY9LLUsWZI7ZY1AgJR+5TdQaZpf580goYjxwduEiU8WRVLyxuNQ1ChyQrva1O4LnkcsT3HEcC77vxel5yWNU3kE/8p0sGlxvpCrc5OFyNCluh7KXeKkQCPvcIf8d5x5W17n+SFDBn791wUCbDO/Q7fD+NVPDhWF1Zfao7Z7aF+tEfGs6p7B18RHIlog/M0FSNN1kDon8CrfIpYoQJRkWPoBhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 14:58:44 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 14:58:44 +0000
Message-ID: <57622f1c-2a5a-4b16-b62f-24f34195068a@intel.com>
Date: Tue, 9 Jun 2026 16:58:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/8] tests/intel/xe_sriov_scheduling: Remove unused
 log_sample_values helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
 <20260527205644.2801165-8-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260527205644.2801165-8-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0168.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::25) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 7127d236-8876-47a6-e449-08dec63799c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 4pA+Q03BiB0Q2N7Kg5aIrv/5hWeohzxmlCQok3mM/3tkq+cwd6+vE3RTaVvUyu58wXo4XcLqUXxHZCwIzm82AJiJ2Q/N1KqM+yZVAV+iqOWaQYGAG8EYI0+0zc8N4rwfOUA5BRVtw9VK5czOKRv2WDWUoSSLC0x6Lqdmm0YBhAz5cWDpo8qdgoUsGBna2x4u39qHplJ+MkASieD7c0Dd0GOTSpqNJS1DqEh61ZWLrFcw3ZVAZOOA0vDVxKna1UUCIDj49NLAFJrHkaoUOnU0Stf8py5C6CNS7PFZBKVjPC2nlMTMCeyXnKA5JINhZhRqJt+ZYU6ZpSazGgIo8dOIP++OWG1BGA7MiFmnYqgyANgqlznrGZ6rGMdp5dVE46GpqiGyUjA8rRhcWxj9DzcXUy9Im20/YaOpdPAfUPiaDOHEhbnfo3NkHs8fFZX7dxZWJ/1kxH4M/0AtNH4uXF4AGVhSxv5HKW5mMUAA4jckKkKpwQxSe+VydaK2fXbBU+l+K1UZi46ZeeSX6Rlai68Ha0gKaEfoAlhiO53l6dDlhSjY81nGlNvKlUbV9fz1avcWagAnaa6eaYFvlpEf1CgJ9Owa1fXHe2BBKtDWbQ6CNgoxSiit2kYffSKEiuL0rKbvsJN8d4iEBr/UKKO48+25V3c5BpwsQvtWGjAtOYLid3EJTghMXCGj9HMNPT8rVr2e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW1sY0Qzall6WnczVWhoQW1RZnVsL2I5ZTlsek92M2h1SWV3UXRLdE1vWVNC?=
 =?utf-8?B?d0haaWRGa0Y1UDg2MEN6VEVjVnMxY3RDSFd0emNsdzNnblNDcFVlc3c3ZnMv?=
 =?utf-8?B?L3JxRVplZjNXOFd1K2ZoOU1GM3oxU0E4NERoS0M2cEdLNGlZcDA5dHR3Q3VV?=
 =?utf-8?B?OXZPcUVUbEIyTk9kUmhZNUtLMlh6eDFUT1NyM2FGZWpFVWtTRFp4L013UzFO?=
 =?utf-8?B?TXB2Rno1bmhJeWpDaUR4UlhJZ25yT25qK3hvQWFYY2pZUG1nS2ZFbmVsbVpM?=
 =?utf-8?B?TzhaM09WakxsWmx0dXowbVc3UE12dW03dkRBMGtZaG1hL3RUZEtPdDVuNDhR?=
 =?utf-8?B?WnVqams2TDcxTndaclp3aTFmVkFXVC9RM2o2RkVEM0xwdUNmSlBsaTJJQUdM?=
 =?utf-8?B?Qi9FWUFWSHdlelFhYnBOYlBoeWRVdlFxYkJCUnIweDBqUUx4em9XY2NkNzlD?=
 =?utf-8?B?Qi94ZkluR1kwb2dvTkhGWXdMcWt4bTlCQ3EvT2ZuK3YyUlYrb1FzbTUyVVVy?=
 =?utf-8?B?Q2NXR1FlZk9vczRqaUhuN1pmMmQ0NVBiZkZpV1VwdkZZZ1hQVnVUYzd5aW53?=
 =?utf-8?B?VXo4QWh1TTBIa3NYeVNXdVBTT25KRFNiMnFnOFlNTDdSSE5zTk9zVE92Nm8w?=
 =?utf-8?B?YVpxR3hsQjZCdDJ5NUw2V3pJdGRISWhvK09ScjN3dEhCTHlmSW5vRHdoN0R1?=
 =?utf-8?B?SU9NMEJkbmdkREhSamc1WDF5aitnTnNYNVk0VHhXOTFHb1d3TWVwM0laMTgr?=
 =?utf-8?B?RVRvRTA1ZXdXSjJ0MVhrb3Y3YTNCOGMyM0duSVhDblhpMlo5MzNZTnFFeXp3?=
 =?utf-8?B?am4zYzBCa1VQQTBDR1MxRzNPUGM2bmJFWS9BWkxVcHd4b2x6TGJ5aG93R2JB?=
 =?utf-8?B?c1A5Tm56SkR1RWJBZEpMbnBMS0Y1ZEs1VjA2bnFUTEdobUV6dWtmQUdWZVZ2?=
 =?utf-8?B?YWxBaFZDYzRpdnhRZk9lc3dhWEFYbjczVjNCWG01SWtCcG1EeHAzMzFJS2Mv?=
 =?utf-8?B?VTg0ZE9yMStlYVVJWTViQi9yc2JwRUFlOGFLckxuS05kV0hIWmdMUysyZjhK?=
 =?utf-8?B?OVMwU2xKUUV6bXk3UWJTK2JVMGZycmZlcCtOK0dQVXlEZjhoTkZveUsvT09U?=
 =?utf-8?B?N09FNTNyTVpSMkNLaWVIU1FRQUFCbnRaaURyUVJGckNPU2puenlBeXkwNjNo?=
 =?utf-8?B?SWh1VUJTcWd2c2VuNGdWbG9rTU1qa293TGZuaFM3NG5NVmhiY0ptU1U5cmNM?=
 =?utf-8?B?SUorbnprTEZzTXIxWElRb0RVb0h4S2hkc2I1Wkg5OVJDYnlTTVhBcWhMSGlV?=
 =?utf-8?B?UUN0R1Rmbnk4YUZjRDNpOVZkRVhCV25Wb0txdG54OGhOVm8yMFZPOUtVWFdk?=
 =?utf-8?B?b24rZEJKV2VJdUFYZCs3VEg3V0tFdmlrMlQzdGRySFgyUUtkenRiY2ZxeVpt?=
 =?utf-8?B?MUllWU0vcS9JTGpPVFJiTVdUOWwyTVhqVFZ0cWh4aXlVWWl1cU1FNEU2ZTVS?=
 =?utf-8?B?c3cxK0tHNWJLVWJxaWxDY3BNaFo0ZlhOZXkwZ0R0dEZMcHcyMkJwcW5USXQz?=
 =?utf-8?B?Q21nMXVFV3d4L2hRdlducXlyOTdPMjRuNEJUWlNPeWJGVjZPanIxTFJuVEYv?=
 =?utf-8?B?L3BmaWs3WVVoWFRwZWozbXJLRjhwMnFoaFR6R3FLbDQ5clRDREtJM3plSnZS?=
 =?utf-8?B?WjBCYjJjQVpxZ09BTFJVK2kybktWYzQzNVNDaXhYZ1M2S0VuT1ArSVhqZ09C?=
 =?utf-8?B?UU1HaXEwcGRSUzVsbWFnemZhZklWRVI2WWRrNURKQTg2aVkwbzQ5Q21XTHNB?=
 =?utf-8?B?VDF1bTJJLzBNcGYvUzhPZWM2TW9JdkJpdXFsU0daTGliYTEvQ0c5elV6WS80?=
 =?utf-8?B?MU85djU5aGRsYUs0Z3pvZkgrTUR3T2tNQlFFc2VXcmluRFcwanl6S1BhNkF5?=
 =?utf-8?B?b3JCRmlIdkdPMlRsdEtvWm12WGovbmNUZVg2SDRRRjY3bmNiWjRQK1c2c3Ix?=
 =?utf-8?B?S2JsZDgzR2R2bjExclliNzBLYXJRZy9CNzN5d3VsVmJhZW43dWM2cGJ2UTdB?=
 =?utf-8?B?dTZKWmFuelhLSDFQRlZDT2hSa3Y1dnpzOXdLcmovUThtdmNQK29CYjBRN3FF?=
 =?utf-8?B?aTFaRUp6NTNXUnJ1TzR1cHE0bGhZSzJRM1RGSXk5TWw4dk8yR2t6YmRJZWRC?=
 =?utf-8?B?ZWJNZUFqdGRTbi9kMkpadUJlcG1UZzNTRUg0cWJiWHJGWUcxdlF1bXdnOCs0?=
 =?utf-8?B?VkhSclRqSDk1UWNBLzN1U21hbEllbTJ3TnpQcVArSlV4eE1RRVE1Rnp0ZnND?=
 =?utf-8?B?bmdQU2hhYW1QNG80UCtCVFNRZXZTNld6R2dmeExTUzlsK2JqN3dqQT09?=
X-Exchange-RoutingPolicyChecked: KbLPrWYunRLZ/S4fdSiPBUXwP8FIGP3lfoMDq+593kvbBiij4Sia5hJ8GssWVmuiNRmCCrYcEdo4dDGctBvEfL9MRohY2AXLlRgEoWuyqFyBtDX0X3zayBujtwxpSjYV4XtoC8GFjZBCGx1wl/U8vHpzlnKTFb1HZJkmx5qovnhMoS4HHQpcX5wcJ1N65n4WrqbJLY87+bkgQ4PfUXG0FUyNVDz7YFFsVcaUwbbcpk7JHBVWDEfCGE91HWFlrAUvp69o+PAWMOB8ETZh5m/+bj1+4we3YFB8Qe707RyoM4908DUD1jbvfO/KVGelu74/nOmWUOpGDGx5VAKkthUoWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7127d236-8876-47a6-e449-08dec63799c1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:58:43.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2vrAyOfx4DfXrVHhiv8EqCL5EFXmamTAB9ybC2A6AeRG48QyBJA50SFuGDE3h/7vrdfpe5XVPBf/Pyl/o4B4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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


On 5/27/2026 22:56, Marcin Bernatowicz wrote:
> Drop the unused sample logging helper after the throughput verification
> path stopped relying on the detailed mismatch dump.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 47 -------------------------------
>   1 file changed, 47 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 692f92e76..915442380 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -472,53 +472,6 @@ static void compute_common_time_frame_stats(struct subm_set *set)
>   	}
>   }
>   
> -static void log_sample_values(char *id, struct subm_stats *stats,
> -			      double comparison_mean, double outlier_treshold)
> -{
> -	const uint64_t *values = stats->samples.values_u64;
> -	unsigned int n = stats->samples.n_values;
> -	char buffer[2048];
> -	char *p = buffer, *pend = buffer + sizeof(buffer);
> -	unsigned int i;
> -	const unsigned int edge_items = 3;
> -	bool is_outlier;
> -	double tolerance = outlier_treshold * comparison_mean;
> -
> -	p += snprintf(p, pend - p,
> -		      "[%s] start=%f end=%f nsamples=%u comparison_mean=%.2fms\n",
> -		      id, stats->start_timestamp * 1e-9, stats->end_timestamp * 1e-9, n,
> -		      comparison_mean * 1e-6);
> -
> -	for (i = 0; i < n && p < pend; ++i) {
> -		is_outlier = fabs(values[i] - comparison_mean) > tolerance;
> -
> -		if (n <= 2 * edge_items || i < edge_items ||
> -		    i >= n - edge_items || is_outlier) {
> -			if (is_outlier) {
> -				double pct_diff =
> -					100 *
> -					(comparison_mean ?
> -						 (values[i] - comparison_mean) /
> -							 comparison_mean :
> -						 1.0);
> -
> -				p += snprintf(p, pend - p,
> -					      "%0.2f @%d Pct Diff %0.2f%%\n",
> -					      values[i] * 1e-6, i,
> -					      pct_diff);
> -			} else {
> -				p += snprintf(p, pend - p, "%0.2f\n",
> -					      values[i] * 1e-6);
> -			}
> -		}
> -
> -		if (i == edge_items && n > 2 * edge_items)
> -			p += snprintf(p, pend - p, "...\n");
> -	}
> -
> -	igt_debug("%s\n", buffer);
> -}
> -
>   #define MIN_NUM_REPEATS 25
>   #define MIN_EXEC_QUANTUM_MS 2
>   #define MAX_EXEC_QUANTUM_MS 32
