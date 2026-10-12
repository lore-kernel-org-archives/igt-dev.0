Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0601CA9ED0
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 19:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2410E474;
	Mon, 12 Oct 2026 19:13:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71F210E474
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 19:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791832333; x=1823368333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E3SkuX7d5g1hrXJs0hcEBzGQedsajUrtBet/iT8hHDg=;
 b=SH759bDmmyngpcWhSjK3ryVw3djjHCXMU+nIep/XZnM9WDeKneok5HVP
 UKEKQdSaO4xwYL3LYupEDm/liGTw1H06A+Sp6WLUEjNzcpCiJlCHdATFb
 RUw2PZaUiomhn8dCsedUEAkVaA7XicDG9B7LSq6RY80YlSyTVZCXHOvEb
 YjAFyHyBoxb6gAhfcndAcAtj/tZG1q/1ioFADTxk9URsAdJQXzjA/7hSe
 HvhVbv5AI3l8z/uuuUMsoY95MGy8AFizlUvHIAokPzxCf6ugWVh5NMYjp
 elTTRggq4JTiVhwX+rNPn2Ua+sSAScZ7q7yUrraigVkP8kgMBLq8ErDy3 A==;
X-CSE-ConnectionGUID: HMAebG2PRWiUGHmwrg8q8A==
X-CSE-MsgGUID: TtbJujigRsGlzaPWpwvG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="536303"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="536303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:12:13 -0700
X-CSE-ConnectionGUID: GR3tw/sJTI2K9REDgLE5Pw==
X-CSE-MsgGUID: uuHyKMk+QFGOaUb7ZQIxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1086484"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:12:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 12:12:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 12:12:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 12:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w96ZkK6rftXKbFDTFamXQakb4BI4S3mKImXPr+FCxvChP2lZIXouKtjnLQnGBQ5kjcErQGOQ4pUp8OqzymsL9S5FWtrzb7uDrBb0yqUTfZHHD1ppDiXiVeEB07O7GX+C9GcfgIyTf0Wqs3MbNx3NzVf0layef4hUJuJ7jHhFNrqEDzz25nWUp+VkCMi+ocpYUp3M0ioSV8c/io81VwDb+9g1lIMH2/4FRkq6/mirqm2R4ao/eI3R8sosyf+HAwOvBz0EWCOj3hBFO3SfwGtkxbzN9kPZjBeclDXUaY50Eozv2jD2nreiV9J6a6OGh4r2KJEmQ0VLLC38lSW0nKcoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZNEzFlV0aV4TYCMInoYejqEcjZF08MdPJTLIwKJkLY=;
 b=HeJmLWbxCCjQENK6CsTKjjO/9O2TT5edMhJ80twdWMnuMBg3+1mslmB7EGWi5jz+vk2n9H1/Nc7cws+Kz67CtG8EjD4XiUBjSHvn4o7KyuOggJknG5VWLaGb1SBxCqILEKEPrIwCX7tBqigg8yforN9w7hA5MTHPm3kYQRu7kxifc+QK1DZwySBZvW4HoxImJZFMk/5mgaNbAeC/weqK8Or3HqZ9K6kufvwGbLCbMxqSlnO4jhghKH3btk0XCLU/mVG4bbrNM51mJZksaoj6vLrTZVG5S81g9s0z79q7o8L5PwVQgJ8nqGys9vQUfQreqNTXIt8ugLGxnfIBW21kTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 by SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Mon, 12 Oct
 2026 19:12:09 +0000
