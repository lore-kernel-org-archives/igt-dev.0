Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0641DC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 11:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A0110E9AC;
	Wed, 24 Jan 2024 11:58:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E310E9AC
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706097486; x=1737633486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ntQgw5IxkutFuVlOdPpCf90WoG6RRF6n73Y92HL12eI=;
 b=mZOQTVEjVU3LeIoTEulCLdJrGcSZDgjf7jUyJMlpR2XgsAHbttZifZUS
 IoS7pK9BLyGkwdVu5xLxsopttjaA7lyi3FmIdxpGRHd1v+Crz3BKF3tP3
 kPcJyetWwrVJlzgqDe2+zldrrd/5bdi632BkhxOkMhj0p5DQ1J4FIC20/
 eZpv+1xSyk/KQiRvwrcNp85YC7ChQZ6aEXRGZNS2kEvRJbxABE3uz3NsT
 3v72GVYEoC/FyeyVB+gID8MSsCU+wnUfEomOffpyXUibfVdaiFP55ued6
 pG14CReTyfCsUK+sq/H6GUBQIL54RMvfX0Q9pUm2LW/WeWUOM5bUpRrYt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20377589"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20377589"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 03:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820440958"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820440958"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 03:58:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 03:58:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 03:58:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 03:58:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 03:58:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iECae+zwH0Ng27lJGTnvhA00v0Ce7oy/TXT4S3IZODJbBTR41b3hvLp/wY84ePvQ91MmxoIXx4zk/OpWTZv1cqWFuVITzXcSxpOnpn31xeGSNjia4XfecPaKI1KP09teLeJg2QDC05d9YkXjMOXHBVMAMsGGMSdCeZC/x3AJuEkgO2CAbrlAbPBtTjnhwaAFQdu0v692LBeBdfcTY69YsSRvQPPXvJnIoP2L6/7NcYKxvWUtDr82oSXA0Zntzt3ajZrye1z8r74oDJyX/Ck4vslqRjC0B81rOivyLnBMoHQ0a/IKnIydnnPzuoPKs3J2aAbyX1Ng2f6HysTUE7GzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KglyRweVfIpni92CP/AM93s1nwt7QKlUjnIPdpfGjgI=;
 b=m4w0KwQCD+LD+k+J8Ty/O2FoeWXjdqRuyx1OTGYGgmw5ghDz+RDnqvqfeRX3ee6R6kNStj0GeYDnz80Fj4lXPy7Bdiw1NLeZVxL9UzjaTeIlv0mNOpqiztbJJvSozIepdp7/V61uwj7ucz/BMKJXCjQpQcx+N3QoC8idHXtzUBPeYEu+0HduxumG1PvKNhEW7yMduuYuDRlATH27kaZVtB3miR3+M3yC2Q2mLj6C8ZvBF7dXdyYFI0+A5iXaseSZLnMk/w0ttNodMwgmgL0OFjmZZ69AvpEvfeP8rovrsT/lUP5dsgrSou5jD3m01gCUkC6p3PT0wDvRKsgMekx6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 11:57:59 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7228.023; Wed, 24 Jan 2024
 11:57:59 +0000
