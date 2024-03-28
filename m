Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FBFC54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 06:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401FF10E3B7;
	Thu, 28 Mar 2024 06:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWLuexFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA26F10E3B7
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711609170; x=1743145170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3OJIk66isFuPkrdnlHbxQpgxLTnzW5rx4BJXaC+oS+k=;
 b=ZWLuexFBkn8DtIrIC/VFA1f3O7wTvBH6BwVzLgMnjKLR8z7r5QTwDH2v
 ItBVeWs/5I/IcsbJ9VsaA38q1TWBqtKtDeVyF+neLVVK4fsLsSyQA5bXO
 9V4dQf3NeNeaK5Gb3gwfWYans0p+yLvdgHZxAvBlezX/uT0RHxXaow73z
 i82nayt3ZxC1oiwZvfGxzZAnmfGxlSt7QkpmB7cNIcIWqvPlris4mpDzl
 q6zy3jVhhTwTdy3TnEWd/Bl2De3OPf9hStm9ytPbETN2mFvMhAW6Fvdjn
 M7rqCZqSRpREBYR6Wf398bzgishkAZN0v7LmfOuvh4E5r38NmC1hcRTjG A==;
X-CSE-ConnectionGUID: PSqaS9P8Ryq0D1wkwsRdaw==
X-CSE-MsgGUID: 7PHaAl7qRb6JatqUtE5UAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6681676"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6681676"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 23:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21237770"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 23:59:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 23:59:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 23:59:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 23:59:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAfeHpo6LId8pWeH3RnQHt0V1cwu/nDrPRUtNCSFvtMOdYmiGW1c9DzfLowe3Tr02IYAhlsjc6C0V96oJG1g+eclAhcPrgwgLz7vxL6FuiX5D0yR+53Bw4HTg2Vgd2mfrE8ciz30cyMXFz/vj35b7c6QgG+QeRf4OXE4sh4wtmkqzzjRfi773ap5FeQ4gQ05UCXRNMltZXowldME3xpswg5bJvDJWGQu9C/h2ZqTBZWsgB7i5Bz5Pcarq2UwFJQSB5Kyxq/4phTtGbVHFQyvzaZ2WbDCnqtqaq/HLr953UAkiGIE33i3eF+6QHPcf4xNnC3MoW3EFZwbnRqA5iypiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s4TDlgKcsHL/8nl70/nqUg6gG/Live8urX+dYUs+3I=;
 b=IYh68LS8XXORpZXLDRDJnheHVcHM+Pk9Wm+D7qBOFc6RvIHlNxGyXYLswSpgLKCeKoISTonnlkXut/lBXfkZwpOFZqmdPeXo+kTtC1KPmx/205E51/tt7RKcYHt9qVX2N6jyaq5damjNgOL+gjEKczFt2t2uH2j/pEDecQHgTY5Fq+HMGqCC6xtGnLgdu3mv86/yQGzbtBlLCSuoxYzJWCTIipMxSsrw3/8gVuFRwC0Ju7R9MCAQQQnKI7syTLYRR4VuUiOG+qOKqVa/LI83IvCdBh/8lqMYI0EDxITtmiDgi4cII3F7Weui284D8M1aCCqFIQMP5tdHzpXYei1SwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 06:59:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 06:59:24 +0000
