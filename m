Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDA0C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 11:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A2B10E917;
	Fri, 22 Mar 2024 11:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwGLxFgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4210EF31
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711105427; x=1742641427;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RAcrhDE3uDoozua9NtUFIE/0e+hQaMxUfSDBrVvQI0E=;
 b=ZwGLxFgidRGBVeWJZ3fq8UzYZ99yDpDL97hLn0La2LbYkn8NaFMEbxeU
 Q+9sSj157XyhaavSE1le52A4ccPP5vl0GIPZmJfN4pBrG69Tx8RnjC+Af
 7G/50ZIOzgVMJEFFFFKdpM9lO77e3/uoB4tUsQqswHxCD2HoPzn1KD1qo
 YCkYQhs5bf5AipjWz/mRjodzWM+wCbvMVjIcjH8dI1sEHeOCGrIRirkEC
 FPut/1GRy+imPX7uNZV4Bx3lh3ex7tqgwzh6ZldP2foDKGh3LPNcUBM1u
 gfaMWKS/Epls1bBmkwMP6h9zuI0Xd4yd7FJOH2YcNuI3XLwP2mzRJxSGj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9099780"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9099780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 04:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14879470"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 04:03:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 04:03:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 04:03:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 04:03:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 04:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyoJ3eQR4QP9v23E6ks0xghCLlJtTC5cEdJ2GjDegVx/6lnrNGNYpBsRaGdl+/dt9ARGcsD1rLJatdqDykuRX2dn5G4MHK4OfIoxaFTDlVczZQggdzyDx5bkaESIjsfEc2uGMLun1d2X1tF7ViE+JqFdsOxhkx9/tZaXtl/QnRAgMw34IxKX7Lnei95kKBW4szzODrIOB7dzCvhJFsFwAAThQ7rvXYWQvId0Jo4ChKe4eE7aXEvk+XjU03m0fogIlmUb3lD4F34Jx3J0/lfS8dbD9gKvbo5tZABDkTpvv4CVEp/gBjbYMd7x1oJDprG+UGeUUXRPyfzhej2DVv/yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIccZSr8XIAbU/SSB6VadtO/xPiygIifp4Z/CcZN7HI=;
 b=Y+pd4BmJFvDyILzpaBBSAQp6UJxBRSwLWGO1MagxeaKJ6+6fbbUSFHB8/XsA7D7b9lSoEEeMU82OikqXoSq0hzS3F6vni9+R7avIT2aHLKR09Fi63lZCjXCbOyUoZ6XMhUR28CogD1CWHEDrBOo+WpitC0meb0sUBCuFbgHwlYWQav/XywSFZyl9nIKLLRyKn11tNWnhjHPUGY3gzKP6ija7PBDmcDOAMSGNO4evCHDjBgFRbF7ytn4xddcb8Sog/n05G6pmJMp+CW7Fu7p+9bsKw5lH2Hr6InmLpTZurDGrejBIGleWTpLUhGqaUVsTioPTMCKo0688dj1spAeBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Fri, 22 Mar
 2024 11:03:00 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 11:03:00 +0000
Message-ID: <ff4d3189-9ee2-4501-b49b-4efa9bd09da4@intel.com>
Date: Fri, 22 Mar 2024 16:32:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: Use high resolution mode for
 output format subtests
