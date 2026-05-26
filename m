Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037FDCD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 05:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EF210E203;
	Tue, 26 May 2026 05:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmmVoCFm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B610E203
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 05:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779772798; x=1811308798;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=x8PbrXSvM6m2ywr8PGBj8wUbpUJ7csHT3GnM8+b9Zvg=;
 b=XmmVoCFmJ2DtGY17Wu8KbnxpZCETSDceAdpd9+hV2I8QFoLpiaQ4AmMP
 NP4gVtwLhU4XZGYmJ9ySuy9sXA4T3Tb/JmDpsCYMOQkiQA75bsl22wtw5
 8SQWJSJdTPbBxYZek+Nof+9Qmg05auO6KRhlJNgpsRxJMF4cgKzR7/sr/
 rFFyoX+wBlW5euwnjV9vI07yyqEi7h6McjnVi8W80nCmnC22Y6AnB2YrB
 tJEWDUqE+CsrTJO0ixeM0ncDxsgqo03wVjXWtB20dpd+5i7EJrQ7wNVhh
 zpPXOfjbp/Wp1jRYQMMf99RoRTnj03BviS/bIE1F/2jZtaM/0psmNNJg1 A==;
X-CSE-ConnectionGUID: tu470fZuSOObkkaSOMw+KQ==
X-CSE-MsgGUID: 1DzboZLkTsySbwNO1rah4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103256988"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
 d="scan'208,217";a="103256988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:19:58 -0700
