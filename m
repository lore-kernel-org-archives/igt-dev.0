Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D638C98308
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 06:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714410E7FC;
	Wed, 23 Sep 2026 06:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg2c2wQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0720510E7FF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 06:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790144886; x=1821680886;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+5VUmbFwsiWblD8r/rJ75Y0a0Rk+BpmYY68QEmSCEIw=;
 b=Zg2c2wQs1R6Qq9skb3ebT9OCF2MVe/ioZg1JiYQiAkZjIG4u81NTdX7T
 SL77ON7Vkg9nqpv2j+oW0G/lubpXSdHd5ZNQVpgjaN1I95gwwQEna7Zmx
 t7+NOe5dLEatYYf5WRB7zvZmRFEuDNBb93xHK1KDZjJpxFUYlpi1Ii5nG
 PBiDHOySu88sh0zB7l2ACnU5zfeTJtNEJTqUQUcJ5YwC+XhdJNnNlO+MD
 7bFHSMxBWqFNZdcbMqhBUp/+/EdBXh6w7bHZjLPKMV5fiUAv9i9CkoJNB
 LTfs9YQoOH/Utt+7rCG3qJYlmAoNWC9MCeMi6ztyKnlfur116xBopZimR Q==;
X-CSE-ConnectionGUID: S9+rOKlaTraPasIMaRjPeg==
X-CSE-MsgGUID: xUgXli+FSXOrqU3hOyoQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101397486"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="101397486"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 23:28:05 -0700
X-CSE-ConnectionGUID: gWtpEYDsQDea5uvzrptvQw==
X-CSE-MsgGUID: fPQvjXbjTj2ajhWdt3gmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4541890"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 23:28:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 23:28:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 23:28:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 23:28:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnaPYvtL0TLP0vkEXoYacKGRTDbb7F5KeBdVcTWXUKkhqz8hsJaJPrZ9PM7/9fYdeRMeEsXXyejWmyn8BX7/rm41H7LQToX9B5FIHK1V2d/waazsSRDda6CnXk61iD1ABYnySyttfWdJsxLnPP0mWJyz6nHp4+h7mbsZ4nweYKdSHwgn1oelPX0qX8b5O0B7zXfV4UxhWB3SR2NqebF+Zjnj1qCGd865tZXd8hmgteP4mkC8rl8+GU0+hJomtmDqZ1B/5S7DG3DVv0EG2NcIl+hwc6hyatHmptmdpwsszVeeRdJbCB//OEMo15R8OrxITY/7N372OhSzujlbq+yeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FacffYl85PVJ2sRFFMwIfE8atwKVg4o6WxJQHWf55fU=;
 b=jL9VS8CoMEsIELkfwai6d3coQz46PvCG2Bwb4hFaZZVgsrgWH9a+7KXAns3GbFY2M4jgjUNMq+pl+qggvqzEoC2poXoVceL+d5Nnn8BHl+LQhV7Jr8/3mjglYsWMunXDSU5JnwkpUDClHonxoQP61eLlLGxAuB37guxw6SFoVxhe4HMjG55Nb/1Qa96sdw0pblDaDDpErOybwo/pIijWsP5XAYpz87Cu/GKDKzwoPtR4LUSH8siivx8wvZKKa/3zmEIFa3mwYkUmcJ2rAEAAMuDpBMrriSq4KIPKsmFRvbKahKQtCsGZfguvUlpZs3D9uBLNNxes+CDD3WzokmBBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:27:56 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:27:56 +0000
