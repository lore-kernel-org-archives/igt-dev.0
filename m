Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC75F94CC1
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 05:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6171910EFCD;
	Wed, 22 Apr 2026 05:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQWhzryB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55310EFCF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 05:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776834301; x=1808370301;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zAI0Dkj/NYFDYqlUxCTU2A77sVl4k3YXTBEuWVf48cY=;
 b=EQWhzryBnnWpvKuIWJPcDX57KtVlZfUpnE/78AmfTQxarTW7vsz/dNKL
 45thW25F15QvtyX9aZWvNQBTlWy//7R7sMCeRVGnI11etXtLjebZPJDLU
 q40JvYDrQLhdmpGlyaLV3aameyPXKLt78tUdEQw41zr0HL5DsuAoNHhnq
 lr0U6oC4QUwqY+efYf6ef1UhlkoAG/Ow7xRmAu+tXAx/n3Qv013XZXvLh
 4fSXZn4dX4FIu0f1KzJW5CWSOz/Bawubc/3prWK3eIT26RMNccBaR5bTI
 qn5xXoshw6SvOHXpRDc3U7bdx7jdr35LYd4OW77zP1w+svqff7xEmEuHs A==;
X-CSE-ConnectionGUID: PipXdkU4Q5WxUU9BAuY2RQ==
X-CSE-MsgGUID: VBen5B0+TJGEnlNmDcDzNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77901619"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208,217";a="77901619"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 22:05:01 -0700
X-CSE-ConnectionGUID: mErJ/kkGTDOhJVvu452wBg==
X-CSE-MsgGUID: jnk7xfcYTHGCoT3AJib8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
 d="scan'208,217";a="231201500"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 22:05:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 22:04:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 22:04:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 22:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuMOVidrbYKRn4us8TRcldWnng+MIqqpqu0ryDxTnSYMIeAtwbB3XzrOD6+Wf5IClznfderCgdbuLoX6lrfIOraNV9VZCGYyi7oPVUfNHey+/lr6BwNS6jBTfMhmHj8IQKmXsciXaWlItolmBKfCAyRmVRr9KDPBDwqi9MjmKfOt7zV15lxXuuwK1z7zFubprOHJ3lRM5MCmyeqYJurSo8EJ/Qfg6v3IVpzygK2+Xh3WSlRV+Pul8WG7swOaFG6+8pvzxOoBjgjLue/CGht3qN0weGR5LQ2Vxg6yaDQEBlze66wPCkyq452Bn9cteta6pCaLvK2I8wcTD/6yYfNx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxiTxoLc8+dOC1Z04k4pLtIH56p4Y8j1a0tcjU75b/Y=;
 b=ZzWGfvKLBM7S7Dx0G9OiqcktZGxhVgW0Klpk/IqG3UXirwEWjqKuO9tN9Uu1J8jPy17rttK+c59J4efecZQAxtJ/j0r6YT8R9/DyaXyT7p1vEKGROqPYBiwItKPeIn14XSVqZhX2X3pF8LVWd/3UN4QOi+28HukNS94u1r69JPcA8iDELUv5CUFMzIP8qe2RyzlFv6AfLCxYTeIH6JB/lPOFsVcIAaG/3nAfKVwqMphWJfLDh197KRREN019Ys3HoUogfCLL/p9yMKBlDugiFh7Z3XOrPoZttwSAKJboROGZfW4FQT0t5orwjEGH50ElVeMzw3xEEEpcUrklGO6LzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB9301.namprd11.prod.outlook.com (2603:10b6:208:573::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 05:04:49 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 05:04:49 +0000
Content-Type: multipart/alternative;
 boundary="------------8mkI2vJbh0uSZ7t1XvjUgerZ"
Message-ID: <c843e301-7eb1-4de7-b11b-1783545dab8a@intel.com>
Date: Wed, 22 Apr 2026 10:34:41 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNf?=
 =?UTF-8?Q?bw=3A_Allow_custom_modes_for_external_panels_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260420061231.1952346-1-karthik.b.s@intel.com>
 <177679272294.482719.8699409611922802608@a3b018990fe9>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <177679272294.482719.8699409611922802608@a3b018990fe9>
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB9301:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3a5217-235a-4b8b-eed1-08dea02cad17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|1800799024|366016|8096899003|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Ev0X0/e5Xt9t3YzeIa+x40gBa0dmlREgYaZSElS/1cCXWQEcz2m+vp/1PHEKLZ6hyFrlV5jCiRAm64Dmq3G+1waQqth1cHhFa1zvg/3u9VtrrU6X+AmLGvHxa4s0nhnW5ukrt5BpfIVruxmQio8e8yCFj2kRumU/I6H7ze28kAy0L5KAplzxiVIDTDU70seVIK5Vg75xPaoUILWkYNE7wCXv1CFIx5QRA4rI/hB9dlGFlgHE/9N7R16RYRvL/7g53L1mpuE6blWZGnciJoCkCkxSQwFiVNStvmrh86YefRGKiSLw4H+uLBQAdCuSPd7lmfY50lxYRV4jBLPBmGEHIwaakcHev1OeEvI4ue3jvCb2pvQbwl/Q+wuXbriVc3WvmkIyz/c17W5sFaDx9cVIwU/GkpLtytB5iAtlFflQKprU5ww+Yf6gLAICZS7gb0WttSYfOre14ssxCe9wKd8kRbxDs3UZzSqUEZHHBefC+o/SBM4Y28jngdqDeCZLu6MIkzgrU24yOukZvqxJqnGUsfHdykcz8fNrRnxUNpvU/XBZ+oxDRW3kjXnhm6Bj+fkwOUdDYLh744yUJqlG/f8VptTzZoheF5ZxT7jzcd91PWvmDgvgLEi7MOOML8XWhZrrpHRUDd5nlW8vLPuNxXsl3VhEw1+2Vh+2mS+kNqOyBpUxbmXRl+2TEzTmoUCXNn7w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(8096899003)(13003099007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2JFTEozYXltU3NHV3lVZDRvdnhnT3NWazNlbmNwQVo2dTVYUHk2YkNTVCtk?=
 =?utf-8?B?WDZTVllpdmdyTmhFaHl4MWlKRXozditGYXpmaHRFMHBUMUM2OUFxTE80aFc0?=
 =?utf-8?B?b0pjbjV3eUFhMDlMNUt2Q284Tzl0NWFqZGs2emJqbnR2aXdLMGk5ektDK09v?=
 =?utf-8?B?S05ScXR6UFFWd1JqbkNHb3ZuclBtMVNZNThqaEpNUzd0TXMvNndBZ3NWS1o3?=
 =?utf-8?B?Y1RZZ242TVlUdUExUnEyQkRIRjBXaWlUaGpTQlFXMjZPV2hkZzhyYTdjTTZC?=
 =?utf-8?B?OFZSNk5pZHlsVU44a2RuZ3RwaFkwNU9CUXVyOTByb1J2NlM5Rjh3Q29QSllK?=
 =?utf-8?B?REJZUTRYL21xOXA4cDJjaEZqNnVLejh6S3ljOStYbXJPL25aZmNGSnpJbk1Y?=
 =?utf-8?B?MnRHREs3SUpYN1dhOVFmK0xPUFUxWGFIN3VxNElucEdPMWxGN3o0bTE0eXlJ?=
 =?utf-8?B?SkJ0dDU4clJOVWErUmZQVWt4QW1zcmxQV0NIOFRsbXJTWDZ0WjNwVnlpSkpF?=
 =?utf-8?B?TURkaFROZ2VFOUc3dFNhMDY4QkdNaDhOejdxV3BCYnRNb1dpNW9ucHJGMDcr?=
 =?utf-8?B?M1djUXRPOUV6TnBjSExKK2ozSm9PeFM2MERWanRSTXozTG9iOU9ucWFaakpz?=
 =?utf-8?B?QTBPTzJ5RGdxbVVLOStFK2hjTHhyTXpFZDZZQ21IZ1pYbnFEU0hhanN3eVNT?=
 =?utf-8?B?SnQzeWMvbGlrV1cxYkNPT1k3T09vNTd6cHBacG9VNUViTzNlc25sRFRzbzk4?=
 =?utf-8?B?UTNHRXkvb2N2WnpnMGVXM3BDLzlLUElLbG1tMzNpTWNCc3FhUTNUSzNjYlhi?=
 =?utf-8?B?NmZNR3JyY1AxU0pLSVJEemVEUXBRY3Q4dFgzNWdXTVNJTU5xMnA5REJQUkZT?=
 =?utf-8?B?K09Rcm9XQU1EUzdyY3VOYUFQTFBSbTc2b284SUd4WWljTThHNHk0SnZZcVhJ?=
 =?utf-8?B?QmtlTjZ2RjNLYS9MWldEbFZqV3k5bnJGZVcxL3BUNFFuUEJjaDVENnhaRHlI?=
 =?utf-8?B?WDlmdnBzNnV3Qk5Ca0QrZVpwOEJGTkh4cFYzbE9hZnh6NVdxaCtkK1N1SHV2?=
 =?utf-8?B?ajFOaURuOGhneklNRTVkYnpYSDl5TjEwY2NseFpxRlR6Y2hIQlp0aVZIT2NR?=
 =?utf-8?B?VElpVzB2QVBuUTVpWlAyU25vNjU0KytuZEppUDFPS0YwOXVnczlSeG1maWRP?=
 =?utf-8?B?VHRWVmZvM2NaYmhwaVA5TUNmT0dlVzYwbGJ1djZnMmRmMGNXdk0yUGR6T2dX?=
 =?utf-8?B?S2VnSHQvcFBkalh6OUtMSWNhKzF6b293ckxSc0Nia1NkMmlhOFhlak5KeTV3?=
 =?utf-8?B?QTBIN0xVZ3dacmVCZWFCUUtENzQ5b1RIOGwrMEVrN3BNbnA0TE5yQzUvNzhY?=
 =?utf-8?B?SEdNWkUyQjZCYjhFblZZTEpBVFdJcUlFK3pYdFlRbWh3dkNhZmhPdndEQm5R?=
 =?utf-8?B?UHRoQXNLK2pzVUNPYkt0Qzlob0EzL3FxUTNaVkYzM0hoZHd3TG1xeVBQaXFt?=
 =?utf-8?B?SUltRS9jbndmYUJGM3I5a0E4bU5GUTBNOXV0OXFVc3Y0OTNBTEo1a2VRbHJi?=
 =?utf-8?B?NnNuMllPdHhheE1hRE92UXBrSjExMzNpbkJlTEV3VDB3SFViMkpzOE5TV2VG?=
 =?utf-8?B?NVlzcy9vTUZabzY1VUp4TS9nZXk2eWdicnRkKzNEcE5LUXBYTThtcGZod0py?=
 =?utf-8?B?L040R0R0aW9NVWJmOXAxYXIycVNyVDR4YkJaL3RDb3ovOWc5WWx1dUdoaGxx?=
 =?utf-8?B?Z005OEEyNGJkSzVlZlVZSzJRUkthKy9UUVVudXFpbjlqeWFYN20zRFVlTnlp?=
 =?utf-8?B?dXM5cXpKNG4veFFpYmlTY24wOVlTd1NDRjBkODIyNmJvTUJWUHBVcDl6UVMy?=
 =?utf-8?B?ZVUzaHZSNUZIWERCMkRWWmlhTjZxb1ExK3R0L2puTEhHd2dLTFJ3b282RkhK?=
 =?utf-8?B?QnloNmNBRU5XRzl4Wkh5Vkt2U1VxVituNjQrcEZkd1AzMW9RMWhxQjljQ1Zu?=
 =?utf-8?B?bUhnN0p1VDBlWVE2TDM4cUdRalRHV05XalJjZ0xBaWY2UkZwNnZmOUtKZy9H?=
 =?utf-8?B?MkV3dnh5M1BrL0QzNm5XMjJoT3lBYnYzQ3RWc3FzOUJMSytwZ2cxQ0R0Wllj?=
 =?utf-8?B?VWE3dDVWeGQ3YWNaZUhmVGRJY01uQjJla1Rma3VkcWhBd0txdGdoajQ0V1VE?=
 =?utf-8?B?aTR4WTJlS0l6Wk1GWWxucm53UVo5djE1WnRQZWcySzZXUkErb3cwVk1vMk5M?=
 =?utf-8?B?YmxBN3JCRnF1MU85SjBHVHFhZWdCb1lzUm5Wam5HS3NreFIyeWpJNTVzalVP?=
 =?utf-8?B?OGVtcVFyajBqWWgycWZMdmtvQlpiQndVVGJJemdlcVlNb012bVJ5Zz09?=
X-Exchange-RoutingPolicyChecked: Sg+mrBWcNq2Y2mUU3fBMNHUbVGrYP492gzhvelAgN/eZQrtnF3EZfAHGZxur9iiPbGyMYS1pYknl2enQQlbytdr5Txw+YgY+uFtj+cWudcP02oqwkq7KhQZ9nHSVC3nBhG+ZtSzvz53MHCsFSKu/m1mk6NHZ7rPqzEH2iSKUd79V2DeMmmsD6o3g1jvDXY6suh1NOFPX4JTT14YiJcRec/44fD9vkVJxMMCvuEePty5n9ic4zaaVskOLnNl3GpmXkSfAo/aR7l8czsUsa+aPAv9xWGcpBksYiKgGYztg1nydPCNpKtwOT1UWoKL5iuvYAQYo9rRI/PRzsI+PdJ+PXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3a5217-235a-4b8b-eed1-08dea02cad17
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 05:04:49.5757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJ7prOxtRnJ43o3Si2qYD/qxAUFttDomuftZpXjYd8m5BCygWGzUxgEPv9qKaGPspqajSBjYfynboKZi7KM4iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9301
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

--------------8mkI2vJbh0uSZ7t1XvjUgerZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Failures are unrelated to the patch and the skips under possible 
regression are expected due to test name change. Going ahead with Merge.

Thanks and Regards,
Karthik.B.S

On 4/21/2026 11:02 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_bw: Allow custom modes for external panels (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/164432/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/index.html
>
>
>   CI Bug Log - changes from XEIGT_8865_FULL -> XEIGTPW_15015_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15015_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15015_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15015_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     {igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p}
>     (NEW):
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html>
>         +23 other tests skip
>  *
>
>     {igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p}
>     (NEW):
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html>
>         +23 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>  *
>
>     igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8865_FULL and 
> XEIGTPW_15015_FULL:
>
>
>       New IGT tests (32)
>
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.38, 0.47] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440p:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.39, 0.48] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440p:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.38, 0.49] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.40, 0.49] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0, 0.00] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0, 0.00] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.47] s
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.50] s
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
>
>       o Statuses : 1 pass(s) 1 skip(s)
>       o Exec time: [0.04, 0.49] s
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
>
>       o Statuses : 1 pass(s) 1 skip(s)
>       o Exec time: [0.04, 0.49] s
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.06] s
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.06] s
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.07] s
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.07, 0.08] s
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.07] s
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.07] s
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.07, 0.08] s
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
>
>       o Statuses : 1 skip(s)
>       o Exec time: [0.12] s
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0, 0.08] s
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0, 0.09] s
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0, 0.08] s
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
>
>       o Statuses : 2 skip(s)
>       o Exec time: [0.0, 0.11] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_15015_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610> /
>         Intel XE#7387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#7084
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084>) +1
>         other test incomplete
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +5
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#7642
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +3
>         other tests fail
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_content_protection@uevent.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707> /
>         Intel XE#7439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x10:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321> /
>         Intel XE#7355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331> /
>         Intel XE#7227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350> /
>         Intel XE#7503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911> /
>         Intel XE#7466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#4090
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090> /
>         Intel XE#7443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020> /
>         Intel XE#7348
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#6819
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340>)
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387> /
>         Intel XE#7429
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>  *
>
>     igt@kms_psr@fbc-pr-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +7
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-lnl-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874> /
>         Intel XE#7305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>) +1
>         other test skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +2
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) +1
>         other test fail
>  *
>
>     igt@xe_eudebug@vma-ufence:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_eudebug@vma-ufence.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>)
>         +11 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +23 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +3
>         other tests skip
>  *
>
>     igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html>
>         (Intel XE#6281
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281> /
>         Intel XE#7426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html>)
>         -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457> /
>         Intel XE#7405
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405> /
>         Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-pagefault-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefault-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1
>         other test skip
>  *
>
>     igt@xe_non_msix@walker-interrupt-notification-non-msix:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_non_msix@walker-interrupt-notification-non-msix.html>
>         (Intel XE#7622
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622>)
>  *
>
>     igt@xe_pat@pat-sw-hw-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html>
>         (Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>) +4
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html>
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@xe_prime_self_import@export-vs-gem_close-race:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_prime_self_import@export-vs-gem_close-race.html>
>         (Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_prime_self_import@export-vs-gem_close-race.html>
>
>
>         Warnings
>
>   * igt@kms_hdr@brightness-with-hdr:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8865 -> IGTPW_15015
>
> IGTPW_15015: 8efb6c8621fb610ad78da61bd0cbb59a6109c2f4 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 
> 898b5aa235c5b269d6c745fd84270b296aa75469
>
--------------8mkI2vJbh0uSZ7t1XvjUgerZ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>Failures are unrelated to the patch and the skips under possible
      regression are expected due to test name change. Going ahead with
      Merge.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 4/21/2026 11:02 PM, Patchwork wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:177679272294.482719.8699409611922=
802608@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_bw: Allow custom modes for external panels
              (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/164432/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/164432/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15015/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8865_FULL -&gt;
        XEIGTPW_15015_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_15015_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15015_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15015_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>{igt@kms_bw@connected-linear-tiling-2-displays-target-3840x216=
0p}
            (NEW):</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> +23 =
other tests skip</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_bw@connected-linear-tiling-4-displays-target-2160x144=
0p}
            (NEW):</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> +23 =
other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-18=
0.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_rotation_crc@prim=
ary-x-tiled-reflect-x-180.html" moz-do-not-send=3D"true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-malloc-mlock-nomemset:</=
p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-malloc-mloc=
k-nomemset.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@xe_exec_syst=
em_allocator@many-64k-malloc-mlock-nomemset.html" moz-do-not-send=3D"true">=
INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8865_FULL and
        XEIGTPW_15015_FULL:</p>
      <h3>New IGT tests (32)</h3>
      <ul>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080=
p:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.38, 0.47] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-target-2160x1440=
p:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.39, 0.48] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-target-2560x1440=
p:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.38, 0.49] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160=
p:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.40, 0.49] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0, 0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0, 0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440=
p:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440=
p:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160=
p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.47] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.50] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
          <ul>
            <li>Statuses : 1 pass(s) 1 skip(s)</li>
            <li>Exec time: [0.04, 0.49] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
          <ul>
            <li>Statuses : 1 pass(s) 1 skip(s)</li>
            <li>Exec time: [0.04, 0.49] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.06] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.06] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.07] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.07, 0.08] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.07] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.07] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.07, 0.08] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
          <ul>
            <li>Statuses : 1 skip(s)</li>
            <li>Exec time: [0.12] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0, 0.08] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0, 0.09] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0, 0.08] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
          <ul>
            <li>Statuses : 2 skip(s)</li>
            <li>Exec time: [0.0, 0.11] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_15015_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#=