Message-ID: <32a8380b-ac59-4747-82f2-a2fe7a035fdb@intel.com>
Date: Thu, 28 Mar 2024 12:29:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_big_joiner: revamp bigjoiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240325165136.1265895-1-kunal1.joshi@intel.com>
 <20240325165136.1265895-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240325165136.1265895-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 9304b42e-8f5c-47bd-010b-08dc4ef49a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oJsb5+q+iMnvbAKrj9Y7K1POsIwXCqG6g74l56gN/ulY/jaV2jSQJr/qWvw3BMK1ZhsLuTh4CKMpkmqajUlCQRaPkIicRWM8kCi3fgZSYsNg8LhoUZqBuTM6gjRyepXeRXZdNIOZHFUm4rbG6zDd42NO/dXnk4KM0yUVcOO6mmRXun5N5CFMuUMtvjiCUgETsIbUBZWWJB3fnwLBWg614r3yIrqXEB6l5okTfw2wWpbIrS5njK0j4HwaoTC2Bb+4eNAO3X2C1qWP1lA94adKPxV6vJAWC7Evkm5Vd2gz0pbQjeBcQfZc5y027rdTtxNJvlOSBtN0EKkGwyGrHj8nAA8wOH+WFzQCv9KRq2MuR9cIsa1oq6Jc0eXNi81BuoSTKtEnCgesx4T4hdAVu1Mmlit5dlUBYbPXVviyDivuXQHhN1RVzxceeAYJrXHZM3K+VLJHWvChNwJ5XdEe1T6fKic+UBXH/ALpOzsBSb4nvKAVGNY71KZkSoW+ec0suMCeNm9Jc4/tO6o96Pg8Jh3X3j/i2JWmJoFdJptzIzFsFWrEHS3kvMUxkHKJOATc9VowEKCE+VDu/zJO0faEHCk3YDTiGoKExyiCC7EA4JmGMoxTPfDk8Q6l9eORp7vdKkAffOQ+kDzEXOLJUcR3SgzYsg20VdfTuvH+Q6VvUpu93o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFd0b04xbzZuaUd6Y0cxaFd6dVI3SnNKVDBRNk5kNm1lRDQ5YklsalR1aVds?=
 =?utf-8?B?QjNIZ3Y0VS9nUGNlOG9HZU1EMXZPSGEzbmpGMktnajFINjE4L0d1MTZzbkxS?=
 =?utf-8?B?SWdpOFVZZ2RqODBBZ2xBTFcvRDFZb0Y4SW81aTdoV09JYjFsV1NJWDV2dllh?=
 =?utf-8?B?U0ZWdEZ4MmswalJ5NFpLT1p6NGlxYlByaEZzTTMrYWRhb1MxTkVZTjhqckhG?=
 =?utf-8?B?bzVrRER2VWhPekFnMXdwWHdndGhUU1hjemZrQ0JqTW41ZDI2MmJYb0o3Y2tq?=
 =?utf-8?B?UERYZ3RhUmRtKzVSZ0lmeldkY0V0L0xHUlZIa2xBU0J3WHBXK3Q2SnJRV2hT?=
 =?utf-8?B?R1RYUjhSSVVVS29qeGhEVDVXR0lhakZhcXozbDQ1dG1ubzRXNmVFZ3RuallL?=
 =?utf-8?B?Ym5lSlNTR3ZjdkNQdStWcDU4R2ZYMWdmbExRVTdlS1FsSC9mUDVGWm9EVlc3?=
 =?utf-8?B?UmdQZHoxc3hyM2d6K3NMMXRLakI1NnNZR1IrcVlreVNyRFJZWE5mTk9MQ2xS?=
 =?utf-8?B?cjhHRjRwOUpqc2ZCeWtFWGh6WEhXQytFbnRHRVN4bVdKSGRnQWVkWElXdWZ6?=
 =?utf-8?B?NkJDQXlEQWdCMGJReGVZQlFRQ2J3NXJVT05hMEtGMGtJdmg0U0c1Uk4zL3Fj?=
 =?utf-8?B?OUpmV2ZTNWJwbk12WUVwMVFnVlltOERUUHpoYmZLcUlmbTliRWJFa2R0QlRO?=
 =?utf-8?B?TUtNWmtTV2JDQTlvTExWMnQ2MHVqdHQvenVXdVpBNms3Z2JLMGRDaUFkMWVs?=
 =?utf-8?B?RlhuT2dBWFZHSUdPaEdZQWtCZ2Z2MEVNWVlmN0J1c3h0WmlUT0IvUXp2TEVo?=
 =?utf-8?B?L08vMEJhT09MSDhSQmVTK3VEd0M3NXkxdmF5MnppVGxBYlJhYzRJV1NNVTNq?=
 =?utf-8?B?ZGI5ekQwbkxReEp2K3lUTTRPclExUys2eEdRbjNDOTNqUHNHS2NPQlZ2bG8r?=
 =?utf-8?B?YXBwWGdNTzlSQngrWVNuVHBqS2hUMUp5SWwwb0F2cDlLdTY2UU44WnJCdXda?=
 =?utf-8?B?Z3RGbDh1d1VrTTVySG9Jd1hSVXZvRTBTRXNSL25UTFFmc1RQWmtDUXhxN1Nr?=
 =?utf-8?B?d0xhNzBGOFQxRG1JY1hERHZISW5mb2Zxc1NpcWtFZDdxdlRsNVZ6dXo2ZWlz?=
 =?utf-8?B?ZGF4ZU9ncFU1OWx4L2RIY0lwZ1kwTVpGU09HNzdTL0lTb2tNd0lMZVNPbEor?=
 =?utf-8?B?czRtSllvUGpwQS80OFhKdTVXRy8zSVFDaWZaWmRFTmR4N21xNnRWWkp6RFVl?=
 =?utf-8?B?WlhzcWJHSFJ3ZHU1T3YrK3ZpRCtTd1NuVlVpc2k2WG54dmlFVmNzaGluK3dZ?=
 =?utf-8?B?SGYwV3cxTUQxMHUvaUFWaVlDaHVKbUxFeVVsOXhac1FmQUFhY0VHcVYvZGpE?=
 =?utf-8?B?UVlLSTRoelNQTWJzZXJVY2hFVzZDRzVDT015eDQ4d1oxSm1jaksyRVAydW41?=
 =?utf-8?B?UThnVDJ5ejM2eW1oMHIwVWtRTG5DUVVuT05ZbXJuNE1GTFQ0SG9sVnpLMDBl?=
 =?utf-8?B?djBxYWk0UTdTNTRwcVlhL1FQeVppdkU2eVFRQ1g3RnhmWWpwWjJwVDVuRW43?=
 =?utf-8?B?TVJYZ20rQ3FaMUtsemdLQlVocEVGaFJqQUg3SWdhUGhtY0h0YVBVVTlBU3lX?=
 =?utf-8?B?c1Raell6dk0xUVk1ZUw0dlBqbEZDb0NKRXhweFFnVmQyb0tPdGtKUUgxS2FX?=
 =?utf-8?B?RWY2bzNKMzZaS0swNS8yOU9reE44Z2RiaGZJMnBHeWxRYWxFeUdFZitIZTJL?=
 =?utf-8?B?Y2RoZXhsYnJsZjhGK0hvZ1Y3Tzc1Rlo5c2RLT25hVkJIcFAyeHRtdi92OTFF?=
 =?utf-8?B?Y1cySm9DRjN0YWNET1laTFBkeFovSmRlbGgrV3M2WHJNeWphUnpCN0dNRUVT?=
 =?utf-8?B?WDZDQzkvVTBHUURac3pTZmN4UTlJUUJxNGZxbjlsSVVRZVQ2ZG1JTVRtV3JR?=
 =?utf-8?B?QloxU0FkOTczR2RZemNVOXNuWTEyR3gxWStDdGFHVHNSNjBxclh5MWhEc0E1?=
 =?utf-8?B?K3QxQUhCMC9tQVpNUHZpMlpZbmJUcWNVNVRZNWR3cHVoZ3Z6M0ViSUlDQ0l2?=
 =?utf-8?B?M3h5L2F4YW5pc1Z5eXZRRHBJSjhodGZxT1N3SmpBUnZnSTRQcm9Da2hrUklu?=
 =?utf-8?B?YkhlZUZzREl1c1R6YnAxVXN1REJVZU1FNkF5eS8vZTdoMTBHUTE0dlBBc2h5?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9304b42e-8f5c-47bd-010b-08dc4ef49a4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:59:24.8579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+nSZ/vcaoo8/bIxaNsM/DrWYTdpVwnmOBAi6dy8SqU9GDuNxHyhI1uiV8LjJMeEXpThA9+mZ3Payxj/a7KQcB+FIo0TTu8VrVyoGECQqJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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

