Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A84CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 05:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FEE10EA47;
	Tue, 19 May 2026 05:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRlGdHId";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850710EA47
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 05:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779167677; x=1810703677;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kimEKSqLpN3+MYxpm7Vw3B5hJ6sFj2faIlC5QWCx7rA=;
 b=nRlGdHId3XI8KB9MfbAR1dcdJW2gskMb5Z928QGurlrNjOKdZyu1kD3j
 Ggtc/6ShQ5KXK+1ldRWmKJK0peQebw0S5OJ/v7UEJz4w+PZhI6AydyGMb
 rOJS6wu2KRRlc5sOsYbqN3Ba2VhmzZ3WVFLQz+bk5fJkkIG3OwcO0H4e5
 yx3urEVcSqVs3FRLtM7USRU/fWgy1DOe+SMFm6owKbluPkMOqWVa38Bz4
 tc11+779LxG9T/3AkbuZXxK+C8zVMQVGfV+qe9SgVqQIKHvrSczY9oJ1+
 Qa8YGHOVNaociyIh5mjVxs51s3VZYH7QtpNS63EhVtPd1SqLj6LSasiHm A==;
X-CSE-ConnectionGUID: 8bnne05CQhuUNgHmvk2+tg==
X-CSE-MsgGUID: UGc2Ida5RW2KhmrkJYZoRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79935111"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79935111"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:14:36 -0700
X-CSE-ConnectionGUID: 1r0ATzFgQXSAFS1aMJVkeg==
X-CSE-MsgGUID: PEKw6XMdTQeHQkcZU3DnxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="233267753"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:14:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:14:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 22:14:35 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLFjalMkp0jGq9IGWJCmAIrNf/tGcHEq6Xj/p55Fc0xzhbIJ0+WApvkYCsK9QFbLAQcfLc2aDDJ2POojAvrMGLkmNNUfhVJPjxkmoBh04DD2FzPbcCrHoyQNimgHMvZ5vviTf/u7mRC5FJfh4R+MpOVzrn3klYylynwUKZXGq0k8D0zpLwD381CITkR4jQ3OImzFc2478ns00UB9/qPPMZ/nG1KDzHlU2q2SGXXjBb/Q4ApiO7XaRA0HI7dC4/srzjv45sMwnuhWctGlUJ7/IOU7gxTIcAd9czqQkS64rjOpMPGZCAGS6oH4Ha05+P/wDo4L+oEHgnuBnqBq6T3/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4lcizaLFPi4mSryvTCAeU+XnSAR/UdnRjOEVQFxtBg=;
 b=nrGZABDvA11t3oGAqTNb+ei6/hXXGVXnaBAGNGyDpYLF5F9p89khdo80XJR+YYTwyLY2RUJqyNk1KgG8XHKB+9bWRuNblQ6XtpRVGnbHZqEFHEcL/O9Gq6QMnlQFxpEFKPtbvcSkJw4GhnZud0CUAX1d4U8L7sXcmjSk9MIB2i+cUSjblCixyGRrF1+tXUyoUH0BYnZ89gQ00zADAvH38yujSVLG2MZ7EqLuD7cTlQvgUuooQOkstSEFpBhdC4AMRXwMgfxdYNSYBsIbtJEV3FpZjvoxk4jSz+zsnyoVs1vmNho/G54C/IMsujEa26lSeqYVjC5hubJdk23+VgAnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 05:14:26 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 05:14:26 +0000
Message-ID: <76548c1b-9205-47c0-bcdd-9e197bf37371@intel.com>
Date: Tue, 19 May 2026 10:44:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260519041750.1199802-1-jeevan.b@intel.com>
 <f29a093d-4ded-4310-8c13-6d59afb4da4f@intel.com>
