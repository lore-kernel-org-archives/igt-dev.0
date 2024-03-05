Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA2C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 18:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BDC112C20;
	Tue,  5 Mar 2024 18:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcB2fkJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8714C112C1D;
 Tue,  5 Mar 2024 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709662056; x=1741198056;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WDsVeX8qjE1sLRVRYmhyJry3tu89mQ0ZxKXZ4Flyrc4=;
 b=UcB2fkJGNxN2HMm3WaGTIDWLdCKxNaaVjO/8qw2g9el1RB/j+kwR+DET
 8TU5lpX4onCcAwpqa9M7hwmJ7G7ncaZqZNZ64vL6dJcZoFKh5aFBEJago
 zrtAudCQtTN+/a1UgHepFXQT8fXqClp7199VJNF7q8QV1eolecFugXQLp
 E5yvMu3G176NN7u96M+22CEs72PxRk8848LRaxT7NcknvF5x3up6qhCvn
 Mlv6SSW0M2avyLTYiqaZH2CbGrPv9G5LQyWpBRSPtWsFjo5LFhdDGDmcx
 JGZR7BXpVYPptmBPJI5f5ddM42Yo/MgdOVUYn21iKKgi4XnFN8VLgscwk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21692715"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="21692715"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 10:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14028439"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 10:07:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 10:07:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 10:07:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 10:07:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkmlBRQyQRhNyO1HyPm/gU88OaRdZLpWV1eT931ieVY77SVB73dDtZ3UdFqS956jn0Q73eErdbtpQB2cNIQ7YWA7kecyAYIyAJaqTKPRc/gVlABHGKJ8ONCLXJcdwNTm6VvIFYlYlBOX38GFncXPspuS6GrWl7DgaNdrBOFlfyPg0Yz/Jx5xYQWysnokg05LGQj7fxnpa4u0PiQVpM2lWUGkqMq3Sp4Tf0mvozFH2lHVBGy0XJraMBcO1WiB4tJzX1QemUtRUMlJE3g+/VQda9V9Q/6aLTrlA2t7IM078MBe2dJ0/ys/zpmuZuvvza/E5J+nMzVzBT7ICgux/HTekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLudL5PLJh7SG/2nPahI3fep3Cmcn6vHU2NDbg+lIXo=;
 b=fs+xXmrQODM25t88HJBPnHATYC3yfW8I0zzVX0rHiC2/C3GssifzZsoEkn0QqIcmu6Db3MUz8kGk782D8uTa6RISMLWRsaibaZpWi74o4GVAqqEtKWdgXZ+4pmZt7sShAaepWihlF7TFuta9qkq732HnVFAEvjZfDrtZegKFc1uUQ7078nqPIxfMnWSAC7u0sKTKaClfyx6+ShsVXZtvVMjdcR5RXj+Hhc3DzCsUljZjOvP6kCGYz7ALQPfqdNaQTHSkCZwNn5dbLkQoYNCXqZSznRGvZiCEPOqE2KobStJ1yBLuAuGyE0pNa+BX3KwxK9bUaCMNz6ct2MKZXGUikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 18:07:24 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 18:07:24 +0000
Message-ID: <52567ff5-e174-4842-bfda-304ef3f8066b@intel.com>
Date: Tue, 5 Mar 2024 10:07:21 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?gem=5Fexec=5Fcapture=3A_Check_for_partial_register_captures_=28re?=
 =?UTF-8?B?djIp?=
Content-Language: en-GB
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>,
 <lgci.bug.filing@intel.com>, TejasreeX Illipilli
 <tejasreex.illipilli@intel.com>