Seems like commit message got missed in this revision.

On 3/25/2024 10:21 PM, Kunal Joshi wrote:
> v2: Don't change license (Bhanu)
>      Print the pipe name (Bhanu)
>      Remove unwanted commit (Bhanu)
>      Move combine output logic to igt_fixture (Bhanu)
>      split revamp and force joiner (Bhanu)
>
> v3: Ignored fused pipes (Stan)
>
> v4: Ignore master pipes who doesn't have slave (Ankit)
>      Retain subtest names (Ankit)
>      Use commit instead of try_commit (Ankit)
>      Fix typo (Ankit)
>
> v5: Fix condition and remove last pipe (Ankit)
>      Remove nested if (Ankit)
>      Use pointer to output instead of id (Ankit)
>      Add missing igt_describe (Ankit)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 399 ++++++++++++++++++-----------------
>   1 file changed, 204 insertions(+), 195 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 99b1b898d..b57996212 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -44,177 +44,236 @@
>    * SUBTEST: basic
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> - * SUBTEST: 2x-modeset
> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>    */
>   
>   IGT_TEST_DESCRIPTION("Test big joiner");
>   
> -struct bigjoiner_output {
> -	uint32_t output_id;
> -	drmModeModeInfo mode;
> -};
> +#define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
>   	int drm_fd;
> -	igt_display_t display;
> -	struct igt_fb fb;
> +	int big_joiner_output_count;
> +	int non_big_joiner_output_count;
> +	int combined_output_count;
> +	int output_count;
>   	int n_pipes;
> -	enum pipe pipe1;
> -	enum pipe pipe2;
> -	struct bigjoiner_output output[2];
> +	int master_pipes;