Message-ID: <a045697d-15e3-422a-b17a-38a6f58773c2@intel.com>
Date: Wed, 23 Sep 2026 11:57:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] tests/xe_err_injection: add CPER trace event
 helpers
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
References: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
 <20260828170439.204268-3-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260828170439.204268-3-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0142.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SJ2PR11MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8eb920-295d-4568-6efc-08df193bcdcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wSbbwn/XRrc3yga2wIUPGOheP4+91/gt7uhgJkC9BYCUU/iyFZZG7NPi8lw+rrikj2ZcF+U2+7IOkUFef8FLJetW/RtuGJD+jOAP5kZgW+rHAK+cEH0bfFpvIJ0ocrWW9IJwh4bl/r4veNB1BulwuIiMxtmZ2umtRHZgxQqz13mqxFW8UcntMfqOhcea2bI1/pri41hDMeFSGIIIAc4cOf8JUnoAh7KXSjP0NdHVhGAmrbbPqPlqstFmeCjwHuyBlm/8CrO/Zwb6Dkk40FHRyjW9MZu+XW2Cm+ZO4wmHcVVQX/TokCiV7/3c7PnPdZcU/iTMlvYW2fDkEIetisdn1imn4DM0k08YjUMgej8wZFU5Uik/lIRyLN7ewgDEAxsbN2wM1JMwA2P2AHpLUln3Sos3RSxmtOfO04UiHjKMvXWeVAwpnlt9xrwq9M7PTlKtil3T0Kzchem4+u9VRC/tFFz3YfRNuZw2W/rco2aCvOgnQIkQNboKkGVRbkaf06cVCicXLKWNzhZCNEP0JW47igopX/Il0VQ88uWyr7LxW34LcNABe/IwI/fXiL1kTU2Re9Q5eUtedOoeeNzYO1VtfR8PewBpI3vnHq7fKSWUnbSeIkfDkBeZOXrSbYkhk6IEM2DvQ6Y/wectJBVKKJyjc+BtXk3x1VqKeZlW2SmQNMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VERUelYrTUJSZ1c2VTV2c1pFNnVXSjNMYXYxTUtGbGFicUFzN25MZVR4b21W?=
 =?utf-8?B?cDdXRFk4NmtZYVZGU01UcHZIZlpKSXRFRzFWcWY1dWJXRjRjcDR6K3A5eFB1?=
 =?utf-8?B?cW1QU1BzYmx6RHY3VDJxeUNwMmJpK2tjc09sMFMvZWtWKzNTakUwdTlkbVBO?=
 =?utf-8?B?VThIWnNDOXJRYnpOWXpEbi8wNW1tVHdMWnJidWlzVEY1SlVpeUhZVlNQc1ZN?=
 =?utf-8?B?eWpMbUIwdE9QenFqRndwZ3htUW05b2FaZmx0Q2U3dlU4NW8rTTZnYlpld2Zs?=
 =?utf-8?B?cHRFZllvaTRuSGV2ZGU2Y2NTTWlONTdLUmZlaEpEK29ZamtaZ2tzL0FUZ3dY?=
 =?utf-8?B?TUZmMlFNczRFVkczTmZnM3A4bnI2b0tYYkluSHpKQnl6UUNWZC8yNnNoeGZn?=
 =?utf-8?B?clNyejRuNUhReU40ZENXbGlqSnVOYVJLQUtabFlKN0dLOXEzajQvaW5UenhQ?=
 =?utf-8?B?TXo0WHdkYkhqTjBlSzkwMXl0Z1p0QU92WTlmYUFLd20xV0MxS1pmTGZpOWdr?=
 =?utf-8?B?c0t2a1RaZlpkVk12Y2dETEptQ2dvNHZTV0FycVdyS0kyQjhHZGZNRFVGK0cr?=
 =?utf-8?B?aWxLZFMvZ2p2Y3BJTXBTMVJVcnUxNDZJS283a1FHMXhMeWYzSklNNHpvaHh3?=
 =?utf-8?B?cVhvOXdQVGx2ckRXZUhKbTYrSXgxL2ZZaGNFY2JsQy82aVBXMjI3c090VWZB?=
 =?utf-8?B?dWpVWTEwWTFIa2dXcnE0YnRINCtBYVUybjBMSFpmblNkeVYxaFdUNlk3TTBL?=
 =?utf-8?B?bHhCUm14d3UxYUE2QWN3eUZZOU01azNpS1BIOXlIbHRZYmxlU1pUWWVLWDJz?=
 =?utf-8?B?V2N0N3doOWlNVXhRNlpqREFKR1NVWFl2aVY4eE1YclFycS91M2NrQXRsc0xh?=
 =?utf-8?B?c3N4d01uZFNlbkh5d3hPWXlWYk9tNkVmbmJlZ2EwL2xDM3l1THNMZzNZWDM0?=
 =?utf-8?B?SmF5NUt1R2pxRFlIc3J2MEhUMzBEMUYvOVhIZ0E2c2tKUFZiL3pqbThzVVVC?=
 =?utf-8?B?a3pQMExtdm5FK24vK2hPWDRIKzlGcVdQVHB1N1VsR2w4UVpaRWxQbjhieEpQ?=
 =?utf-8?B?eVRYU0pnYTdYL3pieXp5R05CODQ0ZThIR1A0eEk3cklhZnAvSnVjd1plYmF6?=
 =?utf-8?B?aGlXMUp2U3d0NXp5RG82Z1htelpKOXptRVBMU2dpbVFxWTVjM3lTNDRrZWdI?=
 =?utf-8?B?czA4Rjgxa0RVT1E1bmtuRjQ4NE4wYmhWY1JPMThxektRdFROUmxxVmhieW54?=
 =?utf-8?B?aEFib2ZTZjJTMmtiMzY0SVBrM1I1UXhuME9rV2FWeTAyTVB4Y2JUMVk5NFA1?=
 =?utf-8?B?YytvSys3VnU5dlNHU3p2UjRnRGJPSEdyNFZ4MzFxdFBoSkUxZFEwTnp3YjFh?=
 =?utf-8?B?OUowWW5VQ1JHTmh0VHBtQ25MeEczN2EvTEFpVkFYakpta2wrcGpKT2s0QVdi?=
 =?utf-8?B?YmpXODhKOHE2d2NiOGVxQSt1N1NFT0ZBaVB4NlBsR3pJQU9oeFZaUnpIOGMw?=
 =?utf-8?B?VkQvcWNjckNMKzFqSmdOcHpOWDlsSnlMaU1ZS0hxSDEvY0FWbnlETTVyNURD?=
 =?utf-8?B?bEFTdkNEVmxjV09iNG0vYUE4ZVpBVnErQVVKM0E5L28xWnpQdGowZVFOZG5y?=
 =?utf-8?B?WG4zZjRzUEhhK2lMT1A1V2dHckhDbDNGa1hNN3RFMzg4MUJReVIrNHRFVDlh?=
 =?utf-8?B?bmFUY0N6QUc4b0txdTErREJhRTBLOHFUN2RKVkFPbUhxQVBxSVhGamhlOWx6?=
 =?utf-8?B?cnpvWHVkL2ZIRGJMMWZxM01Fb01hMmVrRkFyeWZyRjVuL0ZXSnh0eHJ2WndW?=
 =?utf-8?B?algwRjB2TGxHc0FEdUc0ZTlnVExGM2RTcm93azM2UjZ0NEhIZ2xCN2s0TUQz?=
 =?utf-8?B?OXR5QWM3UGtVajBLOENEV2JYbTlaTVZ6NGZIMnZzeUxlbmNrRElOem5YZ1RS?=
 =?utf-8?B?aWRSWlNGMmJXVTE5czYyZDNNMjkvUGszWmJ4Q3AwZWlRTTc2S1lic1BjU1Ri?=
 =?utf-8?B?L3JIYlVBUjFmcjQxM1FtVEcwZlpra25iclZhemxLOHl1WEQwWjgzTFNmNW9i?=
 =?utf-8?B?dDZ2LzI5dU84WnptVzRWZDBJaSs4M2RxMUZXaTgxSEVWNEg3N2ZGRHJuQXla?=
 =?utf-8?B?RVJUNlV2RjdpZDZMRzBUSlJrRXBZWUVQRStPVHp2NVRiRElsMmdhSzBabFUz?=
 =?utf-8?B?NHh2aE1sSHMzOXBEU3VwWFR6QUpJR3BUTWtQVDVnM04xUUtCZ0JqS1RvTTBr?=
 =?utf-8?B?YmduUG9QUTBnSERoSkRBVUgvN1pNWXlRWE1ZOVoyQ01vOUhMaWZxTWUxdmRt?=
 =?utf-8?B?VTNVYnBxY3A0WGJicmVUT01pNmlzUE13b3psK3ZsRU1Bc01GNUlEUT09?=