X-CSE-ConnectionGUID: H5QcAhvfSHGqYSPPvEvrqw==
X-CSE-MsgGUID: 0Tm6VTYrSOSZB3KAMnlaPg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:19:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:19:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 22:19:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5ZmeNteyoCJMB/Y9FSBRWISNYKY3KvN/gv2rlx3sxixfK/xoHqiVVhwHSlnLBcvq3Sf3wCxcvmct7CruMu1gflEvjoYdJEwoIkooOcnpSr6iutEN4MPLGXwC4+SvItMC3cSKiXGXwP4YFDEuiKngStpbVX16JuM/ApNMO1ze7cqu38waN8+pD11ZVfvhnBfiAs9iNxrr0pOLsRe7wAbUMV/UNamJwyhqh+ICdQcnc01iuR3v6/2px8pJsuKtbTT2CaP4iVV7Bgp6QIFysUutVriBRuD3kVFZZKnW6fy5xdAclokqyHplYo/6y1e59z/4JJnND40CrhB8ij8VbFgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNg1I9OG7j9PY8RaLHz+fLCSgZeF3Je5ywyYx0NIp4g=;
 b=XvvfI6Cybl9BDF6a3p/NC/HrVZLm+0bx262C3LRUgps3oZajTu6MnsqNW2CNm3YvmP0WHgLOmZMlIgv7TbpE3qCjZS2QHtNRA9je6typd8Nh9E5XkbkJJTTmU4/cmJZ3h15tkoSRFHsTDOoIYMIz4I2Nw9WRjT8wsuWKT5XWJ13NkTadDLA9K/JqvNICmO/6qkdoxWNE7eiZqHTLfWkK8T2OgbucGIz37Fj5qxPI+0VQV8CtUFpMxlK/L3mcAVGnPE7hotqlSFTbUaEkkZOyzFdyfyEbnM8mgTY1OdcWZIGt1xgZzFM27rx1y5QaNuU0DYTfN6j41/rmHIF0uLyX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by PH7PR11MB7988.namprd11.prod.outlook.com (2603:10b6:510:243::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:19:55 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0048.013; Tue, 26 May 2026
 05:19:55 +0000
Content-Type: multipart/alternative;
 boundary="------------B8ZNUBJedyXqCPLwHvuC6o3d"
Message-ID: <90a2ee62-6d1c-44b6-bdf1-511a9493f3f9@intel.com>
Date: Tue, 26 May 2026 10:49:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/9] lib: take out duplicate assert
To: <igt-dev@lists.freedesktop.org>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
 <20260525163850.3493602-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260525163850.3493602-2-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::28) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|PH7PR11MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d77379-5eb5-4c36-1b64-08debae66bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|11063799006|22082099003|56012099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: gDkl7fRsHB5VJLCgOjq+ZHRqKqs+dGcVZZSyUaCmeb584WMmvbsPpMDMsuVsFbuOwI0dANLi/F8k8h3dpbAhW7VqYqbI3fwVKugt+wRJEOwnJmoPwCRAn+V+UmlTeKAB4iDE4Wn5MwPvIHh2UjH8lFjQdicEiZJdacvWwQShIklNqLM9vbh/2GLS+2O1U7h8zjmWD0pNWoyDrNIbW8IM8MQm54LEbveVlatD1xAQbuFpl3mMgKubW4Nubex5BwvmluEOjIeYBkcTSU85OjCXlYY+zc7UIR8QN1ka+xMfgDqM0qXuemcNmPVfK4iSFM2aUw4krVgzjq7xBjxu2092VdFAxubmdieqH+gm6kStzIEM3Ik1aUIrtlgSj2IizGqjezxFHUPXMO3ZfREvvAO8iejOyut9qks2UYhnITQ2KaIDvcSDqVt1t59izsB9SXI6Be5Pg7AV7YX6R5XUuluGTAhG6704tsxatDppRsfPF4bIrYsvIlp8ahovyLOCOPm/mthn+lLFN4V/t+PyHnE4i1Tb0DrbHf5Ac96Xo7AZ4jvIFhs75sYyP5Xpf5ph2Scr8vKMc1efwHU2dhN9kDZi+r+zgbpQc8b8cKsEsgucr9hvhE8FeKJ/ZC463Yz90dP7wDiI0lTU8R4j1Xq6UjiZWSC1PLYLZKYiMlL7BTUlo28P9/bZuN6qtAnHlLi0vpDU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aThnQ3ZuMklmeW9BRFBCNy9nejVwcmVQN0ZDd2JwZ1FCRVFqR3dGUmJWZ2pS?=
 =?utf-8?B?ajlHeXpValJ4NEQvdTJkZGpWdGdRc3o4UEpRWFRjK25jN2drS0F3SEVoOEZ4?=
 =?utf-8?B?MjhFL3VPclgyWllhbVRmK0Q2RjJ6NXJpOFhZK3FXcEFhZDZURkJIenNWb1RM?=
 =?utf-8?B?MlNPVFJRRHZHMEpOc3NSVjc4YUJLVkJodEJ2Y3g0dEFleFhobXVHTlBxM0lz?=
 =?utf-8?B?UGVzZ3g4a3VKa1RRdnJ3Z3VLcFdNMnIxZWZEYzBYSWZtQk8yMmY0UUtqQnR5?=
 =?utf-8?B?eUNFdlUwVFpOK0ZKc0Nvd2cwOHpabEJORDhWNisyZHNLZ3FreEpRMVJ5MmV1?=
 =?utf-8?B?TXBnQWhWYjhCZnN2TE9TeUxObGFzVnZkc0lOY2ttRThPYVZNL3lmMUpVUHdQ?=
 =?utf-8?B?L1ZqUGZwcWQ1dVppWUJqSW9Nclhmd2J0ZXI4dGRMcU4zcU1nYUJzdHBBTEVR?=
 =?utf-8?B?ams2UE9HV0lOQ25tTG13d2xsTGt5MDVyWjdCRTFwemxTSjhpTXYxYUYyVlhC?=
 =?utf-8?B?Y1pkNDlJamVTWjJHZkNBY2NVNDNuRzAzeUFCZ1JiT3ZrbXdBaUlLeHpPWUE5?=
 =?utf-8?B?K1FrSEJ5MDkvU0ZzNDhWS3FHL3VncFBaUE52UXFsODBJbS9pU1Zyc2pjZzBT?=
 =?utf-8?B?OW1lYzNSMTNITkRGTFllTDE2WFcremFmY3liZks1VnQrdUg0MVJCN2NEeWI5?=
 =?utf-8?B?cmJDdDkvVUZzRGhHQUxQcXNLb0lGNmtPK1d4M2tOdFQzcWdGT3NmUmJIb1NZ?=
 =?utf-8?B?WVJ1VFFmQmNvZVpxSVIzbzF6elRXb0ZTLzRXMDdyd012ZXk2cFVGak5odnNM?=
 =?utf-8?B?RWNGeU40QXc4ZklkWmtVK2trN2xlMy9mM2I4aW9qMURDRXlzeG9WVEJoVDdD?=
 =?utf-8?B?MHBlM0s5Vis2V2NLUjRJRlNwbGVrdlpzMnc0SHhuNVhMR21rTFlpaGRkMmNG?=
 =?utf-8?B?cEpkOHdjTHpoZDRiVFRhZ3RRTTc0TElDeHMvTW0wTUt4ek8xTzd3dVNDRkN4?=
 =?utf-8?B?RzNpRHZxSTNVZFRLcHRSWlRjNlJudWlxbWczOThscXlneWV0VndqK0E0Y2RM?=
 =?utf-8?B?OU40c21VN3NSaHd4MWtLZWE0Z25NTXVBTU5ITEhqWndlcTJvaGMzamJ1eXl2?=
 =?utf-8?B?c0t0VjFRTDg2YlV6NFdMOTBzUlRBMStpZ0xsemozNlhQK2x1c2xNbjg1S1h3?=
 =?utf-8?B?OUlLT0EwYklMUFZXb2hDRkdwUVgzTTQ4MWRFZ3dkUEV6cElaWlBaZ091Vm9k?=
 =?utf-8?B?L1VHR2RSaGlhS3dXL3Z6c0N6N01aRlg0QXdRbUcvL3JyZHBOcTFGbnlRK3Bm?=
 =?utf-8?B?Y2tKZFpRcVBBTlc4b1k2R29sc2pjTGhSK3Rra0sxMHVPS2pYN29WTzZieHBt?=
 =?utf-8?B?dWV3eTlGZDhERis0eWh0ZVpVVjhaZGlJcWI0ck1rMWN3TWpWdU9DN3QxZUov?=
 =?utf-8?B?cHNrOXNTNzZUTFkySmhuMWVYbTlaVUpIcmhlRWRRK0E3TXpXNUlZbUdyQTZ0?=
 =?utf-8?B?cG9Mak16TDZqQ0VSZ2pMVVYvdVRGaElMVVJuZWlyM3BPSWg4aDV5WGc3SUZD?=
 =?utf-8?B?cnR6NkpiNkdjMFJrL3RzWUpJZ0ZPSU1rN2lvVHgyV2F2VCtGZVFsaGZxUlZa?=
 =?utf-8?B?aHZsWmFodVZudExndlBpS0czZU9nL2h4NWlZZjJqTFhveGxOTk80SWVXTk5O?=
 =?utf-8?B?RDlBZ2N2Uk0vM21QRjUyeW9hMzRjOG9LMmlPNnZwU3BPcjVtUERuL1lsRDht?=
 =?utf-8?B?Zlg2dkZ3OEJKSGhFcHM5Z3R1RHFQTmlEMHVBQnNUdXFycFB2SHJDUDBWbGo3?=
 =?utf-8?B?ZW5qbVF0TWNyenhROENkSHg5aWZhcUt2empFR1daaTkra0phQWNZSHBrWlp2?=
 =?utf-8?B?d3lYNzk5bktWODNLZmdmQXF4THQ2V3doYzhzcmFBY3JRaHRSYUYrVnVuaW5O?=
 =?utf-8?B?RXd4K1FWSVk1dGpSOFNIUmZVMXh2U0dGSEM3MEJuL2VWVExxeTdlb01zenI3?=
 =?utf-8?B?MktiUGNxR2k2QVJlS0xNVVE1ZXJrS0hleXJVNnpIQmpwQ2szYnMySTl2OVRi?=
 =?utf-8?B?UytEWDJoN2JkdSt2ZmpiMXRLZm9TZFlEaENrb1AvMTVkRFdJUUhPSkwvZDNo?=
 =?utf-8?B?U3hGOVAwcDdtdFl4VHErNjdXL2l2bmp0NFZ5MXhaSFUwYlZtK3JMWUx1dXF0?=
 =?utf-8?B?RjFWYi9TRDVFYnZPRTROUno1KzNxNXY5K21DZkJ1dElyOEpTR1hWR3B2Wk52?=
 =?utf-8?B?emk5UlhGNURjSkJIR2ZTRHkrOS9NbHBFTzBwMDg0UjhJVER4ZjhZRUlKZE0r?=
 =?utf-8?B?ckQ3VVJCMFFpOStNN05mWENhcHZWaWc1d2xYTkFCMW83YWFiRmJwOTRKSGZR?=
 =?utf-8?Q?/jInkl5Jhj/qLFXo=3D?=
