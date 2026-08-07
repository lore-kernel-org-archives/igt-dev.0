Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD183C5AC7A
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 00:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7716510F2F9;
	Fri,  7 Aug 2026 00:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGdxS2XL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3E10F2F9
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 00:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786061184; x=1817597184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pig6dzijNZ++9jZG2yCVKc4R5/VvnbepB/XTVmZ3BA8=;
 b=ZGdxS2XLNKFyU1/LSUPbcrKavG89HarzJiI2cHwTvOpKGmGipxGD1U7y
 dAlG7l0lEKE6WxQJcxL3G+XjT7i4dIFD06mRO/7Sq7dMauLyMR9lOnsE0
 Okz1GZJfStWLvgJaO6oJKRD7IJAmaWuALF155aMcMjVuwVdrj28kF96D8
 TeHfgXwr9L1zIRrJhNnOIcyGI7rflhMsAxQc67EK++VRceMxGqHxFD6aV
 Q3xkP3iSRt12CKurMZlFU4qcCrMD61oIdYmHnCisQwNbX2Fk6CD5xlLa5
 k+3b4CzuATJIlR0JX/wWQe+3ECBkKpL8jGDZIXQ0FNniwf+ohLu6ULA2Q g==;
X-CSE-ConnectionGUID: sa56XHKHRDGLZ338/u8dgA==
X-CSE-MsgGUID: RMWyo7rrS8SOjMvxF26tdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90486962"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="90486962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 17:06:23 -0700
X-CSE-ConnectionGUID: fX0pwSkZR+OKjZAl9NAgaA==
X-CSE-MsgGUID: XRJGMVfDSW6x1QlQ1uCGjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="262864765"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 17:06:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 17:06:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 17:06:23 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 17:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciK8gTMMQzQxjKeGe4+la44K1GWcaO9VWA0h7i5Ki5Zw5wC/K/YenqNN+Y8DT/pHldYJw9M+WZFsRFl7EQUX78R727aSjkN1bxyFK0lPx20ljnfpfnX76/WS+nxhy1KpZ948KtT+0Gc1trFazv4unAIHNGgq7Nl9V1fuaQuoUSr0kgmVANwwDbsGL5Qs10lWpZdRRf7v5mZdcYUUQX9lXTFL6uLl52YjUxv8jA/KA3BAd6wuA7O+iuY8wBJIdOXmoYN2DvI52tmQP1YqSKvy0dRMakhgs4nHFSdiXX5Hj6fle/my0OfpCrNihKn3rg+rn5eVVXMSUFHwO+1pXMfhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvBQ/N0xDqz0mUn17GwBS0Kxc/+wBLoVqlrFsHQSB6k=;
 b=ynFfG6jxszx1hnYT8VtN//mXyyLbMIMLwCow0DOfQK/OR3Uyc1I0X7OHQV4K8Q37KTP+zHtYk1ffVzUd/XH64XBaFZ1LvzRZjUEpbEYHe3p7VCik5BZVCrWP2LLcdnH6cAQlyvYyYYL90CpL9qp2sgReJovSbMnXPZSFrxl4Qim4mN/1GHgVQzlVP4R6iUJ8aAhDCUVypi669PVpJjKb2vq0XuZQT+vqNjcOPiC3cNZL/m67+pz0H1Sp/19H0FmbeW3valXrW8p374+B3cI05PoX5yxTEjVrkZIwuRd/URw6thDGpX5u+Hdwt+BkTksqSN4cRCFRoiPQUdIVon8l/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 00:06:19 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 00:06:19 +0000
Date: Thu, 6 Aug 2026 17:06:15 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH 8/8] tests/intel/xe_err_injection: add CRI GPU
 requirement check
