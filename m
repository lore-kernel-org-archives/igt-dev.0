Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1D1E99055
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33310E87C;
	Fri, 10 Apr 2026 08:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldgtwD0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27CE10E87C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775809953; x=1807345953;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d2b/kkA04TCDlhF8yH/VPpivkvxeV8IdpS0gG/FT3fI=;
 b=ldgtwD0HjXTztkYZOODNRP+DldRQNKq3+5FjD/CAVWe8hPaMZHpEX28q
 ks3tfQ1tIxZOMSJKGItdJhumj1Lmb0BYUToJqF+KuUa6+Id0RJER7ZUfn
 pUyx4+sowzUw/eTtwv4R6Xci0SXNPOJQeV4X6Lg3JM4uSFAX2Aze+U8o0
 IcOACmZ4qwCNwNKF/4iGgrMY1LONRg/CjrsKoyThpvKj3WwGTJvddfvQS
 D8O6T+wzrGP1myI9Pkk9+QIdb4r+e8cu/Sgb7LGIf51sjURgxA8aLxn2J
 XIM5jB0HiHV8623b9619uOB/GkkPOR9MAwza5ptjZCMEZcqKbJswtGP6Z w==;
X-CSE-ConnectionGUID: uNirM8d4ReyGz5nzrsXPgA==
X-CSE-MsgGUID: dPcrlkO+SGqiK2Y66N5cCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76899397"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76899397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:32:32 -0700
X-CSE-ConnectionGUID: enpi0g6pSs+z2wXodAR9JQ==
X-CSE-MsgGUID: 6zCaBFOZS8agctJiKuUYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="228190895"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:32:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:32:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 01:32:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3f85wThuPx+OP39rh0T1hyCKJgwg/P77lQEEYUDseN+qn9jKWOXzSpVe+51sbYtyFAAmIpezNkYlkkzHRUg8cqjIdMVI+16ZBIeoY+mGGyQouhnl0NnN1UVbWhjp6bwvvF1q8KG7L1Tm6OsMh5wY42ZLoVSJnvxb2R5WWxDD2QjZIMtGXW1nTzoyCDMMHh6UUXPJBVJZAJ4N/aIrP6P2Ajz4hnC+Jw3tVGWrQWjoJ/OeHwtPJj1Un6gn1dezPY3Zzsx/v9iDNqNF50ClWkA8Dpk4B6SWQIRfJ1XE3wIiJY2WxC4ktv5OGNAON1kGXMdTRQSawjGi5BcOlQ8hwE4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66ufH5ljS5/XdTAZlp2961T5tmbjBK2dY47POKPGh6c=;
 b=V8X/j9Z7V/wYGSmftLZpZhruhlRMRnp4Xx6z06tO0aSf/8cHbVyriZpXoNwmJNTq/ryl53rsxyKffG2yYSlZVghzIcl7UwB0SG20tDzxlNqQKLWoJoXYrNChjORAovcpSncQ1WOx3PxVj01L5WgiD2XV8p/38v+NMnB+sYkJyvXMgOe+kmj0IUMF32dUgNX7N52J2cEPXKRD1vhkK4RS4LUT5zeQM04rNLSzeDxz1z3ezs8u6Nz2bFIH4rEkVN8gI8v4+hmIzuDEJKOzcVV278ZP9OUnz1c6Tu25sPIsUMsnDkUMP59ypad6eLFQvBvSrprigZpn5GNJVHZPaiD9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Fri, 10 Apr
 2026 08:32:24 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 08:32:24 +0000
