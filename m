Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34497C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 05:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBF010E0D1;
	Fri, 14 Aug 2026 05:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVt5MycY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF3710E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 05:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786683825; x=1818219825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WE+6SdKs5X6iXkk43r6INpkQbJxKpxuym/c3Ls8MC2A=;
 b=SVt5MycYTSz9iK0trvl1Qruqv1uXBCMGygZG6O1jz92z+eEC/zkpdWac
 39pZLEDFXsxzK/mC+VWpJscuiQlyroWGgeTyS9lzewDCpzZ06GQ+es1sf
 CjFwJrKPvisEoSHFuGC4I7M2zm4knP/bB2OhrXj3t8tJWoMSScpdVcNW2
 7gPkZACVPPZd3Nve9luJguZjHe4L97NmBsm009vTXQjK+WdJP1rnDdyya
 ArG1wMop+vvHwOrAAP8CxUcfT6LkA1nHdf7F+QaJfsH3DjGpP7xefUc1R
 4LmPS2W7WOvGthXPMp94YzTlExBa/XN0CZBivPwf4wRG3OKOg6NbbNrgb w==;
X-CSE-ConnectionGUID: oyV8reFDTySAr2T8GzNpig==
X-CSE-MsgGUID: I4VA4JtxSNuhbxsHwL9hGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87337126"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87337126"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 22:03:41 -0700
X-CSE-ConnectionGUID: 3txtVIYaQnSipyqM2PlhlQ==
X-CSE-MsgGUID: QLCIvNh7TlydFBf8JxCnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="287608776"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 22:03:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 22:03:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 22:03:38 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 22:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DClKTNny2ytsvyJYej6sNSQtVxfxMweNQ+92TRdDg3SV5VFQzd5PwoC68QlY3jFQ5wekYAjHZgJf8lUX+JT/aufBRjzYVV28i+mYyVoAcJJePTvHfs26TLvlM5EPHwBnWt182BTIvTO/ZdiLgF6LP50rwejiLMfMN/Th3ZVhcmK3dL7xydilgBmZhJvuyubCUOCVK0vuaP0NO/uwGfYtdI/+I7kM4rTbL6q4oqN9Xpc8kv5MTtj4RY1tYUNh4HgIKXJGi99Sip7eG4CLyi3JEED2PG9iJiAeXVSCxQiHobfkcKilNkSxYy1L1kA3xYsYPuUDazwF9vcYlZnW5uRhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X8Cg1cE/9tt/hTANiU2l2fVprUbF+vg8VTAArZsQWE=;
 b=f9txMDPVLT4STdVW4RJTPngnLRrq5UdToa1Z3PFJsEClVySFj0f6MHDcXj+V3Ppt1Qm/vQ+R1YPfynSPGchFWGh0dfRCTJY8yMlULRYUiWx+MHfRGlYYGVTOJHn7m7rWyAeQFhTBSBfeCoO5SCUXEkyQfLGflZi6gdnkvWT736k+BkNH4l02SSKN9GAMSQgu0tJ85KtSTHDtkL11lWc8gM/ujI8CYtE6Zr6SRR/llbDhDdy1ZP2kHWS3lvt9MVz3p8AEXzFRtmn5voE0/P0oGaPyh3rkSgGGI/YsOiiTD4HWrPX0CvTXWXfP/NjuPNHmjqnGxSjlXh07hhAiR6jYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 05:03:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 05:03:36 +0000
