Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81377CD13DA
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 06:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADA810E425;
	Tue,  5 May 2026 06:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IM5YK+81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F87110E425
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777962832; x=1809498832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=e2yP+ZU1VeuxZDmNWC8bMLoyAy5K8b7ZRUO5Aq39oVY=;
 b=IM5YK+813bUfPMdJ/rSM0AwRKSHgrT44GUK8II+w4tjiYnLViaFs4Y4K
 w2OsFBy+CFK1NTi0qCCF5bny2x/R4tlBzIwec26U9wBUDLIHma9pnanED
 VGleQQ5QbAKZtJ8AeLiliWyvuV/fb9mlUx1d6UT2Nu1spwAUTskERoPvl
 nziMoSWhNjIGG+a7KgOQ7jMbARRzm7GAvqP/OKB1Tw9ctwVeL3SMekAcM
 VBg2yHEL1GXsbE7mtqeAcE4YbqbGLxHoSGPdregpvwkaR7tlATo7mwikl
 PvyApKisrmWCn8MzFYewvBrT0Y0QzcJ5CXiVb8WzijNJKNhRchHEncj6C A==;
X-CSE-ConnectionGUID: obVWalzcRpeecYQQnNxhdw==
X-CSE-MsgGUID: THEWJgs3RLKw7RIYKChe7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101493071"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="101493071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 23:33:47 -0700
X-CSE-ConnectionGUID: 3V6ExD33StWn6aCoDOAF3A==
X-CSE-MsgGUID: zCJom5/9SYmTeenrnFNdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="273874492"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 23:33:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 23:33:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 23:33:47 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 23:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEMISYXHWNXYTGW4oO06iq3vBFwH/d4p+zToe+BElEIcVsWq2lXZMAa5BtIkVW8SA45UteI5CP2he9PghA7q3aBv+I31ldPsyhr7MU+IaT/gpVsq4Y/ovWnpvZI4hh9hHfpw9/kHImr7pRs81WNKyW4asboL4FMrp/arVWlCGFdBiRlQ5NgrwieNMEuUk3RwJ18Wwz51m2RVyLFQs1qeobBTYoPJHCLywR8qJ/yt2EQRBynMGerau0UvVNI+unpnW4SFYqeOvCaK0xL0npbhu26C+sXKJJ7bl9BBc43ZH8TcJ5I0YR+8ofiRcBKKGy42/VZ00P0RoBcFIr8mkqVC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT3Qssf5HEjU5ALttZm1CTiZ292POMTGAqucUWx0qSo=;
 b=l+Yo3PVUhdzMQyiUvPMiVabo0LHB163wSiyUzTQodyWSVFX8AwfVQ9JlIuFcVv7ux0tYbK65X8vkhmiedbbihmGFhpVmEHt0Jd8KfRa60KwTL/4GXUhlsY2nY95DDiA3QRGW4sc9VLGmX3LPcwes2mzSEWyiJN3tZ7L0JxT/DdFL5nzeTKdcRFn8oVnEPgqGri2r3yDI3a+od+mNfT+rC0PAH05+pjRkz5TDvJ2cDI/DCJF+WUE+V3exYQVimoqCO39tKG1TmmTNaHAiQs3i6yBbqVO+9r8prrgdl4fifcD/bF3lAY3VcnPo2xqcLsx3zcnvziuMdfcOaJR/nLLgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SAWPR11MB9760.namprd11.prod.outlook.com (2603:10b6:806:4c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 06:33:45 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 06:33:44 +0000
Message-ID: <2bc9db4f-c0b9-4fe6-9d66-ef6df1450fd5@intel.com>
Date: Tue, 5 May 2026 12:03:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_cdclk: Skip non-4K outputs instead
 of skipping the test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260501103634.2360004-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260501103634.2360004-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SAWPR11MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 476c54a4-50fe-416f-7b53-08deaa704150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Bpufuj3CLo28PgLVhR60p60L/bTF6QDPMo+pAeoCe7ZVfM9ktucLcyeATmTPkxGhh9jReUOVtHmTt/53T723Sj83Gmqsa105ZmB3Xrg8v3vpN9Zd33tXQHIfI2gS07sABAdawsPutQwKH69TkqMOVVThP+v6O0Y3ywIc2gPv46TePVjapk74Zn1oyxlR8/5REqqaLHI/WFQdeHj71mKABX9oLgivsE6Y1joDAb1ImuWXmuD0hqodzPAIDwJB4KXI8XhF1OjpVRpPKLpEPp3SFNy5LodUVjaXTp3TIxCYbze5dxQhi/jAGklQF1gqGjf8zPHzgZrx6cRGh3cS7ncnz8BgRNEhBm11/Ku1IyerZzBICWVd4+FmRApcpEa4Svfnc9aCc0cEZoUjyC1PHg/edV9ZiekZzm3V1RjiBswnHLWz+FCAkTpev2YtX/kX7A7opOCSUcM+BIWgSx/ZPpTkhjXeeMinVrehSfgV+P0jbg2qCXXakYj27wMTrKc5vHZmg0xya2pOeOfqsteUpZV+MvbBtMvpCKR2q71RGiK7RfRHuH67pVPe1nv9dE3F2G0CE5Yta3xwt870noi9jVbuSDS4vLJlSXe3fg3mG2l9HB5/cNiRNwL+sY8D93vn8gqBoUSYTE/TD5LxEdYZCJkUNayUDBDRJIzndrtMhjsAR75f6i+IjXm8lQOpzD4gZJjC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZBNW85SExTMHhmMElESEtLUUNVaFc1ejRoaWFQVWJRVjREL3hIVE5JZDNh?=
 =?utf-8?B?Q0tubUpmZUNmbS9DTVJyay95cHJST1NUMGFQWm5KbW13NWptV05SaXp3ajlE?=
 =?utf-8?B?U2tEdWJwcDNoSmhJbjNBVE5BOFVta2xrZEhJcWp4T2p5aUZzbGpSL0I2TUQ0?=
 =?utf-8?B?MEhKZ2hKUkNPY1VPMW5LdVhvbVhlaS9aYlI3bk0yR0FjZEQxNkxMa1Q2ZVZQ?=
 =?utf-8?B?RHJMaDdJeHQrZEkrNUJmK3VEZHpHaGh2MmtyZHRiM0hoVXZ6NGZWYm9pay9U?=
 =?utf-8?B?eEZDSktnL3FSakJFcElxcjdBbVA5OHlhNnlJdnNQQktIVFFYOHBTUDN4OE92?=
 =?utf-8?B?UFFEMkpYNFdpTXZBWDAwK2tZMUlhM2xSL0JnQkJNbEtMeksxSDVmUVJnckRI?=
 =?utf-8?B?Y2JWSnAvSmdQbDdwS2RiajF3SjVUNW01WDNWUnVVNjArMWJzaTRaNk9Ya2xR?=
 =?utf-8?B?eHRLUUh0eDFKQ2M3eHhES1VxeXVUaytpcHNVeWIyNkF1ZEhRZmQ5N1EwWThT?=
 =?utf-8?B?OU94b1o3aU1YbGljbTYyVlRvc1F0bGt2b0MwMHRoZTdpc0VEbEdNRm5pOWZq?=
 =?utf-8?B?RUk1bUFxOU5Xb0ZqUTBKSVplWGhXam9oViswbzBJMkFJTjRtU2JJdlQzQlV5?=
 =?utf-8?B?TFAvdUljY01mbE1heFlqeDdWbzlFc3lJN1ltcVFhbzlibmtLMTZCY3R6eXJM?=
 =?utf-8?B?Q01tMVpVMGlBMHRFaVJyZmZ4SWQwdFV1N1doVm9DMzAyTXAzdHoveHBsL1Vn?=
 =?utf-8?B?a2xScWVaRlRkMGhwd20vM0EvNEkzN0NuYU16WFYxajU2T2JGTWo4dXhJcUZE?=
 =?utf-8?B?SStlU1laQ1dUYU9laEFzM0l0WW4wcU13UWRnaEozZkdMeXR5cDBtdGFoczVt?=
 =?utf-8?B?RXhHWnN6OEZaUk9qTmt4QXI1N3JxVUkrcXpiTGtKdUFENk9FdGZXUUdjdkZE?=
 =?utf-8?B?cExRam80UllsclpmNEZ3SGcrQlpoTyszbGlrOXIra290YmRNUC9XUnFqTE5G?=
 =?utf-8?B?d0dCWi9aOWhwNUY2YjI5MUNMYkNNUUwrSlExZjVROTZPVldLU1dsaUMwTUti?=
 =?utf-8?B?ZDZQTGFWWGlqdUpjdUZ2MGxJaDVnMjJTYlBUSjRMMCtkVDU3VUNxVldMZWFl?=
 =?utf-8?B?Vm80MGI0eHZpWFdBS3pzcFVNdTl0T2x2bllrWERyZmhvNDN3NTZaYm1hK1lt?=
 =?utf-8?B?Zy83SWdZcFNvNEp1Q1RnSDJxRVA4UEJHdU5JMWJwTVdEdHF2c3BhbDF1amp1?=
 =?utf-8?B?c25VdHdZaGVOcEVqUUxGdFhNY3ZMdzRUN3hCb1BGMHJPVFJheHdOZS9QNEo0?=
 =?utf-8?B?ckpqMFZCeHR0ZVowTjVobGxZeStBMlB1clVTamRLNE5ZN20ra2hYYUMvT0xW?=
 =?utf-8?B?YzFNQ2ZHK0o1RWV4SWVaQnd1UmVIdVJheXN5UndIcEdPd3BabTN5cjlQQ2dX?=
 =?utf-8?B?dnlLMEFCVVNxNzBROGJwdHkyR2ZyWUJMTjBwSXJlMTVDZS9BYjk1TUdNWG9o?=
 =?utf-8?B?dHVrT0loUW5odkl4OWZONnJjdVppVG5YSmdxdzVOS0ZKOFJkNzNhaFBHTDRV?=
 =?utf-8?B?bVhmbFlFTXVIZXFrYUMzelpRZjRDRXhxK0ZlaWFJUWJZNnhIWUpoQ1BLcndZ?=
 =?utf-8?B?Ym45bC92clFneHY5SVoxYXVLU1c4U2Rvd1graVl4NmRsS081U3NKUHk5RDh3?=
 =?utf-8?B?MEVWb1ZzNFB6Sk41M3ZFblpyQ092cDBsU0dzaXp1VWU3d05EZWdpRDcxUnh5?=
 =?utf-8?B?Q2xFdXoxdU5mdThvdS9TVjI2V1VvditpMGlET01GODBCQjNhN01rRE9oYSt2?=
 =?utf-8?B?YWg2SW5aV3BMY28waTUvQ2pIY3FyNUU5ejBsbFNCdFR2V1dldEh3ZEVyUUds?=
 =?utf-8?B?bXMyU1BJSjdLY0s3RXFjNkRnZllPaGs4U0d4UCtTemJaQVFpMzhqcUZPcTIv?=
 =?utf-8?B?Y1BpQ2ZBQWtBM2tuZWw3YTJ2dVJ0Q25YOEYwOXZ5aXRqTzBSYWNWQjA0YnQw?=
 =?utf-8?B?SGF6ejVxSXVETSsxSWJQMFlSbDEwNlZTWFlrcHRjNFlCRjJjNSt5WWNYZ01Z?=
 =?utf-8?B?Z1NleGNHRmorMjRKc1A0YjhoUEp0aEJqOEdrTzJOZVJPbmM2NmZGZEJFTTBv?=
 =?utf-8?B?OHBvdkI5M1JRb3ExS2RZVVhuemovTlVCa0xQbDJia0RaRjRhSVVPSnlMY0pw?=
 =?utf-8?B?anErN2puWjMzSGY0d0UwYVhUY1oyN1RKL25NUXBOY3RjRUk1UW1UcjRPMFF2?=
 =?utf-8?B?bDM0VkpCUVowdTkwQmMrWjlkQ0JISHN3dUFyQVNTNmhzWHRBeXYwWXg4REZn?=
 =?utf-8?B?U1pJdml1aXp3U2diK1phWnJtbnBPb2ZaUnhCUTJISnplK1ExOHRUZz09?=
X-Exchange-RoutingPolicyChecked: El7hqtsW1I+Y9C8b8mywMdmd87Z6PHhe1uyWtrJSS7nY3nzRWEu7LSmz8KjeXoNwA1z/d6gF9vGYW0naTC9V3mlNad+occHAfQ7x28f5NtdzNdBiw4tlwDrgLawaU8TMDx6nnkt14CPCQGq5eoODYcbyUI+qu1n2zGIat/bA42aqN5G+pH7Mf3frG1tfkY8ik+Py1YvCm/eUAoQGETwEg1DB5dXV6clfux2PbdvCD+3mNZfIQhQgE9spzrXVQk8VGbE3jLouYJcpBmn0t8vJ+noxSs+zHox+N3cId/+hRubGXxdumveWTeoJWcZg2I6m/J0b6G86qfG+PltkllgSCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 476c54a4-50fe-416f-7b53-08deaa704150
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:33:44.6467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAmsKamunmjhI2aWbuYHjkD0f+YllSYuXjgPV8RXktLLa1nnlCtqMFx7zP+X8O/3Jyn/8LS46weO1yjpTo06YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9760
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


On 5/1/2026 4:06 PM, Swati Sharma wrote:
> The mode-transition-all-outputs subtest currently skips the entire
> test as soon as any single connected output lacks a >= 4K mode. On
> typical setups (e.g. an eDP panel limited to 2880x1800 alongside
> multiple 4K external displays), this prevents the test from running
> even though enough 4K-capable outputs are available to exercise the
> CDCLK transition.
>
> Replace the igt_require_f() check with a per-output skip: outputs
> without a >= 4K mode are simply omitted from the valid_outputs list
> and the test continues with the remaining ones. The existing
> igt_skip_on_f(count < 2) guard still ensures we only run when at
> least two valid outputs are present.
>
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 48bd7276f..070fba400 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -271,8 +271,11 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   
>   	for_each_connected_output(display, output) {
>   		mode_highres[count] = *igt_output_get_highres_mode(output);
> -		igt_require_f(is_4k(mode_highres[count]), "Mode >= 4K not found on output %s.\n",
> -			      igt_output_name(output));
> +		if (!is_4k(mode_highres[count])) {
> +			igt_info("Mode >= 4K not found on output %s; skipping\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
>   
>   		mode_lowres[count] = *get_lowres_mode(output);
>   