References: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
 <170933449068.453612.2245101994274581916@8e613ede5ea5>
 <20240305175020.owfzmpn4frw2n7yy@kamilkon-desk.igk.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240305175020.owfzmpn4frw2n7yy@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 37539937-40f1-42d3-4916-08dc3d3f1c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mM+l10wFlAXGilUP1K2wTUA/a+tnsBdxB2kaB2FISEb8KIMdd2a2ExGGIHX+QRxDkPcogKLxmdubJQdNIVwdTTob+ub3h8vR0W7EMsGXh2q9DPDrOPcEYnZTVA+ScRcwm2N+NlPChZwbK1sX24lhyTo83lvb8nGuLrhJMUNdjr7MvM8NRQ60Tw2QVzmRMdIQ07RZi+Harw3+zO5KJDEWgnR5ITs/5JfNL/2idmEEvS5AyDja8paDUSX9BEcOHFomxai+Nvwx+NJ/GaloR85YsCGaD3R78dMtV1JgUB1iy/mCoOuIS9lsCFbT/m6K0ejK45tOd+pxmYu8TSOsE+FElbaPAvkgM8m1MNZXRxvupCLo6/mBcIySdgitjc/BIdSvfyCwa1GFDvLIhHiWyxmgMDc2OTmpvbvX6lpFde+87kUnpJVEHZyxzrYSLYHAMXDGacYLIg9BQifZpS5qUfX5mICexkb5eTtG8N7qpY5xNrh8pNp8apxU7eo5kqyz4Se3DJLRS/B6Pb0wozW4GKpxYS1UX9creDfKVXswbJ/q52xEuGdTZr9SFmcWQbBRz8hvH565dYpbjrmTpyYaRlMFIhpYdyaQmKtEkWi086WGuGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmdqeFQ2SDYwK1RqMjFubkhreVZOdDEzdkxYcmljWkcvNzUzcG9jaEd2bHdW?=
 =?utf-8?B?M0NrM1FFOWdGbmxaOTZ6RHJ4NVp3bEdpQTJ0Wlk3NTRucWZZWk1weGg0cVE5?=
 =?utf-8?B?RWQwL2N5c1RGOFV5NmhrYkZLdnA5RGVLL0FuZkRMYm9JSXd6d3hESXJxZHpn?=
 =?utf-8?B?WEJFd3NjUVg4WlYrakVuVnZUT2VNY1NyRnRPRnpyU3lzNDVqOWVZV0RiSUIy?=
 =?utf-8?B?dkZiSVQzZFduci9mQVFpSGgvVVdTajBwOXdDSWwra202cFR0TzZzTTZKajRQ?=
 =?utf-8?B?SFJ4NG9MTWdCdHVqYTI5Z1BuakxDSmVFZFAvYkZGcit3VHBaNTRWTFBBbjZL?=
 =?utf-8?B?bXg0RWE4czVpQnpGRG9OVFRVdEo3TEYzNVQ4S0VTZDBhNXBnUWJ6Z2J4UDhr?=
 =?utf-8?B?R2FJNkNJMnhMRTJZM3I0TXFzZUlSeU5BM2F0cWs2TEE1M3F6NFhGRXFmL3VN?=
 =?utf-8?B?V1NpZnY2SW50NHpjMUZRbUdLbkk0M2xDWS91SW54bTVSaTlNRTJKT2hzWU5L?=
 =?utf-8?B?R3R2ZXl1NDc2aHc4MTZRN0ZnSlBMTytzWVJxZmdic0lwY2krRE5kVFRIYzJC?=
 =?utf-8?B?cUZveHdxdkcwNVFoeHdTc2pNanFlRDlCamZPTE5KWUFiMW9uZ054QndxQTVo?=
 =?utf-8?B?a2g3Q0tkYXNSbmM4WXh1bWcyazRJd0hQcHB4U1N6WndtQ1R4cmN1RmhNWEhU?=
 =?utf-8?B?ZzYrbmw2UzM1U1JaMXF2RGNSMmdhRWJOUzkvb0ozUjZ1VGd3bHZ0T3A0L3hT?=
 =?utf-8?B?UXhobjFoR0lKTEVzeG81SWZ2Vkc3d1BueXcrVllCRGVlWWk0a0tNYW9ZU0JE?=
 =?utf-8?B?N3lHZXRBY2l0SGdyUG1ZNHppRjhyK1lWbDlCME83dDVwTnJRbyttQ3dOQmJl?=
 =?utf-8?B?aWRMOTJ6amlHTE9raktiZXRYdTVDZFA2QmpLdkVoVVJhUFZDNG5RcUxaQWR3?=
 =?utf-8?B?K2lwdE9RbDA4TWlhMTNYY3g1OENxdURnaWh4UHJuNklpVHowTHRhZ2IxU0N4?=
 =?utf-8?B?cWJWWE5la0NzQi9VWlo1dW9KWEhZNzZHbi80L0VsTFQ4aHAzMy9BL0dKNWdU?=
 =?utf-8?B?ZEtCWUZCdWNSRzBaRHNBYUpSSFlFZG80bTQ4OUxSQ2loM3FHNXlYNkYzUkl5?=
 =?utf-8?B?cWlKZ1lYVHJQOWpyYVZNMmlHZXpJYkpBRFBlWlJXRlUwejlpZ3NRL3NXeGZ0?=
 =?utf-8?B?TXp1L3RDOW4vYy9WRkJHVXVLWXhlVlJPZll3TklVOFVGSHJKT2p4MThmMWhr?=
 =?utf-8?B?bkE3TkprMnZhSVFXcHFPMUJ4NVN6b1lTb1UxV0dQOEl3cUxXYnAxRWtGdDdt?=
 =?utf-8?B?UklFbDF6dFZsQm1pSFZEWGxZcWFpb3NsaUdZS3YwTVVrWWJwNTJEVlZ5OHlq?=
 =?utf-8?B?QXNMa3dvck8zbHZRZ3ZmY3Q4K2MrTWVrM3NsZituMFE2MGxuaGxXV2J6cmEv?=
 =?utf-8?B?bFVqMFdvSXo4U2I2RjJxQm5hejV3WCtDNCtHTHAxbUp4NmphYUdpNk9KODFv?=
 =?utf-8?B?UTc1ellCaFVxQjFieThDVk54NXVTMWRjZ2Z4enRKSk1pMWFXTW9RY2tVSm5s?=
 =?utf-8?B?R1A4eGd5a3QzeEhjNzhGeERhNE5EYUhtcGtCQ3Y2T1NoUitFYUNCVXhiMS9N?=
 =?utf-8?B?S2tUek1RUWJuREFyYzduZjVvZG0rSmF6NUlpYWVsZFFTMmxYRGZaM0pHQU84?=
 =?utf-8?B?bDVkclE3QjQ5ZEFuUUFidlR1eFpEZzF1bUxSbHhuSGdNbVIyZVpsMmNGMThL?=
 =?utf-8?B?NGJzSlRyb2htVDhuc1JTYkVPQWw3QnVqeG04bW1tQVNoSHNSM0srNTduWERp?=
 =?utf-8?B?bWVySW5uMnNSbEhWMFlDVFhlNSsyaFNIdVVOL2JkUUFLL3lnM3pHbjdSeXQ5?=
 =?utf-8?B?dnpLSW1Ya2pmdmlnVmhGak12V0hXQlRueHQxU2crUjVlUlhoQjAzNzVqK2xa?=
 =?utf-8?B?dHIvN3ZSSG80aGZCYkNGRVo5Mktlbm5vUEt0dG1qWGpNUzM5OGkxalI0UWJ0?=
 =?utf-8?B?UFhVVXMvUmxPZy9wdnJrQVpKWU5NTjByenpSVi80NGpIR0d6N25uRzlzQzZJ?=
 =?utf-8?B?Z1hMeERMY0hpUXZHR2FaclpJZXVHeGJ2TUpleVErZXNBUmJMOFBBbEhFbjM2?=
 =?utf-8?B?MlZTd2VGd1QyVjdmNU8zUmVPaHZWM1p2Sk1XUHQ1dDMzbTA4bGUxOVY3TVpC?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37539937-40f1-42d3-4916-08dc3d3f1c37
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 18:07:24.7054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJE6/sq7cSPVYNUnn6bcjV9MBoZV55/vEuVyK5rxQhd75RvUGlQtm2o8GL/CvZh7TCR7F79KNHQAy0grvNAwdGloOunfBH6W2dszhcIisC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

