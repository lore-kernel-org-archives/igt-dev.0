Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1FFC79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 10:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1707A10E5D8;
	Thu, 10 Sep 2026 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHvP7boX";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2026 10:32:54 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5603010E5D6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789036375; x=1820572375;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dFxc96bQN0kOdTleVgFNSXT7USecWHqPlTnsu+S5zqQ=;
 b=RHvP7boXuhTMMEylSt81oiR84H6oYdxbkPhM9sIdA1J84yGoUtQoqFFM
 PQixSTSvg+zDLvcJBdiXZFopK9CU+fX3DDvjbBWq6Nlj4fSWOd04H+cyv
 uHOotT0pUzS15rGsknITuFKkKQm64iQnGm61QajERPuY5zp5s0rt4z5Jr
 45dC3nwBkXJAAKQ1B9k+FJyPq22zohtnwK7ejBWHpRLxnvam/0itiMPVj
 JbaA0a7fZQMG9noXQAcXsEbTbiYMCwTSNpySR+de4KrfEbsyg6+3WGeU6
 5D8EWU8yUagVEOAN8Ic2D8AINQmXLkXoLsiz9uDjBCHYqAj4x72OZ1stK g==;
X-CSE-ConnectionGUID: jvVAhoN4TpW2jT6XxSW8VQ==
X-CSE-MsgGUID: 6hnIvvXSS5qcobo6Izv9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="3251"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="3251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:25:44 -0700
X-CSE-ConnectionGUID: 7W5JzyVmSbiY3YLHyYe3pQ==
X-CSE-MsgGUID: GWknkQQbTnG7o8ZUiZhduQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="301484578"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:25:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:25:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 03:25:39 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNu9fuvJ6CH8IN1ZbyJD0xLlGZlGSbwBrRxERiSLI/QeI1lycQnzkXtUC150PpF54vG4zkm2GNaOjOCTY7EKVQr4JxkCkWL7xLpVB2tCRC83oa27I4m+LRJUU+wOroM0i/E8dWhhtaNnoyT7BllxsNoaM7/yHncnQvEosarkk96EqI47+/Z38hGFc7rznyJc5a6HEljrP2TLkRJCFB3motqFn7igQC41HCj2oAfZXcd/YLV4bu+5jBcxSHxiEoShBRgh+GRfx1x2v463xD/nRqKqQN3dmTio+UdGlJQZ/SXpz3MkUBDqxT46PTLtKEitbzJMqqoM3OdTAQsRJWP5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV2ZzitzrlrnP8C3T1bFv9+XQyxVRQUKOMyO5hjRSnA=;
 b=xM5D81undwLkwR3WmvHiQlFhPq9wKIDj0c6N8pHrMR/8E0LBr6trSeI8Ka4Pq+i+aATTkj3kWpBybKBjK5IpQ6yOCLBD+5H9YTtgoAmv9os8Lou41SU5hhEHaQkoGKViD7VemAsJ38bQrDGrMatUjPHsk00cvHPoKK33SoJAELv2e6Z3ToKOskLy4LF4TiXB3U+ebxD0/PrWZav1GAgUfAhbebYjaFXVwtHFVEVQBJ/WSEFvNMhz1BM63F/ERLH+ncIl9CgChHBxd+pMaavwvhxV27VHgaMRWDnmVQXVjHj+N/R7MpEP9nTzp8/NBldxZ3xKEf8kbsTlnStFv960Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 10:25:36 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 10:25:36 +0000
Message-ID: <e7bc3094-7254-4482-a17b-de4487b1cdf4@intel.com>
Date: Thu, 10 Sep 2026 15:55:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/3] tests/kms_vrr: Add CMRR fixed and video mode
 subtests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>, <karthik.b.s@intel.com>