2327</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#=
1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true">Intel=
 XE#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7387" moz-do-not-send=3D"true">Intel XE#7387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-til=
ed-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">Intel XE=
#2887</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7084" moz-do-not-send=3D"=
true">Intel XE#7084</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-s=
ingle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE#=
2252</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-se=
nd=3D"true">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7374" moz-do-not-send=3D"true">Intel XE#7374</a>) +1 ot=
her test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_content_protection@dp-mst=
-type-1-suspend-resume.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send=
=3D"true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7642" moz-do-not-send=3D"true">Intel XE#7=
642</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"=
true">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3304" moz-do-not-send=3D"true">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374" moz-do-not-send=
=3D"true">Intel XE#7374</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_content_protection@uevent=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6707" moz-do-not-send=3D"true">Intel XE#6707<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439" =
moz-do-not-send=3D"true">Intel XE#7439</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x10:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_cursor_crc@cursor-random-=
32x10.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel XE#=
2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true"=
>Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7355" moz-do-not-send=3D"true">Intel XE#7355</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4331" moz-do-not-send=3D"true">Intel=
 XE#4331</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7227" moz-do-not-send=3D"true">Intel XE#7227</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-d=
ownscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" =
moz-do-not-send=3D"true">Intel XE#7178</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7351" moz-do-not-send=3D"true">Intel XE#73=
51</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=
=3D"true">Intel XE#2311</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-=
send=3D"true">Intel XE#4141</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-argb161616f-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-se=
nd=3D"true">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7356" moz-do-not-send=3D"true">Intel XE#7356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"tr=
ue">Intel XE#2313</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2350" moz-do-not-send=3D"true">Inte=
l XE#2350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7503" moz-do-not-send=3D"true">Intel XE#7503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6911" moz-do-not-send=3D"true=
">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7466" moz-do-not-send=3D"true">Intel XE#7466</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4090" moz-do-not-send=3D"=
true">Intel XE#4090</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7443" moz-do-not-send=3D"true">Intel XE#7443</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-cc-modifier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-se=
nd=3D"true">Intel XE#7283</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE#5020</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348" m=
oz-do-not-send=3D"true">Intel XE#7348</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-5@pipe-c.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-se=
nd=3D"true">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6886" moz-do-not-send=3D"true">Intel XE#6886</a>) +4 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-fac=
tor-0-25@pipe-d:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-factor-0-25@pipe-d.html" moz-do-not-send=3D"true">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-=
2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pi=
pe-d.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6819" moz-do-not-send=3D"true">Intel XE#6819</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@kms_pm_backlight@fade-with-dp=
ms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7376" moz-do-not-send=3D"true">Intel XE#737=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
 moz-do-not-send=3D"true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15015/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734=