Message-ID: <cf4f5b6c-c51d-47be-a9a7-d697800ea415@intel.com>
Date: Fri, 14 Aug 2026 10:33:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_joiner: vblank test for joiner
 secondary crtc
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
CC: <swati2.sharma@intel.com>
References: <20260813075409.57087-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260813075409.57087-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 5165508b-5019-4784-ca21-08def9c16536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|42112799006|376014|366016|1800799024|56012099006|11063799006|5023799004|3023799007|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: JogiemlAqWSkWRtFQABhKH8LQueaVC4xk89UfYiF9+qLdbxLm2fCGspBA8m/XO72cSuuSlKXqY1TKQNzNIo2G/gO3POb1pq0Kab8AaZXHkzjXI5wrnkSZBZQGrHEmLU5+zGe3/oby3srmITURxOuA3UDw8FLs9V8hEJ2sfTbMCkk0jxianjCFNhxRr//wikLvUOV3SlDF2DoqegvbITuKk6OTMYrGlWrDIwIAoS5XNF6D9TGFBA/jmrs1nzfHvQo02lfFUCGQow+fURM9ogKx8s4LSig+6/1AcfktTi2Qyc/xi8D3Temq8WUBTYET6sAbMdeC5Dh+b8tcgede5OyXn4fj3HsHNlwEzc7FkkCdlsr4HqMbeJj3NMJBkDm6AzUlxUpufubIJGdPXsnyUCugh5dG6X+34iEEGiDOqZHKIl1QnlZF0PrFpJY+V31X60+fZnmJwJLKaV+9QFtkD3vnwn59l+uusJEEALwPAwY9zQYpTa2GkzsW8oqmW+qXILAUJ/7hGiK37GeTKj/fbvwmBTwD/9JueotnXaF+nAvLkz5A+4CEhuTZk43ugNwEYpJExEk7iH1oIePfw703L2sUgDBvOdBatR2CPqQMRBGteYI3cyYu83mLgKZyr4rqlCnYRWeJegZhfibupEXL646NgwTpH7opdKRGqkVTSlG7h8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(42112799006)(376014)(366016)(1800799024)(56012099006)(11063799006)(5023799004)(3023799007)(6133799003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1BTUGhhOXFYMHJJbVRlOU1pUFMrN1NvSHRTREhsdW5iUUdONVBoWi8zZkVk?=
 =?utf-8?B?MFAwRy9xdy9SdS9jYzBqZHJZamcyOUVCYkZDbTExTnFqcmszU0ZDM3YxT21P?=
 =?utf-8?B?cjBONWJGUVVLQjNVdmRLOTVUTTJLNExSK2NyeVB6SmQwY3VtcmVaZUlXOHFJ?=
 =?utf-8?B?SXludGFPbWZEM1R1VFVZR25kbkJoalp0blpKNlBjWnVzQ1pzR0tiRjR0ckVy?=
 =?utf-8?B?cU5XMGlVMk1iUENaZzJ0UmF5RDhkZzBtYkpVb0lvNEI3cmtiRHdRRDM3aEp0?=
 =?utf-8?B?akVLRitmYW1WRG1Wcy9qaEhXVERVemhuM1BiS1I1TzR1ZXhzdGhKUkFaRFpU?=
 =?utf-8?B?dlhaa0UxcVVCKzJQUFc3Qk90bFlqMXZsYVp2R0xCaDBoNnIyY3A2MTFkWVZv?=
 =?utf-8?B?SkFTOWNiVE0rWXl3OFFUV3hxbXd2TUpwcVNCUWRuT3VjanI3Ujk4eXB3MVIz?=
 =?utf-8?B?VEYvbTdqVFI0QmFpSUwxcUVybTNCOU5xQWRUWmJDY0RyNWI5RlEvUFdJKzRE?=
 =?utf-8?B?THJFdDJVaWtYdk1aNTAwTjU2TUFpWlJXSWRtbE5TVjdXZXB1dStUMXMwQm9N?=
 =?utf-8?B?eFQ2WVpLVVdaK3dHV2d0cThjblVCa3EvZXJ6NFFlYndhM0Z3WVNJaGk3Snlk?=
 =?utf-8?B?KzdySFl0dFlRM2lESm1nSmVTWFlQNVF2UUdJRjV5blRwUVZONSt5MnY5ellZ?=
 =?utf-8?B?alFiWER0YlBkMEEzR0kvdEI1TEJYOS9OU3FJR3IyWEZaKy82NEVlSjdWcm9B?=
 =?utf-8?B?Um5rbGFsN01SeTh6SURBTGpsaFBxNjhBQjV2a3RvcXdlM1k3dkpneUNlbUtM?=
 =?utf-8?B?Y01icjBCaThLdEpTdWU1TDRpbHJvSlZQeTBqQnA3d1FKN3haZDZXNkJNamxU?=
 =?utf-8?B?anU4RUR0aEJ1NTE0WFIyVStnRWl2Q2NVQTcrTHFDQStxNmQ5Uk1SUnBFMXVO?=
 =?utf-8?B?WkJPc1d1cnI4STZBakszdENsclBiWVhQWkl6Ky9CaEhFVDNSd0tPQWRaWnpY?=
 =?utf-8?B?M2hncWdpa2NsMlJLdlpFSitzL1hOZktpSkJ1WWU4UkU5U0JESTdVUTBtTE5F?=
 =?utf-8?B?QVh5OGNqMkNKU0FGVHgrckdBdWVLRVZXRlg3YTAzMjBaWGU4SENyN0VGZkZH?=
 =?utf-8?B?WGNKbVJrSmJBOGI0ZGRzb0JmS0w0aUsyaVJGUDJaT1Q5VGZNLzJGRzRWeXZa?=
 =?utf-8?B?MGpyaGhYaUd1a1BrczVYN1ZoYXR3emwwRTFCWEVQS3NvUm1oUzZhc0xoMnBw?=
 =?utf-8?B?Zjh6M0xiRmdCaVR5QkhiSlhuaXZqZmRVTkpteTBFNm5CMlpYTmVIYnR1akxs?=
 =?utf-8?B?MmhaWmlNekl4RnExMjl4aWZ6aHA0bXRuNlVBTWlNbEhrcjcwU1FMNVJGWDlD?=
 =?utf-8?B?cVZLNXR2bDNsQWljN0FGZXRjckpIaFVEN1RDRlBZb1ZPUUhjeWdJditRY1NG?=
 =?utf-8?B?bWl3ZmdET09QdUNoWitsaFNuZWkzV1JNd3YyaERjRStwMTk5UnE4angwS3Ez?=
 =?utf-8?B?aHRTWlA1SnJ2cDlqVzBrejNnU21pdUpqYW1ieGV6bmRpK2I4a0dHdDJJSmVC?=
 =?utf-8?B?Mm1aQkVGVnZsSGNzaVlaYmxrNGZQbjBPNXdvME9tajhKSHJLQmZHK2Jvajc2?=
 =?utf-8?B?YWpJNHZ4eHJReVgxV1lvTzZWZVE4dDFHMmF1OEpUdkhMcjgyTDRsRTlZL0xH?=
 =?utf-8?B?d2tGVlB4dUhjcnJGbG5NTHRkK0RuVlFNWE5RRlQ1eGFNSkR1dmpLTndwM3dz?=
 =?utf-8?B?R0RVSXBGcDFLaDlKMHpMR0VOVGtWdDJUWnhiamlWYS9mN1c4aGcyYU9HNEc5?=
 =?utf-8?B?bE1hQThKTjkwSWFJWXFDZjREVG5TcXpoOFRCZHBYcUZ5YlN6ZkFwUFVsQ1Bo?=
 =?utf-8?B?UnpMcUlPQmhlSlk0M2VveElZc0kxTWl2SWF0M1Y5L2xZaWJSNDI3KzBFQTZl?=
 =?utf-8?B?MnRsTGFwVG9FWnJDUmYraU00NVZIcCtNOHF3dzQzWFJwYzBleGlobVo0ejlH?=
 =?utf-8?B?ajBSeXZlaERMbzRlcm80L2VBd2ZHcGx0N2RQQWZTaXJtdWM1NTMwMVBrSk1P?=
 =?utf-8?B?SmVkRWVjcWhOOFdvbGkyWlRaWGJnZEtldUNWOHBDQzg4WUFRMjZjcGhsVmtx?=
 =?utf-8?B?dlVYVE9zRmRLVnFkYXZFRW8xYjQzR0ZIYk12ME16eDI4L3dpd01VUjgxdkJh?=
 =?utf-8?B?V3hEY1c0c0ZBSjRPM1VxMEdCMGNFVktERnk5cFRtckZkNTlZVUdwMkl0MU5R?=
 =?utf-8?B?MUdMZXE2V0R1R0ZyVVdKaDhlazBaN0lqall1Rmkzajc4cXZJbmMvamxEc2tE?=
 =?utf-8?B?SUFRTisxREJIMnFkSGxaeDN0Z2RGUmgwQW9hU0tMYlBPU01sOENIQT09?=