References: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
 <20260907174836.3159214-4-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260907174836.3159214-4-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0227.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS0PR11MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f27cce3-acc8-4f1b-b290-08df0f25da78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|3023799007|10067099003|11063799006|56012099006|4143699003|22082099003|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info: M5xd8eZ6ip9qopmSMAgOkxJlbA7kyoLKfkyO4l3Dqy3tS4x3n7KaMNaOAUtMetpHNjt2wu38prnP23+hAgRA+j98hTeG/ymzg01zAJMDRgXjvyqWJnVRd0ZizQarWox3C+oFTGEIl11No+yeSD24B7oqN1Ch+ewlFnEGaMUHvLwQsParJq1cda9r0K/fOFjmU8a91+j+iambLL6InFcSrw4ZOiIS6a2284x3JK/OHF3zMBdzd2TI9KdHhStYdSvX2zacaxeTDnWsIzGeT0HlkOHvxU8K7Yo/nwyVjLLUlBE1Gsg4oe17PDGiidSBB5t8AuN27dRFZVzTKT7i0ysZrC0juInuQ3t0LzwHZ6mtalliRQ/XJ38B0TczLh0jyPzoPVjMahyFiZDM97PL3jTYV11xgeKaWdtMifZZyZgNd2s4kkaSo3IBwgj6uJmauJr9akAMJ1I9qWr3fNcZDidz6ijDa1bL2UgmsFuI8qb7AudrpfXA29GcDo8hEYbFqtuzd/a+5sCk3Qz6CoYFzJ6UNU9+Bdj2zOW0hHYBrDZDYkO/J/4LcOaxYwzKo89+pNMScuwfItI29WRBInjA1rcBE9eqEkKN3l5kBmftcRwn1BF0ti6AXgdMlbFgrcwCDOP3eqp0165JlsLt8npf8fVmPEr5OliJpgcI0uulT6guV08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18092099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDcxbWJRaGYxdGZUWDV4KzNxaTNSbWtBZVliVHVWdHFyZDlwL096ZVFlWDgw?=
 =?utf-8?B?bWVhVXJQMVZzamZxbm9ZMGRST3RqYnFaS2NhSm04Y3g1cXIvaGxqcFJCMzF4?=
 =?utf-8?B?WXd6UlAzY0lsbGl0SDhkUEJTRVFucWg5N2NSQllEcURWTDRTRTZNMnF0Nyty?=
 =?utf-8?B?Z21kM0tFMW96VktTZXNSWkNwbHdFMW1ldVREd2l3RDJXTmZTWkREN3ZDMlh3?=
 =?utf-8?B?VXJ1SnJreU8vNjhzaUJPQ1Y3LzlHN3BRaDUzREUyOWdjMkx6aU5NTFZ1Z2x6?=
 =?utf-8?B?eTZnazJGNWpMUTNhZ3BVcmgxTEVFTVlyYTltMHVRd3lhZ21sQ0VpZUZRdmRV?=
 =?utf-8?B?b1daMkpEOTh6d1BpN3RSSnc0YlBHdWxrbG9aa0FkUmtNK3B4amI0Tkd2d2o3?=
 =?utf-8?B?d2lKdDNxVEh3NDMrcEJwV2pIN2RtTWowSEw3VndPQkxJMEdRQWkzRzJ4TGhT?=
 =?utf-8?B?L1lNRXM2NjZaaUpPWEpXSzRQb2U0RW5lRXA2ZEk3SVdXL2s5RnI1MjR4bDRn?=
 =?utf-8?B?RTZ4OGhJSC94OXFtMUZHdy9FV1FnUHFsT3JTZVVaV0RHZGNMZDRIMDdFenN3?=
 =?utf-8?B?cDBGS05JcDRsWDJZR1hNZDJlaE14ZE8wQWthNGJaS3hHQzlDdTNuc2dTSlhC?=
 =?utf-8?B?VzU5WVJkajI4RzZ4U1o4elN4dVdtV0RsWEhkdDVjTVYzQld1aHhtUHpneERx?=
 =?utf-8?B?T0JrYVhnK0YycmJDalEyam5qeDZ1MS9rbFJEZkhtZmJqT0M5ejVqL2F0ZThZ?=
 =?utf-8?B?b0JvK2pDQWgzM0xwNW9JMnhuQVc0eDF5KzVQRXhxQ1R2YTJ6U0RrOXBaenlV?=
 =?utf-8?B?SUxxVnFySTJ2NS9UWTFwek5RNkxGakNpWjcvb2dMQnlnMGh3c1UrSTBmZTZ1?=
 =?utf-8?B?cjNFZ3AzSmxSMERPVUtaRlFERmdyaU5HbmdEQ1NrNXZGVXcvMFdvdVZoSlVV?=
 =?utf-8?B?dTlveVNrS3JDbm9pQWcyRFFHTlZWdFVyVWpZN0J3dGpJR2JMVGV0TUFJaWsw?=
 =?utf-8?B?TmlRa0o5NTNhQ2wveTZYZWJxbCsvUXNKVFNQczh5ZUtEWmJOdEdZYjlVZ2dI?=
 =?utf-8?B?TWFGL3c0SWVaYllPcGhiczIyRUUzSHJaRUlXak5tZk05K3kyU0Z6WENrWFFi?=
 =?utf-8?B?NWZPbVRGeGJtWmNKaUE4QkhnNWQxVC9TQ0hsNHVRQ2JydVVOai9NdGtJd1NR?=
 =?utf-8?B?ZTNrYi85MnY3WWxGSlhLajBqNE0ybVZSUmhERHBJdDU5aUxvZStDaVEvSEoz?=
 =?utf-8?B?ZHFmQ0k3YlpBSmFrQkpINnFuMTU3UnVnckYzdzlyN09mVzNCb0VuQ3VkeE1G?=
 =?utf-8?B?OEV5R0V4NCtOWTNjdnFTWUZsWS9HMGp5dm5rbWw1OEh5aTlucFNyVWhYMVBJ?=
 =?utf-8?B?N3A4MWVNVHo5VVdibDZ4dUErOGlIR1NsVDJLTUM4clJVUTdZQVZCc0FwWE80?=
 =?utf-8?B?QXZKKzNWZmNRbTVaNUJRL3dRL3V0TW9EemdQa0c4Qmc3M3I4bXF4ejI1Q2tq?=
 =?utf-8?B?dnhScGRwcWlGWjJFRjZLOFhMQVlucGhQUGJtQkpzNThqS3RITEorRGJabXhT?=
 =?utf-8?B?MGFLWEdnYTAyc3lwR1lNMUJ0eUw3eUdLK1FzTTVWbG9NUzYzVldQQjl3bDlG?=
 =?utf-8?B?MkZOdjNFcHpIcjl2RS9xTDVCR1dTSG5UNjZVWXV1S0lMVTE1cVliT0xYeDhZ?=
 =?utf-8?B?R2JuYWl0ZWgyUnBDNzUxNUhVWU5MN1BxbFMvbDAwZUs4RTlpSDFWbUdJakRD?=
 =?utf-8?B?OTRzZnhuL1BvYnhPQUJGZWQveTNWaStBQ09ESndMZHlSTjFFeTJOdExqU2Jo?=
 =?utf-8?B?cC9IZlQ2dy9xaWRsSWhNTWl6UVdpbkhkRlJEai9FZUhHckVFZlhRS05vN2FU?=
 =?utf-8?B?TytuRDZHMlhqTTFMY0NUUVdEYVNEMWZYY2NWQmdIbkV6R3JTVVllUm1xcUJq?=
 =?utf-8?B?V29kV2NKa0VVRzk3ZmZBZ21BRWlJOEhYdXJndklCTzZVV1RCUFpIUzh2ZWFK?=
 =?utf-8?B?Y3AraXFPcFNDbUY0UXdUbnAvem9aZnZ3THkyVEhqYTkxUHFUZEFWM3FXUHNN?=
 =?utf-8?B?U29yakxUdzJrUGxQV0RQMDkrbGk5MVFGOTAzQm9kbElMc3NiRDhoS1gvVk0r?=
 =?utf-8?B?aGJhSE5uNWZSK2s4VkY0RkJyMHQ0Z0xLUWl4Y2NyT29RbHN1ZmZZdEdrQ1A1?=
 =?utf-8?B?bHFGc3lWT2hNUCtEYnFNSnpZaG02dG9XNEU3WDJCZUM4eVhwck5pUHpyYW1Z?=
 =?utf-8?B?aXVQdU5JR3FUK0psdUNuK3k5Z1E5TFhzZHdTejB4YnV1c0xCN3FEb01GMkJV?=
 =?utf-8?B?NzB0MFJFNllnTXVhSG9nOGl2WEZpN3ZPclhQQUhPNVNISzFEbWViWm1xSEU1?=
 =?utf-8?Q?QyKfJ14pUoWP856C0Aw87p5gaQwCaUpNYmfe6?=