Received: from PH7PR11MB7148.namprd11.prod.outlook.com
 ([fe80::8ad1:8f89:43a6:e282]) by PH7PR11MB7148.namprd11.prod.outlook.com
 ([fe80::8ad1:8f89:43a6:e282%3]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 19:12:09 +0000
Message-ID: <cb268395-3068-42d9-b501-672fe02d3b74@intel.com>
Date: Tue, 13 Oct 2026 00:42:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_vrr: Let the pipe go idle before reading
 the DC3CO counter
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>
References: <20261012093308.731774-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20261012093308.731774-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To PH7PR11MB7148.namprd11.prod.outlook.com
 (2603:10b6:510:1ef::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7148:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 256dc42d-ae64-44f8-4a26-08df2894b68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|260925021311599003|260925021911599003|260925022911599003|11063799006|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: oV107tR9SEwmmKBa6D3bAjkARtCuj0QzaPAzUb32tN02X1I8RNO3zEpAQP827a2D3gRAea7eeBf4UyJ2b67loIcpdJQ0S+2Fk9sc+AgwMXmFaGmFWITGQvoKRncOCMIvsXW2mr/VhJieZfvYYrUzEoByBv9PCZXIAvyGNe0pfgVEbcEybifilfURfSTpG1EpeTidYOLWhjr17Jj8W4YEhhTvugufwpmPHRKnmfWbu8oQbrJcrRe7dWgJzpa/4Vas8OwAb5ETO1LNMyySgpSzfZIG4CBUmkivMpr10D1kLwtrMC9UcN0xK205L/wfplZkJL9GiMnouVSfeVkZD2XTfm+nYmQSRXPBtP2WolKYWt7LssizxQqOeOijjHb8tZPlIkQhBT+nci4ZjzODO4VjJ+l42Z+kk3kPc2wvnkNN1SCzA6gPXqSgSCL/klXGQ+TuyUh/YnF8y/xfJBkl/yq9RpBLSKcV6eXeFdCGMrNcLmGU77J/EereMJz6vZGIDOG8ZtugaWmByl6XrB764aOlJml9Gjxmd07Efw0pdnR00hQLKgbzM72Qp7zNE0EMUYpjLKfBHvGe2ERmFPBS+/RCkm64RZVB+fgIX0oE9ByTgqfZPxjas4pygLtnhU0YyDLFkPqkzMhVU7rappW1vOxDGstrs3fuktSBiUSW42v+e44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7148.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(18002099003)(22082099003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0p0ZzVtNThEa3FuZGpvL05pN0s4Ylkxclh5UDZWdWh1bjdVbnRhSUxCU2R1?=
 =?utf-8?B?cTFNcVBRazRVUncrZ0lVUmJnR1k5MUNiS21aL1BMbDNydU8vTnkvZGppK3Er?=
 =?utf-8?B?cmJNYXNVODhxa2g3UEZ3c2VkSUoyUXNIOWxiN3pQM2ZpVGlrWnIybGxqbUpC?=
 =?utf-8?B?SEsxWWp3V2kzanYxdk1NWjZLeGdHTmdHZ2NuYlU5Y3lCbXdnRmczTHk0TDlU?=
 =?utf-8?B?aXk0d09uOFBSUTRlNk1DSjUxdHYyRFZXa3dLUmh2cXpjVVNvYUpsaGg3NlFq?=
 =?utf-8?B?L1dwY05UQko5N2dleUdraFp6K3I0K3AyRUlsSzVjeW5BNzFQOXh6c0dyY0ZB?=
 =?utf-8?B?d25HMmZ0QTFPWmFFaGdOeWgwUzJNZStOKzFzZHNoTk5Jamd5aWJPSWFEZUlx?=
 =?utf-8?B?M3JaeVErZWRvdjVXc1lzVjBmNDdGQkFLckJ6RkI2MlhxT0ZXSHgvVTU2SGh3?=
 =?utf-8?B?aDkyS2pZNDZPTFYvWjJVY0RYZmllV0I3UDcrdGlHN0dNWEtRdVhTTmJRYm1P?=
 =?utf-8?B?RjJlbzZDM0lwczZGSzA3N2VFSTRqNG15SmhocURESkloNVA0TWdwRk9sTVgr?=
 =?utf-8?B?UE4vamlleWQxMlBnQWdtVzFqeXlJcFJodzdaRnl5K1I3S28zMWNVWXk5MmZ4?=
 =?utf-8?B?a1Y2YzNhbG1Ub3RQdW9SMVhFd08zQ3NSd1pXcVlWaEQrai80VHgyaWtRalVS?=
 =?utf-8?B?MC95a1Z3bzIva2pjYy9yL2R3by85dkhVUkhBZ0xVZ1dyS2VldnVxQWVrREpw?=
 =?utf-8?B?MTRwU0Q4RkZmOCsrOHZpRTJWSGFpS1NZSHJTaGVMK2hRK2RxSFMzVVBuWHNt?=
 =?utf-8?B?MGtFWnJXa1ZVVUprUWRqTGNhU0hTenVzL0tHUEVoVGhNNlBzUzhnK1duaVBn?=
 =?utf-8?B?MHpMYVdPSWllVDdYQ2dUdktESXY4VUxIZFlxRG9xZEM5SWRyaFNIaU1RbDRS?=
 =?utf-8?B?Wk5wUEJoN2RhNWtONXNXM3ZMSkxxd2VWRFNyc1pjaFZsNVRkVjllMDJoTnhu?=
 =?utf-8?B?TDd4WWQxLzVoZ2g3M05ScG12NEFGZlFZcC85aXlUaUs2MzdxU2VHT1BQRTZ3?=
 =?utf-8?B?c2liK0dreEdhaEZKelZCL1BLUlpxaTdLVzc3TTVrSU0yTWxTWUdrMkVnUUdj?=
 =?utf-8?B?RExDTzZoNmRJa1hEVkpTQTdXMTJBRkMzaWJ3QlZWVzZUdHFDN0tXeTYveUxu?=
 =?utf-8?B?NGtqTFRwOXJhSUg1cisyMmNpekJlY2JhQnpMQkJ4cTdNampRVVRaNStOYzNw?=
 =?utf-8?B?Z1NPd1RIUjVjcUdWekxEc0tneFlmczMzK2ZWdmd5MTdodExIVmxrbkdpRjNp?=
 =?utf-8?B?R1V4UFp2TWFWK3BNK0NJaHkweFQvdXVzYnJIbmdsamF4RGo5NXVlUVZ1MDBs?=
 =?utf-8?B?cW5JQk1yMFc1eThNSVlyWUhFbnIwc0VyeTIvTnEwV0xCbisyaS9LR3o3N2N3?=
 =?utf-8?B?Mk1mR0ozdHRWY0FrOWYwYkpCNFl1T09ob3pmSmdmV3lnYlQxcUxkbGlpbXh6?=
 =?utf-8?B?eVc0K21tZytVMFRDOFgzR1BZMSszSUloS1lmNXZqbERteE11WFRHeFRQTC83?=
 =?utf-8?B?Ukg1THU2dFN4b3RWNTBwWDRaYnFROWROOEVTbDVDUUtTeHg2M1Y5R0Z5U0M3?=
 =?utf-8?B?eldqQTcwZGt4d3hENUR0c2NJc2RNWnRpMmxUYzEzUGRieTU0K3AxR0hWSnN5?=
 =?utf-8?B?cWdzcDlWS2NISHBLT29nU1g0TjZzajFkRS9Dc3NpQWZRL0ZEN3MydysxQ0ZW?=
 =?utf-8?B?em1XQ29CM2pvTWpReS9Cem9zRFVoNlFWaldTQWhzc0ZUU0oxaml4aEFISk1X?=
 =?utf-8?B?cm1wc3RIaWlBNFFmaWltUU1OTEZsTTdoaG9xU1hDZ01OSjNIQkFqV2hxby9v?=
 =?utf-8?B?cTBTSnZJelJMVFJ2NlF2YSt5S1RjUnVoeVdBaUNoNENMVDREVEo1eDY2eFg3?=
 =?utf-8?B?Nkh0ancrNWpoWW8yNnltTlpuZFM0ZGJqY0kwK0tieHprdzc5Zk1WS2RMbkVN?=
 =?utf-8?B?MFhDR28wOHYxaFp3SzRvbXVOclNDTk5vTEJIdFJDSnFCWUd2R0ZIZTFwYlpJ?=
 =?utf-8?B?andGb0RlMnFTTWg4RWd4MmtzWkEyVkJ1QVdZaXh2R1dOYklBS3JaT0NtVTBs?=
 =?utf-8?B?cTJCSlp5T0dweHBDKzd0MC9oeFNwVDRQenpiZHk5STBWZUsrUFNBaVhMOEM5?=
 =?utf-8?B?Q2lYWjFERFpVaVl4UzNiTEx2UEF3SHNuZDhqNGE4cG4wUFJGbFVhYk16S2U1?=
 =?utf-8?B?ZGVDT2JkSmIzVStJTHVwYlVaaTNRTDJBOFJBY0dQdkFYV2hiUGZrK2FwVWJp?=
 =?utf-8?B?cEF4ei8vdmNITEZSaTVwYWM5aEpkdGlLN0F0clRJT3pwR0RwQVhYOU9ZbUE4?=
 =?utf-8?Q?Lg5DvXK97XoEaVzk=3D?=
X-Exchange-RoutingPolicyChecked: w34rw62vbKvp8rcOK5rLvocR86d6qixmN9/aLgx/Mkb56kVI3t3szg2TrEKgdEqQlLkew8D28QZQObqGKB47CkQ8IXEJ9r1EvFZj1HAsjvJ0rvmNqjR1Be+hgtSfL1sJWxnpmwGJ703Gpq2IM6EtzzovBdzbB8bUkVdlTLhSOr3MMGw5vppj5xz1IqHjVahYq04l2NTTWx2KNYYGypSmX/LnH+VWLafs41ni8PuwzmO/i+dIxzct9m7FZ3i5XaA1nORL4fWVbI4rc5QDoDoMjPM9Z2hndKrnjFvxiQ244O2l+C/lQVIe8WQPLRsL9DQTRKVJfpAqJeEBhJVJsmpgKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 256dc42d-ae64-44f8-4a26-08df2894b68d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 19:12:09.6075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+eXx1aqPQcLaSG327+W4v5w5tXCon8H0yZfg/fHUJL+ssSbJBxZHZf57UrOEGbjxfb1NoT35RZ55BJQyRmbGM11G7coMgQl0PguLDzp2nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
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

Hi Suraj,

On 10/12/2026 3:03 PM, Suraj Kandpal wrote:
> Every atomic commit holds DC_OFF until a frame after the flip, so with
> flips arriving every ~33ms DC3CO never gets a chance to be entered and
> the counter stays flat for the whole measurement window.
>
> Flip first to confirm LOBF comes up and stays up, then sample the
> counter across a second of an idle pipe instead.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/kms_vrr.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d83adea74..1a3e18740 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -106,6 +106,8 @@
>    */
>   #define TEST_DURATION_NS (5000000000ull)
>   
> +#define LOBF_IDLE_DURATION_NS (1000000000ull)
> +
>   enum {
>   	TEST_BASIC = 1 << 0,
>   	TEST_DPMS = 1 << 1,
> @@ -1185,11 +1187,13 @@ static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
>   	 */
>   	rate[0] = __test_lobf(data, crtc, output, flags);
>   
> +	/* Keep flipping at the rate that enabled LOBF and count from there. */
> +	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
> +
>   	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
>   						 IGT_INTEL_CHECK_DC3CO);
>   
> -	/* Keep flipping at the rate that enabled LOBF and count from there. */
> -	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
> +	usleep(LOBF_IDLE_DURATION_NS / 1000);
>   
>   	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
>   						IGT_INTEL_CHECK_DC3CO);

re-float on the latest IGT.

IMHO, The sleep should be added after reading the DC3CO counter and 
performing the LOBF entry check. That appears to be the right place for it.


         dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
  IGT_INTEL_CHECK_DC3CO);

         test_lobf(data, crtc, output, flags);

         usleep(LOBF_IDLE_DURATION_NS / 1000);

         dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
IGT_INTEL_CHECK_DC3CO);
