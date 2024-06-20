Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829EBC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAFC10E870;
	Thu, 20 Jun 2024 23:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvGOyauO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3110E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925884; x=1750461884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cYwIazViRPd7g8YKNwuEPzquqdwmoa9+wHWFrHIeur8=;
 b=bvGOyauOHtVBf5sd9TzO9OvkqgNHr1tFTaC9opB2Uluu8kYqKCUEyRY3
 KvCMkbjCgqcp6bzPqSAeT2ccJCPKdNteNcxeW5WHhuJZ1jCZK8VU+tZqN
 pEB73LCUIH7LS/rqCI/AqybNUBMnbCdtnNWK6t7sO9vfazafe8dPqkKHS
 4Po9n3hQeRsAMW4UlIvPopNnvMrp7137qAAR0smVFhpiTF+XFNyJ8DlLZ
 /F9QUVEMU1Qb700zgtX+jqNi2BAbYsFvIQFUggPUHy1Wg8Ly+XIOHXHJL
 qmkL32xxQorCW+/xj2xUvv3JlUYF+G3GvifWBWoaUmMFB3VivIpKfUPgu Q==;
X-CSE-ConnectionGUID: yz6GCa3JR3eE2zJjsAvIWw==
X-CSE-MsgGUID: qqQRQ77bQs2QhaWACcdkWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16086349"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16086349"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:24:43 -0700
X-CSE-ConnectionGUID: KhvuCi6SR3u6aRm2loOBZQ==
X-CSE-MsgGUID: zWCEy4McTNSAZ01/oEGlRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="79914159"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:24:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:24:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:24:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiHd2CU0DY1ulst07zcqJg06nyJTZYB60OMzjwy7QkiCmBX+53BbNA3NnZuo04xz0vY05zIuYcSCuTyu+Jte2pYlg7NH8LfnAAQI0WOFKosMdfQFz44nV2EdOTccHOy7kvSYOQWTOXIBZh5JVMVGmOheTlI4LKeSM7MErgpvCr6VD6x6FLRhtQrUltkhg9HXTFyCxJnSc5wN6dcCmgf+y45VO7dFP1WY8M4Q58ohc7vAp/3xGorPQ8YO57BZ/CIL840kq0yffHwjbOtmx6j4dlHidQeDoOq4HnzXV7lgYZWwRLdZEl8hwQJzKsenK47Q0Iak52Qku02GZ6YSSl0rtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0FwOPmUMdRY3zWAysyMUK9q44Zb8KYhXufBwvkvWTs=;
 b=a8uBODxGl2+v97lJMh2owhEnN2uB2RmGY2fk6cx95UeUgo3b9uq/hjb9dw0f7K/1AmEaHhn69d3NpZmNdjEqRLdvhebCAQZ6CUDHiDDt0bJA7NSLUcEPbasy4D6pKgceZDw2cm8cNeeejAejveLuZt6K05BlogzasCnkj+GzkYTXHHrrQJlBTBlG+GzqpPDqSXBThIJ9YpgmUbNFBAC0ejvV9l61JEOhce087LKA88cAglXp5U6XqbCUsnqHr4cGdEVSa9k3r/7ZcBlNWQwkJDz8xn8xJXyLL5S35WqBEWDfcvHqyF0KCraH987qY+/zRxXhGiSD1Q312iJcVGAViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Thu, 20 Jun
 2024 23:24:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:24:40 +0000
