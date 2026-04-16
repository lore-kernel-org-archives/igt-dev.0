Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17447F8D775
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B4610E1A4;
	Thu, 16 Apr 2026 19:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1zjOamB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B19310E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776369278; x=1807905278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I4kMIwzljLpjTXxaCl2364/wMov//iIbc0ZXqZ04eqw=;
 b=b1zjOamBWk78cmvTygBFuGTcbId2MgTuEoJG/MjVqg5SN/orE7Z2mroO
 hrX7tqn50m+nRc14bNYAsKuyb9A+Z+ormtydFPSzB/6AJLsMbRgKk8Z0U
 rZ4XHT7peHPHky4ZiFLXZU79wnyVql5WFUF52NIpHr3kgQwIkIKI/9GLv
 ojI4+O1+FwtI9WrYEnuYAJ3B8FddWiwgYFl2sOs6rSNIMNR2o6HQ6XpCC
 2y9BBUctVw6p60u+Q4bXJL/XWMQmtOx2UlA2gWZkuu2RUrAYNJopUDe2v
 FKtUISdNhgl1rgJSFNH8Xc+UkZwgfpAX6ZfbHgrfg13qsgix0RhQIkqdR A==;
X-CSE-ConnectionGUID: 5e31IUR5QGi3P9EO90OHXA==
X-CSE-MsgGUID: P3OhLSruQPOjvd4ePfONDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="64922416"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="64922416"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:54:38 -0700
X-CSE-ConnectionGUID: R3kNeB6wQM6WhmMfnsBXaw==
X-CSE-MsgGUID: R0OEep1SR7K507SgUwN7oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="228162046"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:54:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:54:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:54:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMm3MxWBRH6FKvSBAGUHJ0IBRUZCch69QGppRWcJEm7GxwM/6nEKXM5DM8nNxKczF7GXGqLKkfNxNX94EhskrV98dGJpH0Glpj3lGVvtQFHlHNnIbi1eGfePDRp44/Zfn9Qjn5fHEHu3qkeWBt4lKw5KlBja9APiSaQsAkPHRCIv8UhuZQJmDYn+MpoyOpLX4c2JtyvCBsgxC1sOJh391vH43oJOTASGzsmysUk1zr18vgw6aeq1cvS7N+vbYYxOlArGjmkEumH4201fi6bh0hb6Wp/RMXMlf0iqtKuqTEN/HF1lwgZapjNqE9OHYW7jdWmlmzw3Dzjcz6BizAvLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsUy31euejw8PJUQqDgxe1eaHmBvz4iu+fsjNBb+bII=;
 b=UEVc2R7sxcE2dXb3GQdUbJcujn7vpuO4XwPHcn9xLhpt2uJ8KVpobuR3DjucGbAZOsFZLkAkNHc0+7p1lE7ySSyXcVJJ7P4z/vS84fRum4qwWfsXrJ+p1AhFSMGNhD0q2VQHeURdkVG5tK0GWlRgxwniZjmrK61zhJVvlTrXQ6IGonwa3cgFAvFRL7TWWGn3zXRUtREa0rUP68HVXcf5/pt4EziQMkH2qFLIxpzcUhi9kldbLG1u7WC+8qajnM6+QwADBWm5HQZR/rvllsFSISb5YuCWo6cXYHiaW5n8qmFK3Vm4gMWGkqFJviJX9JztqM4TjIwWH75Jmi3SbaEfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 19:54:24 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 19:54:24 +0000
