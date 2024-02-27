Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331FBC5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 18:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC67110E53C;
	Tue, 27 Feb 2024 18:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdCd6ZqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B83C10E819
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709057916; x=1740593916;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=My0Oz0s5A3+7rkpbTVCUEXuBEjxyiT2FmiqHHSVlaME=;
 b=IdCd6ZqO4LVMF2CG2RKlNwOjTsS8ftqhM/4qOZ1s7wJfccrgpnKPyPS3
 9vaB23sNyWVnmYDBL1gHjJbTQ60jeXThaW4I9Zwh03/OCskNt7axhy53o
 BZCJeJ99Oue6BL6R7/mF/pxy0OWc5arxcmDoLB8d5sKo/d0PGKTOjMcTs
 guUhwyfhWeNFuvNnIHnuKrcMIPOyYfNwIk5YNLTvTxz1tRD8XXcbvzHtJ
 jdSRkyBBOIM+uplj+W9ydndIzs893RxNjXf4Azpn+tPQlbuxEyNxT3MgH
 jMmS8Jsec+iuU9ZUSvKjmuceNWOxf618gyCqhBl/VRUqazoB3yCm0teXd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3290995"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208,217";a="3290995"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208,217";a="7089966"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:18:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:18:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:18:13 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:18:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhN57qV01RDVXMizdF9NeEzjdc0jGOAUt168IUExdDrjGo6X1uUc+Q9Fg5dVppVyO1s638N4WLWZxlgzRc97CNZI/zM8wLepA0AOk0AKZQBSNAtVSV1cW+jL7biugSRB79uzGkay+JmrVyTrPMc9QJpbGJRCWVXC5rLaWUobMuj0ZhM0EoyY7DCeij0RRA09YanjNefYMkWNCSpTg7dXYIHDp53La6Qq8BCF2v22vlh15I/CMOU5xUg0/1kWseATd7mxVcE0ZQCpyUGMEcfsH05t+KIQ2LoX13WDuTsPL5JZjhW/VuiDFLgamQaeTV6FBS5btMipHB+9LntAJC8wFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhgekKjMvYeIzarSHVSdpx+7uwWQp0ITixCGN95h/uY=;
 b=cERkaqx4KJab+eFgnM2kukBXUxaR6wyXbt2Jtt7rfDAbb2R/2r8wYuEPOf8EmN4mQafuw4PHYPsX0Fc7A9t5zuKJZzYT8zDlZ53uWXKZy5jjZIPXkxqvzgpwlRXOdbMg0wUhe040imuKXg88VGqxPRqq2zpU4iUCYZlaicZhiKm8+pvNj+lLsTUENRjK5GTn1TWNcUjzaGeOJHa+BJoB2ByZW3wrseFkXWy+B3x3hSOas6ObtHNd1AgjK6Uh+TlIxyCn9K6Xl8SNLrH2v5cBimF2U87Vi4GCLWq4VkG6uecRJ/SzBllXfGvI6SQBVskkINyPsyU/nFKo2SvyMg/GuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Tue, 27 Feb
 2024 18:18:06 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7339.023; Tue, 27 Feb 2024
 18:18:05 +0000
Content-Type: multipart/alternative;
 boundary="------------DEG95rKAefIK0ELe7sZbwOle"
Message-ID: <81f78c05-556d-416d-a3d2-92e3146ac268@intel.com>
Date: Tue, 27 Feb 2024 10:18:03 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_More_updates?=
 =?UTF-8?Q?_for_MTL_workarounds?=
