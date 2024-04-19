Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ECDC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 09:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7B10EB0E;
	Fri, 19 Apr 2024 09:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvnzVCPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00A10E661
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713520448; x=1745056448;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T7HrIBIxyDDOQFyPi125paka5Cfy+SI48B0JGI4vYsk=;
 b=MvnzVCPFbc8q77sM9rjOB7FlDgqVzE+fv9nszwz0qADkrvPUojw57aKs
 ngDYkCZR0M3UT+U9qwMCDGIYO4c2yYbZeO/PTKUKbzGjDJ5JCuPRanIxZ
 nN5ooTdrdS0qp3UA+saPRe2WuyeSC1HotmAL0EAYj/2oN/vHsIWIIwTUY
 ynAHTKWw8CbVNCxzZ/npsD8XKCe5MwPAvBIZ0QEKT/bYDVYgoQayV1d6B
 t4ILdn6q3sTqcNAF0n/nc7lxynzTTWHoDORc+ES7/0ne7zFwPdzswZin6
 wueRcaJYBqIcU5ew1cOyERioeJMho+CxD2MdsyH/HfH7GS1u7rTJPTVee w==;
X-CSE-ConnectionGUID: Kwl3/7XwSZWlHliOLdF20g==
X-CSE-MsgGUID: 4A88jMf9QZi/6phLr0Jr+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20538971"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20538971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 02:54:07 -0700
X-CSE-ConnectionGUID: VG6t3RxATDiSCQwJc51UDw==
X-CSE-MsgGUID: 2iiJ5u/iRN6ceyDFVhsftQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54205838"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 02:54:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 02:54:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 02:54:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 02:54:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 02:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY2BTJlAN4vP+IBrc+OOnsKgW9TsTfmzFgJ4gQyQbOJfmxdZTolxVZllXaEoIgBdgvPgDk57Nl/O5QUe48BR8ijaK7TvoYCB9lwdrIHw0PLD9gEf3fJtCSXJe2sYBdzndcUfXWeulZbFpjBKg9jKL/e8szpJu3k5AHHm/KCkusPJg8+tl0902U3Yxe9vACdcloGa4J/J45254YTpAaHn51UlvP2t0Wx/QfYA6FWYQEtBrfVdiDyrqCLLVsdbgNonwYCCNn6gwRqfZFNz1/83+p38nhxNHwxE+wWoGuxPJJIT4ZxRUKibMSNa2fnE2HAHtuTQDmvf8xUt+CSaUzVeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqKU+TmPx6cKCwDEF7EfQOlSx2IPM4Vte3QOLAFH6vQ=;
 b=Jv11EAqZ9kD6b95oYDcLZsBv4X7rYDt0FIZImW4ULpe3wQx0ElJvUmIgocAHjpEf87yN+eEqTIph6Cx4dT2J3IMVMGNIF88ljOYXDWnKS8oiAzQEMFznuwDhuIHzdNj/xooesihC1pkEVg+ab7RzydWIDsSDHk1+Da141LnXr0lyIGI3gqfTQFskRFXY/BbyomCoYDTNO+PHwVFUaaAfu5MZPfmWOXs3kB6geJI3chejekqoTBVkhdVcpeJchh+bdPSy5Gp8f+XqH+CIJjYNSrqDxfdYn0A2+tV6sHdCapuZ7JKq9Qnrg/mfWMaSf/0zmz3oqlwISONxsd9bAa5HMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.26; Fri, 19 Apr 2024 09:54:04 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 09:54:04 +0000