0" moz-do-not-send=3D"true">Intel XE#7340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-full=
y-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do=
-not-send=3D"true">Intel XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb88=
88.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2387" moz-do-not-send=3D"true">Intel XE#238=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429=
" moz-do-not-send=3D"true">Intel XE#7429</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-f=
lip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0" moz-do-not-send=3D"true">Intel XE#2850</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-lnl-7/igt@kms_rotation_crc@multiplane-rotation-cropping=
-top.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-lnl-1/igt@kms_rotation_crc@m=
ultiplane-rotation-cropping-top.html" moz-do-not-send=3D"true">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-n=
ot-send=3D"true">Intel XE#1874</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7305" moz-do-not-send=3D"true">Intel XE#7305</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send=3D"true=
">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7342" moz-do-not-send=3D"true">Intel XE#7342</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_setmode@basic-clone-singl=
e-crtc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel XE=
#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-se=
nd=3D"true">Intel XE#6503</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel X=
E#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5848" moz-do-not-send=3D"true">Intel XE#5848</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@kms_vrr@flip-suspend.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp=
-1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-lnl-4/igt@kms_vrr@seamless-rr-=
switch-virtual@pipe-a-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142" moz-do-not-s=
end=3D"true">Intel XE#2142</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@vma-ufence:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_eudebug@vma-ufence.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7636" moz-do-not-send=3D"true">Intel XE#7636</a>) +9 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-inval=
idate-race:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate-race.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" =
moz-do-not-send=3D"true">Intel XE#2322</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7372" moz-do-not-send=3D"true">Intel XE#73=
72</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-pre=
fetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-prefetch.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-d=
o-not-send=3D"true">Intel XE#7136</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority=
:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-priority.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not=
-send=3D"true">Intel XE#6874</a>) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind=
:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not=
-send=3D"true">Intel XE#7138</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queu=
e_add:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281" moz-d=
o-not-send=3D"true">Intel XE#6281</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7426" moz-do-not-send=3D"true">Intel XE#7426</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
865/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-b=
mg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_886=
5/shard-bmg-10/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bm=
g-10/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_lo=
ad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"=
true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_88=
65/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bm=
g-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_=
module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15015/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15015/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"=
true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15015/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/sh=
ard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shar=
d-bmg-10/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-8/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15015/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15015/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1501=
5/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-=
bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-10/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_module_load@load.html" mo=
z-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15015/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405" moz-do-not-send=
=3D"true">Intel XE#7405</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7725" moz-do-not-send=3D"true">Intel XE#7725</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_multigpu_svm@mgpu-pagefaul=
t-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send=3D"true">Intel X=
E#6964</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@xe_non_msix@walker-interrupt-=
notification-non-msix.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7622" moz-do-not-send=3D=
"true">Intel XE#7622</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-sw-hw-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-2/igt@xe_pat@pat-sw-hw-suspend.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7590" moz-do-not-send=3D"true">Intel XE#7590</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"tru=
e">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7417" moz-do-not-send=3D"true">Intel XE#7417</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Int=
el XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15015/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeo=
ut.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-not-send=3D"true">Intel =
XE#5545</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7308" moz-do-not-send=3D"true">Intel XE#7308</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-6/igt@=
kms_hdmi_inject@inject-audio.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-6/igt@kms_hdr@invalid-hdr.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-7/igt@kms_hdr@i=
nvalid-hdr.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_prime_self_import@export-vs-gem_close-race:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-6/igt@xe_prime_self_import@export-vs-gem_close-race=
.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7725" moz-do-not-send=3D"true">Intel XE=
#7725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15015/shard-bmg-1/igt@xe_prime_self_import@export-vs-gem_close-race.html" =
moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_hdr@brightness-with-hdr:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8865/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15015/shard-bmg-5/igt@k=
ms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-se=
nd=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8865 -&gt; IGTPW_15015</li>
      </ul>
      <p>IGTPW_15015: 8efb6c8621fb610ad78da61bd0cbb59a6109c2f4 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469:
        898b5aa235c5b269d6c745fd84270b296aa75469</p>
    </blockquote>
  </body>
</html>

--------------8mkI2vJbh0uSZ7t1XvjUgerZ--