Date: Thu, 20 Jun 2024 16:24:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 07/28] drm-uapi/xe: Sync with Perf/OA changes
Message-ID: <ZnS6N5G7Xw+G6BAp@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-8-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:303:b7::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfba7a7-79d7-491e-bd33-08dc918028d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDFzMFZOaCs3c3UxaXkvU0dsVndXZTlNVDUwNXhwYWxMSVBiWHJkMmgrUDE2?=
 =?utf-8?B?aHBIeHo5SFcxUWlQSlpvM2hUcXdlZE5XQlE3K29pYUdNQjluWTlibHc1dVlD?=
 =?utf-8?B?MVJtclRaNzlyZ3k5Ymx6S1p2Tmk3VExGdlZZcVFrcUVqOE90MEkrQSs1WmpO?=
 =?utf-8?B?U1dQMFhveU5xZmpSSjNnMnpKRERsckVEcStFU1VJU3hHTW9kUTNnUHBONnhJ?=
 =?utf-8?B?RGpLOEREa0JldmlENXUrRTc1THEzTFNiY2UvZzg0MHl5QnUyNHFFbG9XRFFZ?=
 =?utf-8?B?ZER0dUZqdHpDQjB0WEFDMlFYSlZXbi9iWmFmREM0ZnFqdjVJblVrM2xjTnZj?=
 =?utf-8?B?UXYxa3hPUU93aDdCZWdWRi9QUGV2MlBTUVh4eGhpdGROSHpVQ2RmMmt1VXVi?=
 =?utf-8?B?RnBtM2FZcmVJbk1hNWhpdXNON1RvTEI2WW40MnFFMzZRTkdYbkZoTnY0TWRn?=
 =?utf-8?B?NHpnSjhKUzVYNDlmTzZQc2ozdlNWUFYzUzRxdi9NSWFyNGUvTVB5YnI5eHlt?=
 =?utf-8?B?V0JSeTNRT2ZjMThCYWYrdHFRZW9WV1liWUlBVkZES01hU041b2s0TWtObE5j?=
 =?utf-8?B?ZjB3d21EaCs5REd2aE1nbGtMV0pNS0g5MEFnVXVPcWQ3WFgwaFRSNTFCNmxD?=
 =?utf-8?B?LzBoZ1dJeEEyT1NHTnlpOVNxekp5Zm5OdCtJZElXU3h6akpHTDdnVTZ0djFC?=
 =?utf-8?B?QnBKZ1ZJcnNEb0drRDB1SEpVUnVhQnhHN1VLUDRGak1Nc29ZU0J3c3NpZytl?=
 =?utf-8?B?NnJxNVBwWGFzd25Xc21UeEhITWJHaWJ6cTY1cUExN256UGxrYWtRNmtlTnox?=
 =?utf-8?B?ME9jUWp0S3hkbnErM1hpZ2tjeitFQnZHNW5KVWpHQWt6RHY5eUx2bSt6YWxp?=
 =?utf-8?B?NVh2UkdvalNKTGticWFybVhEKzRSUDZOMGxFVWFBb3NzdmJXdTlrYjRoKzdT?=
 =?utf-8?B?cUlVamJnMU0vM1JGejRHY3NaZ3dZelliYVNTa2d2M2g0S094RTBaNXBPaVdJ?=
 =?utf-8?B?cU53Qm91S0NMYnpHeS9TbktFTkhNYmdTS0VOSzZRT2o3ZDBncjVqbzFsdW1R?=
 =?utf-8?B?L0E4RGZSQWtqQjRiMERFK2lHUUZ4QmRJOWZINVk0VHlQRDlKVlFlRTFHeWNj?=
 =?utf-8?B?Q2srZmhsWTV5STlnVUNSaTljWGFHRlFUQTVWNlZvS2JXM2R0YWQ2NDllZGl5?=
 =?utf-8?B?aHNhajZ2bWU5OEEzeEZRYnRNVXVHOFFXVW1jb3pLWG1mRG1MckpaZlFkZ2VK?=
 =?utf-8?B?VWc4cWJ6M3JjRkc5VFFka211WkNSZjJoQytTZlR6czkrbFFXQ29CVEpab2R1?=
 =?utf-8?B?Tlp5M2dYL0NRNVdPTDV4Z0JKZnNmTDQxWS9BbWhPTlZPUS9DcE9admlzN3Vh?=
 =?utf-8?B?ZzBDUHVyY0tXVmVteEdVem0zZG13UHRGb2FncFZQd2E4MTVtTUNPR1BvUzM4?=
 =?utf-8?B?WWp0VnY4alUrR1FDUzduZmoxa2pJckdVOWlKK1lteWpRODZKRnpGTUhwaXpV?=
 =?utf-8?B?R0RMVFBmUnhFQkl0MFZsOFkxdER5eDl3Mzl5VUQzMytWZ3BPVnVxMDFub1Zk?=
 =?utf-8?B?V2pSVkIzYmFCL2NMVFA1dDhvV2ZaWHo1UlNhbTRoWWh2cjJucFNaU2N3aUVx?=
 =?utf-8?B?MTI0ZXZZazJvOUVNQk1DZjNKcjBoMnJFR2ZpZTNEZjh1ME1UaC90djE2R1RL?=
 =?utf-8?B?L0FaaVZEbkRFaW5KSjJIeU0zTnp0Q1FEMm1NUGhhVmpyaGlpZ2hqdUpOWUc0?=
 =?utf-8?Q?6R1WHI6sVs1oyRKdoDW9eaLIPewj0lKhJt3dPH+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJremd4aGpURks3cFZSWUdGc3FaVUlaQ2V0bjVRRFo2b2RZVFduWEg5MUhh?=
 =?utf-8?B?a1BSdzVQMGJFcm9wT0xST3BWZHlYSjJyZGxUb3NybDZMRjhUNk9OTWFZSzVS?=
 =?utf-8?B?RkhOVGN4TEhGaXF3Q1dJRnFnNldZdDFhSEhSYUtHYVdtVjF6V1VjSktGRWVi?=
 =?utf-8?B?eldRQTgvVmtBUE5ZcTk0T0ZpeGdxSnJwVklxMENHRng0K3M2Y1dVMzNicmtI?=
 =?utf-8?B?K1gvNzZUckZJb0dHOCtCcU1nTlZFcE9rN0FzRTRPenpsSGRnbkFQa0JnQ0hW?=
 =?utf-8?B?SGljMk1paE5XZTlvQ0Vld3VKeEIvMi9nNHZLR2VpUG1vVWV2L3NMckVnMWRo?=
 =?utf-8?B?MHlPMEJxWFRFdjVoOUNVR1JxVkQwV3lETWEwblR4akw2dU5ud3lEcEZHNEgy?=
 =?utf-8?B?Zzd4cUlxQXh3d2dGWG80MWprYkJrSEFBN2w1NGltUkNVeWluRnUrdVl3QWQ4?=
 =?utf-8?B?TDRtYXU3RXNtNEtJYWdndzdEZXZEWXNYeEFydlBZT1NLbHlYSHkzeGFQRXBK?=
 =?utf-8?B?ZStQaStvd1VDL3k5dXR0SmlNMURUUkJSYjBjaU1hVk1kOGV5ajZqMDZzbC9q?=
 =?utf-8?B?NmVVamtWZWllaEdwdGhnRm90U0pLVWNCK3ZYV2F2cG10TVh0clBEQzhaYWli?=
 =?utf-8?B?WnVCZkVuamNPVmpIMXZtL0s0dGpTWjlrdGFpbXZMRlAvQnRRMlU2a2E2SUFh?=
 =?utf-8?B?R2taTDVUQkdpc2VlS2Q0dkhzOTdkQlFnckNJZy96OUltanVpdHdQdEg3K1Aw?=
 =?utf-8?B?L2krT2d6eFNma0N2bXo5UjFwamxQeURrYllnZndudk1za0JwMlRDc2dLVkd3?=
 =?utf-8?B?ZG9rb1pDM2hMRTNoSWNXanRGTmJDdEdTbnBBci95TXZsK2dNN1dIb3lDalBr?=
 =?utf-8?B?MGJrclZIdnljRExVeGdHc1k5RGN4V1UvTVJ4T3pJV2NUSzFnQjVEcnRSMFQx?=
 =?utf-8?B?UndmdWs4L3g4MENFWVlwTzFKeTlHaGExbUU1dS81c2xWVm5qdmNjMCtraXVK?=
 =?utf-8?B?cU4zekFkcWVVRk4zenFxMGViMmJSdEx1QWQ0OTcyL0JXZmR4UWltNjBiRTV2?=
 =?utf-8?B?OWw5RTBUQUhIK2YzSWU3MDNOaSt2WHl1dnpUZndxL3hZY3RENVh3d2c1OVUz?=
 =?utf-8?B?NkR6Y1pKUHBHMFM0NWdaajZMZVlMbWsyM1p2WHBSdU45OVNSWXR3RHZHaUh4?=
 =?utf-8?B?aGg4R3IvL2E3aVNTcmhycFlBUUdONUFOamlBZW1pZklnRGtBUUdpU25lR0lV?=
 =?utf-8?B?U1doaFRmM05CcHF3SWI3K3hXQ00vdUlJcm13Ymh4S1ZaTTk4SXhBclZRUGlV?=
 =?utf-8?B?SU85UldRbEcyZHhFdkJpclNrK1BTa3VpbWxGMVZsN1IwSS8vamVEd1R1R0hV?=
 =?utf-8?B?dVBqUDVwMEN4L3MxNm9lUFdJQmJJNlBka3F3Nno5S2FrNC94VFQ2WHFRa2N5?=
 =?utf-8?B?K3FVZGtxR0plc3J2ZG5ZdmQ1WWI3d25OMkpSdWk1eVJ3TlNub2tVRTJOWjg1?=
 =?utf-8?B?QjduVVFWcUx1d3ByWmc0S1o5Q2RUZW43SytaWGlXQmtBMHREN3pORXlXcEZ5?=
 =?utf-8?B?NkJZcStYMERKdHU5Y1dIZk10MVZEbGNLRzhmUUVPM0E3ZHFnTFNudWU0R2ll?=
 =?utf-8?B?eDdtQnk1cG9iUlg1dzlNUEdtZkRwZW80dDIxbVdEV3cvclZQVWkraTMxUEFl?=
 =?utf-8?B?aTZjTE95Z3BWTFVOc0ZIakU5ZElNNi9oY2hNUy9JVDViUVBEMjcycnQwUHJC?=
 =?utf-8?B?eEZORDE2RE9mb0phUGlacWkvMjMvWWZvWWczWW1TQ2dlZUhMQ3JmMGV0dlRZ?=
 =?utf-8?B?ZENQVFpZNloyZUlNREpseVVQUTVmKzAxOXZkZW50ZmQvc2ZXbG96ejRtQ0NU?=
 =?utf-8?B?dXJwUTZPd2w4YytTelRVSGlpOUd3dXhUMVNaYktVRTJub251blVrSm1JeDhm?=
 =?utf-8?B?aUFrand4OVVUcDNOdld5U2xOeEhDcFRvdEhYcTVOOWhkd0M3NEU0OEtHdWxU?=
 =?utf-8?B?NXRzRlFNaWt0MHV5MkpYaDg2Ynd4Yit4SHpNZEZhdFpOeW8wMGNTeGFkSkxr?=
 =?utf-8?B?eW9zTkVwdk4zZk5JZy9rUDRwMytSemVXUFZLa2d5YjB6U01rRzBKdGxrek8v?=
 =?utf-8?B?TXIvL0prcUxQM3hPU0VrNEhEOWUzb25TZWxFdHN1a0NZZzdKeVYrYmg5amlx?=
 =?utf-8?Q?buV1Uab90jG3vJCQrhM6298=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfba7a7-79d7-491e-bd33-08dc918028d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:24:40.8217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ggnNaZa5Jev/hcnyiWWXCk/KSluzo0LjAMMrXJCEanHbpNXLFSvNTTPLsFnxJrlkC9OMxPnWpXvMXiRHmzAWDswGyTzT4f+2nINS7r7cW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Thu, Jun 20, 2024 at 01:00:32PM -0700, Ashutosh Dixit wrote:
