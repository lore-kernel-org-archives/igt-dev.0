Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA1C88E53
	for <igt-dev@archiver.kernel.org>; Sat, 12 Sep 2026 19:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836F310E367;
	Sat, 12 Sep 2026 19:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1HfsSzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1654410E367
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Sep 2026 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789242751; x=1820778751;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=KZPWGAjv2pGF75MGF0Lx+3/9IFZGUfSgCbcXis7Obs4=;
 b=A1HfsSzJvoxtyTYiJ4JnVHAQiN8VDFh9uS1kceAfhe/zkkGjQFKLbsuL
 3z2DJPxRrPoV+X/dqFjtfqklXz+0l3J6xUOP62hfvxmUkx82N7LsxADuq
 y5l1BhHJDV5Beunic1uun2NuM2durjio1hO0v3W851FhZwc+P1tfsJNw+
 6lDL98twgJpf9V+wkDCWJfLN9ufrojnJ7fJ+pSBaMfQM3snbRjj8tKnx0
 vGsx5f7BklTd0vvVbYdlAv71tH+Lpx85Qu1XnfX2xB0jUJ1WddVKMxgLG
 AaQvlwr94+D/+IgtTAKD88QRyC8evPFQ9SQOCeqn5TAThRjNwlKVZhw5m Q==;