Message-ID: <63ff29e1-66a3-4f30-be54-476f345a1aee@intel.com>
Date: Wed, 24 Jan 2024 17:27:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr
 mode can be enabled
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
 <20240124103410.1259607-2-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240124103410.1259607-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::11) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 172089f9-520a-47d1-f44a-08dc1cd3b5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cH4zpm3lPidjEZyAS+IkxQ0OjcdGFC6N30yrCpnsTer79cBkyZnglPBjJ99anttNtNle9vCoH7vqXCslDquGac7uW72O3sW/JrhU3c2Giq0li+H4hhfVCF/F+n5S6brOZfF/I8o9YT+/gTmtWm0ZFk9sTI0a3+ZcQC0M6easS3u6SxvrUEtIuuEsaIuznQcUtPJBuBx2h4+qjvJsR22xcrNqxqzD6Hw25PbPrFAEcM+F/YeAzqobj8dqpgiZAKiik/oLTiD9AeVbSsQpR6P2hrO/9us4bjDYXR9LuSQO0JZGUgQT9rU8GSeSZ9pnP6a4XGNp1rR7+JQ6mGvPplOIa85MYuaFVZiRCGik5xw+SK6Lt0SPIF6XRY2s5LA9SWT3fN5zT9N3Wtn5pDAB3C6AL9UEiZRvS20BczXoxWYJHGH7qgpNo0hiUwMD04SbW0oypZI/UJmg6Gomo0+ibLKVw/M4+yKUnMCthkltNCSdN3CcYmxqolDUtg8Iwhdbj7lgWtPffSNF/vthJ0a64WJvuh+V2ffA8W02+QvxAE7NloIc0gO+bHrtT2/SnutNi4BYa9Ao9/olZLqvupwG1S4HNL9S1KJ0vsWzusE42+5+kb92Y6ELx/MOd5yX7s3akXo9NwW9zF3dqbTdcrN/a3F5mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(31686004)(26005)(8676002)(4326008)(8936002)(82960400001)(66556008)(5660300002)(316002)(66946007)(86362001)(31696002)(66476007)(38100700002)(6486002)(478600001)(2906002)(107886003)(2616005)(6512007)(6506007)(41300700001)(36756003)(6666004)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjdibklZTWZVREM5eEpTcWhuWDdsNm13ZU1tTU5LT3dUbEJtazE4VGhxb05x?=
 =?utf-8?B?TGNiNHVsTm5NVDFWYnd1UHozZ3pZOHFaZVNVeDRGK2Z2cmlTNnZKbDljYUxK?=
 =?utf-8?B?bVlEa1pYS0ZIVk9wd1BHUldHNWgrY1pERzZ1MDBRYnhxOFc1TldMRlRpUk5k?=
 =?utf-8?B?QlgzZkNuK2xRK2NPcUxSMVJLQUlVNFQ2SDYrUktXV3FrdlZDbTFieXFFOFF3?=
 =?utf-8?B?dzF6QUxQL0M0Rlk4L2lvQ1FNVVI5eE5UdjdZTlV2VDdDMVFWZmczRUV0RE4r?=
 =?utf-8?B?NkhycnlkTVFKQll3dGsxRTlsbFcvTEVobnExd0p6MjM5dmdRUmJIWXVGL1lj?=
 =?utf-8?B?ei9vR0xIY0R3NEJnU2VFVVg2TmNWZmZBTzhPVWJlNUlvWkJjOU11K1VVZ05N?=
 =?utf-8?B?Mk9iZnNTN3pUME03M3IxeHlqRWhjeDV0YmV0UzB3aEY3NC9DOGJFd1VUTDR3?=
 =?utf-8?B?R3ZoWkZXeERUYjQzODV6TEV6b094dFA5UGpSWXVkUzlQcG5WU0hyOVFVSEZR?=
 =?utf-8?B?R3l0YUlrZ25nc0ZrSEhZNGJGTUJ2Q0lTbVZ6OTRneEh3S0pqQ1ViS1pzaFho?=
 =?utf-8?B?NEJiVFhuczhWaVpidiswVXJ3YkNDRDBUS3VrSmFWc0VRR2sxRllXc3ZXdDNG?=
 =?utf-8?B?eWVKdS9GTVpRUllZMlo0WHp1Y25tVzlURGR5b09PazJJQ1dSMnhsU3l1T0VO?=
 =?utf-8?B?NFVna1ZvZ0RqMjd3c3JBcDlyQ05QOGJ5K3ZndFFYcjNXSkdFVzQ4NVZFOS9k?=
 =?utf-8?B?eW5mLzA1Ynd3NnlKalNLdDMvWlNlUTMvQlNFSzhIYnRDNE83ODFsSENiU0Jt?=
 =?utf-8?B?WmNEVVBOUTFvUUFpeUNHMDNMOElvRWZ5MGo3TGxvTHVFY3M3ZTg5ZkE0d2l1?=
 =?utf-8?B?TWthSUdpMlRaM2czcEw1aTN2d0psS2Q1VG5lc3FzQ21VS1VibkwzNVJrVm5j?=
 =?utf-8?B?VGVMeXl0WHhFMllWUHVJVlpBS25BaXFLaVVTSlJFY05aS2NrSTVIeU80ajhk?=
 =?utf-8?B?UTl2YzNzUDZ2MUxwZzNibEJPZnJtbmV2OTdBZGNySmZ1Skxxak8velU3bDlt?=
 =?utf-8?B?MWFoa2VjQ0JGZDZwcTQvUmMwWkNFN29yaVNUNTZOWURQZVZiUXgzUlhVSy9y?=
 =?utf-8?B?OWo1NldVMzJPM3ZJVmJRSlU0NDY1eEF6azhCMlN3eFhxWldyb2NIb2hmWjRr?=
 =?utf-8?B?L3NHRksrWVR1c3FMWS9vZTR2MG80bTNhRVRzZkR2UzIzTkNMR0ZKRThvb094?=
 =?utf-8?B?TzdIM0dzNXhPUDdaZ25xa3BrZEIwS2V0Z2ZlMWdXS2MwR1VOaHdtQjNiblBT?=
 =?utf-8?B?eHkwYjQ5TWNuZ2UxbzNHakxJK2lsNDJnNGJXaVRWRE1Hd09vVVAreUQrMXNj?=
 =?utf-8?B?ZU8waE9pRVpGbHZPQXd4MWl1cGdZbm51U0M4NGZBaEtHTndUbEcrMG54T0lY?=
 =?utf-8?B?enYwRm12bjhGRy9kMHV1VEJac0JkekpmN1p4RXJFdXlkZ09qOEM1MWNWc0JB?=
 =?utf-8?B?c0VmbEJmTlZ0ZUVoeTFEbTVBTXRNdkdwWGZkU0dTNVhOT0VUMEhiZmFDcndx?=
 =?utf-8?B?S0xEUzY1akxvMDgxQWVtWFU2dkxyL0s0SzF4SE82dXpXd1JzNTNnbWxzeUox?=
 =?utf-8?B?cXZKRjZEOFZVVWV3anBJaTdDYnVuN2NhRE1JZWREVUw0NkdyM0FxS1JWd1BR?=
 =?utf-8?B?bHNHWS9IemhpZUdaYTVDMldRT2RKZjRqTXZnS0lMUUhqZnE5UWplZGp4My9m?=
 =?utf-8?B?QkRDVGwwYWlhaCtkNURmTEVYcHBaektNeGVjN3VZSHpPUkJ3aDhxWno1NGV6?=
 =?utf-8?B?YkthWkl6djRiWDA3WEJlVUVrQXYydWg2d1BaTDhodHJGcmx5TXJuTW5seHJN?=
 =?utf-8?B?c2ZXUS83Z0E1QmluYWNtWnJTVUtWS3FYaCtqVDhnWlJEbzAySkRvSGN5Nll6?=
 =?utf-8?B?VzQvbVNwMndDNGNWVXdoTm5xRmVpUTR1Q2U1NEFDa2RVNVRJMThMR0VGUDRO?=
 =?utf-8?B?V2MwQ2ZCOHZGMTRsNXcxU2laU3BhWkJOSTNpUUF3UGpYYnI3TXcvWFpyc1NI?=
 =?utf-8?B?VFUvbi9HazkveTB2NlM0Uy9zMldITDZZV1VISXBsYUtLRUZwMkdQMk56NG9C?=
 =?utf-8?B?Y0FYSXNQK2FTTzRaUGtOTUhqbFdMV0NGdldFejdQV293MVMwT1ZXV0oveEc4?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 172089f9-520a-47d1-f44a-08dc1cd3b5a6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 11:57:59.4455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbzi4H+jBczb/oMEj7A0A5W3FswLklmz1yh7mAPVbI5t8K3RcHfvwt73TojyGsuonYtS8kUPameo2cT0QYk/F+TMwqJro0hUF7t5/+ZFamM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
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