Message-ID: <1f1014ab-4713-4fc5-9af9-4487f344f8b2@intel.com>
Date: Fri, 17 Apr 2026 01:24:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/kms_sharpness_filter: Find mode
 with lowest bw requirement for test
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
 <20260416155421.2000-5-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260416155421.2000-5-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::17) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: dece6abb-afbe-4e89-fed0-08de9bf1f570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Z591sV8GZ1se0Q20b2ufrH+yimmRZsTn1Yu0x7Xtm2QyLSaNhCGv83m7/uBAV+R2U57PqDlnz4vGUC08a4dvb23q2qY34KfcmzaQ0VCPndUYwM6nBG1V5xv3uNhJaNW90k+8lqk/hsZjoRud3qXEliaGJRMAWro1fAP+k0uz3xX7M0MEqVWph8yeOdeT2zUeDQcvwSQiKzNDgg84yIM7l2L5QZaSRMWqLnGSPPbdAH2kkxTfFxt9wL22ej56d1YtjGfKmCiqfxVsxEtqfVcNtWoyJNg7JAyto/LC8A0hzROHLmP601YQ1JRzmBgJLDS228AHovGi2TGopOAajKkb58wkl4rqYswaqcKa0K+BZ0DuTUDUXyPoLVvTtkqBRIy5mwMrBEsw74yNjTAac3pafWu339dDaZW+WAN8YWDtkiofYMFSYL9YmMVuLDHeny4ajkP7SuPRb5ARnIlddfyaCnkDaJl4uIfqs8suZfeTO5cVmAs4qxx7H9wTta4rsRoNKq8pvlJ+FjUVkPxbhePgTQH022HZxaof8tWbRoFOlvfKjFFqb5scaoJc0Lv+pF6oRJ6DGNFAz2cuNUY67TFj9pFYTGE17hCQaxQCopPIX7ULs/Isc1ObV1/9fqq+IywArZmmT2k2lLwstObrRqTiOuwyU33aIZHnvj1La9vXiV3W+AehRjF6LVtBz2toJYoNjm9LIJmlp6K3ATeDjKHSiMQ8ZNhtlk0O1USyhPlg3JE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elBHSGpNL1pHRWw4RVg3c1NEa1NwU0xtdndsQnZoemZacE1NVjd1VmxTcGNN?=
 =?utf-8?B?K2pKVGJWRWZIbUViZU9VdE5OZXcyZEMzUUIxSUNiRGJoM05VQVFiSC9sYzBB?=
 =?utf-8?B?S1d6YXJqQnZLbVlqTDlPdFVpd2FpQkRyWUh4dTIrbzZWQS8vSUJQK21QTnd0?=
 =?utf-8?B?YnJOY0dReXUvT3NyaFZXeExXSkpXS25PVEs1SS9CWFMyVWVOUnYrMisrTkJY?=
 =?utf-8?B?cC9zUE1LNUpNVlUxMUp2bGVDaUs2V2hiUUxnenE0aHhHWFllYVpROHg2WEdF?=
 =?utf-8?B?YzViZEJkdS9kOWRtRXBmcGk1YStTbnJtWWFXV1RhRFJacmtwUTNaTkorem1G?=
 =?utf-8?B?S0RyU2NIV1dqQU04OXJxRVJXK1hFdGovYXV1eFcrMTFlR3k3T2FLVGdIbExo?=
 =?utf-8?B?ZVZiVEdvZ2Z4VG0yNVZtZmtRam5VNlQyT1VxMGlteDJlT3lPU2RadnVYUmE1?=
 =?utf-8?B?WVlIUEg4dGNZd3h6a0lVcXRJcUtCME55djBURUZYSzNIS21uZXlUQXFidWl0?=
 =?utf-8?B?MlBpNndRb1MvWkkySEJQSjhMdmQyWllwRy85WTJ4NHVVU3BpYkpJUnIybloy?=
 =?utf-8?B?NWtCaDhwOEovYzFmT3ptRC9jQzJBVlZUOVVSaVQvMFg3WW5wQ0grQkxYUXJj?=
 =?utf-8?B?OFBlVm1jUWo4elpDbmN3QlI2K1loMEt0SWs3T1I1c29pZ0dLTDkzNzRIcExZ?=
 =?utf-8?B?a0g3Z2tyZHNvczJWVU5XWG56S0VqV0lRUXQxTW93MTVjd2sxcWhUL1NPLzky?=
 =?utf-8?B?bGZLUS9aQVlGaytDWlVGSUFTK3lhclBoYm5tTUM1b2IyU2QrS2pSOHk4L3FX?=
 =?utf-8?B?VjlVQ2xOSXluZ0tRQ1l3bzlJS01vR0krWGtMWmtHS2FJUlhKSWl0b25mWEJy?=
 =?utf-8?B?cHd1ZlZrUHRsNWhTckVlVzBXNk5tNzhxanVZN3NhSG96WmRMNDBpU0w3TE5U?=
 =?utf-8?B?SXg4eHlDNDNFSVVINVpDWnMvKzVGVmpURXJMWXF0THA1eDRydjBuWE9UdWVl?=
 =?utf-8?B?eVJ6Zm5PLzlMdTNrSEEyVllBR0Nwb2FnaG1CeTM1V2tpNWE3TzdlUkhIRDFv?=
 =?utf-8?B?VlkvUGhGSTNuemZuNGZYbXhkYUZpWXJEcUlENmNRMzBvQzNJRHdqZDRiYzU5?=
 =?utf-8?B?MTd6aVIzZGhYbnppdG5uVTllKzNGQk9kd090QTA3a0F6dHgvdXpXc2hNZVFY?=
 =?utf-8?B?RDBCNGErQWtSRmpHZS9teENRRGFXMmsvRGVHVEdVeE02eHJUdGllOUsvblhx?=
 =?utf-8?B?VjYyU01EU2MvVFZIUlFRNExCQVl1dWRYcnNaSm5rSnVPZWFnNUt0bTNOelhT?=
 =?utf-8?B?Y0pQZmc3NGZBSFFOTytpdHlHOWhvS3JEVkxXNGo1Ym90RHIzTVFTaU4rMnQz?=
 =?utf-8?B?YzB2ZXhVYnRobHhqOVlWV3QvbnJpLzduTFRxaTZibDdkR3VNNUJDYWkvejl4?=
 =?utf-8?B?SWtJbTBXb2h5RHg0VlRBdFAzYTYvMTZLUE5JaWlwbU5CdVZoWWZqTTd5UTk3?=
 =?utf-8?B?Rk4rQ2hINUd2VHdRb0pMd01tcm01ZElSb1dVV3Q3UUMxNUV0NE5rNEhqbTV5?=
 =?utf-8?B?cVlzaHRFdkRUYkQxOEw5VXplcnFrZ3VINUhuNFZINmVCYVFtNS9RNmlpRXV0?=
 =?utf-8?B?NUw4QUoxczNuTEYvMVJvZ21MMEp1TFlzVzlDclNyMlBoVFh0U3hpeVh1VG9B?=
 =?utf-8?B?RnNnZ0JOVWJqakE3RTBIeDl3d0xPYU5IZDlwVnpRMU10cjhhWWZaUGI4S1RR?=
 =?utf-8?B?SWc3bHRIR29vYUhVYVhoOVhHQnRIdlhIRXo3Uy9rbC81RFNXZFIxZ3l1OWxZ?=
 =?utf-8?B?dUhGRURKNWJCbFdKcTlIWWFMenlHZ1h5a3prRHZQWWZRZVdJdmU0V01tYVNz?=
 =?utf-8?B?dkVTL0dacWtjZ3ozWjdZcFl3VjVhalJQRjd6eFFkc1lCQmlMRmQwR01DeVpS?=
 =?utf-8?B?UXJGcWJoQU9sNi91MEVYMFprUm1kM3Z0MmZ0ajFQb3hIMkY4UTRRbkJQQmZB?=
 =?utf-8?B?a1hQODdGS3FtYzdicUZPTkdJaWg3K2NLZ3EwQUdlNlN4bmRzMko0NUZyd3BR?=
 =?utf-8?B?M0tvcHZBUDd4bWxEWWRvRjVteGlncURzZk52QUZac3QxVlhPU0dPaFV4YmxM?=
 =?utf-8?B?eW9tOE5SZDdJelo4cWZjc043S0IvM2ZtZ2VmeE5CWDB6Y2VXMnpZSjhjcVNk?=
 =?utf-8?B?bDZ0ZUpJc2JnVVIydnAvczhxYlYzMU1DeWF3UXhoWVlKN1JQWW5GNlFaQVlF?=
 =?utf-8?B?UW1vZTg4Nnc0VEZHcVI4YTcweWFjSnBlekdxUTlucjNhUG1aNkR1dEpvOE5q?=
 =?utf-8?B?VEFhalY1MXpaRGpLNmhRRlFSTUY1K3JyMzJiTFNmZEJnejJJV1dMdz09?=