X-Exchange-RoutingPolicyChecked: NO4ibrxgesB6ULbjUjtK3fAKlfehKJ1zJlG76B/xMiKOqv1t+nbG1xk0TqQlRoxwfUa7r/KPZhTzY1op308sWyPP01xlPjJouWPmCn14Dob6HVskU7No4ALMryIkBVqUz4vSBNvSLv2r8zhShYEvW2LpmvN8ZgICrkXy8ZVMixNbu7OGpCIPIxZk1NuKr68DPH29eQnKCNpqy5AC5QupRhcQlMaMOJQy2wIn7eIC/lG2eUpxrBrsK4672B3ZNq/iTsiOlKhmE6PQ23eN/W4BVZiNy0Fj7EiNvrxoCeQ5XXpAJ+qFf2clx+oB609h1az1mOE45zaHrnAjqdLod0k2xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8eb920-295d-4568-6efc-08df193bcdcb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:27:56.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgN5Ib1RpVCe3OX3+6SJgGafULk/Yeog4jXvrho81OKlqSKzSRtv1ywhNLaJS3san3Lfmzeph7sjfj4mpzWuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
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

Hi Ravi,

On 28-08-2026 22:34, Ravi Kishore Koppuravuri wrote:
> Add tracefs helpers to read and inspect xe_error_cper events, including
> CPER event polling, field extraction, and little-endian hex value
> parsing.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 152 +++++++++++++++++++++++++++++++++
>   1 file changed, 152 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 37f4c2edd..c52fee2de 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -589,6 +589,158 @@ static void tracefs_clear_trace(void)
>   	igt_info("Cleared trace buffer: %s\n", TRACEFS_TRACE_CLEAR);
>   }
>   
> +/**
> + * tracefs_read_trace - read the current trace buffer into a dynamically allocated buffer.
> + * Caller must free() the dynamic memory.
> + */
> +static char *tracefs_read_trace(void)
> +{
> +	int fd;
> +	char *buf;
> +	ssize_t n;
> +	size_t cap = 65536, used = 0;
> +
> +	fd = open(TRACEFS_TRACE, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Cannot open trace file: %s\n", strerror(errno));
> +
> +	igt_info("Reading trace buffer: %s\n", TRACEFS_TRACE);
> +
> +	/* trace file size is not known ahead of time; read in chunks */
> +	buf = malloc(cap);
> +	igt_assert(buf);
> +
> +	while (1) {
> +		n = read(fd, buf + used, cap - used - 1);
> +		if (n <= 0)
> +			break;
> +		used += n;
> +		if (used >= cap - 1) {
> +			cap *= 2;
> +			buf = realloc(buf, cap);
> +			igt_assert(buf);
> +		}
> +	}
> +	buf[used] = '\0';
> +	close(fd);
> +	igt_info("Read %zu bytes from trace buffer\n", used);
> +	return buf;
> +}
> +
> +/**
> + * wait_for_cper_event - enable tracing, get_error_counter, wait up to
> + * CPER_EVENT_TIMEOUT_SEC for an xe_error_cper line to appear.
> + * Returns a malloc'd copy of the matching trace line, or NULL.
> + * Caller must free().
> + */
> +static char *wait_for_cper_event(int drm_fd)
> +{
> +	char *trace, *line, *match = NULL;
> +	int elapsed = 0, ret;
> +	struct app_context ctx;
> +
> +	tracefs_enable_xe_cper(true);
> +	tracefs_clear_trace();
> +
> +	/* Call igt_get_error_counter to dump the cper in tracefs */
> +	ret = igt_init_nl_socket(&ctx);
Check the function name against the latest patch series.
> +	if (ret < 0)
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +
> +	ctx.node_id = 0;
> +	ctx.error_id = 1;
> +	ret = igt_get_error_counter(&ctx);
Same as above.
> +	if (ret < 0) {
> +		igt_cleanup_nl_socket(&ctx);

Same as above.

Thanks,
Soham
> +		igt_assert_f(false, "Failed to query GT correctable error counter\n");
> +	}
> +
> +	/* Poll the trace buffer until xe_error_cper appears or timeout */
> +	do {
> +		sleep(1);
> +		elapsed++;
> +		trace = tracefs_read_trace();
> +
> +		/* Walk lines looking for "xe_error_cper:" */
> +		for (line = strtok(trace, "\n"); line; line = strtok(NULL, "\n")) {
> +			if (strstr(line, "xe_error_cper:")) {
> +				match = strdup(line);
> +				break;
> +			}
> +		}
> +		free(trace);
> +	} while (!match && elapsed < CPER_EVENT_TIMEOUT_SEC);
> +
> +	igt_cleanup_nl_socket(&ctx);
> +	tracefs_enable_xe_cper(false);
> +	tracefs_clear_trace();
> +
> +	return match;
> +}
> +
> +/**
> + * parse_cper_event_field - extract a "key=value" token from a trace line.
> + * Returns a pointer into a static buffer; valid until the next call.
> + */
> +static const char *parse_cper_event_field(const char *line, const char *key)
> +{
> +	static char val[512];
> +	const char *p;
> +	int klen;
> +	size_t vlen;
> +
> +	klen = strlen(key);
> +	p = strstr(line, key);
> +	if (!p)
> +		return NULL;
> +	p += klen;
> +	if (*p != '=')
> +		return NULL;
> +	p++;
> +
> +	if (!strcmp(key, "cper_raw"))
> +		return p;
> +
> +	vlen = strcspn(p, " \t\n");
> +
> +	if (vlen >= sizeof(val))
> +		vlen = sizeof(val) - 1;
> +	memcpy(val, p, vlen);
> +	val[vlen] = '\0';
> +	return val;
> +}
> +
> +/**
> + * hexbuf_get_byte - read byte at 'offset' from a "xx xx xx ..." hex string.
> + */
> +static uint8_t hexbuf_get_byte(const char *hexstr, size_t offset)
> +{
> +	unsigned int b;
> +	const char *p = hexstr;
> +	size_t i;
> +
> +	for (i = 0; i <= offset; i++) {
> +		while (*p == ' ')
> +			p++;
> +		igt_assert_f(sscanf(p, "%02x", &b) == 1,
> +			     "Failed to parse hex byte %zu in '%s'\n", i, hexstr);
> +		p += 2;
> +	}
> +	return (uint8_t)b;
> +}
> +
> +/**
> + * hexbuf_get_u32le - read a 4-byte little-endian u32 starting at byte offset.
> + */
> +static uint32_t hexbuf_get_u32le(const char *hexstr, size_t offset)
> +{
> +	uint32_t v = 0;
> +	int i;
> +
> +	for (i = 0; i < 4; i++)
> +		v |= (uint32_t)hexbuf_get_byte(hexstr, offset + i) << (8 * i);
> +	return v;
> +}
> +
>   /**
>    * SUBTEST: cper-tracefs-event-format
>    * Description: Verify that the xe_error_cper tracefs event exists under
