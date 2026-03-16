Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFBDEFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428610E250;
	Mon, 16 Mar 2026 08:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8F6+/xT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63EB10E289
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773648946; x=1805184946;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=f9LLIgaiCbCV71cr7IFxxTlu30DPXl1YT8R5G4lwPLM=;
 b=Y8F6+/xTa79KX3t6q5TnnQVgftohcnlrsygKlK2mwAHt1YPMn7WAOdI6
 AV6+/1hjcbRm3rgf+E/iNessLUdt2J3Z6qyxcNTz9UrdnBNUFSmsXkHCa
 U60p4B63qJaV06T7wBVkKPsd+rp2l87Nqgd4fo6r6wR63h19jNERaWhvs
 BxQ6pXpiekvs4rXwzBjOnWb66C9RBsMqi/16DJooKxie1DhZ+Gr+8lOa8
 NxlvMiRdf5ntZzqfFCoqkL7hmAKJFedXXgsbCp60j1oH5MHE9r7WDsXPr
 dQifid8z5Q+78Bvh8b0/Q+ECShaJp58mFhe1PpAJvszmjoh1xRtAngjIb w==;
X-CSE-ConnectionGUID: C34mFxUwQ4O0p6BW5QQ0LQ==
X-CSE-MsgGUID: fZY4rCgGS0+lXDNnhpxFVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74363371"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208,217";a="74363371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:15:45 -0700
X-CSE-ConnectionGUID: 6ZCu44XLRHiRUiYEUvkWEg==
X-CSE-MsgGUID: uYG/bhqnTOa0ScQZkBWMEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
 d="scan'208,217";a="217694627"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:15:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:15:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 01:15:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:15:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eq1o7Arr1Yn7s/YSpW0mFTpBDZDeI58pW23TlhSIur9Ij3EpzakVsBq/nsf9Cd1r7/Q0v0DjZ8VqZXTunpHeuIAoGSC3M/UrO9M5sbNXq9CdFKmhvWEm1xb/5QMu1Y2qpwfgf/OPPjAbDh0PPANNfQ7v4VStRHCm+r6BToaVoSKp+wA4osnWoFlRPRzJ0xcG2U0J13oqGXvepi0FsY+Ia5KeHwTZ09y1CdXmEVW4ppHR+4uhToSiP07YKCGnbOYvvMXJdutsjBlatDemMKR6IMYJ0hVrMnqqa4g3l0onibGdiy9URJi6WfEWflW2WOmqvCg6FsOXeM4enGK0Zc7mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTz4vMgv2IEeSL+U+8cB9vwQUHjxRas0UHspIokyjL4=;
 b=BsJoVFeW2YiqhmSwjMSAFmFm3oUzGNNNwgB8Mfn4GtqHmT7oO/RXDHbjUtm7AvxnHDYgJJFPin8B/aoEo8wWYtWLYSSPZRavSyeYNNxufbPcK5WjJ5TyRHuPiDHEbR+xOYOnH4iNn0Vxdum4izkOE1rje5dx0WJuNomIUWRphx3HjFQtcgy0dZJnlqCordL0JeWFz6pLpa1GoK/4uGHdtB1ZWU0oYf+OzxD80tddiaU1OSjVDqu6GGru/QDKDS+RXyWW5LUp7KGFUGaIiqImqtlywFUqvX1aG5bQhliRsCsLv5OblKyMyp1NPcF0PWZGEfKFO23fM8Wev3bV8ANRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 08:15:36 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 08:15:36 +0000
Content-Type: multipart/alternative;
 boundary="------------IYUSqSq2ShNI0ITKVQL0kvhf"