>Include Perf/OA changes from the kernel in include/drm-uapi/xe_drm.h
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> include/drm-uapi/xe_drm.h | 291 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 291 insertions(+)
>
>diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>index 1100dfe1ff..d377572aa3 100644
>--- a/include/drm-uapi/xe_drm.h
>+++ b/include/drm-uapi/xe_drm.h
>@@ -100,6 +100,8 @@ extern "C" {
> #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
> #define DRM_XE_EXEC			0x09
> #define DRM_XE_WAIT_USER_FENCE		0x0a
>+#define DRM_XE_PERF			0x0b
>+
> /* Must be kept compact -- no holes */
>
> #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>@@ -113,6 +115,7 @@ extern "C" {
> #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
>
> /**
>  * DOC: Xe IOCTL Extensions
>@@ -685,6 +688,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>+#define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -1370,6 +1374,293 @@ struct drm_xe_wait_user_fence {
> 	__u64 reserved[2];
> };
>
>+/** enum drm_xe_perf_type - Perf stream types */
>+enum drm_xe_perf_type {
>+	DRM_XE_PERF_TYPE_OA,
>+	DRM_XE_PERF_TYPE_MAX,
>+};
>+
>+/**
>+ * enum drm_xe_perf_op - Perf stream ops
>+ */
>+enum drm_xe_perf_op {
>+	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
>+	DRM_XE_PERF_OP_STREAM_OPEN,
>+
>+	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
>+	DRM_XE_PERF_OP_ADD_CONFIG,
>+
>+	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
>+	DRM_XE_PERF_OP_REMOVE_CONFIG,
>+};
>+
>+/**
>+ * struct drm_xe_perf_param - Input of &DRM_XE_PERF
>+ *
>+ * The perf layer enables multiplexing perf counter streams of multiple
>+ * types. The actual params for a particular stream operation are supplied
>+ * via the @param pointer (use __copy_from_user to get these params).
>+ */
>+struct drm_xe_perf_param {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>+	__u64 perf_type;
>+	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
>+	__u64 perf_op;
>+	/** @param: Pointer to actual stream params */
>+	__u64 param;
>+};
>+
>+/**
>+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
>+ *
>+ * Information exchanged between userspace and kernel for perf fd ioctl's
>+ * is stream type specific
>+ */
>+enum drm_xe_perf_ioctls {
>+	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
>+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>+
>+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>+
>+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>+
>+	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
>+	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
>+
>+	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
>+	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
>+};
>+
>+/** enum drm_xe_oa_unit_type - OA unit types */
>+enum drm_xe_oa_unit_type {
>+	/**
>+	 * @DRM_XE_OA_UNIT_TYPE_OAG: OAG OA unit. OAR/OAC are considered
>+	 * sub-types of OAG. For OAR/OAC, use OAG.
>+	 */
>+	DRM_XE_OA_UNIT_TYPE_OAG,
>+
>+	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
>+	DRM_XE_OA_UNIT_TYPE_OAM,
>+};
>+
>+/**
>+ * struct drm_xe_oa_unit - describe OA unit
>+ */
>+struct drm_xe_oa_unit {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** @oa_unit_id: OA unit ID */
>+	__u32 oa_unit_id;
>+
>+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
>+	__u32 oa_unit_type;
>+
>+	/** @capabilities: OA capabilities bit-mask */
>+	__u64 capabilities;
>+#define DRM_XE_OA_CAPS_BASE		(1 << 0)
>+
>+	/** @oa_timestamp_freq: OA timestamp freq */
>+	__u64 oa_timestamp_freq;
>+
>+	/** @reserved: MBZ */
>+	__u64 reserved[4];
>+
>+	/** @num_engines: number of engines in @eci array */
>+	__u64 num_engines;
>+
>+	/** @eci: engines attached to this OA unit */
>+	struct drm_xe_engine_class_instance eci[];
>+};
>+
>+/**
>+ * struct drm_xe_query_oa_units - describe OA units
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
>+ * drm_xe_query_oa_units in .data.
>+ *
>+ * OA unit properties for all OA units can be accessed using a code block
>+ * such as the one below:
>+ *
>+ * .. code-block:: C
>+ *
>+ *	struct drm_xe_query_oa_units *qoa;
>+ *	struct drm_xe_oa_unit *oau;
>+ *	u8 *poau;
>+ *
>+ *	// malloc qoa and issue DRM_XE_DEVICE_QUERY_OA_UNITS. Then:
>+ *	poau = (u8 *)&qoa->oa_units[0];
>+ *	for (int i = 0; i < qoa->num_oa_units; i++) {
>+ *		oau = (struct drm_xe_oa_unit *)poau;
>+ *		// Access 'struct drm_xe_oa_unit' fields here
>+ *		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+ *	}
>+ */
>+struct drm_xe_query_oa_units {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+	/** @num_oa_units: number of OA units returned in oau[] */
>+	__u32 num_oa_units;
>+	/** @pad: MBZ */
>+	__u32 pad;
>+	/**
>+	 * @oa_units: struct @drm_xe_oa_unit array returned for this device.
>+	 * Written below as a u64 array to avoid problems with nested flexible
>+	 * arrays with some compilers
>+	 */
>+	__u64 oa_units[];
>+};
>+
>+/** enum drm_xe_oa_format_type - OA format types */
>+enum drm_xe_oa_format_type {
>+	DRM_XE_OA_FMT_TYPE_OAG,
>+	DRM_XE_OA_FMT_TYPE_OAR,
>+	DRM_XE_OA_FMT_TYPE_OAM,
>+	DRM_XE_OA_FMT_TYPE_OAC,
>+	DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+	DRM_XE_OA_FMT_TYPE_PEC,
>+};
>+
>+/**
>+ * enum drm_xe_oa_property_id - OA stream property id's
>+ *
>+ * Stream params are specified as a chain of @drm_xe_ext_set_property
>+ * struct's, with @property values from enum @drm_xe_oa_property_id and
>+ * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
>+ * @param field in struct @drm_xe_perf_param points to the first
>+ * @drm_xe_ext_set_property struct.
>+ *
>+ * Exactly the same mechanism is also used for stream reconfiguration using
>+ * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
>+ * properties below can be specified for stream reconfiguration.
>+ */
>+enum drm_xe_oa_property_id {
>+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
>+	 * the OA stream, see @oa_unit_id in 'struct
>+	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests inclusion of raw
>+	 * OA unit reports or stream samples in a global buffer attached to an
>+	 * OA unit.
>+	 */
>+	DRM_XE_OA_PROPERTY_SAMPLE_OA,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
>+	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>+
>+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>+	DRM_XE_OA_PROPERTY_OA_FORMAT,
>+	/*
>+	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
>+	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
>+	 * b. Counter select c. Counter size and d. BC report. Also refer to the
>+	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
>+	 */
>+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
>+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
>+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT: Requests periodic OA unit
>+	 * sampling with sampling frequency proportional to 2^(period_exponent + 1)
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
>+	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_DISABLED,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
>+	 * @exec_queue_id. Perf queries can be executed on this exec queue.
>+	 */
>+	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
>+	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
>+	 */
>+	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>+
>+	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
>+	DRM_XE_OA_PROPERTY_MAX
>+};
>+
>+/**
>+ * struct drm_xe_oa_config - OA metric configuration
>+ *
>+ * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
>+ * particular config can be specified when opening an OA stream using
>+ * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>+ */
>+struct drm_xe_oa_config {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
>+	char uuid[36];
>+
>+	/** @n_regs: Number of regs in @regs_ptr */
>+	__u32 n_regs;
>+
>+	/**
>+	 * @regs_ptr: Pointer to (register address, value) pairs for OA config
>+	 * registers. Expected length of buffer is: (2 * sizeof(u32) * @n_regs).
>+	 */
>+	__u64 regs_ptr;
>+};
>+
>+/**
>+ * struct drm_xe_oa_stream_status - OA stream status returned from
>+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
>+ * query stream status in response to EIO errno from perf fd read().
>+ */
>+struct drm_xe_oa_stream_status {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** @oa_status: OA stream status (see Bspec 46717/61226) */
>+	__u64 oa_status;
>+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 3)
>+#define DRM_XE_OASTATUS_COUNTER_OVERFLOW	(1 << 2)
>+#define DRM_XE_OASTATUS_BUFFER_OVERFLOW		(1 << 1)
>+#define DRM_XE_OASTATUS_REPORT_LOST		(1 << 0)
>+
>+	/** @reserved: reserved for future use */
>+	__u64 reserved[3];
>+};
>+
>+/**
>+ * struct drm_xe_oa_stream_info - OA stream info returned from
>+ * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
>+ */
>+struct drm_xe_oa_stream_info {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** @oa_buf_size: OA buffer size */
>+	__u64 oa_buf_size;
>+
>+	/** @reserved: reserved for future use */
>+	__u64 reserved[3];
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