Content-Language: en-US
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240322081442.4120318-1-ankit.k.nautiyal@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240322081442.4120318-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 390aaa0b-6265-46a2-960d-08dc4a5fa325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gcEb0N2gfbBk00RkizNYx1dKSi+598N/Yge19lr1ig+7rBBUZYPT/mEkZ2KiPJr2c0bx1s1PAFfO65h0hiDnDdqCVCypdyTsueTivMXzuCJor+fv++sZNfDOoGSwD3StyCb5DUa0CvbSI6u+smtgBUrSFOFyBuZzXuN7ElTT13RBXgvGKs3cUf8DpmA7cgqNS+A0EX4YnUFm7aua3t/nn53+U6FMoiAa6Hco0M2ANPf7tyRiP6mXgbRRQvF4kGW+X+em8xoorFkrmLvNI6TPIXQERApjCXzHIKYSCHcr49hJv/qP/5DqvuB/UVVFKhUn9dEjC0SwKf1wCPn4vgTBQm6JMBIj1Km3stdphAIFT41C1PZZI/KWkHOrhHoh/B+As1Hv5g+YBCJLFaUx6kG3yczh04mJP+MvxQgVuYmulIGzw3AyggHnNiGj/Fbulk/ynH90XBOjMWHs/nlcyqgh6plzEIGXp/Iw5P/9ka/yl2ZUNh3S61B2nbrIuylPA3JYBYvTE3HUIeFWHf3snQCWwYajG9rRXQHBLabRzMfga/JhhJLX2zNaZ7UknD4693P5LLwm6V6d90rQeukiufIbp8aJkBsXxmaspsu2MgDR7NmsAl1O4AW8wSLKXzfZAR4ZTueaNf/95JUipcOpHvqX7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3QybHNYYWpjVmhBSWxOYXZpWWpHQVZyK0ZzSGpMaWV3WEtJdHA3OFMyMW1Z?=
 =?utf-8?B?V043aEZrQU9DcW9zSHIwaS95Y21OSzV1UmVJbnNhQWtPUWdTNzZuUCt4ZXF3?=
 =?utf-8?B?NVFwUnRBNnlwNjBoZVRpUFJOR0J4QlNxVk02aCtldVlXOXFWdEo1L0lFSmt1?=
 =?utf-8?B?Y2J4cExoZFVTZSsvbitDYmFERGQ3cUx0Z3ZKZk1ob2tkaDB5VHlKOHZJWE9G?=
 =?utf-8?B?ZzN5dnFUaEMvR0YxcHhVeWpxUm5ZcGErdDlJb3dDODNxNG55c3hTejJUcDJY?=
 =?utf-8?B?OFZCQk9sRldNNWJkQXhneGExeFE4WlMxQ3NUb2J1RG9qT0tUellyeklPUTlh?=
 =?utf-8?B?TStGS2JIY0F4MzI3MzlQYmE5YUYrQnYyQzBvTXNhTGVsNGt3WGNIR1ZiTjV5?=
 =?utf-8?B?OFR5VElPTXFXTER5TTY2RHNCOGZoUndRai9OS2NILzAvakJabm10dzcrbUZE?=
 =?utf-8?B?WlUzMG11V3czV2V6bjZYQ3Bpb296ZHdSZlRMY0JNWGptM2xpcDdZdkdMdmZY?=
 =?utf-8?B?Wnhia25kdzQvUjNOb0V6MFUrbit1Q1NITzcvS3g3aHovSlZhN0lKR3hTdnhW?=
 =?utf-8?B?T2I1dGFwUmNJcnhDb2FMTzFNRlVwdXBKR2piUlpiaHc1SmRiblcwai9wd1Qr?=
 =?utf-8?B?QUtNaUttMDRHZUc1ejQreXlORzRTK1IxSGhEL0ViekxzWFh6ZEFFZnMvZURB?=
 =?utf-8?B?WTl5MjdNM2RXNmhIV3RudHRqanFxdVhQUHRhTno1TkN2THdmRFNpdnExM0V3?=
 =?utf-8?B?eDFEa0ZkaXpXM2tUdUQ4WlFNQ3o3T2RlWmV5a3VFWlFXL2ZvbllJN21GdXFI?=
 =?utf-8?B?OHBqZGpTWVBGV1orUUpVaDJZdWl1OWp2ZTV0RDZPQ3cyTk9zRmlVZHJQc2ds?=
 =?utf-8?B?NkFRQWdSSTIwS3FGOVJuS0VBN0RWMFd0UmRDMm9nZUF1c3pjVjhsVlo3V0V0?=
 =?utf-8?B?bDRHUEViSTdHUHo2KzFzYXpXTkRPOTZHS09hbGVyQlZMZlFVZytTUHVOZWZx?=
 =?utf-8?B?V05SZTNOUGNVVkd3OG9iQ1lHNVlSU2duR2pvYVdPYmFvL0lPMXBiZ0EwNXpD?=
 =?utf-8?B?Z3F2a3M4N1RqbEh1S3VuWENOR2N3UVJMYi9QVDdxbnoyV3RFYm9QU2pBcmoz?=
 =?utf-8?B?eEVKZys4bk1hVHFhdW0wSFN5THYyQzhSSmJSWEttQ2cyQ1FBTUFyTC8rTVQ1?=
 =?utf-8?B?VVowMHNDcy9rS3NOd3RLdnFWN0VqMWFvQ2pneE5weHJFSWpPNlBHUW9Sbisx?=
 =?utf-8?B?THl0Y28zQ0hseGdLdG5obTNTWXdRS3VuN2ZDdzUvTXZNMGhrR1hueGQ4UTZk?=
 =?utf-8?B?RHlwZ1hKckNLT2hFTW1CTGMrWXI1NE1naTNlUlJFMFlhdFBqbGF5T0wxMDVM?=
 =?utf-8?B?TmFibDNiRXJCQ21oTWZ6QUlzSXBvbkdFeXZWSW1MQUl4NlZjLzJnN0thZGs3?=
 =?utf-8?B?MWIyaHVuVCtKUE9Qc0tzN255VzZUZ3VRcFIrcGpGQUs2UjFqRXUySGNIOU1D?=
 =?utf-8?B?dWwraUpxRHBVKzhEdmxJMVAvT3hCUkVZZ3JvZlk0T0Vnd2Iyd0NMaUNOd1hY?=
 =?utf-8?B?L1Zpa1hEZU5RK1J2ek5SWk1wZ2VSZ0loVGJBSTFQbnpoR0xucXJNSUY1WWdx?=
 =?utf-8?B?TkRkUkl1TUFBbnFzK0dKdWN3aXhTa0ZDdjlMTVBZSCtDWWRMc1lleHRndmh3?=
 =?utf-8?B?R21udU9LaW9CR0hWdVJWOUl2bEppVi9NcjU3eGswQlJBWUwxb0VyWHVRU1RV?=
 =?utf-8?B?TkEwV3lHZStERVZua1lTZVRtMlk0T0RoODFVeUM1SmtPWUV2Q0lGSnRkNmho?=
 =?utf-8?B?bTZnWnE1elBjK2Y5cU14UWlWd2xqS2xJRUkwRU81K2ZqTjlOOFZZcktiK1Rp?=
 =?utf-8?B?SUh6R2daR0s1Sy9DSExEV1RocmZCZHU3MUxIMXpZQXVKZkY0V3RLSCtlbUJX?=
 =?utf-8?B?cU45ZVlkUTVKMTYvSldKelBqemlLV0I3Z0RuaDRhYlhyaUN1eUxyMWN5c2Qy?=
 =?utf-8?B?YmR6V1Z3ekFhalFxazBDbGFHN0NmQmtxZm5aYjZFbTdCaUNYenlRd2VPdjhN?=
 =?utf-8?B?NnNkazQwMEIwYjFqSzh2VlhlV3Z1Y091V0JWZzBHMGJCREE2MnJBVmt5a0ow?=
 =?utf-8?B?eHpTK3YzMElQNXkwa0xzZWdpTllTWk5xWXpDZVkyWEZnQmh4ZjBLRzE4UUJh?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 390aaa0b-6265-46a2-960d-08dc4a5fa325
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 11:03:00.0133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ4H8qD9y5lxOB1ajQAbvvHdoQxYLjjSsh55ez6JPKiT81/r5J/NqulVePSDofgrx68VYxk1O/C89jNChN7E5UdEsaUo+RW6hzM4DXHBBuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
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


On 22-03-2024 01:44 pm, Ankit Nautiyal wrote:
> Currently, we are not using the highest resolution mode for output formats
> other than RGB. For testing other formats we force an output format, and
> try the mode from list of modes.
> Lets call get_highres_mode before using the modes, so that we try modes
> that are sorted in descending order of resolution. This is to ensure we
> try with higher resolution mode and use DSC with that mode.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/intel/kms_dsc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index b5c0fa6ab925..9b48caf762f1 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -184,10 +184,10 @@ static void update_display(data_t *data, uint32_t test_type)
>   	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
>   		    DRM_FORMAT_MOD_LINEAR));
>   
> +	mode = get_highres_mode(output);

Irrespective of the formats, this ensures to try with the highest 
possible resolution.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> +
>   	do {
> -		if (data->output_format == DSC_FORMAT_RGB)
> -			mode = get_highres_mode(output);
> -		else
> +		if (data->output_format != DSC_FORMAT_RGB && index > 0)
>   			mode = get_next_mode(output, index++);
>   
>   		if (mode == NULL)