Message-ID: <63cfd345-bcca-453a-b6b2-465307bc9308@intel.com>
Date: Fri, 19 Apr 2024 15:23:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/7] tests/intel/kms_big_joiner: add missing commit
 after reset
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240419064001.2401850-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0215.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::8) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 930cc8a4-b8ad-4221-642d-08dc6056a5a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1tpkgDqdFyZDz25ibcrSbRGNtvnRccN91AML46s+32Lw5YuA1imjV8qYuBww48w4ZS02K8cWHv51aEkuHc09LbVkBZqEUeWteMZQKIdw+MsZGTDq/Y/pi/IAhhIXT5HMJ5KagaABI7hLw7SuUbwLJ9Q0HwmIVwVxQBppoD54eCxJD2wFsg3ZU2Ey5C/8QSTC1CJLvjHYeD/WGmatvjzQ18ga1JbhHojS6XFWska72wmnq0+AxKvtkpg4HfcwU8SmnoD8aO4cSpzDr3hDejI1YSwvPbbO+i4AJmkI8lTuXnnELePP3l/AobKs3rGxgHDNL7Jp7VuLVGHqZ4fLR1rJcOx9qxEVb2NLxo8j2eKhORwW7NA3WkssQCkgCZFUuAbAc/OWRYe/dSvVdwGYmIMGEMKOlt9ujQadeZzw7QVKEdVk7KRBBfOWKo6AUJmFg1A1qoah7m+yVRYHysBLNuPcRGCnF8xiEKEcw+tdBPS9l8ZSETd82I6N/58kG/kaR9XT6Vb+3OZOYMcNSjUPwz0Pc3yH97LkIzNhpZ+WH2fINKCtSNoPYLsgDvzLBJJtfNZG662OSFuvhg/+mmtSN82Ub38I8J+qhK5L4CuCcnlUxX++n17oxZ+guRls+opqTKqahfiROTCLr4CUgKcUbFxcD62kOOSNvNvk5F+MEAr/v0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2FPd2hZS08zOEVmUTJiU2grWjdLYmFsaDhRVFdIMkhzdjFGZGVDU0RsdmlD?=
 =?utf-8?B?SGJCUUdIdmFuUnliV0d1NGxQRU5qVUJKcCtvTlcxSHk3YmY0ekoyV1hTRFNW?=
 =?utf-8?B?ZitHMDliWnp3NmpSWEJyc1Q4RTViT2RFcmdRdHgvYnltWXRScE5RemNId2x3?=
 =?utf-8?B?WVBVSzNPR1NXWSthZHRTaXJmOVc3RDhTN2VScmJwcHJ2UVArbUo4NU9jRC8w?=
 =?utf-8?B?VXV1QVBlMVBLYkJvTC9JaU5TaEhxREVHVy94Qyttd1dJa2g4cjFlU3l4YjFx?=
 =?utf-8?B?N3k5Mko2RjR3VmoyZ2tsSllmT21JeUJ6bmxSK09xUGRPUG8wTDV5emVGUXN3?=
 =?utf-8?B?b1orbHRld0hHc0ZRZ1ZQdnc2Rk9sc1YxVFZ3L2dhd3RVY2JoZXV3dVMvUnRx?=
 =?utf-8?B?SExPTHJIbWQ5YVR6RWplNjB2RGNEc1RzMTZDVGl2bWZKT1dQbUFoTnFqSmhQ?=
 =?utf-8?B?VzJMblRZeGZ1d1RQTEh6VTZiMjRjUDdNb2N0OFh6QVF1aVljMHR5UzBUYkpJ?=
 =?utf-8?B?U3o2V2ozT0ZGM1h4dVp0ZytJNVAzandKVG5Pa3JHZUtEU2ZOQ3pJd1ltVldI?=
 =?utf-8?B?RExQTWRVQU1NMTF5eStSYlk3aFhiTjVJWjEyaENUd3o0S2hUUTlscnc0RS9B?=
 =?utf-8?B?ZVB1djVPRWJRRmljMjE0b0hiZVVVdzl3QTNBNG50UDhBV3VyMUZLYVBqSHZr?=
 =?utf-8?B?eEZncy9rTFNOd0hIQ2tLdFExbFpnYk90T0ZJV1FvUk9iTG1DL0kyeEFkdVJt?=
 =?utf-8?B?SnJKckVnanlGdUgwNzhkS25VWFBhb3czTWN0TDFoNkh4cTA0SEtrY3MwZWNP?=
 =?utf-8?B?amZQRDJoQWpuNlUxK3VHUjZiWGloQldQa2szN28vVnhrUWhaY25OemlOM2RJ?=
 =?utf-8?B?ZjdtL1BWVmltbmp2ajhVUDNZZjJzRU9ZZWFiYmIzQUlHdnJTcEpxMHkwWVc1?=
 =?utf-8?B?V0JmdFZySENpSVduOGlkMndMME4vRHMzREw4TDR3bWhGMnhzbi9LOEtveFZI?=
 =?utf-8?B?Ykl5RFlmaVhqdzlYR0YwZTBZcnMrTmJuUy9LaXcvZjdMek93dWprRk5neGVj?=
 =?utf-8?B?dm5ubEFDQVRYWC9meFVlUTE0UG94TzUwbDFTU2t1Z2lCM25ZejhRZGVaZ2xX?=
 =?utf-8?B?NlZmaUUxUEV0YmYzN0V2Y1kvVktFckxRcmYwNGRHMytOQTF2Y3dRYUZtaGVa?=
 =?utf-8?B?TjgzWkRNVWhtL2NYU3BOK3JYVkc3Tm9KYldjV0pIK1UxTG9FemNkN0g1Wmxj?=
 =?utf-8?B?aUlHK3hRempHUEcvN016ZlZzOXhGaHdNN0hGVVJuNFVPalEvMUh5dlJSWm1H?=
 =?utf-8?B?KzRIcXl1eDZsM1ZRVnQ2ZXd6bGFVbUJpcWg3ZFlUbjhBaWwxc3BtazhvcEtF?=
 =?utf-8?B?NWlCRFpmTll2ak5BQ1c5QktZQi94djlsWWl5MVl5aEpKbmtZTy96MkVnOWlJ?=
 =?utf-8?B?VVUyVU51a3NTcjRpWVJQcUFTMDNZTGZibGVNUUJTQWJyS21FZHZlWVY0TFg0?=
 =?utf-8?B?L1dGUCs4U0p0UE91QWRiQ3VlN1phcXhCQWRDbDZUZnE0S3h3L002VjNoUFYr?=
 =?utf-8?B?ZkJqaWNETTVjdzg5Znd6WWZ3T0RrU2FXOTVta3ZDNVpFdkdzYThFUlNOOVBX?=
 =?utf-8?B?cFN6dDA5TFFHTjZkRnlNdjc0clR1ZDNYVmhLb1UvL3ZxekVTRUlLeGtBSzQ0?=
 =?utf-8?B?RGZLblFGRFd1NUFlMVF3NkZwbWIrZi9PV1ltRVc5amRkdDZUS2NZSW1zWnhI?=
 =?utf-8?B?QzlQVHIxNDloUy9oZ05aWGZIZE1zR3V5M2hLSGc4ekVnWlRpZVVMeUhFWTVl?=
 =?utf-8?B?clFxRWs2bWZOZkxhYk1NNmZSeWRTdEhZVFJlR1lvYnVvV1M5WEc3Vng3RTl5?=
 =?utf-8?B?WDl5WTVFUjdWZmFGa0dnUnpHTjlFOUI0RDZaYWsrNnJXZmMrbURDVzBUbGM0?=
 =?utf-8?B?Y2t1OGc2TExFUU5UUG02V1YxN0UzaE4yU2hRblg3RmtKMmc3QlpvMHBuQW04?=
 =?utf-8?B?amdIM0t2ZHIwaElIUFlaSXFmeXVYK3VyUzhhbDZ2blJsUWRiZnFTSmF5QVNK?=
 =?utf-8?B?L1NCdjcxWlZJaHRrM0kzeTRLY0kyNVlLNTVCdDNJVEZ5UWc2NVJocGtpNnh5?=
 =?utf-8?B?L2VxQUFoNVUyVXdjcDNSbnFhcWtCWVBkN3VOZWlKZDJRUGVSbFRqWkxoQ3kw?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 930cc8a4-b8ad-4221-642d-08dc6056a5a4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 09:54:04.5449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3B0uPmvPgY7VkVwdL+WeRswfOnJYzbvnj/Q4UynI8Mknm3wDE4l7iAb/aLqd5scmf3AQj8k3IWPSBOEZD4pFu8yZ/aRtXvnJmE1sUaiqPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
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


On 19-04-2024 12:09 pm, Kunal Joshi wrote:
> add missing commit after reset
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 88923be6b..f325a9839 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -267,6 +267,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   
>   	for (i = 0; i < len; i++) {
>   		igt_display_reset(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);

Do we really need this commit?

>   		output = outputs[i];
>   		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>   		mode = igt_output_get_mode(output);