X-CSE-ConnectionGUID: GB3nel4UQGWKwOIvAy4k9g==
X-CSE-MsgGUID: AXRvdB2bSxKM/H+V+LKp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89433288"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; d="scan'208,217";a="89433288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2026 12:52:31 -0700
X-CSE-ConnectionGUID: mqZxiE6EQru/YLAhV1MbcQ==
X-CSE-MsgGUID: NWNiO0UnSMmNONtuzUInOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; d="scan'208,217";a="310510146"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2026 12:52:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 12 Sep 2026 12:52:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 12 Sep 2026 12:52:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 12 Sep 2026 12:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7aIFqJtgQsVEh7/v9dWb3QBjJnoYieBRQKgz4g9srs+AidMpgfMYDQAkuZd3hJMT8kpVfZ7mfUKkxhWU5hsv/5PJVunPmMUt25kUN8/hrrQ3Yc7ZUhUcDIFWJqS0/E5qkAztXoeobxHrEwcb91+b3ay0i3zB/d1s7b67qiygjMxtdu+i9Kj6Y5fWc2zIW6Y3KUUnC0ptjkPCsqlMZJhtUv9wlozmeEJOSMAGNixZdapbQOKjcmBORBkJkgOClijlQDfHW0675P68H1WyzraRl4bpQehkQx9kYZKy/PdM7aT93ifd2SfgowYUIhPhFxNmZxM+xCx7s48UQbNR5MXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+vi0dFJ8tXw9mzOsyG5yEdWgjbWa0uw7wyHJeQ0ceU=;
 b=GY/yW2fhGvELt9h0mtLH+QDdqTvWyKctRlaVpeXWSTkcHvDvpyGit38pV1C+Kf9TcbYMBOnIBZ+hvVymB/Yy+mabzQaaBX4WS1tqKTJiVd/C5z5s5mfDAL+wcFroFSzvOMQZWgN97hcNkrIi/4bNJWTvHX5GbNtLDde/F/xLFT806QsmT/KFlaVG7mbuowzx/tznEDseCWRMxXjG0YGT0lQXlIW6G/ae5B29T1gwSF+LLxDBBrUVSWyy3O4hHN/XNZnlAf8xwE3HAhwuu2V5ZKvApmWD/TR1/53NkUB0NTRpiXouKiGY48eEWW5ap4JSmwNFg0fBvfEzGelqccjzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA3PR11MB019951.namprd11.prod.outlook.com (2603:10b6:208:54a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 19:52:23 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 19:52:23 +0000
Content-Type: multipart/alternative;
 boundary="------------FoPas0nK9OBUU0OIdPa3U5aS"
Message-ID: <c24dd279-531a-4f9a-b3f1-d13bfd65fca5@intel.com>
Date: Sun, 13 Sep 2026 01:22:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/3] tests/kms_vrr: Add CMRR fixed and video mode
 subtests
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>, <karthik.b.s@intel.com>
References: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
 <20260907174836.3159214-4-ramanaidu.naladala@intel.com>
 <e7bc3094-7254-4482-a17b-de4487b1cdf4@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <e7bc3094-7254-4482-a17b-de4487b1cdf4@intel.com>
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA3PR11MB019951:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b40064-20d1-4110-5633-08df11075c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|18092099006|8096899003|3023799007|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: NGusSWkJABskiAWNxX7FmelEol05DcDl/kZd1utVmJvGxCX3D6oqzZ5w+ISonVOdzoTedOY2M+ujC5z9UQe3nzKDamaux7PxEgrxJZcjxzVfE9IjyHGxC1ovfEZJMb0iqw9ww72jz8qtFrKz5CanVeyrhEUjnNvf5y7jTFm4PZ/YduByJ9I06BNDy6ID/2VXoJ+wCXZmSsK9rnzLi2OJhCjyyQCDxuAmGs59FXAW50yDRlM7GmBLsD/2fQRA+FQTXmNM7qiu2Qf3Tmz6OZaYACHkUByt7gDcjq7ki/OzbY32fQOemP+E1qq3f2QaxU/SJ4KgInf9qXqbZddZPSPc8Ejqajmi/3nr//xZDFXPZ0g5hJp/U47tjzVkxVRO4kQ9Tp9EaIhHtrBRGFFahCey/RrGLQnAZGNuqb0/yKeGFtJH1pUOCU5Ot/16ZnLRQ8gPhNhjY0qJVsPSWR6F9kqsFWUZ7OVLPSjP6F10BTd8K/zUuhS+DnYXTuabzT+NLkmwaNayACPGZJi+eFSNnydfZ7GEQvxuIwtVxgynffzQEWjfah+y2DMmeK9OynkEoM65OY9VlgxNtcI9QBCEBAHwm3rAEBzniDYHHXoF6i2mvuu+eAk7dZgp5BhLAKwUPtXolF1/dM/FtttM2k4qw8B0WvU9/vKEGvWGx3yB1Aq8+nw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(18092099006)(8096899003)(3023799007)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2RwUDc3RHZrNzVORURkMEQ1bkthNUxyV24vdTFLV3o0bFlpUHRVdzlWSWFT?=
 =?utf-8?B?OWE3cFdJcE5yUjJTQ0h5elNpeWVkUmFGT1k5WnRyZ0RQdjVVenE1dWhLaHlP?=
 =?utf-8?B?Ly9SOEVLTmdCUWU5UFZ3ZmtEWkJ0aFUrMU5aaFNNZ29lOENCV01yZmZYYmN5?=
 =?utf-8?B?NlZyUm9GRktvVnkrWmltTUtyQ3RhUURsMWpnWHgxb0VRQ0gyQytNQ3prY1gv?=
 =?utf-8?B?a3JJMmZhT0FWRmM1SGdRUk1yeWR3M0lNc0ZoZ1Vpb3NYNS9veVNqaWdwaGln?=
 =?utf-8?B?SkFvRlF2cGlmdC8zbWtLdVI4aHAySXBBaGRyZnlEaW92T2NHdU8rU0hRMmpT?=
 =?utf-8?B?Y1ZjSE50bXVmeWJkbEIzSlFmMmJqbjlqa05JTStINzZGZDdqd3BVT0xUOHB2?=
 =?utf-8?B?SUhOak51Nm44OGRaNFN6U0N1allSWDVtOXZvd1FXcmlWYkxqdDlVQlUxSW5K?=
 =?utf-8?B?c2pJNVBON1BuaFhuemhuS3BRT3NNVjJLUHpGWHhMVmpmLzNOOFpqY0dQeW9v?=
 =?utf-8?B?UlhMSVh2WXd0N003anc1NTJNeDN2SEVZbU8rYU1PMExIYWpPMnJMR290Z1Mv?=
 =?utf-8?B?Q2xiM2JkNGpSRTJsQ1VJMHk5RDBjOWJ2KzhjYUNtS1RzVzBRZEJHM01ScVlk?=
 =?utf-8?B?NWxaZ29VR2RMOU9iY056MmM1YzRYczlwWWh3dDFGdWFNT2s2SldxekQrTXJt?=
 =?utf-8?B?bitMUS8zajRjTnJFeWt0OXpwMXJxMFdXRzBIejJDUFVyKzdMc2ZmTHpSNkRJ?=
 =?utf-8?B?SzA0ZGZRTmFocFJkMDBUWWlkb3IyK1VCRlJqWTNOcFZSaFZvN0cvWDR3bHhE?=
 =?utf-8?B?ZUtpQ3grRGc1UkI4OVJpT3orSUFOcHZjb3d3WXNhLzJoU2dPU0RCbDV0ZlY0?=
 =?utf-8?B?Q2sxVEs3OGkrZlhuMTV1WURFTG5CbE1jMWY1bllRV01LTG1OeXd1MExHM2dn?=
 =?utf-8?B?Yll4NVdzaEhYc0lsUmQ3UGFuWEs2SUtjWExkNUVqMHh6TFdtNWpYZ21UQ0pa?=
 =?utf-8?B?b1VhNjhCVmxJbkhhMC9GaGdXVUFCcllabWdvUVdUTnpDR2dyT0JVdlB1Rm5o?=
 =?utf-8?B?bkRpMFQxazg3V0dOaTJObkp6TFpOKzgwQ0hrVmVJT0RPRnJuV21Lbm1PcVJ4?=
 =?utf-8?B?K3ZJRUlKRDluUjJPR2ZJQ203ZjMzUW5wU2J1dU9xcllJaXhlQnpYWkxCb1ZR?=
 =?utf-8?B?ckdnVklyQnlKMHNkQW5LOXBMNTlUUnhkN1ZvZm9aYVRpNDFoRGdCNlRFdzhw?=
 =?utf-8?B?YUp2YVVydEtrSUdTRktHRmprOFZUTk9nSjhFZFo0dkxQNGNoZUxTRWdsQlIz?=
 =?utf-8?B?QzRMaDdHR3dubkdwbmhqRGowVW5WZjhZZTJNN0wzK1U4bDNRelBNRklvN0Jz?=
 =?utf-8?B?Z09OUStvQ1hjMGV5bTJySnl2NlZFL2ZLbTRSb2hqOFJuR3dxT2VMUEJNcGEy?=
 =?utf-8?B?UU9rbUd4TWtld05CSUNqTlphcU9WVklyVytuWmdTSXUyM1MvalkvWGZzWmc5?=
 =?utf-8?B?cTZIR1g4bXhFNVJ6bkFHUE5mZTlOTjBWZE5vR3ZKa240bUxCSXRhNEs5OW5j?=
 =?utf-8?B?QURmWkNHMVhEbDRtV1l6Q0NhTmZobjZzS1QyZXc4TWJXd3VLb1poSWtSSGdk?=
 =?utf-8?B?dTU2eUtqNXdSZ283WmNRWXdXWkhISHZBS1EwRU1pU3VlNTNzMFRwRmZPdlB4?=
 =?utf-8?B?Y0pMZDZ2NUZvY3IrenRHQmEySFVaVTkyRXdEbWI1Y2xMdFFjWSt5Y3V0QTNU?=
 =?utf-8?B?OVJpVUZhN2swT1I0QjF4L0lZZUxNRWFqbENOVmNTd2tYcklUVVBaM1ViWVBu?=
 =?utf-8?B?VTdQQS9aWHp2bFZPWDY0UXI2MjhDUC9NeWV4b3E3Q1BCa1krb3IwSDJnWjR2?=
 =?utf-8?B?eWpsUTBsNnhKUTFqVk5nR0NxYm91cW54Lzg0OG1KdTFqa3BkOWlUQ0s3VE1y?=
 =?utf-8?B?Z2k4bHk4TldDSGhHdFplSE5Xa28yaDZpNjJKaGJXdEdxclNJN3dSWVpxZ0FV?=
 =?utf-8?B?NjRuS0IyZ1hWaEFTVWoxamYzU2hFTThnLzRTVEJZTEtYZ2Jvb3AxTWxpUVRQ?=
 =?utf-8?B?YndrRUplVzNETEVyM1VHaGJkRFIwcVppRkpEUTNTcWhVV2xFb05sc0thRWNs?=
 =?utf-8?B?WXFYenJTR1lxNFM3TlY3emJHU2ZIS3dPWmE2c2Jma1ZHRGdFVkVJcnNnN2ZG?=
 =?utf-8?B?dUFvWXRPcFkvMkVKdXJ5RVNYT0pUaC92VmZ0dGtHMnBOdWd2VlptZFNrN0hQ?=
 =?utf-8?B?eU5xcXFjVmkvT1hrQkgwRlJkaE93TUFySG1aMGFRbmt3N05wSDVlTmZ4SjlR?=
 =?utf-8?B?MzUvN01jWW55WU8xWnhvZldGTTV5QkgzQXh2WitlOXlPTUk5SXdxN0pZY1BQ?=
 =?utf-8?Q?gH3wdbBKvU4O2uV4=3D?=