I think uint32_t will be more appropriate for master_pipe


> +	igt_output_t *big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *combined_output[IGT_MAX_PIPES];
> +	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	igt_display_t display;
>   } data_t;
>   
>   static int max_dotclock;
>   
> -static void test_invalid_modeset(data_t *data)
> +static void set_all_master_pipes_for_platform(data_t *data)
>   {
> -	igt_output_t *output;
> -	igt_display_t *display = &data->display;
> -	int ret;
> +	enum pipe pipe;
>   
> -	igt_info("Bigjoiner test on ");
> -	for_each_connected_output(display, output){
> -		enum pipe p = output->pending_pipe;
> -		drmModeModeInfo *mode;
> -		igt_pipe_t *pipe;
> -		igt_plane_t *plane;
> -
> -		if (p == PIPE_NONE)
> -			continue;
> +	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> +		if (data->display.pipes[pipe].enabled && data->display.pipes[pipe+1].enabled) {

Nit pick: Space around '+' I think need to fix in couple of places.


> +			data->master_pipes |= BIT(pipe);
> +			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> +		}
> +	}
> +}
>   
> -		mode = igt_output_get_mode(output);
> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
> -		kmstest_dump_mode(mode);
> +static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)

let's use uint32_t for the available pipe masks.


> +{
> +	if ((data->master_pipes & available_pipe_mask) == 0)
> +		return PIPE_NONE;
>   
> -		pipe = &display->pipes[p];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	return ffs(data->master_pipes & available_pipe_mask) - 1;
> +}
>   
> -		igt_plane_set_fb(plane, &data->fb);
> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	}
> +static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, unsigned int available_pipe_mask)
> +{
> +	enum pipe master_pipe;
> +	unsigned int attempt_mask;
>   
> -	igt_assert(!igt_check_bigjoiner_support(display));
> +	attempt_mask = BIT(pipe);
> +	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (master_pipe == PIPE_NONE)
> +		return PIPE_NONE;
>   
> -	igt_display_reset(&data->display);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
> +			kmstest_pipe_name(pipe + 1), output->name);
> +	igt_output_set_pipe(output, pipe);
>   
> -	igt_assert_lt(ret, 0);
> +	return master_pipe;
>   }
>   
> -static void test_basic_modeset(data_t *data)
> +static void test_single_joiner(data_t *data, int output_count)
>   {
> +	int i;
> +	enum pipe pipe, master_pipe;
> +	unsigned int available_pipe_mask = BIT(data->n_pipes) - 1;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_output_t **outputs;
> +	igt_fb_t fb;
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output = NULL;
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
>   
> -	igt_display_reset(display);
> +	outputs = data->big_joiner_output;

This can be moved to initialization.


>   
> -	for_each_connected_output(display, output) {
> -		if (data->output[0].output_id == output->id) {
> -			bigjoiner_output = output;
> -			break;
> +	for (i = 0; i < output_count; i++) {
> +		output = outputs[i];
> +		for (pipe = 0; pipe < data->n_pipes-1; pipe++) {

Nit pick : Space around '-'


> +			igt_display_reset(&data->display);
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			mode = igt_output_get_mode(output);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb);

Formatting looks a bit off. line up argument list with tab.


> +			igt_plane_set_fb(primary, &fb);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
>   		}
>   	}
> -
> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
> -
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output, mode);
> -
> -	pipe = &display->pipes[data->pipe1];
> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
> -	igt_plane_set_fb(plane, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> -static void test_dual_display(data_t *data)
> +static void test_multi_joiner(data_t *data, int output_count)
>   {
> +	int i;
> +	unsigned int available_pipe_mask;
> +	enum pipe pipe, master_pipe;
> +	igt_output_t **outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[output_count];
> +	igt_fb_t fb[output_count];
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output[2];
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane1, *plane2;
> -	int count = 0;
> -
> -	igt_display_reset(display);
> -
> -	for_each_connected_output(display, output) {
> -		if (data->output[count].output_id == output->id) {
> -			bigjoiner_output[count] = output;
> -			count++;
> -		}
>   
> -		if (count > 1)
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = data->big_joiner_output;
> +
> +	igt_display_reset(&data->display);
> +	for (i = 0; i < output_count; i++) {
> +		output = outputs[i];
> +		for (pipe = 0; pipe < data->n_pipes; pipe++) {
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			mode = igt_output_get_mode(output);
> +			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb[i]);
Formatting: Line up argument with tab.
> +			igt_plane_set_fb(primary[i], &fb[i]);
> +
> +			available_pipe_mask &= ~BIT(master_pipe);
> +			available_pipe_mask &= ~BIT(master_pipe + 1);
>   			break;
> +		}
>   	}
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	for (i = 0; i < output_count; i++) {
> +		igt_plane_set_fb(primary[i], NULL);
> +		igt_remove_fb(data->drm_fd, &fb[i]);
> +	}
> +}
>   
> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
> -
> -	/* Set up first big joiner output on Pipe A*/
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output[0], mode);
> +static void test_invalid_modeset_two_joiner(data_t *data,
> +					    bool combined)
> +{
> +	int i, j, ret;
> +	unsigned int available_pipe_mask;
> +	unsigned int attempt_mask;
> +	enum pipe master_pipe;
> +	igt_output_t **outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
> +	drmModeModeInfo *mode;
>   
> -	pipe = &display->pipes[data->pipe1];
> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = combined ? data->combined_output : data->big_joiner_output;
>   
> -	igt_plane_set_fb(plane1, &data->fb);
> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
> +	for (i = 0; i < data->n_pipes-1; i++) {
> +		igt_display_reset(&data->display);
> +		attempt_mask = BIT(data->pipe_seq[i]);
> +		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> -	/* Set up second big joiner output on Pipe C*/
> -	mode = &data->output[1].mode;
> -	igt_output_override_mode(bigjoiner_output[1], mode);
> +		if (master_pipe == PIPE_NONE)
> +			continue;
>   
> -	pipe = &display->pipes[data->pipe2];
> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			output = outputs[j];
> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> +			mode = igt_output_get_mode(output);
> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh,
> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
> +			igt_plane_set_fb(primary[j], &fb[j]);
> +		}
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			igt_plane_set_fb(primary[j], NULL);
> +			igt_remove_fb(data->drm_fd, &fb[j]);
> +		}
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
> +}
>   
> -	igt_plane_set_fb(plane2, &data->fb);
> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
> +static void test_big_joiner_on_last_pipe(data_t *data)
> +{
> +	int i, len, ret;
> +	igt_output_t **outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +	drmModeModeInfo *mode;
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	len = data->big_joiner_output_count;
> +	outputs = data->big_joiner_output;
>   
> -	/* Clean up */
> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
> -	igt_plane_set_fb(plane1, NULL);
> -	igt_plane_set_fb(plane2, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	for (i = 0; i < len; i++) {
> +		igt_display_reset(&data->display);
> +		output = outputs[i];
> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +		mode = igt_output_get_mode(output);
> +		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh);
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +							  DRM_FORMAT_MOD_LINEAR, &fb);
> +		igt_plane_set_fb(primary, &fb);
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
>   }
>   
>   igt_main
>   {
> -	data_t data;
> +	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
> -	int valid_output = 0, i, count = 0, j = 0;
> -	uint16_t width = 0, height = 0;
> -	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	data_t data;
>   
>   	igt_fixture {
> +		data.big_joiner_output_count = 0;
> +		data.non_big_joiner_output_count = 0;
> +		data.combined_output_count = 0;
> +		data.output_count = 0;
> +		j = 0;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
> -
>   		igt_display_require(&data.display, data.drm_fd);
> +		set_all_master_pipes_for_platform(&data);
>   		igt_require(data.display.is_atomic);
> -
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		for_each_connected_output(&data.display, output) {
> @@ -228,105 +287,55 @@ igt_main
>   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
>   			if (found) {
> -				data.output[count].output_id = output->id;
> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
> -				count++;
> -
> -				width = max(width, mode.hdisplay);
> -				height = max(height, mode.vdisplay);
> +				data.big_joiner_output[data.big_joiner_output_count++] = output;
> +				igt_output_override_mode(output, &mode);
> +			} else {
> +				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   			}
> -			valid_output++;
> +			data.output_count++;
> +		}
> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> +			data.combined_output[data.combined_output_count++] = data.big_joiner_output[0];
> +			data.combined_output[data.combined_output_count++] = data.non_big_joiner_output[0];
>   		}
> -
>   		data.n_pipes = 0;
>   		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> -			pipe_seq[j] = i;
> +			data.pipe_seq[j] = i;
>   			j++;
>   		}
> -
> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> -
> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic") {
> -		for (i = 0; i < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> -				test_basic_modeset(&data);
> -		}
> +			igt_require_f(data.big_joiner_output_count > 0,
> +				      "No bigjoiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_single_joiner(&data, data.big_joiner_output_count);
> +			if (data.big_joiner_output_count > 1)
> +				igt_dynamic_f("multi-joiner")
> +					test_multi_joiner(&data, data.big_joiner_output_count);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
>   	igt_subtest_with_dynamic("invalid-modeset") {
> -		data.pipe1 = pipe_seq[j - 1];
> -
> -		igt_display_reset(&data.display);
> -		for_each_connected_output(&data.display, output) {
> -			if (data.output[0].output_id != output->id)
> -				continue;
> -
> -			mode = data.output[0].mode;
> -			igt_output_set_pipe(output, data.pipe1);
> -			igt_output_override_mode(output, &mode);
> -
> -			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(data.pipe1),
> -				      igt_output_name(output))
> -				test_invalid_modeset(&data);
> -		}
> -
> -		if(valid_output > 1) {
> -			for (i = 0; i < data.n_pipes - 1; i++) {
> -				igt_output_t *first_output = NULL, *second_output = NULL;
> -
> -				data.pipe1 = pipe_seq[i];
> -				data.pipe2 = pipe_seq[i + 1];
> -
> -				igt_display_reset(&data.display);
> -				for_each_connected_output(&data.display, output) {
> -					if (data.output[0].output_id == output->id) {
> -						first_output = output;
> -						mode = data.output[0].mode;
> -
> -						igt_output_set_pipe(output, data.pipe1);
> -						igt_output_override_mode(output, &mode);
> -					} else if (second_output == NULL) {
> -						second_output = output;
> -						igt_output_set_pipe(output, data.pipe2);
> -
> -						break;
> -					}
> -				}
> -
> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
> -					      kmstest_pipe_name(data.pipe1),
> -					      igt_output_name(first_output),
> -					      kmstest_pipe_name(data.pipe2),
> -					      igt_output_name(second_output))
> -					test_invalid_modeset(&data);
> -			}
> -		}
> -	}
> -
> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> -	igt_subtest_with_dynamic("2x-modeset") {
> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			data.pipe2 = pipe_seq[i + 2];
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
> -				test_dual_display(&data);
> -		}
> +		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		if (data.big_joiner_output_count >= 1)
> +			igt_dynamic_f("big_joiner_on_last_pipe")
> +				test_big_joiner_on_last_pipe(&data);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("invalid_combinations")
> +				test_invalid_modeset_two_joiner(&data, false);
> +		if (data.combined_output_count)
> +			igt_dynamic_f("combined_output")

I think we need to mention here that with combined output, we are 
actually mixing bigjoiner + non bigjoiner.

Apart from the small cosmetic changes, the patch looks good to me.

Regards,

Ankit

> +				test_invalid_modeset_two_joiner(&data, true);
>   	}
>   
>   	igt_fixture {
> -		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