X-Exchange-RoutingPolicyChecked: QUOD8U0Y9JZ507jpl9l5SvgNuNtmBoYsuxwSzKo54BZzMRjKHU5guYPPVFILix5Hv+4ZgmK1003agvWhHOBQq8fiGfbRymTp7TRg7Y3OSrnQ/SZ5nQtoCsaVomSJQNE5pYEAA15DQnPAkI7Fp79RU5FNQfNpZo/8NRnkIeC7rcnXFu0avbjRa4fPNBvjRky/29xwvHS+urFckk49bLnRB8PuxXiDVnuymu+LfJQQMCXzPpqDD/JCEfrbVJfGF/JPS33N31f1mac6pya+GcOTrjm1kq94Fj6Ca2ehLRU2usXAO5v4lgjQizCKsJSHNHbseQJH9exw3K10vr2ezyUvHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d77379-5eb5-4c36-1b64-08debae66bec
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:19:55.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lw+0v8ehd+0iqIO7QvPTBVcAgNxeVbtcse2daoffMN73pqbxnHW60hwLBTqnmKVy02HDZzEA7ZSWICik3zurQnb3P+LhhTF+cuKK1wqYT9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7988
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

--------------B8ZNUBJedyXqCPLwHvuC6o3d
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 5/25/2026 10:08 PM, Juha-Pekka Heikkila wrote:
> in gen12_vebox_copyfunc there's the same assert few lines below
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   lib/veboxcopy_gen12.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index 2193433a1..9d07ebb91 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -314,8 +314,6 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
>   	uint32_t aux_pgtable_state;
>   	int format;
>   
> -	igt_assert(src->bpp == dst->bpp);
> -
>   	intel_bb_flush(ibb, I915_EXEC_VEBOX);
>   
>   	intel_bb_add_intel_buf(ibb, dst, true);

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------B8ZNUBJedyXqCPLwHvuC6o3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 5/25/2026 10:08 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260525163850.3493602-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">in gen12_vebox_copyfunc there's the same assert few lines below

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/veboxcopy_gen12.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 2193433a1..9d07ebb91 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -314,8 +314,6 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 	uint32_t aux_pgtable_state;
 	int format;
 
-	igt_assert(src-&gt;bpp == dst-&gt;bpp);
-
 	intel_bb_flush(ibb, I915_EXEC_VEBOX);
 
 	intel_bb_add_intel_buf(ibb, dst, true);</pre>
    </blockquote>
    <p>LGTM,&nbsp;</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260525163850.3493602-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------B8ZNUBJedyXqCPLwHvuC6o3d--