Message-ID: <32b466e3-21a3-459a-902e-9318f9003018@intel.com>
Date: Mon, 16 Mar 2026 13:45:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
 supported
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260316033807.24078-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260316033807.24078-1-jeevan.b@intel.com>
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To MN2PR11MB4271.namprd11.prod.outlook.com
 (2603:10b6:208:188::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3e3d77-fce9-4214-8574-08de833432b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: eOwKQh3SKeZ4C9F7HnKczXJS2dw6goAZNCpVDv0JG9NQKdIn0t0e98n8XrabieTGa4pHBCZUp05Xe662aMJJXXi4QsAPa0czIFCPVOD521r1jE/UkkmL0FPsAfWUT8pniXeHzXl9MRClAyVoR2igOQV/te1i22peBNSnXmG37WkV6S8Y4l18wFZ63kRq6r17V6BJLDxH2IGy9jBDdDsw/zsTuMo+dW/4MwWQaKZfLPfcxMhCyDGGByGs2on9dtg3Ea0NgYNuuc5hSDdcxSoQo3CKx7shE+CPnGU7tUCXnTjZUyAQo4CArwdr8EqnNUsVybfOmJDRF1FN3HR5sfBTUKGFoagN5TFsdxe1mqpjaMicGSLk9rImBqg7n9OCBgp9hZ93hwy34Q/Lt9wsGHlBBoNB4CxIPoprjCVuit5osqQp6Dyzh7YkbHB0xbmQ7Wf1G8zpRC97EekoerJ64R6F27CG2mntJH/L2DMuKL4/+4cKBHig6VcW2hRywFsfT7RoInglJ76U53NbIfJtxxOaEou7kT/EUiu27imPHKvjm/yPrr3ul8BO0JPk5k6mUbgyUGK/WbGCrlSRWK4pxtXwN41odhEB3ndbAs2eef4Ex4Nl/BOTp8erHYkcQB5TIjVKKW/Mt6ji95M4s8/dnz7kMc1ie8SKGqarLJggKaQIVCp3zW3H8Oo3K8itw8idTx0Lx+U40PwOpMTYk37ydV0bFbKT9hTjaG/ZfajVARI7y78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRGRkpuTVJ5clYrN21wM0pCTDlTcmNFQ0FGbXpJK0V1WWk5QWE1R3hSSVQy?=
 =?utf-8?B?RWZZMlBzQWh5VTFNRmlsUW5iRE1RRG9PSHNHb1VqREpVdk8zR0hJM0V0S2wz?=
 =?utf-8?B?d25iS1FPdHBMaHRFYm1oR1RtNnRZRUNFK1doQWFKNFB5L2RCOHF2WUlSbzBt?=
 =?utf-8?B?RzRGbzQ1QWh3VmZEWUxVVUEzc3dxU3dwTkpaYUNIc00rRVd1SEVaL2xRdVFo?=
 =?utf-8?B?OHN4UENTeWo0VjVJRi8veFpZQ0FvNFUwcXczZFNBemtWWTJ6VW5WeGNjYWZJ?=
 =?utf-8?B?T0JCWTAwQW1tSUNWaXdqcFJJZXpBNTg1WnBHUlpETXM3TWZEV1MrQWMzV1Vp?=
 =?utf-8?B?ckNGQXdIVTNNcEtCR09sMzlVd1hteXFORkJlTGlYNTdjTU90dTBoQzFkOG4x?=
 =?utf-8?B?TlQ1akE0NVZla3JPVjBieS9WOHdwMWlOaTFJSUdMUzhyNk9uVGVBelZhdXln?=
 =?utf-8?B?ZW1XcmdGNXJwZFZ6bWFMQ1NUWFlQN09qbDYzY3lrWGNXSm5OdEp4YUJZS3JR?=
 =?utf-8?B?UUg1R09NOGJVUzB2NTFwcHh1ZmUvNGkwelVodFRoVUlwYVVVNE9LSkErRyt2?=
 =?utf-8?B?blhuQWJvS09SeCtpeUs3NWZYUWFVdjdPSkc1cVRIcDBOTmNMSFdEYXV6ZUkr?=
 =?utf-8?B?eUlSMTEvclJ0N3pOMmhyeEU0ay9teC90UkxNRnZKRndlbWE1dEV5eTNpUkYw?=
 =?utf-8?B?UEZIeEtFS1daN0thUDhFWStKcmFuSHFodHh2em02S1RhblJXemRCbFpRN3Az?=
 =?utf-8?B?SWszaW8wNmxpZ3NROVJMQWZQZzZuNENQQlFFekt3bXFEdUN5RGRsb2lha2Vp?=
 =?utf-8?B?MXFzWnR1ZDZMd3ljR2M4TjJPbDhjZFdmUWlXVkRUaWhFVzYwazV6ZWtRZWIv?=
 =?utf-8?B?K3FPNHRQa25BMUF5YkRTM0tLcm9Ib2FEbDVhdVpKZTEwQUxhbUYrQ1BMaEsw?=
 =?utf-8?B?QjZnc05wVXRKZ1YyVk9NRmpSOURGSEk5ZmlmMDYrUFNsajBMdnhaT2NwTUNs?=
 =?utf-8?B?MVNIV0xCNDFPUTdaTUs5eUNHT3I3OWxJTTNTQU1BQjZJMjd6T3NQZEc5cTgv?=
 =?utf-8?B?YVpZNkV2eEcyZlpjeXFKUkdWUVJVY3ZSUFl1aVVRYzhDdCt0cjVZQ3pkNjlj?=
 =?utf-8?B?VzF2RjRrYXhRVXhDaTFpU1daRldSVXpUMFp5NUpvM1dLWWhlazQ1K1lBSUJm?=
 =?utf-8?B?cFB6c3lYc1d4VDNRVmZsWGFOcnVrdmg0Z0tRVnlMYXhpM21kRG9HaUNJRW82?=
 =?utf-8?B?UDNZeVZmYnpJS3RMR2UrTURTdGd2dWkxc1FSNllHUUVpNnNkTlNZbUdQZytw?=
 =?utf-8?B?SEJJaUVBZWZNYWwzaUZ4Y3hZaUdJRms3ZEg2eTFobUVmR0RSdlorcTlreUt4?=
 =?utf-8?B?SkFTWWxGZWg1bkQ4LytlbUZ2Z3Nxc1hQMWs3RXd6cFlKbFAzbXhTTjJ1dkRU?=
 =?utf-8?B?SUVQejdqWENRa1F3VG0zZHYvT0J3Zkd4QmFrV3h1TnU1Wm4zRGl0VDZZYWMw?=
 =?utf-8?B?QWQzb20xNGNsWFR3WisrNVQ3a1ExRWxiYUdXcURYa2ZsQWZ1cDZESjJwa1Vy?=
 =?utf-8?B?bzI5TUI5WHNncWtrZkhJRmNGUjdtWDhyVTZsUW1Tb0R6S0trSXk1NkNCS0pI?=
 =?utf-8?B?ZzZldTQrRkNtOGZyV2gvbjBicXVDOWxIRnRkcllMV1NDZ1lJTll3MXBqa3Nz?=
 =?utf-8?B?VkMvV09uNDRCVWdZRlJNcFQwdkYwTitvYUIwMG8yTTBlcENkNjdzUEkwWDB3?=
 =?utf-8?B?VFgzM1ZnRmFpakxITkhScHZvZHVHTEpXT2dLcnhtY2JWb0pCT09YMEdZSVVU?=
 =?utf-8?B?NkQxdVY1SUF2UUNCOUVqYW5CZXROdmlnc3VQck5mRU9FZGltNWZPZG5ia3VV?=
 =?utf-8?B?ZTNDRnUweTBVMzFlQm5GMWxkSzhoNzRJbU9Ea0E0dmV3NXhRTGh3bVJJOE1D?=
 =?utf-8?B?MUlwL09DdnlKZFM3MkZDRjdmS3dRZDAyM2dsMzRORDcrM0prQUJrTnFhUERT?=
 =?utf-8?B?cnU5MjlXNFNsYnBpUFpUZHVsaGx6d2dUcGtrbDk4cmRhZVMwNHIwTTBzWEd4?=
 =?utf-8?B?VWZhVHQxVjFEdk44aUtuVW9MbXh3WjNKSjdiazhBRy8yeGR5SC80YjU3MWht?=
 =?utf-8?B?WXJUL0IxNjFQdy92ZVlTM3pvUUo4UjlKZmRNdmpXRTFOaklNdlYxZGNWa1Rv?=
 =?utf-8?B?Vld3R1V1QXNxTTR5Zk12VXN0NVhyTStVWTVaMFdIcmh3KzdiNTRWZ1RyQTVi?=
 =?utf-8?B?NUpwUmZpRjV6YWE4WXV4djNMQWdJc3BpZi9uTFp2TXR5NDE2NzlFcEVhKzJH?=
 =?utf-8?B?WjdHcHpSMVp6UzBlMDNHeHNleHQzdFRVTUUzdlBWVk5wZXczbjQwTTFXbW53?=
 =?utf-8?Q?UDiwOZbatmAPzrXY=3D?=
X-Exchange-RoutingPolicyChecked: UZCrLJySfdMvbLa5/b6jngoA1O77kGkWx2s7wiYQT+5spS1viC0C8kzzIjVYFhNO3QQQQQ5VwYoKJpF6MKuoKFZDqMUQcWKurt2tYW0jB7KkuNUO/NWuQGJIxPH40oXDxBYJXjpYmsPuu+VNRrdZrnSxHbvLq0dA6JNiQ7sajpWczQc5PsJSXhghgGHFdcre8XQisK9TuyvXf+EyNPHcsSvtl3QO5rS4tIj8Pj5y/amgAcLOjpMVR7t/+Q67H9hD1FhGgKwdJkjNaHNrYt40E4LuroOytWzNykdAuOqZ13noQxmSqZkNu2GNl173Z2r7O33VKG8eyRq16VqRbxpfcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3e3d77-fce9-4214-8574-08de833432b8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:15:36.1693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BO4S4hOfEInjaSCSyIk3dGqMu3mAg6aNfZetjaL9JQTUXa/62l3iA8ZNAeitGdMW8y0yHh7804LuBWmYI0OMKNg7nJEcMNAvbsmPCYHuP6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

--------------IYUSqSq2ShNI0ITKVQL0kvhf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi jeevan,

In same binary couple of other places also used DRM_FORMAT_MOD_LINEAR 
please change them also to I915_FORMAT_MOD_4_TILED.

On 3/16/2026 9:08 AM, Jeevan B wrote:
> While creating the framebuffer, prefer tile4 when it is supported
> instead of always using linear. Fall back to linear if tile4 is not
> available.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5399ef481..4c4e477a1 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
>   {
>   	drmModeModeInfoPtr mode;
>   	igt_plane_t *primary;
> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   
>   	igt_output_set_crtc(output, crtc);
>   	mode = igt_output_get_mode(output);
>   
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
> +				     I915_FORMAT_MOD_4_TILED))
> +		modifier = I915_FORMAT_MOD_4_TILED;
> +
>   	igt_create_pattern_fb(display->drm_fd,
>   		      mode->hdisplay, mode->vdisplay,
> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
> +		      DRM_FORMAT_XRGB8888, modifier, fb_info);
>   
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, fb_info);
>   }
>   
--------------IYUSqSq2ShNI0ITKVQL0kvhf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi jeevan,<br>
      <br>
      In same binary couple of other places also used&nbsp;<span style="white-space: pre-wrap">DRM_FORMAT_MOD_LINEAR please change them also to  </span><span style="white-space: pre-wrap">I915_FORMAT_MOD_4_TILED.</span></p>
    <div class="moz-cite-prefix">On 3/16/2026 9:08 AM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260316033807.24078-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">While creating the framebuffer, prefer tile4 when it is supported
instead of always using linear. Fall back to linear if tile4 is not
available.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_cursor_legacy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..4c4e477a1 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 
 	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
+				     I915_FORMAT_MOD_4_TILED))
+		modifier = I915_FORMAT_MOD_4_TILED;
+
 	igt_create_pattern_fb(display-&gt;drm_fd,
 		      mode-&gt;hdisplay, mode-&gt;vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
+		      DRM_FORMAT_XRGB8888, modifier, fb_info);
 
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb_info);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------IYUSqSq2ShNI0ITKVQL0kvhf--