Content-Language: en-GB
To: <igt-dev@lists.freedesktop.org>
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
 <170899473106.299097.11954731905985931753@8e613ede5ea5>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <170899473106.299097.11954731905985931753@8e613ede5ea5>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 69342ff8-9997-407c-279e-08dc37c07169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzHRbNsABygnOp67uLN4GCE3I49MqKjB48epD5wkQ+ehBCcsmAPg7S8ptWAj8ilc6NOT+xNy8hrWjU5g9bxAJ2QnMlOEMzYIkJIAjkP8XXyGTbwcD/+N1yGjez6ITrGmIv0/Nw9hUvhMK7T+ZrCnaSSMo2lx92EzjaZUr1CsNDqjUODDhHrUUwv9fwXl/yEey9hS4ETGMLrAs3Vxytt/iIDkOBOzEvi+Kb2TTkjRPbNKFe9xHFB3P4cH5R9AIGmwuO/LMN7omxD5+nwGWC6YWs3qnwv9p39GXhg3g7It3SyUd1FAqN+j95SWFwkvgWusvHHlj4nual1QXXcu1xYcIvUd4PI91OnLPJtgutes2d7QxtYePWXvTwp3sq06O+59wTGE1ZRKzDZJtvoL9PKI9NFC5rOazMfWX+pQXw/r3g6m/FW3J6oWAId2i2w2ES4fqw43iiTRwd7LohPievyOCl4Fa6RanC8sfZi/40ZZh80cnzB49k0TPq4BYA+969VF6/oSW6FEypagrp08S5qk2PZDuot+9yCLnf/7jr/uCxyzPUy3hpU5pK+mn2igQUHZdAvjRwocZQtXsby9RLDd9Lnp9a6l9ZuMJKmPIR0eabj64xtli7V6jAqeqyeGH2IWNjYopr+A1obC5xdB4zEQ+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjVidldNUnNZTC9iallEZWJoTFpKVUNleXVPOEk1WE9NOWQvVUUzR0wrRzgw?=
 =?utf-8?B?VjBsM292QU5ERFJKUlZKL21KS0tWNVRPWmc4UG1kR1VXdXNjSXR3Tmc1VHpH?=
 =?utf-8?B?bldRdENSV0lVWVVBa2ZqWXUrOG41MVlRRWN6Y2VZMEZYejBVOWhaRmFvTUh6?=
 =?utf-8?B?RkxVMTQvcWtBaXE3aG50czNYcjF6SWY3ZTFQZVZYN3JLZjEvVVMrSjNTYWJO?=
 =?utf-8?B?RU1iU2pycVhMYjJHdEE3aWlCWFJ4K080Y29LRHNYUlBpVnp4aHN5dDBBZnZx?=
 =?utf-8?B?cDdUcC9XbXd2TUhFaDJGWG5xR0VpdVU2eDVjVmk5RVV1amdOdEx5WTYvRDJ2?=
 =?utf-8?B?UitRVXBrMjMrSHd6SEVNTGtsREQ5TUU5eGVZK1R3bUtWeS9CaXg5WEwyaWFu?=
 =?utf-8?B?clFHbFpWYzI4eGdOL0FMZnNCekpFTTRsOFRRMWpKejNlQzFRUHpnRUlQUjN1?=
 =?utf-8?B?OS8wMEY2czJmY1E3NUJ0ZEZjT05PdUlEeGRuK0hLZW0xZEtkODNPRkRjODFU?=
 =?utf-8?B?TFY2eWdXNWwvRXEreG1EVy9Zb0k4ZkFyN2dsMnlhQlFlQUFMVWZwOStzem1K?=
 =?utf-8?B?VEp4K0hBQTYxQk9uQS9vOEpxMmR4bHcwK0doV2xGZWpIRlgrMUdIMGV2TE9E?=
 =?utf-8?B?VFZKSkl0WTdlUnV3aTNKa0NodWpGVjNuZnRsNVhnNDdNZGpXL3dHU0hsdUsw?=
 =?utf-8?B?L0JTcjlPczU4VXJnUTQvWkpQbUNIVHorQURtWjhmM2g0cUd3V2MwYm9ZQ0RE?=
 =?utf-8?B?Zno5ZWRqUkhwamlNaWZ2SHA4akVCbGNXZTZHNnRKZ1NOczZQWTBjR3FEZ25v?=
 =?utf-8?B?RG9FNy9JdnBlSGZmSGIrVkk2a2taNk1PQVFTTnVSblI2ZFJhY0tHUHUyc0lr?=
 =?utf-8?B?V09ubXRkZ1ZCSk1KN2VWYlMzT0ZaUE5LUXRHRFNsWFM2VVpFcWxqQ3NUNGNL?=
 =?utf-8?B?MlhOQjFKcFVSSUNDbHM2SVNVbnc4Sy90emJodU9WNDVzSFQzcWlvc1Y1YUdF?=
 =?utf-8?B?TzgrVmIzRjNhYTF3Z205a015c2l1N0VSZHo4ZDFOYUNURlBtLzBkN0tKaTc0?=
 =?utf-8?B?eW5pVWxrNUlVZS9qWStPQUZ6UzhVdUY5cEgzVkluR20rQTdoVU1Fbk1pc0xM?=
 =?utf-8?B?NGF1Tzh2SzRwMEtWaTAwYTA3VlM0VHVIZmxkUWlKdnlCZ2xGMW9SaUlrKytp?=
 =?utf-8?B?ZTRrRkIzdXgralNGeHJhc2JydTNqK0plZUNoYS9JakUrR3luVU1vdExOVmFi?=
 =?utf-8?B?dEZ0VEgvUFlycFdhNkc5NkFIUGlzd3M1YWpCazlOZ0hxUHBXTnEvWjNWZlJV?=
 =?utf-8?B?eFhlai9PNUhlbFdNeGVDY29aemc2REIwSVhsZGxyK0RpMWt5eGFsaWxQc1RM?=
 =?utf-8?B?OFBkOWxLU1JkN2Z3dTMzTHBFaVVrWmVxMm1JaHBzTmpaVG05VDZGWjZ5UTc5?=
 =?utf-8?B?OE5HYklEdnNNQm1zdXVvYXJuVEY3WCtpK25UMnZCMG1KTE95NVZpU3V4SzMv?=
 =?utf-8?B?ZThzQUkzV2NEZkZZZXJUK1NUT0hPaVhWczdrNDFndmZjWXdsTmcrNWU5dWdl?=
 =?utf-8?B?aTVwQldQNTk4NWkyZ0QwMlk0RE9Hbk5uek56QXR0c3A1ZGd5OE9zYXpJdXE0?=
 =?utf-8?B?M0Jqa3hYaERyTndIcDZvSXlTa2l3WEx5bWViQU5VYTMyZkR5WHNDdjNjUk5P?=
 =?utf-8?B?SWlyUjF1UlV5bVRhekljV1dYWm5MY0krdGorVWlyWFVXaVJpOWZPL1licisz?=
 =?utf-8?B?UFAxa010MVBaOU0rRitna0p2TjRzbHorTDUxNzVJUXE0dUlYbnhTR2JUNDRF?=
 =?utf-8?B?K2tHQU1xY1l0ZVBzSCs1NDhIYkswSCtaRVlWSXhET0RCdDF4Mk84Wk9PS0Zv?=
 =?utf-8?B?d0VYTWxPUndQMUc5ekx2Q2xJSC9IT29UQWRyN0VHaU9Ca3FyZEVwNlIzOUs0?=
 =?utf-8?B?OHpEcVE3NEYyS21JMFM5NlR6VDY4RUlqM3Rad29iVjdiM09wWUVTQThVUU5i?=
 =?utf-8?B?TlNQYTVWM2dsczVqcmplb3BJYXlEeWdJSE5HZEZad2pUTDdNTDBpbE0xZUlD?=
 =?utf-8?B?djhYQ2RMUWk3Ulllc1N5WmlXVE5oSGw5ZXlYT3pISUVaWGkzNDJSL0ZLejZn?=
 =?utf-8?B?ZU12dE1KWkJNbWFSSVpKLzAwclV0cm53WDIrWUkzaDZuR3FaaFRrZTJLSTdx?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69342ff8-9997-407c-279e-08dc37c07169
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:18:05.7140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtXf1FSQovb+WMuWLIbVeITgc0HrzZVJY/ezpvE32rbaXEJ+0VpsyFGeo/sIqYkVwCZ+S0aarYbnJN+ffFUu/HheMKBNHjZtwrrWoIn4gB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