On 3/5/2024 09:50, Kamil Konieczny wrote:
> Hi igt-dev,
> On 2024-03-01 at 23:08:10 -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: tests/intel/gem_exec_capture: Check for partial register captures (rev2)
>> URL   : https://patchwork.freedesktop.org/series/130332/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from CI_DRM_14370_full -> IGTPW_10760_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with IGTPW_10760_full absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in IGTPW_10760_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html
>>
>> Participating hosts (8 -> 8)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in IGTPW_10760_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@gem_exec_capture@capture@ccs3-smem:
>>      - shard-dg2:          [PASS][1] -> [FAIL][2] +13 other tests fail
>>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-10/igt@gem_exec_capture@capture@ccs3-smem.html
>>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-6/igt@gem_exec_capture@capture@ccs3-smem.html
>>
>>    * igt@gem_exec_capture@capture@rcs0-smem:
>>      - shard-mtlp:         [PASS][3] -> [FAIL][4] +3 other tests fail
>>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-mtlp-8/igt@gem_exec_capture@capture@rcs0-smem.html
>>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-mtlp-6/igt@gem_exec_capture@capture@rcs0-smem.html
>>
>>    * igt@gem_exec_capture@capture@vecs0-lmem0:
>>      - shard-dg1:          [PASS][5] -> [FAIL][6] +3 other tests fail
>>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html
>>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html
>>
>>    * igt@gem_exec_capture@userptr:
>>      - shard-dg1:          NOTRUN -> [FAIL][7]
>>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-18/igt@gem_exec_capture@userptr.html
>>
> Above are bugs which were spotted by a change in test.
Correct, this is the test saying that the kernel is broken.

How does one know what build of the kernel the test was run against? 
Specifically, does it contain this patch:
e45afbeb59347 drm/i915/guc: Correct capture of EIR register on hang

If not, then the test is expected to fail.

John.


>
>>    * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
>>      - shard-dg1:          [PASS][8] -> [ABORT][9] +1 other test abort
>>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>>
>>    * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
>>      - shard-dg2:          [PASS][10] -> [ABORT][11] +1 other test abort
>>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
>>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
>>
>>    * igt@vgem_basic@unload:
>>      - shard-glk:          [PASS][12] -> [INCOMPLETE][13]
>>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-glk8/igt@vgem_basic@unload.html
>>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-glk7/igt@vgem_basic@unload.html
>>
> These are unrelated.
>
> Regards,
> Kamil
>
>>    
>> New tests
>> ---------
>>
>>    New tests have been introduced between CI_DRM_14370_full and IGTPW_10760_full:
>>
>> ### New IGT tests (4) ###
>>
>>    * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-4:
>>      - Statuses : 1 pass(s)
>>      - Exec time: [3.52] s
>>
>>    * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-dp-4:
>>      - Statuses : 1 pass(s)
>>      - Exec time: [3.31] s
>>
>>    * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-4:
>>      - Statuses : 1 pass(s)
>>      - Exec time: [3.46] s
>>
>>    * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-dp-4:
>>      - Statuses : 1 pass(s)
>>      - Exec time: [3.31] s
>>
>>    
>>
>> Known issues
>> ------------
>>
>>    Here are the changes found in IGTPW_10760_full that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
>>
> ...cut...
>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html