X-Exchange-RoutingPolicyChecked: 0sOIhN8hX7SKaYryvaUlePnOi7X6AbdeNbTAzSA6k4p37dvRcRaTKnhrI+pAhPun3nuPMLbVYKe2xGwTSR1MUm1id0buVsv4++KoREDAWeV29e67zu5hXsPKFfMGZIDTOvvv7mb3j+3h/0aO0u19ny4+E2izg7tcTbQUKlvajGo4LVWpt5VOMMWln1jMANAJGEGzzg/BVd8POa6NPMCU/Be2YANx9Y5/nEDkgyXbmL4XXhIE4eOBFRg04icvqZ+A+sGF0yjFGb+57LxMHhnHggicAsrVjq1frEwq1dW1PCUVRKbGaizyxsld2bfJKklsUMZxlfbs7Yo4YvsjLuBLUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b40064-20d1-4110-5633-08df11075c9c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 19:52:23.1966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIrKbNIvbIdU9x8ihxlPF8huX4pHURLhEOVdoxYTIxLF2q456aHgtP54zQAsJVk6ltCcCxxpipmjHcgvG9zok7RYyzW9yQ7N8Zepe83P9W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB019951
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

--------------FoPas0nK9OBUU0OIdPa3U5aS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chitanya,

On 9/10/2026 3:55 PM, Borah, Chaitanya Kumar wrote:
>
>
> On 9/7/2026 11:18 PM, Naladala Ramanaidu wrote:
>> Add test coverage to validate Content Match Refresh Rate (CMRR)
>> behavior across both fixed and video timing display modes.
>>
>> This introduces a shared helper library to support refresh-rate
>> mode selection and parsing, along with two new test cases covering
>> fixed-mode and video-mode scenarios.
>>
>> The new tests measure actual display refresh timing during CMRR
>> operation and compare it against the expected target rate to
>> verify correctness. Video mode coverage validates behavior across
>> standard video timing rates, while fixed mode coverage targets
>> display modes that fall outside the standard video timing set.
>>
>> Each test cycles through the relevant refresh configurations,
>> applying and resetting the appropriate settings between
>> measurement passes to ensure consistent and isolated test results.
>>
>> v2: Fix test issue.
>> v3: Address review comments. (Mitul)
>> v4: Fix test issue.
>> v5: Address below review comments:
>>      - Rename CMRR fixed/non-video mode references to desktop
>>        mode. (Chaitanya)
>>      - Factor out vblank timestamp/sequence retrieval into
>>        helper. (Chaitanya)
>>      - Simplify CMRR tests by extracting common mode logic. (Chaitanya,
>>        Mitul)
>>      - Refactor CMRR refresh-rate verification and frame filtering.
>> v6: Address below review comments:
>>      - Document skipped vblank intervals and fix seq_delta
>>        format. (Chaitanya)
>>      - Fix minor style issues in CMRR tests. (Chaitanya, Mitul)
>>      - Add mode existence checks for CMRR test paths. (Chaitanya)
>>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 240 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 240 insertions(+)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>> index 27f18e8d0..109b4629d 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -32,6 +32,7 @@
>>   #include "igt_pm.h"
>>   #include "igt_psr.h"
>>   #include "i915/intel_drrs.h"
>> +#include "igt_vrr.h"
>>   #include "sw_sync.h"
>>   #include <fcntl.h>
>>   #include <signal.h>
>> @@ -80,9 +81,22 @@
>>    *
>>    * SUBTEST: lobf-dc3co
>>    * Description: Test DC3CO entry during LOBF.
>> + *
>> + * SUBTEST: cmrr-desktop-mode
>> + * Description: Test to set a desktop mode CMRR target refresh rate 
>> and verify
>> + *              it is correctly applied.
>> + *
>> + * SUBTEST: cmrr-video-mode
>> + * Description: Test to set standard video timing refresh rates via 
>> CMRR
>> + *              and verify each target rate is correctly applied.
>>    */
>>     #define NSECS_PER_SEC (1000000000ull)
>> +#define CMRR_NUMERATOR 1000ULL
>> +#define CMRR_DENOMINATOR 1000ULL
>> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
>> +#define TARGET_RR_SAMP_COUNT 100
>> +#define CMRR_RR_TOLERANCE_HZ 0.02
>>     /*
>>    * Each test measurement step runs for ~5 seconds.
>> @@ -103,6 +117,14 @@ enum {
>>       TEST_LINK_OFF = 1 << 10,
>>       TEST_NEGATIVE = 1 << 11,
>>       TEST_FORCE_RR = 1 << 12,
>> +    TEST_CMRR_DESKTOP_MODE = 1 << 13,
>> +    TEST_CMRR_VIDEO_MODE = 1 << 14,
>> +};
>> +
>> +enum {
>> +    CMRR_VIDEO_MODE,
>> +    CMRR_DESKTOP_MODE,
>> +    CMRR_DISABLE,
>>   };
>>     enum {
>> @@ -221,6 +243,38 @@ output_mode_with_maxrate(igt_output_t *output, 
>> unsigned int vrr_max)
>>       return mode;
>>   }
>>   +/**
>> + * get_mode_with_video_timing:
>> + * @output: Display output containing connector mode list
>> + * @fps: Requested integer refresh rate in Hz
>> + * @matched_mode: Returned mode that matches @fps
>> + *
>> + * Find and return a connector mode that matches the requested
>> + * video timing refresh rate in Hz.
>> + *
>> + * Returns: true when a mode is found, false otherwise
>> + */
>> +
>> +static bool
>> +get_mode_with_video_timing(igt_output_t *output, uint32_t fps,
>> +               drmModeModeInfo *matched_mode)
>> +{
>> +    drmModeConnectorPtr connector;
>> +
>> +    connector = output->config.connector;
>> +    if (!connector)
>> +        return false;
>> +
>> +    for (int i = 0; i < connector->count_modes; i++) {
>> +        if (connector->modes[i].vrefresh == fps) {
>> +            *matched_mode = connector->modes[i];
>> +            return true;
>> +        }
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   static drmModeModeInfo
>>   low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>>   {
>> @@ -580,6 +634,177 @@ flip_and_measure(data_t *data, igt_output_t 
>> *output,
>>       return 0;
>>   }
>>   +/* Measure and verify the effective refresh rate against the 
>> expected CMRR target rate. */
>> +static void
>> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
>> +               double vrefresh, uint32_t cmrr_mode)
>> +{
>> +    uint64_t last_vblank_ns, vblank_ns, frame_time_ns;
>> +    uint64_t total_frame_time_ns = 0;
>> +    uint32_t last_seq, seq, seq_delta;
>> +    uint32_t err_frames = 0, valid_frames;
>> +    double avg_frame_time_ns, avg_refresh_rate;
>> +    double  expected_rr = 0;
>
> double space.
>
>> +    bool front = false;
>> +    uint32_t i;
>> +
>> +    switch (cmrr_mode) {
>> +    case CMRR_VIDEO_MODE:
>> +        expected_rr = (vrefresh * CMRR_NUMERATOR) /
>> +                  (double)CMRR_VIDEO_MODE_DENOMINATOR;
>> +        break;
>> +    case CMRR_DESKTOP_MODE:
>> +        expected_rr = (vrefresh * CMRR_NUMERATOR) /
>> +                  (double)CMRR_DENOMINATOR;
>> +        break;
>> +    case CMRR_DISABLE:
>> +        expected_rr = vrefresh;
>> +        break;
>> +    default:
>> +        igt_assert_f(0, "Invalid CMRR mode %u\n", cmrr_mode);
>> +    }
>> +
>> +    do_flip(data, &data->fb[0]);
>> +    (void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>> +    igt_wait_for_vblank_ts_seq(crtc, &last_vblank_ns, &last_seq);
>> +
>> +    for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
>> +        front = !front;
>> +
>> +        do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>> +        igt_wait_for_vblank_ts_seq(crtc, &vblank_ns, &seq);
>> +        (void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>> +
>> +        frame_time_ns = vblank_ns - last_vblank_ns;
>> +        seq_delta = seq - last_seq;
>> +
>> +        last_vblank_ns = vblank_ns;
>> +        last_seq = seq;
>> +
>> +        /*
>> +         * Use only single-frame intervals. If delta > 1, one or
>> +         * more vblanks were missed, so the interval is not valid
>> +         * for calculating the average frame time.
>> +         */
>> +        if (seq_delta != 1) {
>> +            igt_debug("vblank seq delta = %u\n", seq_delta);
>> +            err_frames++;
>> +            continue;
>> +        }
>> +
>> +        total_frame_time_ns += frame_time_ns;
>> +    }
>> +
>> +    valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
>> +
>> +    igt_assert_f(valid_frames >= 90,
>> +             "Valid frames below threshold (90): valid_frames=%u, 
>> err_frames=%u\n",
>> +             valid_frames, err_frames);
>> +
>> +    avg_frame_time_ns = (double)total_frame_time_ns / valid_frames;
>> +    avg_refresh_rate = (double)NSECS_PER_SEC / avg_frame_time_ns;
>> +
>> +    igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 
>> CMRR_RR_TOLERANCE_HZ,
>> +             "CMRR refresh rate mismatch: measured avg_rr = %.3f Hz, "
>> +             "expected_rr = %.3f Hz\n",
>> +              avg_refresh_rate, expected_rr);
>> +
>> +    igt_info("Average RR (Hz): %.2f, Expected RR (Hz): %.2f, error 
>> frames = %u\n",
>> +         avg_refresh_rate, expected_rr, err_frames);
>> +}
>> +
>> +/**
>
> Did you intend it to be a doc style comment? 
Yes, it was intended to be a doc style comment.
>
>> + * Programs the requested CMRR target refresh rate for @mode, 
>> verifies that the measured
>> + * refresh rate matches the expected CMRR behavior,then disables 
>> CMRR and verifies that
>
> nit: behaviour, then
>
>> + * the refresh rate returns to the mode's nominal refresh rate. The 
>> function asserts that
>> + * all target refresh rate programming operations succeed.
>> + */
>> +static void
>> +run_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>> +     const drmModeModeInfo *mode, uint32_t cmrr_mode)
>> +{
>> +    uint32_t numerator, denominator;
>> +    bool ret;
>> +    double rr_from_mode = igt_vrr_mode_line_refresh_hz(mode);
>> +
>> +    switch (cmrr_mode) {
>> +    case CMRR_VIDEO_MODE:
>> +        numerator = mode->vrefresh * CMRR_NUMERATOR;
>> +        denominator = CMRR_VIDEO_MODE_DENOMINATOR;
>> +        break;
>> +    case CMRR_DESKTOP_MODE:
>> +        numerator = mode->vrefresh * CMRR_NUMERATOR;
>> +        denominator = CMRR_DENOMINATOR;
>> +        break;
>> +    default:
>> +        igt_assert_f(0, "Unsupported CMRR mode %u\n",
>> +                 cmrr_mode);
>> +    }
>> +
>> +    igt_output_override_mode(output, mode);
>> +    igt_info("Override mode:");
>> +    kmstest_dump_mode((drmModeModeInfo *)mode);
>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +    ret = igt_vrr_target_rr_debugfs_write(data->drm_fd,
>> +                          crtc->crtc_index,
>> +                          numerator,
>> +                          denominator);
>> +    igt_assert_f(ret, "Failed to program CMRR target RR (%u/%u)\n",
>> +             numerator, denominator);
>> +
>> +    flip_and_measure_target_rr(data, crtc, mode->vrefresh, cmrr_mode);
>> +
>> +    ret = igt_vrr_target_rr_debugfs_write(data->drm_fd, 
>> crtc->crtc_index, 0, 0);
>> +
>> +    igt_assert_f(ret, "Failed to disable CMRR target RR\n");
>> +
>> +    flip_and_measure_target_rr(data, crtc, rr_from_mode, CMRR_DISABLE);
>> +}
>> +
>> +/* Validate CMRR behavior for supported video and desktop display 
>> modes. */
>> +static
>> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
>> +           igt_output_t *output, uint32_t flags)
>> +{
>> +    drmModeModeInfo mode;
>> +    bool found = false;
>> +    drmModeConnectorPtr connector = output->config.connector;
>> +    uint32_t j;
>> +
>> + igt_require_f(igt_vrr_target_refresh_rate_supported(data->drm_fd, 
>> crtc->crtc_index),
>> +              "CMRR not supported\n");
>> +    prepare_test(data, output, crtc);
>> +    set_vrr_on_crtc(data, crtc, true, false);
>> +
>> +    if (flags & TEST_CMRR_VIDEO_MODE) {
>> +        found = false;
>> +        for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
>> +            if (!get_mode_with_video_timing(output,
>> + igt_vrr_standard_video_timing_fps[j],
>> +                            &mode))
>> +                continue;
>> +
>> +            found = true;
>> +            run_cmrr(data, crtc, output, &mode, CMRR_VIDEO_MODE);
>> +        }
>> +        igt_require_f(found, "No video mode found.\n");
>> +    }
>> +
>> +    if (flags & TEST_CMRR_DESKTOP_MODE) {
>> +        found = false;
>> +        for (j = 0; j < connector->count_modes; j++) {
>> +            mode = connector->modes[j];
>> +            if (igt_vrr_mode_line_refresh_hz(&mode) - mode.vrefresh 
>> <= 0.04)
>> +                continue;
>> +
>> +            found = true;
>> +            run_cmrr(data, crtc, output, &mode, CMRR_DESKTOP_MODE);
>> +        }
>> +        igt_require_f(found, "No desktop mode found.\n");
>> +    }
>> +}
>> +
>>   /* Basic VRR flip functionality test - enable, measure, disable, 
>> measure */
>>   static void
>>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>> @@ -591,6 +816,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, 
>> igt_output_t *output,
>>       uint64_t rate[] = {0};
>>         prepare_test(data, output, crtc);
>> +
>
> unintentional new line.
Sure. I will fix all review minor comments in next revision.
>
> With these LGTM
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>v
>
>>       range = data->range;
>>       vtest_ns = data->vtest_ns;
>>       rate[0] = vtest_ns.rate_ns;
>> @@ -1147,6 +1373,20 @@ int igt_main_args("drs:", long_opts, help_str, 
>> opt_handler, &data)
>>           }
>>       }
>>   +    igt_subtest_group() {
>> +        igt_fixture()
>> +            igt_require_intel(data.drm_fd);
>> +
>> +        igt_describe("Test to validate CMRR in desktop mode.");
>> +        igt_subtest_with_dynamic("cmrr-desktop-mode") {
>> +            run_vrr_test(&data, test_cmrr, TEST_CMRR_DESKTOP_MODE);
>> +        }
>> +
>> +        igt_describe("Test to validate CMRR in video mode.");
>> +        igt_subtest_with_dynamic("cmrr-video-mode") {
>> +            run_vrr_test(&data, test_cmrr, TEST_CMRR_VIDEO_MODE);
>> +        }
>> +    }
>>       igt_fixture() {
>>           close(data.debugfs_fd);
>>           igt_display_fini(&data.display);
>
--------------FoPas0nK9OBUU0OIdPa3U5aS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Chitanya,</p>
    <div class="moz-cite-prefix">On 9/10/2026 3:55 PM, Borah, Chaitanya
      Kumar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:e7bc3094-7254-4482-a17b-de4487b1cdf4@intel.com">
      <br>
      <br>
      On 9/7/2026 11:18 PM, Naladala Ramanaidu wrote:
      <br>
      <blockquote type="cite">Add test coverage to validate Content
        Match Refresh Rate (CMRR)
        <br>
        behavior across both fixed and video timing display modes.
        <br>
        <br>
        This introduces a shared helper library to support refresh-rate
        <br>
        mode selection and parsing, along with two new test cases
        covering
        <br>
        fixed-mode and video-mode scenarios.
        <br>
        <br>
        The new tests measure actual display refresh timing during CMRR
        <br>
        operation and compare it against the expected target rate to
        <br>
        verify correctness. Video mode coverage validates behavior
        across
        <br>
        standard video timing rates, while fixed mode coverage targets
        <br>
        display modes that fall outside the standard video timing set.
        <br>
        <br>
        Each test cycles through the relevant refresh configurations,
        <br>
        applying and resetting the appropriate settings between
        <br>
        measurement passes to ensure consistent and isolated test
        results.
        <br>
        <br>
        v2: Fix test issue.
        <br>
        v3: Address review comments. (Mitul)
        <br>
        v4: Fix test issue.
        <br>
        v5: Address below review comments:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Rename CMRR fixed/non-video mode references to desktop
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode. (Chaitanya)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Factor out vblank timestamp/sequence retrieval into
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; helper. (Chaitanya)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Simplify CMRR tests by extracting common mode logic.
        (Chaitanya,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mitul)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Refactor CMRR refresh-rate verification and frame
        filtering.
        <br>
        v6: Address below review comments:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Document skipped vblank intervals and fix seq_delta
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format. (Chaitanya)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Fix minor style issues in CMRR tests. (Chaitanya, Mitul)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; - Add mode existence checks for CMRR test paths.
        (Chaitanya)
        <br>
        <br>
        Assisted-by: GitHub Copilot:Claude Opus 4.6
        <br>
        Signed-off-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/kms_vrr.c | 240
        ++++++++++++++++++++++++++++++++++++++++++++++++
        <br>
        &nbsp; 1 file changed, 240 insertions(+)
        <br>
        <br>
        diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
        <br>
        index 27f18e8d0..109b4629d 100644
        <br>
        --- a/tests/kms_vrr.c
        <br>
        +++ b/tests/kms_vrr.c
        <br>
        @@ -32,6 +32,7 @@
        <br>
        &nbsp; #include &quot;igt_pm.h&quot;
        <br>
        &nbsp; #include &quot;igt_psr.h&quot;
        <br>
        &nbsp; #include &quot;i915/intel_drrs.h&quot;
        <br>
        +#include &quot;igt_vrr.h&quot;
        <br>
        &nbsp; #include &quot;sw_sync.h&quot;
        <br>
        &nbsp; #include &lt;fcntl.h&gt;
        <br>
        &nbsp; #include &lt;signal.h&gt;
        <br>
        @@ -80,9 +81,22 @@
        <br>
        &nbsp;&nbsp; *
        <br>
        &nbsp;&nbsp; * SUBTEST: lobf-dc3co
        <br>
        &nbsp;&nbsp; * Description: Test DC3CO entry during LOBF.
        <br>
        + *
        <br>
        + * SUBTEST: cmrr-desktop-mode
        <br>
        + * Description: Test to set a desktop mode CMRR target refresh
        rate and verify
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; it is correctly applied.
        <br>
        + *
        <br>
        + * SUBTEST: cmrr-video-mode
        <br>
        + * Description: Test to set standard video timing refresh rates
        via CMRR
        <br>
        + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and verify each target rate is correctly
        applied.
        <br>
        &nbsp;&nbsp; */
        <br>
        &nbsp; &nbsp; #define NSECS_PER_SEC (1000000000ull)
        <br>
        +#define CMRR_NUMERATOR 1000ULL
        <br>
        +#define CMRR_DENOMINATOR 1000ULL
        <br>
        +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
        <br>
        +#define TARGET_RR_SAMP_COUNT 100
        <br>
        +#define CMRR_RR_TOLERANCE_HZ 0.02
        <br>
        &nbsp; &nbsp; /*
        <br>
        &nbsp;&nbsp; * Each test measurement step runs for ~5 seconds.
        <br>
        @@ -103,6 +117,14 @@ enum {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_LINK_OFF = 1 &lt;&lt; 10,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_NEGATIVE = 1 &lt;&lt; 11,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_FORCE_RR = 1 &lt;&lt; 12,
        <br>
        +&nbsp;&nbsp;&nbsp; TEST_CMRR_DESKTOP_MODE = 1 &lt;&lt; 13,
        <br>
        +&nbsp;&nbsp;&nbsp; TEST_CMRR_VIDEO_MODE = 1 &lt;&lt; 14,
        <br>
        +};
        <br>
        +
        <br>
        +enum {
        <br>
        +&nbsp;&nbsp;&nbsp; CMRR_VIDEO_MODE,
        <br>
        +&nbsp;&nbsp;&nbsp; CMRR_DESKTOP_MODE,
        <br>
        +&nbsp;&nbsp;&nbsp; CMRR_DISABLE,
        <br>
        &nbsp; };
        <br>
        &nbsp; &nbsp; enum {
        <br>
        @@ -221,6 +243,38 @@ output_mode_with_maxrate(igt_output_t
        *output, unsigned int vrr_max)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return mode;
        <br>
        &nbsp; }
        <br>
        &nbsp; +/**
        <br>
        + * get_mode_with_video_timing:
        <br>
        + * @output: Display output containing connector mode list
        <br>
        + * @fps: Requested integer refresh rate in Hz
        <br>
        + * @matched_mode: Returned mode that matches @fps
        <br>
        + *
        <br>
        + * Find and return a connector mode that matches the requested
        <br>
        + * video timing refresh rate in Hz.
        <br>
        + *
        <br>
        + * Returns: true when a mode is found, false otherwise
        <br>
        + */
        <br>
        +
        <br>
        +static bool
        <br>
        +get_mode_with_video_timing(igt_output_t *output, uint32_t fps,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *matched_mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; drmModeConnectorPtr connector;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; connector = output-&gt;config.connector;
        <br>
        +&nbsp;&nbsp;&nbsp; if (!connector)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; connector-&gt;count_modes; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (connector-&gt;modes[i].vrefresh == fps) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *matched_mode = connector-&gt;modes[i];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return false;
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static drmModeModeInfo
        <br>
        &nbsp; low_rr_mode_with_same_res(igt_output_t *output, unsigned int
        vrr_min)
        <br>
        &nbsp; {
        <br>
        @@ -580,6 +634,177 @@ flip_and_measure(data_t *data,
        igt_output_t *output,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; }
        <br>
        &nbsp; +/* Measure and verify the effective refresh rate against the
        expected CMRR target rate. */
        <br>
        +static void
        <br>
        +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; double vrefresh, uint32_t cmrr_mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t last_vblank_ns, vblank_ns, frame_time_ns;
        <br>
        +&nbsp;&nbsp;&nbsp; uint64_t total_frame_time_ns = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t last_seq, seq, seq_delta;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t err_frames = 0, valid_frames;
        <br>
        +&nbsp;&nbsp;&nbsp; double avg_frame_time_ns, avg_refresh_rate;
        <br>
        +&nbsp;&nbsp;&nbsp; double&nbsp; expected_rr = 0;
        <br>
      </blockquote>
      <br>
      double space.
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; bool front = false;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t i;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; switch (cmrr_mode) {
        <br>
        +&nbsp;&nbsp;&nbsp; case CMRR_VIDEO_MODE:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected_rr = (vrefresh * CMRR_NUMERATOR) /
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (double)CMRR_VIDEO_MODE_DENOMINATOR;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; case CMRR_DESKTOP_MODE:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected_rr = (vrefresh * CMRR_NUMERATOR) /
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (double)CMRR_DENOMINATOR;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; case CMRR_DISABLE:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected_rr = vrefresh;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; default:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(0, &quot;Invalid CMRR mode %u\n&quot;, cmrr_mode);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; do_flip(data, &amp;data-&gt;fb[0]);
        <br>
        +&nbsp;&nbsp;&nbsp; (void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_wait_for_vblank_ts_seq(crtc, &amp;last_vblank_ns,
        &amp;last_seq);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; TARGET_RR_SAMP_COUNT; i++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; front = !front;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_flip(data, front ? &amp;data-&gt;fb[1] :
        &amp;data-&gt;fb[0]);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_wait_for_vblank_ts_seq(crtc, &amp;vblank_ns,
        &amp;seq);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void)get_kernel_event_ns(data,
        DRM_EVENT_FLIP_COMPLETE);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; frame_time_ns = vblank_ns - last_vblank_ns;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_delta = seq - last_seq;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last_vblank_ns = vblank_ns;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last_seq = seq;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Use only single-frame intervals. If delta &gt; 1,
        one or
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * more vblanks were missed, so the interval is not
        valid
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for calculating the average frame time.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (seq_delta != 1) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;vblank seq delta = %u\n&quot;, seq_delta);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err_frames++;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_frame_time_ns += frame_time_ns;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_f(valid_frames &gt;= 90,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Valid frames below threshold (90):
        valid_frames=%u, err_frames=%u\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_frames, err_frames);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; avg_frame_time_ns = (double)total_frame_time_ns /
        valid_frames;
        <br>
        +&nbsp;&nbsp;&nbsp; avg_refresh_rate = (double)NSECS_PER_SEC /
        avg_frame_time_ns;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_f(fabs(avg_refresh_rate - expected_rr) &lt;=
        CMRR_RR_TOLERANCE_HZ,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CMRR refresh rate mismatch: measured avg_rr =
        %.3f Hz, &quot;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;expected_rr = %.3f Hz\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avg_refresh_rate, expected_rr);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;Average RR (Hz): %.2f, Expected RR (Hz): %.2f,
        error frames = %u\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avg_refresh_rate, expected_rr, err_frames);
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
      </blockquote>
      <br>
      Did you intend it to be a doc style comment?&nbsp;
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></blockquote>
    Yes, it was intended to be a doc style comment.
    <blockquote type="cite" cite="mid:e7bc3094-7254-4482-a17b-de4487b1cdf4@intel.com"><br>
      <blockquote type="cite">+ * Programs the requested CMRR target
        refresh rate for @mode, verifies that the measured
        <br>
        + * refresh rate matches the expected CMRR behavior,then
        disables CMRR and verifies that
        <br>
      </blockquote>
      <br>
      nit: behaviour, then
      <br>
      <br>
      <blockquote type="cite">+ * the refresh rate returns to the mode's
        nominal refresh rate. The function asserts that
        <br>
        + * all target refresh rate programming operations succeed.
        <br>
        + */
        <br>
        +static void
        <br>
        +run_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; const drmModeModeInfo *mode, uint32_t cmrr_mode)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t numerator, denominator;
        <br>
        +&nbsp;&nbsp;&nbsp; bool ret;
        <br>
        +&nbsp;&nbsp;&nbsp; double rr_from_mode = igt_vrr_mode_line_refresh_hz(mode);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; switch (cmrr_mode) {
        <br>
        +&nbsp;&nbsp;&nbsp; case CMRR_VIDEO_MODE:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; numerator = mode-&gt;vrefresh * CMRR_NUMERATOR;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; denominator = CMRR_VIDEO_MODE_DENOMINATOR;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; case CMRR_DESKTOP_MODE:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; numerator = mode-&gt;vrefresh * CMRR_NUMERATOR;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; denominator = CMRR_DENOMINATOR;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; default:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(0, &quot;Unsupported CMRR mode %u\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmrr_mode);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_output_override_mode(output, mode);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_info(&quot;Override mode:&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; kmstest_dump_mode((drmModeModeInfo *)mode);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = igt_vrr_target_rr_debugfs_write(data-&gt;drm_fd,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crtc-&gt;crtc_index,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; numerator,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; denominator);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_f(ret, &quot;Failed to program CMRR target RR
        (%u/%u)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; numerator, denominator);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; flip_and_measure_target_rr(data, crtc, mode-&gt;vrefresh,
        cmrr_mode);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = igt_vrr_target_rr_debugfs_write(data-&gt;drm_fd,
        crtc-&gt;crtc_index, 0, 0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_f(ret, &quot;Failed to disable CMRR target RR\n&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; flip_and_measure_target_rr(data, crtc, rr_from_mode,
        CMRR_DISABLE);
        <br>
        +}
        <br>
        +
        <br>
        +/* Validate CMRR behavior for supported video and desktop
        display modes. */
        <br>
        +static
        <br>
        +void test_cmrr(data_t *data, igt_crtc_t *crtc,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output, uint32_t flags)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; drmModeModeInfo mode;
        <br>
        +&nbsp;&nbsp;&nbsp; bool found = false;
        <br>
        +&nbsp;&nbsp;&nbsp; drmModeConnectorPtr connector =
        output-&gt;config.connector;
        <br>
        +&nbsp;&nbsp;&nbsp; uint32_t j;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;
        igt_require_f(igt_vrr_target_refresh_rate_supported(data-&gt;drm_fd,
        crtc-&gt;crtc_index),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CMRR not supported\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; prepare_test(data, output, crtc);
        <br>
        +&nbsp;&nbsp;&nbsp; set_vrr_on_crtc(data, crtc, true, false);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_CMRR_VIDEO_MODE) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found = false;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j = 0; j &lt;
        igt_vrr_standard_video_timing_fps_count; j++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!get_mode_with_video_timing(output,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_vrr_standard_video_timing_fps[j],
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mode))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found = true;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_cmrr(data, crtc, output, &amp;mode,
        CMRR_VIDEO_MODE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(found, &quot;No video mode found.\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_CMRR_DESKTOP_MODE) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found = false;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j = 0; j &lt; connector-&gt;count_modes; j++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode = connector-&gt;modes[j];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_vrr_mode_line_refresh_hz(&amp;mode) -
        mode.vrefresh &lt;= 0.04)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found = true;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_cmrr(data, crtc, output, &amp;mode,
        CMRR_DESKTOP_MODE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_f(found, &quot;No desktop mode found.\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; /* Basic VRR flip functionality test - enable, measure,
        disable, measure */
        <br>
        &nbsp; static void
        <br>
        &nbsp; test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t
        *output,
        <br>
        @@ -591,6 +816,7 @@ test_basic(data_t *data, igt_crtc_t *crtc,
        igt_output_t *output,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t rate[] = {0};
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prepare_test(data, output, crtc);
        <br>
        +
        <br>
      </blockquote>
      <br>
      unintentional new line.
      <br>
    </blockquote>
    Sure. I will fix all review minor comments in next revision.
    <blockquote type="cite" cite="mid:e7bc3094-7254-4482-a17b-de4487b1cdf4@intel.com"><br>
      With these LGTM
      <br>
      Reviewed-by: Chaitanya Kumar Borah
      <a class="moz-txt-link-rfc2396E" href="mailto:chaitanya.kumar.borah@intel.com">&lt;chaitanya.kumar.borah@intel.com&gt;</a>v
      <br>
      <br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range = data-&gt;range;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vtest_ns = data-&gt;vtest_ns;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rate[0] = vtest_ns.rate_ns;
        <br>
        @@ -1147,6 +1373,20 @@ int igt_main_args(&quot;drs:&quot;, long_opts,
        help_str, opt_handler, &amp;data)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; igt_subtest_group() {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture()
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require_intel(data.drm_fd);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test to validate CMRR in desktop mode.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;cmrr-desktop-mode&quot;) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_vrr_test(&amp;data, test_cmrr,
        TEST_CMRR_DESKTOP_MODE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test to validate CMRR in video mode.&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;cmrr-video-mode&quot;) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_vrr_test(&amp;data, test_cmrr,
        TEST_CMRR_VIDEO_MODE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(data.debugfs_fd);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_fini(&amp;data.display);
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------FoPas0nK9OBUU0OIdPa3U5aS--