X-Exchange-RoutingPolicyChecked: dPCvzo/T2rgAUV6HXgNEK9WPHtvcjn+WmM26huUNpqUI/qFfQd7oy2t5b/qiY4nbkSknoRDujoZMa4e21UDlm2dde9BrxdpW4pHJHUZWmr25U+v3fJLhj6zC3oeCVHXqRn8UPWwnH9VBlbdEoXt6q8v1VyEdVhayWSOwiD0us+ytQUdPJyQyuT4GyUpSrF9shIBK/J0PY2WudCxf4ND5jryzf1IUp4GB5AStQZH0/SFATCBdLYTfZvm3Vq9giWEAjUu+lG8wxePgzPJBmfPwMFv6vEpZUBbHg74Lk/XBN/xkqbsqroZTpgW8l48B+vuIJmsORWE/okTb1lGjPLgFvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f27cce3-acc8-4f1b-b290-08df0f25da78
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:25:36.5054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0Qq/l7SBIpmdPSzbQSe/+bJIc0a0PvL27URoJkT6UiXeXgFXFDuh2BPNxGGBe0tDK54g3rOj+8HvkUKcIClSd+y/DRKYg55k1oJinuXZkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
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



On 9/7/2026 11:18 PM, Naladala Ramanaidu wrote:
> Add test coverage to validate Content Match Refresh Rate (CMRR)
> behavior across both fixed and video timing display modes.
> 
> This introduces a shared helper library to support refresh-rate
> mode selection and parsing, along with two new test cases covering
> fixed-mode and video-mode scenarios.
> 
> The new tests measure actual display refresh timing during CMRR
> operation and compare it against the expected target rate to
> verify correctness. Video mode coverage validates behavior across
> standard video timing rates, while fixed mode coverage targets
> display modes that fall outside the standard video timing set.
> 
> Each test cycles through the relevant refresh configurations,
> applying and resetting the appropriate settings between
> measurement passes to ensure consistent and isolated test results.
> 
> v2: Fix test issue.
> v3: Address review comments. (Mitul)
> v4: Fix test issue.
> v5: Address below review comments:
>      - Rename CMRR fixed/non-video mode references to desktop
>        mode. (Chaitanya)
>      - Factor out vblank timestamp/sequence retrieval into
>        helper. (Chaitanya)
>      - Simplify CMRR tests by extracting common mode logic. (Chaitanya,
>        Mitul)
>      - Refactor CMRR refresh-rate verification and frame filtering.
> v6: Address below review comments:
>      - Document skipped vblank intervals and fix seq_delta
>        format. (Chaitanya)
>      - Fix minor style issues in CMRR tests. (Chaitanya, Mitul)
>      - Add mode existence checks for CMRR test paths. (Chaitanya)
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 240 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 240 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 27f18e8d0..109b4629d 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -32,6 +32,7 @@
>   #include "igt_pm.h"
>   #include "igt_psr.h"
>   #include "i915/intel_drrs.h"
> +#include "igt_vrr.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
>   #include <signal.h>
> @@ -80,9 +81,22 @@
>    *
>    * SUBTEST: lobf-dc3co
>    * Description: Test DC3CO entry during LOBF.
> + *
> + * SUBTEST: cmrr-desktop-mode
> + * Description: Test to set a desktop mode CMRR target refresh rate and verify
> + *              it is correctly applied.
> + *
> + * SUBTEST: cmrr-video-mode
> + * Description: Test to set standard video timing refresh rates via CMRR
> + *              and verify each target rate is correctly applied.
>    */
>   
>   #define NSECS_PER_SEC (1000000000ull)
> +#define CMRR_NUMERATOR 1000ULL
> +#define CMRR_DENOMINATOR 1000ULL
> +#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
> +#define TARGET_RR_SAMP_COUNT 100
> +#define CMRR_RR_TOLERANCE_HZ 0.02
>   
>   /*
>    * Each test measurement step runs for ~5 seconds.
> @@ -103,6 +117,14 @@ enum {
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> +	TEST_CMRR_DESKTOP_MODE = 1 << 13,
> +	TEST_CMRR_VIDEO_MODE = 1 << 14,
> +};
> +
> +enum {
> +	CMRR_VIDEO_MODE,
> +	CMRR_DESKTOP_MODE,
> +	CMRR_DISABLE,
>   };
>   
>   enum {
> @@ -221,6 +243,38 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
>   	return mode;
>   }
>   
> +/**
> + * get_mode_with_video_timing:
> + * @output: Display output containing connector mode list
> + * @fps: Requested integer refresh rate in Hz
> + * @matched_mode: Returned mode that matches @fps
> + *
> + * Find and return a connector mode that matches the requested
> + * video timing refresh rate in Hz.
> + *
> + * Returns: true when a mode is found, false otherwise
> + */
> +
> +static bool
> +get_mode_with_video_timing(igt_output_t *output, uint32_t fps,
> +			   drmModeModeInfo *matched_mode)
> +{
> +	drmModeConnectorPtr connector;
> +
> +	connector = output->config.connector;
> +	if (!connector)
> +		return false;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		if (connector->modes[i].vrefresh == fps) {
> +			*matched_mode = connector->modes[i];
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>   static drmModeModeInfo
>   low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   {
> @@ -580,6 +634,177 @@ flip_and_measure(data_t *data, igt_output_t *output,
>   	return 0;
>   }
>   
> +/* Measure and verify the effective refresh rate against the expected CMRR target rate. */
> +static void
> +flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
> +			   double vrefresh, uint32_t cmrr_mode)
> +{
> +	uint64_t last_vblank_ns, vblank_ns, frame_time_ns;
> +	uint64_t total_frame_time_ns = 0;
> +	uint32_t last_seq, seq, seq_delta;
> +	uint32_t err_frames = 0, valid_frames;
> +	double avg_frame_time_ns, avg_refresh_rate;
> +	double  expected_rr = 0;

double space.

> +	bool front = false;
> +	uint32_t i;
> +
> +	switch (cmrr_mode) {
> +	case CMRR_VIDEO_MODE:
> +		expected_rr = (vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
> +		break;
> +	case CMRR_DESKTOP_MODE:
> +		expected_rr = (vrefresh * CMRR_NUMERATOR) /
> +			      (double)CMRR_DENOMINATOR;
> +		break;
> +	case CMRR_DISABLE:
> +		expected_rr = vrefresh;
> +		break;
> +	default:
> +		igt_assert_f(0, "Invalid CMRR mode %u\n", cmrr_mode);
> +	}
> +
> +	do_flip(data, &data->fb[0]);
> +	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +	igt_wait_for_vblank_ts_seq(crtc, &last_vblank_ns, &last_seq);
> +
> +	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
> +		front = !front;
> +
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> +		igt_wait_for_vblank_ts_seq(crtc, &vblank_ns, &seq);
> +		(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> +
> +		frame_time_ns = vblank_ns - last_vblank_ns;
> +		seq_delta = seq - last_seq;
> +
> +		last_vblank_ns = vblank_ns;
> +		last_seq = seq;
> +
> +		/*
> +		 * Use only single-frame intervals. If delta > 1, one or
> +		 * more vblanks were missed, so the interval is not valid
> +		 * for calculating the average frame time.
> +		 */
> +		if (seq_delta != 1) {
> +			igt_debug("vblank seq delta = %u\n", seq_delta);
> +			err_frames++;
> +			continue;
> +		}
> +
> +		total_frame_time_ns += frame_time_ns;
> +	}
> +
> +	valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
> +
> +	igt_assert_f(valid_frames >= 90,
> +		     "Valid frames below threshold (90): valid_frames=%u, err_frames=%u\n",
> +		     valid_frames, err_frames);
> +
> +	avg_frame_time_ns = (double)total_frame_time_ns / valid_frames;
> +	avg_refresh_rate = (double)NSECS_PER_SEC / avg_frame_time_ns;
> +
> +	igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= CMRR_RR_TOLERANCE_HZ,
> +		     "CMRR refresh rate mismatch: measured avg_rr = %.3f Hz, "
> +		     "expected_rr = %.3f Hz\n",
> +		      avg_refresh_rate, expected_rr);
> +
> +	igt_info("Average RR (Hz): %.2f, Expected RR (Hz): %.2f, error frames = %u\n",
> +		 avg_refresh_rate, expected_rr, err_frames);
> +}
> +
> +/**

Did you intend it to be a doc style comment?

> + * Programs the requested CMRR target refresh rate for @mode, verifies that the measured
> + * refresh rate matches the expected CMRR behavior,then disables CMRR and verifies that

nit: behaviour, then

> + * the refresh rate returns to the mode's nominal refresh rate. The function asserts that
> + * all target refresh rate programming operations succeed.
> + */
> +static void
> +run_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +	 const drmModeModeInfo *mode, uint32_t cmrr_mode)
> +{
> +	uint32_t numerator, denominator;
> +	bool ret;
> +	double rr_from_mode = igt_vrr_mode_line_refresh_hz(mode);
> +
> +	switch (cmrr_mode) {
> +	case CMRR_VIDEO_MODE:
> +		numerator = mode->vrefresh * CMRR_NUMERATOR;
> +		denominator = CMRR_VIDEO_MODE_DENOMINATOR;
> +		break;
> +	case CMRR_DESKTOP_MODE:
> +		numerator = mode->vrefresh * CMRR_NUMERATOR;
> +		denominator = CMRR_DENOMINATOR;
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported CMRR mode %u\n",
> +			     cmrr_mode);
> +	}
> +
> +	igt_output_override_mode(output, mode);
> +	igt_info("Override mode:");
> +	kmstest_dump_mode((drmModeModeInfo *)mode);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	ret = igt_vrr_target_rr_debugfs_write(data->drm_fd,
> +					      crtc->crtc_index,
> +					      numerator,
> +					      denominator);
> +	igt_assert_f(ret, "Failed to program CMRR target RR (%u/%u)\n",
> +		     numerator, denominator);
> +
> +	flip_and_measure_target_rr(data, crtc, mode->vrefresh, cmrr_mode);
> +
> +	ret = igt_vrr_target_rr_debugfs_write(data->drm_fd, crtc->crtc_index, 0, 0);
> +
> +	igt_assert_f(ret, "Failed to disable CMRR target RR\n");
> +
> +	flip_and_measure_target_rr(data, crtc, rr_from_mode, CMRR_DISABLE);
> +}
> +
> +/* Validate CMRR behavior for supported video and desktop display modes. */
> +static
> +void test_cmrr(data_t *data, igt_crtc_t *crtc,
> +	       igt_output_t *output, uint32_t flags)
> +{
> +	drmModeModeInfo mode;
> +	bool found = false;
> +	drmModeConnectorPtr connector = output->config.connector;
> +	uint32_t j;
> +
> +	igt_require_f(igt_vrr_target_refresh_rate_supported(data->drm_fd, crtc->crtc_index),
> +		      "CMRR not supported\n");
> +	prepare_test(data, output, crtc);
> +	set_vrr_on_crtc(data, crtc, true, false);
> +
> +	if (flags & TEST_CMRR_VIDEO_MODE) {
> +		found = false;
> +		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
> +			if (!get_mode_with_video_timing(output,
> +							igt_vrr_standard_video_timing_fps[j],
> +							&mode))
> +				continue;
> +
> +			found = true;
> +			run_cmrr(data, crtc, output, &mode, CMRR_VIDEO_MODE);
> +		}
> +		igt_require_f(found, "No video mode found.\n");
> +	}
> +
> +	if (flags & TEST_CMRR_DESKTOP_MODE) {
> +		found = false;
> +		for (j = 0; j < connector->count_modes; j++) {
> +			mode = connector->modes[j];
> +			if (igt_vrr_mode_line_refresh_hz(&mode) - mode.vrefresh <= 0.04)
> +				continue;
> +
> +			found = true;
> +			run_cmrr(data, crtc, output, &mode, CMRR_DESKTOP_MODE);
> +		}
> +		igt_require_f(found, "No desktop mode found.\n");
> +	}
> +}
> +
>   /* Basic VRR flip functionality test - enable, measure, disable, measure */
>   static void
>   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> @@ -591,6 +816,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>   	uint64_t rate[] = {0};
>   
>   	prepare_test(data, output, crtc);
> +

unintentional new line.

With these LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>v

>   	range = data->range;
>   	vtest_ns = data->vtest_ns;
>   	rate[0] = vtest_ns.rate_ns;
> @@ -1147,6 +1373,20 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		}
>   	}
>   
> +	igt_subtest_group() {
> +		igt_fixture()
> +			igt_require_intel(data.drm_fd);
> +
> +		igt_describe("Test to validate CMRR in desktop mode.");
> +		igt_subtest_with_dynamic("cmrr-desktop-mode") {
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR_DESKTOP_MODE);
> +		}
> +
> +		igt_describe("Test to validate CMRR in video mode.");
> +		igt_subtest_with_dynamic("cmrr-video-mode") {
> +			run_vrr_test(&data, test_cmrr, TEST_CMRR_VIDEO_MODE);
> +		}
> +	}
>   	igt_fixture() {
>   		close(data.debugfs_fd);
>   		igt_display_fini(&data.display);