X-Exchange-RoutingPolicyChecked: tO0gfGq1tpbZRwF7VBFLpVe5Y5X4zdGPGBL9ofosIkEdW3TYB8wv036wlUxJ0ITG8WOJxBNwXV1h0Us9Vt6mECsIzRjQgYiIVhH3UEBgWYjgle2T3BgZLUoyF/skbPOuSsSTekH0zb4wWcDtOGbbTcKSWk7SoFysIwILvWE7fH/AazTn6UJjK5EfA3qGZWbtH0SrIlkCcTq+GXbC4aVAIT1Gk/3JZR6iV33WL7/Om+/WGAB9vtCwNvnp+4qO+0NvCoIEHkmnR5c8ElsAznl2iUxKESh/k/lpT4p0XSIwZNWggfK/pDW3tnggryuxO7SvnSR0CniLa7DxQ7gnbFn4fA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5165508b-5019-4784-ca21-08def9c16536
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 05:03:35.9412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BX+xZVH1UKNMjIPfQFTF9B1IRhRZhouNCcZsthCMtfmEobIeatcISn4oUbj33aYTcX2f3gtcAvumxL3dmplIIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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

Hi Santhosh,

On 8/13/2026 1:24 PM, Santhosh Reddy Guddati wrote:
> In joiner mode, add new subtests to validate vblank events are delivered
> on secondary crtc.
I've an open which I've mentioned below. If that is clarified, we could 
add more details here as to why we're adding this test.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 94 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index dfcb24004..ff33256a3 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -76,6 +76,10 @@
>    * SUBTEST: basic-max-non-joiner
>    * Description: Validate basic max non-joiner modeset by selecting the max mode
>    *		supported on single pipe.
> + *
> + * SUBTEST: vblank-joiner-secondary
> + * Description: Verify that vblank interrupts are generated on all pipes in a
> + *		joiner configuration including the secondary pipe.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -275,6 +279,74 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
>   	}
>   }
>   
> +static void test_joiner_vblank(data_t *data, bool force_joiner)
> +{
> +	int i;
> +	enum pipe pipe, master_pipe;
> +	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_output_t **outputs;
> +	igt_fb_t fb;
> +	drmModeModeInfo *mode;
> +	int count;
> +	drmVBlank wait_vbl;
> +	uint32_t pipe_flag;
> +
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
> +	count = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i = 0; i < count; i++) {
> +		output = outputs[i];
> +		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
> +			igt_crtc_t *primary_crtc, *secondary_crtc;
> +			int ret;
> +
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +
> +			mode = igt_output_get_mode(output);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					      DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +			primary_crtc = igt_crtc_for_pipe(&data->display, master_pipe);
> +			secondary_crtc = igt_crtc_for_pipe(&data->display, master_pipe + 1);
> +
> +			/* Verify vblank works on the primary joiner pipe */
> +			igt_wait_for_vblank(primary_crtc);
> +			igt_info("Pipe %s (primary): vblank wait OK\n",
> +				 kmstest_pipe_name(master_pipe));
> +
> +			/* Verify vblank works on the secondary joiner pipe */
> +			pipe_flag = kmstest_get_vbl_flag(secondary_crtc->crtc_index);
> +			memset(&wait_vbl, 0, sizeof(wait_vbl));
> +
> +			wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_flag;
> +			wait_vbl.request.sequence = 1;
> +			ret = drmWaitVBlank(data->drm_fd, &wait_vbl);
> +
> +			igt_assert_f(ret == 0,
> +				     "Pipe %s (joiner secondary): vblank wait timed out - "
> +				     "no vblank interrupt delivered\n",
> +				     kmstest_pipe_name(master_pipe + 1));
> +			igt_info("Pipe %s (secondary): vblank wait OK\n",
> +				 kmstest_pipe_name(master_pipe + 1));
> +
> +			igt_plane_set_fb(primary, NULL);
> +			igt_output_set_crtc(output, NULL);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_remove_fb(data->drm_fd, &fb);

This block should be ideally in a separate function outside the dynamic 
subtest scope, as if the assert hits this will not be executed.

Other than this the test itself looks good to me structurally, but one 
open I have is if the userspace actually needs to be aware of the second 
pipe vblank sequence?

@Ankit: Could you please provide your inputs on this?

Regards,
Karthik.B.S

> +		}
> +	}
> +}
> +
>   static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
> @@ -836,6 +908,28 @@ int igt_main()
>   			test_basic_max_non_joiner(&data);
>   	}
>   
> +	igt_describe("Verify vblank interrupts arrive on joiner secondary pipes");
> +	igt_subtest_with_dynamic("vblank-joiner-secondary") {
> +		igt_require_f(data.n_pipes >= 2, "Minimum 2 pipes required\n");
> +		igt_require_f(data.big_joiner_output_count > 0 ||
> +			      data.non_big_joiner_output_count > 0,
> +			      "No big joiner or force big joiner output found\n");
> +
> +		if (data.big_joiner_output_count > 0) {
> +			igt_dynamic_f("big-joiner") {
> +				test_joiner_vblank(&data, false);
> +			}
> +		}
> +
> +		if (data.non_big_joiner_output_count > 0) {
> +			igt_dynamic_f("force-big-joiner") {
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +				test_joiner_vblank(&data, true);
> +				igt_reset_connectors();
> +			}
> +		}
> +	}
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