Content-Language: en-US
In-Reply-To: <f29a093d-4ded-4310-8c13-6d59afb4da4f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9af4e3-43d0-4acd-43a9-08deb5657f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799003|11063799003|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: cxHWh1j44lK/sv70db7JMwvCmr4J3Jo8yNZ5HNHx5WOIVOVpnwNBSgdffHPM2vzxoDwmE7BkWLjB/fpQtP17Gmam0U6OttolPmapbTmiS5oZEN5Ani2QgzttmjQyO1GCdsoixNqinUJBMgfPOz6Qlod6zazKhzkh1FJEBTx8TXLFuORpB7+Uy69yuTCTbgt4bf2zqF1zVJ41Xi/Ibuo3T/dDIxCa1EkbvFOgpyWVdjg/uRFg8+5DEt1KXcq2tQZ8G9wYebb1i0I1pmu6iCPxHK0alCzB+IZ7di8NYBDF4V57u0X3MhRRi+CJNWptuTsUKyY+EDRHTgtIApwVY0g+QDXmsVEdGLTbqBLl6IUmXl61R0bdPPBCiqOw0JZfxupMbdK3bZiPMxDHXBb2vkvJnD1AOy5J/Fjv/IV6twDRnYB754GpRKbFd2uxahDvhPu1VCjX+uZAG2NZrbmwTTQQC8ZS6bWsjn3NwEi7sgcVLf+/WUHfrIj4DDsT5Dg7/pgDWqj94OrAy/ctfNYHtcWfpRmMerG7GaJeoXGG36fRojaZXdbNQc61Y9I1mshbBRLSpZ8DdTVkdEg8Me/YyJkuyUR7f4H2VXx/2b46MtzG7GOYCDxaWc1dO/TGoQRX6b/0o6deKeVGHtFRm2Rp8kcDSvn8IenTsFAu6UBgKUuApG0HxbiSu8AVYW1Mc57iaIK6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(11063799003)(4143699003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXFLdU0rTlFlY2FPVzJneEd3dkswMGNndy94TFROK3p1VjdrNUhMN0wyNW55?=
 =?utf-8?B?Nk52ekpWRWZXS1RBNDZISWRYNUtJWXZJdTBKOG9FeUxobVJ6Z0V5alAwVGFi?=
 =?utf-8?B?VFFhcWFUSTlNc1FvK01obDlFZkZPWDg3Y01UTW53MU94WU5pcndpcm8yVERE?=
 =?utf-8?B?SXpyRzZscDJjWmlIZ0QzclBLaStuNUVWdFVNVkRxRU1xQmhwVk1hSHo1dVRX?=
 =?utf-8?B?Y0pqRThKM2tZYytrSnAvdW14ZlZ4aEY4UEExbm1leUV2SVBLV0lqRmE4ZXYr?=
 =?utf-8?B?dy9SdHd6TDZDUzljdDBIeFJJWnRrMVQvMUVJQUg0QVlPQ0xmaU0vS2ZaTCtS?=
 =?utf-8?B?aEF5ZGRzNDhnbjFNZnVaWk16MDdLRFBKU0JsQkd5dGRCaHdudVVWbm9WVU1Z?=
 =?utf-8?B?d0x4cjFhaXpsY1lyaVJpb0Q2VHpKTktpa0dYQ0tGSVcwbkw3VXllUS9NLzlX?=
 =?utf-8?B?TmF6WUNSblo5TmNQQXArZFJNM2lYUExEWi8xLzNlVEdjRVdpeVNYQlVnZ0ZW?=
 =?utf-8?B?cmtESEwyWmJIMzEwc1FBVFFJZmtDMlZkT0tsK01ITThOSExOS3RaUzJNNkVh?=
 =?utf-8?B?ZmxiYjJ3a1B0Q1ZzZXFVVlBQcGV0ckRQcHlTaWpvSW5peXQvNVFyWTRhT1o1?=
 =?utf-8?B?b3FEVDVhYTRxYTNOVUFUdDVHdFhwQjFXTDM0N0Znc29ZQjJRYTluY2J0aTlC?=
 =?utf-8?B?bHN4SDdtMi92WUhzQ29Wekw5QlQyRzExeXpyamR3RXJ5cFJXZ1UyTlZ2WlF0?=
 =?utf-8?B?NWpTanF0SnZrR0ZJSGx0RUdUYWF1WXlWNFhVcjE1eDc2NXhlUXJLTkJMOTdH?=
 =?utf-8?B?Y2d3Zlk4MWdma210c0I1ZWJlZElVQ3kvUTRqTUJZQURVcHN2ZFBXZEZQLyt3?=
 =?utf-8?B?K2FLOTRCQ0JuRjRqWG00djgxbGxYcE5HdGljaE1RV0pwQ3dqa2lhSTkyazFh?=
 =?utf-8?B?UTlCRk5oR3FhTlJNVmpCUUN1S0NWUzVDSUFFYzhiUitvdE5OYnViZERtcGJV?=
 =?utf-8?B?UDVaelR5QkdKa2EyNzN5ZXMrRjlmclZkQVIvamFnU1pUZ3VMTm9wQmJURlcr?=
 =?utf-8?B?UGt1WnIva2tFUkNNZkp3Q2xRRW52L0xrc014M3M0Q0p3ZGViQUFPVlNRMGdw?=
 =?utf-8?B?UlJqZGQxeWRocXFsVEdUTjR0b0VyYllxcDBVdXF1RmY2d3JaME90cHpEMEdF?=
 =?utf-8?B?RVhsTUIvZGdtRXVyZlcwVGJXbkFmUU5Sam9mS2J3NFJOT1JmZ25TRHpJa0J0?=
 =?utf-8?B?YlpKTFBxWm5USkw4dFBMc0t6akVpamFNQXpuLy92ZFdja2Y0cm5mNXJsZHlF?=
 =?utf-8?B?dm1OWjh2VkN2UXU3QXNOOThzMXNOWXcxSjBNNmFtS1Uyb2kyek1pODZLQlFQ?=
 =?utf-8?B?L2JybmJIajFwTW1MaTVJa1pyd2ZiWmJ3OVlha1RJcEtFN2s0QXNSdFZMUFJ0?=
 =?utf-8?B?N2JnSnFtNnphOXlJVmFmczRVWjk2VnZ6ZTZiNERRZWNyZE9jVVd4MWdCekhL?=
 =?utf-8?B?dzUyOEYvaU9yNUJ6ZGhERk40UzIweEVxSnk4T1VOTEp5d3ZBVU1kS2Evbkkw?=
 =?utf-8?B?YnBMaUI0QzduTStSaXZhZXRtRUVYcGg0NW5JRXhBV3VIK2FQN25HV3JoZWw3?=
 =?utf-8?B?eVA3QS9ydkVmZ04xNnVPRnIwT1F4Y3JCeVRqYVlwMDRJTGtwOHNDWWt5VWlW?=
 =?utf-8?B?em1SMkJpY0dNaTdGRVM2NytmcVl3T3hGUTJjWHBiVWVPYWQxS3JaZDhjbFlv?=
 =?utf-8?B?d0UvQkZHOFZld016clFQZzN4Q2NNeDRsbWlkbU5ma3lPdEdGSFFiZnFPYkF5?=
 =?utf-8?B?Vy9mbUhOYUtmRnp6UnZ1SFg1UmhhSG9pNjQ0VnRwYWxDVEoxejlWd0xMR0dh?=
 =?utf-8?B?c2FuQjN6dHNZcGZOVGVPUEJlZzdFYm1ydklZQW5WbzdtSXhjbzN6WVVWTnl6?=
 =?utf-8?B?V0FtN28yS016NWRWSWFiNjlGUGptamQzWTJiNWtTbHZRK3ZIM0crUnNnS2Vm?=
 =?utf-8?B?VzRFRGZRWHduQzQrZDZURGtmcmxuVzkwU0E3QWJOQ2ZmaHZvL25vOGMvNWZT?=
 =?utf-8?B?cjJ5UThsOGRsVlVJU3Bwb2NWUUtEYkRnZHdZTGxkaC81bzVUYzZPSEFUci9K?=
 =?utf-8?B?Q24zd3Z5clRYM0hMYmxscTU4V2NLbWs4NDVYTjkrTWtDUng2TElTYXdTbWF0?=
 =?utf-8?B?c3F4dU5PWlVxQnk4NlhMVlgxQ21wZVVjVHlib1NpcnhJSGtxQW9TTWJtQ2pa?=
 =?utf-8?B?cFlpZ3RQY1o5L1dZUnlwRjJKelRsSFlOSDNyenBqcmxuRERTdXlVQ1ZtaHBz?=
 =?utf-8?B?aFBCeVFQQkVjRW03WTF6TjZMNmo3ZVdmNSt2aW1ZSnVVeFFSWnQzSnFNSHU4?=
 =?utf-8?Q?Ea3QKNKGdK8pEuUw=3D?=
X-Exchange-RoutingPolicyChecked: Tlq/MecNCzkL/emYQFfs47epY1ttSlDviMImpvkpiZXkpjHw1W3cbyaQRROPkOoZsPIVjX1Pt0J75SgpO+b8VM/8VIETd/9FSymwX2YylHarYRVdHWxNx6IeTo9zLfy6TX01QQz7bGp1+GxdeAb111gPnik8NSylqfge41LpxQqWSBfnPK6kKWCof8FxDjTPHrUiUlydM+czv6L2mCSDDBEFhbqKrt21IXJM2dmv3MrNTsazThZuFvKXqnweIxWl1eLirdEsWfGVxR3R5M10x4ZZhqVW0+WfKVc1XVQ9bcVYD/QtHnCwbKc5FinDi+6atQ0KqW47O+1axk+8CZ7Cuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9af4e3-43d0-4acd-43a9-08deb5657f0c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:14:26.4144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9WOcAu2AArtL7F1aXE3YBSwN5F5BqI/Haome7bFZZNNBdYaXiJjkXkdag9Of4hAyPexQ9Giflo5n/kQLOLOhUtW8lnm/Fc1jgal7tI+DcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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


On 5/19/2026 10:39 AM, Nautiyal, Ankit K wrote:
>
> On 5/19/2026 9:47 AM, Jeevan B wrote:
>> eDP modes with high clock rates were being forced on HDMI 2.0 displays,
>> causing kernel to reject with EINVAL. Add clock validation to skip
>> incompatible eDP modes and fall back to supported modes.
>>
>> v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
>>      and ensure per-connector compatibility to avoid invalid modes.
>> v3: Refactor connector compatibility checks into helper for clarity.
>>
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>   tests/kms_setmode.c | 39 +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
>> index 1f2849bc2..4d4f980f6 100644
>> --- a/tests/kms_setmode.c
>> +++ b/tests/kms_setmode.c
>> @@ -79,6 +79,9 @@
>>   /* restricted pipe count */
>>   #define CRTC_RESTRICT_CNT 2
>>   +/* Clock limit for HDMI 2.0 */
>> +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
>> +
>>   static int drm_fd;
>>   static drmModeRes *drm_resources;
>>   static int filter_test_id;
>> @@ -165,6 +168,35 @@ static bool 
>> connector_supports_mode(drmModeConnector *connector,
>>       return false;
>>   }
>>   +static bool 
>> hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector *connector,
>> +                             drmModeModeInfo *mode)
>> +{
>> +    if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
>> +        connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
>> +        return false;
>> +
>> +    return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
>> +}
>> +
>> +static bool mode_compatible_with_connectors(struct crtc_config *crtc,
>> +                        drmModeModeInfo *mode)
>> +{
>> +    int k;
>
> `i` can be used as iterator here.
>
>
>> +
>> +    for (k = 0; k < crtc->connector_count; k++) {
>> +        drmModeConnector *conn = crtc->cconfs[k].connector;
>> +
>> +        /* Check HDMI 2.0 clock + per-connector compatibility */
>> +        if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
>> +            return false;
>> +
>> +        if (!connector_supports_mode(conn, mode))
>> +            return false;
>> +    }


I think I had mentioned this in earlier comment, but got missed.

We need to drop crtc_supports_mode(crtc, mode) here, otherwise it will 
try to match this mode.

This will prevent the test to use eDP modes that might not be 
enumerated in external panels but can still be supported.


Regards,

Ankit


>> +
>> +    return true;
>> +}
>> +
>>   static bool crtc_supports_mode(struct crtc_config *crtc, 
>> drmModeModeInfo *mode)
>>   {
>>       int i;
>> @@ -270,8 +302,11 @@ static void get_mode_for_crtc(struct crtc_config 
>> *crtc,
>>                   if (conn->modes[j].clock < mode->clock)
>>                       mode = &conn->modes[j];
>>               }
>> -            *mode_ret = *mode;
>> -            return;
>> +
>> +            if (mode_compatible_with_connectors(crtc, mode)) {
>> +                *mode_ret = *mode;
>> +                return;
>
>
> As mentioned by Ville and Jani, this test need to be modified to 
> handle the external vs internal mode better in long term.
>
> However to avoid noise due to test trying higher mode on HDMI, I guess 
> this should be okay for now.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
>
>> +            }
>>           }
>>       }