Hi Kunal,

On 24-01-2024 04:04 pm, Kunal Joshi wrote:
> Check if given psr mode can be enabled by reading enable_psr
> modparam
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_psr.c | 20 ++++++++++++++++++++
>   lib/igt_psr.h |  1 +
>   2 files changed, 21 insertions(+)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 663bac163..ac214fcfc 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -394,3 +394,23 @@ enum psr_mode psr_get_mode(int debugfs_fd)
>   
>   	return PSR_DISABLED;
>   }
> +
> +/**
> + * is_psr_enable_possible
> + * Check if given psr mode can be enabled by reading enable_psr
> + * modparam
> + *
> + * Returns:
> + * True if given psr mode can be enabled, false otherwise.
> + */
> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode)
> +{
> +	char *param_value;
> +	int enable_psr;
> +
> +	param_value = __igt_params_get(drm_fd, "enable_psr");
> +	igt_assert_f(param_value, "Could not read enable_psr modparam\n");

IMHO, Please don't assert here. Instead, allow the user to decide if 
modparam "enable_psr" is not available.

- Bhanu

> +	enable_psr = atoi(param_value);
> +	free(param_value);
> +	return enable_psr > mode;
> +}
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index 36711c0d4..82a4e8c5e 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -61,5 +61,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
>   
>   bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
>   void i915_psr2_sel_fetch_restore(int drm_fd);
> +bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>   
>   #endif