Message-ID: <b92b94d2-0c71-41e5-a047-1716a9500321@intel.com>
Date: Fri, 10 Apr 2026 14:02:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 6/9] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-7-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260409070118.2211602-7-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0180.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::12) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f277e9-02ee-44d5-9ffc-08de96dbb070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Mvl3B83nNFzHURP+UwxD8tJLSsLP82FXgx9xAv5fHKI3Uy15/ar3DJ2lVIuDTOnEEMG1l3D+IHeVTpjUk3W6TnVLeOs6F+53uQc1RIISOLEL0foaeQROFt+Vr+ZK99j1O/7e5Q5m7QfTJrdWGZH5hYVVb11xO0ygr7b4G3rYbQ+/xcnnqUrArUoXQIEcS/S8UwgAWcOIM1Be6RiuQlyJtI0qp3RiCKPc6M5qOn8Gw5YAFuFrayki6aSdoWxlltd6dBaRu1YXcz8csoBnWgkHfjyaqW/yrjLfw5Y4vpZzE8M4aDKfHE7aph17ksOBugE8EtXyfqnSbqIeA2GihS1K+HwSzA7Kej+RwMWbqRic+iyHYu5osLR6/V75NiNJaZiPaJz+w4L0VGm9Jdye67PV71evn7rE3J0I6BC9SdWm3AOXMuHGclIj3Wf6TpXwzpQvNjX5KKeS9vKCL87WwrMTp44Zo+jU8PEAtTfTNoMOsdGfHaEiX7jIydNj0Fsv90h6Zxyp2HW+nf2RLp2L+jS4vxnHmpIoj1eDhPT0QYOuJvU9Z0q1Fd6V39LPoSFRD7g78WcGo55+wqXJGWxXR3R5ktoxHLhipQ9YTqYC8W7G307Hgka/NFmTP4IsRiX7Kbe9xA0GIjWoyrXJcXcdugMeK4hf5dcesNWyFxUAYy3OisgxBxcv/+Xvfopgtm7I2gQJKditgN2rz4pNYSLzCumekuHsenVGxhWc1JXy8NLPuH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlJpQ1pmUG92UnFhZitlME9KUWk4RGZQUVF1NG1TVTZ2REdGZCtodDN3OTln?=
 =?utf-8?B?RlRFNE9TN2dweDlvTHJuNDdLUjV1RTQvV2JCbGp3VW5Pck83aFJXWGxIUVZ5?=
 =?utf-8?B?dVVxTUlFeVY3R2MrZ2M5U2JxMkpOQ1hyS0hRajZkeUw3dm1XaDZXWUx6ZXJx?=
 =?utf-8?B?UnlBNDhCc2pZaFBLK2FNNU94Vk0wbGJGdm1oak1wZHA0S0ZVaFhZM055SlVB?=
 =?utf-8?B?WjF3RWxpRE5vckF4dGNVYStXWUxoTXhUQmtQcjNncVBpWDF1clFxaVlGWlNa?=
 =?utf-8?B?dFRZbGQ5TEVZQ1VUMlkvWXlSam1HVllHUFYrWS9WYWVQMkxIQWRuckxlNGc5?=
 =?utf-8?B?dlFkMFpSZXdPczFDaG81MTg4N0Y2M2praEsxT0JoWEY4MHBuakpCVnhhUlB2?=
 =?utf-8?B?Y1lFcG1vVmVWNElBUkVJTE9NSjVmZWI5RmVaTW5NendhNXUwVFBYS0JKcm54?=
 =?utf-8?B?WWdZdVlpVUxtMGc0N0Z2TDBScGhVMFJVQjduSlZ3WkpkcG04YzlkS3ZWNnJO?=
 =?utf-8?B?N0JWM2JtdGJiTkFnc2VKK0ZNNWgxRXk4QzhjS2I2NU1ydmpHeUYvcy9qZVl3?=
 =?utf-8?B?TlkyYjVBblRMUmE3Sm9NV1ZxdEpKd0JpUSs1U0JNZ01idFNlMlAxNnNnSkpL?=
 =?utf-8?B?WFdXRHVWQlpSTzVlUU1zVzQ5Ryt0QVp1QzMwNDNXQkdWMFMyMW5OWGp1THZW?=
 =?utf-8?B?Z2RxSVdxbXpxSFNBSmdEZ2FGMWp4bUhROVdHMzFUV1NYMlBsOEhiN1kzdVpK?=
 =?utf-8?B?bFc4WHlEQzRoNmo0NWd6SWsvQVlzYWNtSGZjZ09GOWVjZlNXVGtmeDdOUHVD?=
 =?utf-8?B?UGUvVDgxd05QY3BPUlpNbUJCOFpxQ1NXQWhqamY5Tm1Gc0pRNGE4OG03NHB5?=
 =?utf-8?B?T0M4SE1zYUZIVnJkQUFMbktEQTREYWkydDZWV1BIQkVXUGpjRHQxQ0dhOWVO?=
 =?utf-8?B?dnBEeTZPS3JCTW9wN3VLVlZ1V29XWUxDYzJ2V0pSK1p6WTlQalBCcm4yd3JF?=
 =?utf-8?B?U1BjUWhDY0hnR0pyM2ZhQytLTnpyMHRMTkc5eVZiMCtTS2RxR2RqdTZDRFNU?=
 =?utf-8?B?Z05XMWdFSUxmb2QwYnRvL2k0SFFFeXNkNUEyMWJkL3hlQ1R5YjNmUkFNVzg5?=
 =?utf-8?B?QTdpeGM1YWVoaE05Tlp5Y21LK3p2YWtDOUd0c3M2SmJwc2ovYWlVSngraWM0?=
 =?utf-8?B?cGlwWjlJUndGQlBrNy82ajZNWjdnNU1EMU5QVThqKzFLWjh1V3ByenBFQ2FV?=
 =?utf-8?B?QW1MMzJwOS9TZ29ZRlBqc2ptd1ZKVDdFZjliUk1zdm8xUWRHM0VtRVNpOUJR?=
 =?utf-8?B?azVmQU9mNExEOFM3NzFSN1RZRWR4RjNuRmVJOVVndXc5NjRHTEhPOHJaWkxt?=
 =?utf-8?B?Rmx5alpML0l2SDluZ01tcFRPeEVjaFp3Qmk4VlpYNi9aYXdZd2NtZHY2R3Br?=
 =?utf-8?B?RXhrQ1dNSExZSUtiVWdtOWVxWW9VZkhEbXBwMHpUaTVFd0xiUjFOWGpkc3I0?=
 =?utf-8?B?RzQxNHQ2djdpRjgySnBmYU5pVFdDblF5NlVsTC80NGpjOEZmd2k5SllIM2FR?=
 =?utf-8?B?MllsZm95Z0xEVElDUzkvakcrUlJkZytoUnRRTTlKOEZFTWpoL2FXSzN6RVFS?=
 =?utf-8?B?eDgzdjA2L3BidXYzeW5OS2ViMXlYVXdpUkQwbXpUWW5YbmxFMEFJa3MwTFI4?=
 =?utf-8?B?Z0Q5SUZzS0lOQUxBelBSQzhRK0VBMXhJY01QYjZPZm51bGVXQkN5TlJ3TXJR?=
 =?utf-8?B?VWdWWXFEcHRBbXVoUjVXY0dEMTdVdW5Vb2Nka3c0aHNVbjVkU1IyMGhBdEFk?=
 =?utf-8?B?TkNrS2ErK1JLOUJuM1k4cDNtbG5GbnlPNDZPc2lSYnVwYWdIRW4xQml0UytO?=
 =?utf-8?B?QTkvWml0ZDBWYS8raDEyMmZKQzF0UWk0bGFqK2Q0MmdQSUdIWmwyUUJsNlZD?=
 =?utf-8?B?OUdoNUxnWnFYVk5CS0xBdW5TeFI1Y2orZEV3NDVzTVo1Sjd0RW5ZWk8yTXIx?=
 =?utf-8?B?V3lwajB1RWNDQzhiODNBTlZCRWkzRUlleWVuRXh6TmFONGlWZ3lNaVJLY0FN?=
 =?utf-8?B?NzNmR3J2ZGs0anc0eEZaeGM1QmhIMElNb0J6L013NWFMSFhWNlE2Tm9Od3ZP?=
 =?utf-8?B?am9nRE03UU1PSnZhTHRkY0JJZ0xxRTlsQjVLcXdhWkZzQmo4cWlzYnIyYUNr?=
 =?utf-8?B?azIrTjVEeEZWQld4Vm40YU9JSWFxb004RWJaR3grWnlQNmxoMkpkUzVycnhT?=
 =?utf-8?B?V05TQms5amJIelRTZDJjTkhQOC9jS0l6SEdWSnljN2hkODdIR1VTVTRud0Q2?=
 =?utf-8?B?NFRyVyszd041TllQVjV6SGNVd3FVK2xPSE9pQkRUeWFITkR4WnNUQT09?=