X-Exchange-RoutingPolicyChecked: OUiWvnH7BQU7vt62WzVV08eB7VoVJMvahFVcIxL13WYDB0CPJcMI0IRaMlWabN/P1x8BKpMdeVSKq9oIZnG3FsB/UXrNSxLkHtkK9RnHdYB5h7GzgSeq/YLCOFbO0EhImCXme2Ba4+v8K6dS9wQvruLcKSBmLo9lNxAnm5LLjSIvYeZx2cFb324W0Gaian/pfvkdWXhxksmNEaeCVXcid0SLHAulOYEUm2CV8U7ReemNGCimLb57YCiAV18QIxH6rsxO8orRfMkW2xpX6DHeh2l4p8zJI31ja2QtqV94dykRjN/JOEjTf+eHoqSjm5kwdRC4YxW/N3eTc7OL1LRwPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dece6abb-afbe-4e89-fed0-08de9bf1f570
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:54:24.3527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2DGcStezmnVzS8aYsO46qmbUaePhiALuCuARwKV2Vs6GyXhhLCzK6vSONgxbNeFA1loCcKxLwLMV6g/WPYx8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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


On 16-04-2026 09:24 pm, Juha-Pekka Heikkila wrote:
> choose mode from connector with lowest bandwidth requirement
> for tests to try to fit tests into bandwidth limitations
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 35 +++++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 98eb671d1..cf5b0d2c7 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -609,6 +609,24 @@ static void build_test_suffix(data_t *data, enum test_type type,
>   	}
>   }
>   
> +static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *low = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode = &connector->modes[i];
> +		int pixels = mode->hdisplay * mode->vdisplay;
> +		int low_pixels = low ? low->hdisplay * low->vdisplay : INT_MAX;
> +
> +		if (pixels < low_pixels ||
> +		    (pixels == low_pixels && mode->vrefresh < low->vrefresh))
> +			low = mode;
> +	}
> +
> +	return low;
> +}
> +
>   static void
>   run_sharpness_filter_test(data_t *data, enum test_type type)
>   {
> @@ -647,7 +665,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   					 data->mode->vdisplay,
>   					 data->mode->vrefresh);
>   			} else {
> -				data->mode = igt_output_get_mode(data->output);
> +				if (is_invalid_test(type)) {
> +					data->mode = igt_output_get_mode(data->output);
> +				} else {
> +					data->mode = find_lowest_mode(data->output);
> +					if (!data->mode) {
> +						igt_info("No mode found on output %s\n",
> +							 igt_output_name(data->output));
> +						continue;
> +					}
> +
> +					igt_info("Executing on lowest mode %dx%d@%d@%s\n",
> +						 data->mode->hdisplay,
> +						 data->mode->vdisplay,
> +						 data->mode->vrefresh,
> +						 data->output->name);
> +				}
>   			}
>   
>   			if (!has_sharpness_filter(data->crtc)) {