--------------DEG95rKAefIK0ELe7sZbwOle
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/2024 16:45, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	More updates for MTL workarounds
> *URL:* 	https://patchwork.freedesktop.org/series/130416/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html
>
>
>   CI Bug Log - changes from CI_DRM_14345 -> IGTPW_10739
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_10739 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_10739, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html
>
>
>     Participating hosts (39 -> 38)
>
> Additional (1): bat-kbl-2
> Missing (2): fi-apl-guc fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_10739:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_selftest@live@requests:
>       o bat-mtlp-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-mtlp-8/igt@i915_selftest@live@requests.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-mtlp-8/igt@i915_selftest@live@requests.html>
>
This patch set only affects gem_spin_batch so any selftest failure is 
unrelated.

John.

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_10739 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@fbdev@info:
>
>       o bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@fbdev@info.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>  *
>
>     igt@gem_exec_fence@basic-busy@ccs0:
>
>       o bat-arls-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html>
>         (i915#10194
>         <https://gitlab.freedesktop.org/drm/intel/issues/10194>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o bat-kbl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +39
>         other tests skip
>  *
>
>     igt@i915_selftest@live@gt_lrc:
>
>       o bat-adlp-9: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html>
>         (i915#9413 <https://gitlab.freedesktop.org/drm/intel/issues/9413>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_exec_create@basic@smem:
>
>       o bat-arls-1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_create@basic@smem.html>
>         (i915#10194
>         <https://gitlab.freedesktop.org/drm/intel/issues/10194>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_create@basic@smem.html>
>  *
>
>     igt@i915_selftest@live@gem_contexts:
>
>       o bat-atsm-1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html>
>         (i915#10094
>         <https://gitlab.freedesktop.org/drm/intel/issues/10094> /
>         i915#10137
>         <https://gitlab.freedesktop.org/drm/intel/issues/10137>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html>
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7731 -> IGTPW_10739
>
> CI-20190529: 20190529
> CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_10739: 10739
> IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
>
>     Testlist changes
>
> -igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf
> -igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf
> -igt@kms_colorop@plane-xr24-xr24-bt2020_oetf
> -igt@kms_colorop@plane-xr24-xr24-bypass
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive
> -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate
> -igt@kms_colorop@plane-xr24-xr24-multiply_125
> -igt@kms_colorop@plane-xr24-xr24-multiply_inv_125
> -igt@kms_colorop@plane-xr24-xr24-pq_125_eotf
> -igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf
> -igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
> -igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf
> -igt@kms_colorop@plane-xr24-xr24-pq_eotf
> -igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf
> -igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf
> -igt@kms_colorop@plane-xr24-xr24-srgb_eotf
> -igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf
> -igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf
> -igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf
> -igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut
> -igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut
> -igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf
> -igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf
> -igt@kms_colorop@plane-xr30-xr30-bt2020_oetf
> -igt@kms_colorop@plane-xr30-xr30-bypass
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive
> -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate
> -igt@kms_colorop@plane-xr30-xr30-multiply_125
> -igt@kms_colorop@plane-xr30-xr30-multiply_inv_125
> -igt@kms_colorop@plane-xr30-xr30-pq_125_eotf
> -igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf
> -igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
> -igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf
> -igt@kms_colorop@plane-xr30-xr30-pq_eotf
> -igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf
> -igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf
> -igt@kms_colorop@plane-xr30-xr30-srgb_eotf
> -igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf
> -igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf
> -igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf
> -igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut
> -igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut
> -igt@kms_properties@colorop-properties-atomic
> -igt@kms_properties@colorop-properties-legacy
> -igt@kms_properties@colorop-properties-legacy
>

--------------DEG95rKAefIK0ELe7sZbwOle
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 2/26/2024 16:45, Patchwork wrote:<br>
    <blockquote type="cite" cite="mid:170899473106.299097.11954731905985931753@8e613ede5ea5">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>More updates for MTL workarounds</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/130416/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/130416/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_14345 -&gt; IGTPW_10739</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_10739 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_10739, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/index.html</a></p>
      <h2>Participating hosts (39 -&gt; 38)</h2>
      <p>Additional (1): bat-kbl-2 <br>
        Missing (2): fi-apl-guc fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_10739:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_selftest@live@requests:
          <ul>
            <li>bat-mtlp-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-mtlp-8/igt@i915_selftest@live@requests.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-mtlp-8/igt@i915_selftest@live@requests.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    This patch set only affects gem_spin_batch so any selftest failure
    is unrelated.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:170899473106.299097.11954731905985931753@8e613ede5ea5">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_10739 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@fbdev@info:</p>
          <ul>
            <li>bat-kbl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@fbdev@info.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849" moz-do-not-send="true">i915#1849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@basic-busy@ccs0:</p>
          <ul>
            <li>bat-arls-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194" moz-do-not-send="true">i915#10194</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-engines:</p>
          <ul>
            <li>bat-kbl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +39 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_lrc:</p>
          <ul>
            <li>bat-adlp-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413" moz-do-not-send="true">i915#9413</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_exec_create@basic@smem:</p>
          <ul>
            <li>bat-arls-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-arls-1/igt@gem_exec_create@basic@smem.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194" moz-do-not-send="true">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-arls-1/igt@gem_exec_create@basic@smem.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gem_contexts:</p>
          <ul>
            <li>bat-atsm-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14345/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10094" moz-do-not-send="true">i915#10094</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10137" moz-do-not-send="true">i915#10137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10739/bat-atsm-1/igt@i915_selftest@live@gem_contexts.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7731 -&gt; IGTPW_10739</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_14345: b3552bf1e79de200a6ca49c518ead46a1256618c @
        <a class="moz-txt-link-freetext" href="git://anongit.freedesktop.org/gfx-ci/linux">git://anongit.freedesktop.org/gfx-ci/linux</a><br>
        IGTPW_10739: 10739<br>
        IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
      <h2>Testlist changes</h2>
      <p>-igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf<br>
        -igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf<br>
        -igt@kms_colorop@plane-xr24-xr24-bt2020_oetf<br>
        -igt@kms_colorop@plane-xr24-xr24-bypass<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive<br>
        -igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate<br>
        -igt@kms_colorop@plane-xr24-xr24-multiply_125<br>
        -igt@kms_colorop@plane-xr24-xr24-multiply_inv_125<br>
        -igt@kms_colorop@plane-xr24-xr24-pq_125_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf<br>
-igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-pq_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-srgb_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf<br>
-igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf<br>
        -igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut<br>
        -igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut<br>
        -igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf<br>
        -igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf<br>
        -igt@kms_colorop@plane-xr30-xr30-bt2020_oetf<br>
        -igt@kms_colorop@plane-xr30-xr30-bypass<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive<br>
        -igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate<br>
        -igt@kms_colorop@plane-xr30-xr30-multiply_125<br>
        -igt@kms_colorop@plane-xr30-xr30-multiply_inv_125<br>
        -igt@kms_colorop@plane-xr30-xr30-pq_125_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf<br>
-igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-pq_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-srgb_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf<br>
-igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf<br>
        -igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut<br>
        -igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut<br>
        -igt@kms_properties@colorop-properties-atomic<br>
        -igt@kms_properties@colorop-properties-legacy<br>
        -igt@kms_properties@colorop-properties-legacy</p>
    </blockquote>
    <br>
  </body>
</html>

--------------DEG95rKAefIK0ELe7sZbwOle--