Message-ID: <anUhdyJ_WZmvRDNL@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-9-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260729121959.603890-9-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: BY1P220CA0042.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::17) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ0PR11MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d121074-efcb-4b85-797a-08def417b4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: /FPik6OgS+mSO6HaUhYlhX5f7+rkDGqQ8ZJm2Z0fm1qksooNfdW20W4qcvTOxY5OOA4KcuV4G8iz4Dy2kFkUfLx+qulX2VDXCiX+uaDLQaJtxd3Lpimy+uIXs+7g06ffh1o5Wr1LHJWvOCsiQsfGsyBWOrfOJ/ACcw2o6BiCj4iSGsEjMyXKddKnMgEUzfir9a67qCZLhLJzzNyZJoACNsbRLDsL0qj/JfMXqOtsGeHaIjvrVdORAZP4FvSY8LcdqSiK58aOryKZHXJdhfTpMT+8T7h6X2Fz/Z8kfp6f5FWRO46GR1OlzHRkzfm8JgK8DrmJMg+E69QHeJ8+WBzitj1ga2TudL6g4UmP4xeFjU1kT7AW/y+UtfAMpMEgfziFQ6+7AAHUBj79f+8qjJTGrqhgXekIbrD7tUAfRUXym5jA8j8cv6pbOMx8+zNbf/AqhclAt3sPLxCAdBA+G4cYxjZDqQ74clLgCEtXl1yQTVhl8VEWm5W9o4XSLzAcSw9O6w2yG0Z9plD8ZBRcdsun1w9s3x1hSxQccFgJ62eqL7Wy6JfpJUd0m2UO8DDMAto42B6jWaAzbRYxeB0WbryiUEw9dgDCsADPjuEhK2I3Xm6bBNv5ylJQ3MtADI++qwFBZfMeW+KG4C0I0buR+HibDG5IvAOhixPsR6SGRG8qCGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SllQWTZWVW5pYzFUT21FbU9sdDJxOU5XMTlqUjNmNlM5RklyRnhTWFRwaity?=
 =?utf-8?B?Vy9SQk1ZS2o5TTkvU1ozVHFHRFlpRm05VldBWjJwMnBXa2lQZk9sZEVyWG1W?=
 =?utf-8?B?TUZNcW1BVFdZSFRNdkl6SmQ0NC91TDhXOGgvUGJlTjdVZDVnT2hIVDJmeS8w?=
 =?utf-8?B?a1VkWXJSZUx0eTJOVUg5UWdJaDNxTTkydkhPYkt4M3d0WWg5cnQyc0J1T2Nh?=
 =?utf-8?B?WG5uWktzWjB0SVVBc0JhVlpWdnF0UU9XbktJdlR6dzFTY2h3SUtMKzF5aTdm?=
 =?utf-8?B?ZjdpbjN6RHViZWNoajJ4dmtFMVZuNWpLaHhqQ0g1eWJrZW5mVVpIVmhyajdT?=
 =?utf-8?B?UmtSUXNIR1NXUTVWS01kakFxVDNqWVozVXY4UEE5VEtNOFpmU0ZhL3VPbEJw?=
 =?utf-8?B?dVoxZjBhYndtNTBLTm5FLzBkMHp0WHE0cXVKRlRsYlRqQzRzTjB6WlYxbTAw?=
 =?utf-8?B?UWhUcHp1eXJUQWNscnVteGZQRGdMVWVrdkpSdTRNL1FRTkx6U3R0VVJlQTJy?=
 =?utf-8?B?SVRHRnBOVk10SVM2dDJIdlhKYkpUNE1ZK1FQN1A3ekVtdmZXU2RCUDZPU2pF?=
 =?utf-8?B?aVJxTjlYYlZhWGFYeEFpdVVaVW10c0E2c1NNdHdGeXR6dWhSQ3IxUWRpaFNY?=
 =?utf-8?B?MUhaV1dRWURyb2xxZHp0UVI4SFdrS0VvN1ZlY0FlMFc3OEIvT3NLSExvRWcw?=
 =?utf-8?B?SmVVYkMvS2tkRCtGKzJoenNXMndpTVJ4Yk05MkpPdHlWWjFmVUw0RG9mV0hW?=
 =?utf-8?B?VG9yR0xvaGdVY3dnbnJUMjBSclBVUXZkQmRzbVc5d2FaaXNTZTA3MVlBWlJR?=
 =?utf-8?B?Ylk2eklnWkd3ZDBJQjJHNWZJNWZ4QWVpSWhvUkJaK2tsSW1qVUI2bW9HejQr?=
 =?utf-8?B?NzhVdnhNeXR3WkdZOG1ScGp4QVFPdFFHazJFWmRuYXFNYmpxOEpWTWVmSHNE?=
 =?utf-8?B?enIzcGhrYkZiUVFkN1RwbU9Md3A2L3ovVUEwSkRFalJHRkpvUFo0ak9hR2lJ?=
 =?utf-8?B?WXpOQkF0ZmEzZ01ZbCtZR0x3S2tHL3lvTTAzam1vMjh5YUxrQVM5NDlBdWhy?=
 =?utf-8?B?R0JDbUw2enkzTXJYRVZuSTZtQzNnREFLakIyZFUvVkxEeHgzdFFvMGtzRTNY?=
 =?utf-8?B?ZUhOU2ZPbzE0MWFFS1NUdFdoU1dpQjRFd2hKeE1XV1BSZTFQTVk3WWFjZ0Jl?=
 =?utf-8?B?Y2ovT0krc1Jkenl3a2t2dHMwTVpRdmZsVlBrcDdDRzZPY1lNdmlwWjh3a3pT?=
 =?utf-8?B?RXl4QWEyU0VqUmt2dzJGNTFwNy9ZTGJZVk1WbVhYR1NwT0ZMK2tjRTNTbk9j?=
 =?utf-8?B?VVQ3WnR1RG9hUmZCSWhYaldYY0lqZ2EyQ2pOUmhaNlJ6VUFsc1JSWllvZDRP?=
 =?utf-8?B?bEt6dXhiVnFVZTN2dzVKVCs4QjNLVUJhWVJ5ZkQwM01qZGhSVzFiTXFFQ2k1?=
 =?utf-8?B?ZUdrUEJqREFMQ2V3WGdSVnRQUEMxdEtEZGRDV25PaW84Z2FuWXYyR3BvU1ox?=
 =?utf-8?B?Z2JPVVdpWGdkdkxmOU1hWjlmRDlGRytJdCtrMUFYL1ZkWXNVeTlyUUpQTS9s?=
 =?utf-8?B?THVkQ1pKZTNyUXlrUnhtTWdJNDcwckF3RWs2ZG5QTjJRdnRFaTdRcU1JUis0?=
 =?utf-8?B?Sm9scUt0bkNEVHQ5Z1BFNWtHVWlMaHg0MWE3aGhCZ09tcVhCb1lzRHczdEZZ?=
 =?utf-8?B?cUVFcllxQ0ZGbnZjZzBzb1RzcldKeUhFWVQ0aWNIeXgvK3N1Yk1jeUZ6ZWtx?=
 =?utf-8?B?bFA0NnBNcG5NTUtBRHZFTllMNllBRGdETVVTeGhWUEtjQ3pZV2grZkdoY1l2?=
 =?utf-8?B?aUYzR1RYQTRGajRFQlFvUmJIdHNsdmpNL1VkNnE3cThlREJwRFNBbDNHejdv?=
 =?utf-8?B?akxDVUc3VkFVazE5aE5TbkpOSWtRcmlHeFRTa3RPK29aWG5mNVBOYm83M0NS?=
 =?utf-8?B?MmZ2SDVOSFNjMmI1OXdxZ3JCU09PUG5MVWtRQ0lwT3NrYlVUVjNxc3hoUmhO?=
 =?utf-8?B?L3M3MXplZi9LZjd2bUk3Q0dnNWVsNnlsYmxaRVRhUHZuNHIvcVpCcGw4YjJL?=
 =?utf-8?B?bU9malZPUE92UTI1ZzRqZlpkOEh5NTlncUxTeFpoT25NZEcwZjFTeVUyQjZF?=
 =?utf-8?B?aHIyMk1QY2JDOE44TXV1MHdQa2xZTlhyMUkreWNGQjZrU2FmR1BISVlKeFNE?=
 =?utf-8?B?VFQwY1dLaGFTcnZWLzVUUkpDYmFaS1F1L3lkVjVxS01KQTNYOTBuUU1Cb2dY?=
 =?utf-8?B?N2tGYmREZDF6L3lKb3orOFl4M3VHczd0ckR4bHZOd2pSMURFeUJlRkQ3d2NS?=
 =?utf-8?B?Q0R6MkdEYWx3dThkL21CTHZEVDJIdzJzdjlMRG9zd25UNndtcjZETk5oUXNu?=
 =?utf-8?Q?Bh36S5EPB7oki2F0=3D?=