X-Exchange-RoutingPolicyChecked: FwrbIWmzx2RQPdJLC4H5+W+vshYoDyRCZOI4+D4DjMPHwFNwC4Q7K+aoxa0z/79Doh9iw8Cy1F+pFD9zeBMsxeSKrS9lt9eN+WHGJ5OJnSua1K7mSkdiWQXaUHObbvixUlRTkRZH3oPKM2VE+bQCWvAt4B5V8anQ2Qf2GN1iKEZaJUPJ4IChrySc7SYSUSB9sztEfVlZGK41iXkAPnzz6pMmBpul82qhf4pAsC2CBWSgz29EgdwnsFEgqrwp3I2kgvqU8wJjUfAQ/+dR62SW/S3ENHFpMWXuwfLatRzsoZ/Q8RRaDIReYu6wxseF+wf8dpd+A+LbQFIbfwwesBUu1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f277e9-02ee-44d5-9ffc-08de96dbb070
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:32:23.8937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppN/gxIFvyMQNNdHsAIuVbgkHd07vpDAR3YhCyhjP+foq2Wwj+GPQ1o2W2+K7/qqt+7uP+Z7u346iYfNxcPhbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
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


On 4/9/2026 12:31 PM, Arvind Yadav wrote:
> This test validates GPU execution behavior when a data BO is purged
> before submission. The test creates a batch that writes to a data BO,
> purges the data BO (while keeping the batch BO valid to avoid GPU
> reset), then submits for execution. With VM_CREATE_FLAG_SCRATCH_PAGE,
> the GPU write may succeed by landing on scratch memory instead of the
> purged BO, demonstrating graceful handling of purged memory during
> GPU operations.
>
> v4:
>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 148 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 2d5acc347..b30290f27 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -19,7 +19,11 @@
>   
>   /* Purgeable test constants */
>   #define PURGEABLE_ADDR		0x1a0000
> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>   #define PURGEABLE_BO_SIZE	4096
> +#define PURGEABLE_FENCE_VAL	0xbeef
> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
> +#define PURGEABLE_DEAD_PATTERN	0xdead
>   
>   static bool xe_has_purgeable_support(int fd)
>   {
> @@ -196,6 +200,62 @@ static void test_purged_mmap_blocked(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs for GPU exec
> + * @fd: DRM file descriptor
> + * @vm: Output VM handle
> + * @bind_engine: Output bind engine handle
> + * @batch_bo: Output batch BO handle
> + * @data_bo: Output data BO handle
> + * @batch: Output batch buffer pointer
> + * @data: Output data buffer pointer
> + * @batch_addr: Batch virtual address
> + * @data_addr: Data virtual address
> + * @batch_size: Batch buffer size
> + * @data_size: Data buffer size
> + *
> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
> + */
> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
> +					   uint32_t *bind_engine,
> +					   uint32_t *batch_bo,
> +					   uint32_t *data_bo,
> +					   uint32_t **batch,
> +					   uint32_t **data,
> +					   uint64_t batch_addr,
> +					   uint64_t data_addr,
> +					   size_t batch_size,
> +					   size_t data_size)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = PURGEABLE_FENCE_VAL,
> +	};
> +	uint64_t vm_sync = 0;
> +
> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
> +
> +	/* Create and bind batch BO */
> +	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd, 0),
> +				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
> +
> +	sync.addr = to_user_pointer(&vm_sync);
> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr, batch_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
> +
> +	/* Create and bind data BO */
> +	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	*data = xe_bo_map(fd, *data_bo, data_size);
> +
> +	vm_sync = 0;
> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr, data_size, &sync, 1);
> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
> +}
> +
>   /**
>    * SUBTEST: dontneed-before-mmap
>    * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> @@ -292,6 +352,88 @@ static void test_dontneed_after_mmap(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: dontneed-before-exec
> + * Description: Mark BO as DONTNEED before GPU exec, verify GPU behavior with SCRATCH_PAGE
> + * Test category: functionality test
> + */
> +static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
> +	uint64_t data_addr = PURGEABLE_ADDR;
> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
> +	size_t data_size = PURGEABLE_BO_SIZE;
> +	size_t batch_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = PURGEABLE_FENCE_VAL },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint32_t *data, *batch;
> +	uint64_t vm_sync = 0;
> +	int b, ret;
> +
> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
> +				       &bo, &batch, &data, batch_addr,
> +				       data_addr, batch_size, data_size);
> +
> +	/* Prepare batch */
> +	b = 0;
> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[b++] = data_addr;
> +	batch[b++] = data_addr >> 32;
> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
> +	batch[b++] = MI_BATCH_BUFFER_END;
> +
> +	/* Phase 1: Purge data BO, batch BO still valid */
> +	if (!purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size)) {
> +		munmap(data, data_size);
> +		munmap(batch, batch_size);
> +		gem_close(fd, bo);
> +		gem_close(fd, batch_bo);
> +		xe_exec_queue_destroy(fd, bind_engine);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
> +	}
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = batch_addr;
> +
> +	vm_sync = 0;
> +	sync[0].addr = to_user_pointer(&vm_sync);
> +
> +	/*
> +	 * VM has SCRATCH_PAGE — exec may succeed with the GPU write
> +	 * landing on scratch instead of the purged data BO.
> +	 */
> +	ret = __xe_exec(fd, &exec);
> +	if (ret == 0) {
> +		int64_t timeout = NSEC_PER_SEC;
> +
> +		__xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
> +				 exec_queue, &timeout);
> +	}
> +
> +	/*
> +	 * Don't purge the batch BO — GPU would fetch zeroed scratch
> +	 * instructions and trigger an engine reset.
> +	 */
> +
> +	munmap(data, data_size);
> +	munmap(batch, batch_size);
> +	gem_close(fd, bo);
> +	gem_close(fd, batch_bo);
> +	xe_exec_queue_destroy(fd, bind_engine);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -322,6 +464,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("dontneed-before-exec")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_before_exec(fd, hwe);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