X-Exchange-RoutingPolicyChecked: KVhIs/OQ/e/sTXPu8aKK6XP0FIRV1IBFnZz+9zdkN1I5YWNjKrJbXM5prl2zUHHF2wtJ1sB7TodzLM2/XAjNJiX9MtYc+0X7gm0AOx14I8rZLMbXczKjEV+W30KhKi1m9jIIP6RdJc6vCUpT5fV/wYQxP3vXhJUS8rDjFLWDzewIx7dOY3v75ME8m7lXQBszMZUK2w+tyKqM/9wevQ+1pg8MofJGlxfb2PvEypdM1SLlQBCkPsKONXZscEhp3jbnOfetofB0iw7Q6teA42IH8sMdoboVXV0eiJ0fHu28bNmxQi9186ppEIiCTCDvyOOx7J6SQWNQNHJaxEDjNt7fAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d121074-efcb-4b85-797a-08def417b4b4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:06:18.8512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5kgyHvC/7u2HBEYq/u4c0bOLw+mxP0flrsndbRltm2MfaH82pRjjwap8wcPfQwEHgzYOJQ1AJXzgDEJkpasCr2yalUWQ8/GvZxOOZ9GQ8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8294
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

On Wed, Jul 29, 2026 at 05:49:59PM +0530, Ravi Kishore Koppuravuri wrote:
> Add support to verify the CRI GPU and skips test gracefully
> on non-cri platforms
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  tests/intel/xe_err_injection.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 0303f4a56..4df4589b3 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -20,6 +20,7 @@
>  
>  #include "igt.h"
>  #include "lib/igt_drm_netlink.h"
> +#include "lib/intel_chipset.h"
>  #include "lib/intel_reg.h"
>  #include "lib/intel_compute.h"
>  
> @@ -508,6 +509,14 @@ static void l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
>  	CLEANUP_ON_ERROR(ctx, fw_handle);
>  }
>  
> +static void igt_require_cri(int fd)
> +{
> +	uint16_t dev_id = xe_dev_id(fd);
> +
> +	igt_require_f(IS_CRESCENTISLAND(dev_id),
> +		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
> +}
> +
>  static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>  {
>  	igt_info("Starting Error Injection test: %s\n", injection);
> @@ -531,6 +540,11 @@ int igt_main()
>  	igt_fixture() {
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		igt_require_cri(fd);
Instead of a separate function, you can just use the igt_require_f(IS_CRESCENTISLAND(dev_id),..) here
> +		/*
> +		 * TODO: Add firmware query for error injection support.
> +		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
> +		 */
>  		xe_mmio_access_init(fd, &mmio);
>  		igt_require(xe_mmio_is_initialized(&mmio));
>  	}
> -- 
> 2.34.1
> 
I think this patch should be merged into the patch 5/8:
Add GT UC Unicast GAM Walker Command Parity Error Injection

Since, these error injection tests are run only on CRI as of now, this
patch can be squashed into 5/8
