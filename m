Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6CEC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 11:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B5610E5A6;
	Wed, 20 Mar 2024 11:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUXTU9NZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A7410E5A6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 11:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710935801; x=1742471801;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=NIEMhaPyd7g42g2RUt+8fCPcV1q1NiS8Lj+j/qfJM2o=;
 b=MUXTU9NZayzVD/BBGB2JkH/TqVRQPPU6852J+uka0wJpJLG24Z9wiG2+
 ymdhJMCVkzSFj2+rCM000yMp6XioA8p7Xn1CedyR/vfCokH6UGPNbtKSa
 PPjDjKEAlpnjB5oMvC7HAQQ44Si4H4e1HNkQaVbPyPMcioEN4YqrS49wk
 Zsz5gwQHWDN+aDMbf2jLS1Ow7ba9GKaEjbb1qXkwkkNR+KRbOJnk91zr+
 CUK9fEYJJd02yBaCaqIJl2kPX/X2nAAMBRfoIG56L+uORdq6BHXl/SbUL
 NqUpqaluxxRrUG8IW0K1+cX7HLRyRy7SWcUtumLn1/muAlhIPa54RIQPo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16497055"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208,217";a="16497055"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208,217";a="14029664"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 04:56:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 04:56:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 04:56:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 04:56:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9TASwpAEf9NMCrqxn6Df1CR7FZhSvG+Bsi0YNLHXDLmKDO4fhy5PNHqG1gum7gQXrPra48NInG+v6p4E3lRagi34wYl8lH1bE0X/KnmPviMQtRFOS5NgI2wIuMlH2wE+4SgjEDt0FFkvmLekalcmLJH88yj1l4cj70rOTvtPWSCfO0hY6Qd6Di6JqGfzHZlukmNQHN5qyyvacoNZs7kzanRt3nBu7I4WmShz/u9t0nKuAXHTJ36+D/kcOB1gbpnydnUIx+5dKk0VEWYSZczYN6Sm6/+pmliCqWZMG67w6yAW+i4FM1tHr+kmQOfk9Q91AKCHxwM7mCTGVt1uYgvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncK1fF6Pb+B2xLAuaSxZoJhWrsoggi2nw3rkJGtl2ek=;
 b=fU/fY+u2p+rP8qWI4X7R6lGitBteCZR7Oi9F2GQV3buxqxggHiviitsJrfkxmLeFNcdpMqw9s91aXsCqWLAbGeeZD0zhGTVFZ1260cZWhQMP/+BbyOvFL2ToiN7N3ypNZQ5WdJ0j1ig7ZrZrlV9wtzMJTyPN93SIINdCewkQEYA54CXWe338gNdgCP5AxRo7TD5Mx7wyQ+8ttIBJ7JQbtJE7DcRoZmPev4N4R9S2ft7a9FBBB6Bm6EG3YV36KdHdFfgFRqp1HJhGBYSwbWXzTb7UJXK4yXh4ScIqQVZ0AwiDw8V+QAjZqEnWfZLd4pJXL0qfhwO0n7CpN1pUw2cXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Wed, 20 Mar
 2024 11:56:19 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 11:56:19 +0000
Content-Type: multipart/alternative;
 boundary="------------fIAgMHh80Ce49H051itr8kPh"
Message-ID: <2f4bb0d7-2fe9-4373-9995-9308dc5088b3@intel.com>
Date: Wed, 20 Mar 2024 12:56:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_compute: Add documentation of global
 workgroup size
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
References: <20240318085227.2624098-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240318085227.2624098-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 76064eda-6f37-466d-8d18-08dc48d4c117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WB3Q1oTJBpDVr1DMngWYrP9YJb0xPIMPSro+ONd7wy62RK6XUzCQuxUOsKtrU/9P2qI9UuxVSpR54kdhIbVs3nxUo5xkl88bI4zK0VzFuqzjJ2qo0hfiGj88uu1N788HhSfvrHkybfzn5PodUWfp8n7eMVfQiom6QlUf0X25obZHxTWyhoyrZOefWbbHGzREWTtW4edlpQzbQ9KC/nBcBXxqAfXQSz9LuIIiM2ca1eaIYgC/t5EAVuJ9r4AdTd98WZHqSr/ZXEoY0nLF1/09Ju0NjTyiSGrJXve3R48NLApyN4LToBxu1snCynEz4P1CIL4gWjVdBW5GM00iA0SkPxDlM+OcPCXqssIJ3PZglZRAKVfAxweUYr27GIGHoq+b1rXlEDa6OvHG1JhuROdPvc+wqNw6ZxBtV48n+1phv82o20E5BTLBCFWCUD8FDN2TeOdTRHulewN5gfAkyAUTGB7/q4+IwFsMDMQ7zfn/FNl2ZC9nzpuA9whdBTvSjHg0cu5l4am0EL0bNBI7/oxYBAPwxP4beQOu94f3euW3FlF1bbWS8cwOR9Vo4DzcEwUHmDzQcQcBNrrwa7vB+VphR21DWIuFOSkYELtQbD0JC0bovTq/NwXaXV2GSzH3cWr4+LiN32NuvbPPDdTCzHoXd78iYDJPUBNe7VbacSNVO1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtXMURKK0o0RVBBZmJpNmV0by8yUXVDUGVqK2ZVNm95SWQrbXdKSHN2bDFy?=
 =?utf-8?B?NVlkc1BqY0thaExvT2lFaFROUXdsZHdXNHZ3aFN0MHBtYk1NdjFGY3libnRa?=
 =?utf-8?B?WTR5TFg0WXEvWHRXVTErL2IwcTFLVEU0SzZYb2xUTXU1d2FBUHpNQVFKYlp1?=
 =?utf-8?B?TjFTNHRJK3g5d25IZXhOejc3Y09WNlV5eWlDTmc3eEFvVWtlWENJMit0eUVZ?=
 =?utf-8?B?blJ3OGZoYmNrcmNwVlRYQ25jUHJ6YU9HZWZDSVVTZWZMMFA4NTdxeHU3RzJV?=
 =?utf-8?B?dzM2UCtySGhjbDF3S2szNEJYMnhtVTBjSkV3WHNIZzMwM2tBOCtEOUdLOXpv?=
 =?utf-8?B?ZHVTOGc2UEtnUXRSUXhyNmtHN25yRHVHNThja3BmTm1Cb1c4QjlDOERmWXUz?=
 =?utf-8?B?bXV3TW5jUVhxQmljY2NNdjk3YmorNDNiL0lRaWZuWXdCRCtPeXdwNDQwdW9j?=
 =?utf-8?B?Y2tjdVVUVWVCaWQzNFo5cVJ4RDFCYzV3QlZZS2w5SUo3TGlKNTdkY081Q3Bo?=
 =?utf-8?B?akhoWG43cDRVRmgrNWlKVGEyMzZUNi8zenVKOE5iNHpwZ0dsNUFpM011REdp?=
 =?utf-8?B?S3BjLzVkclpUTk5tVWk0Ymh2RGdTVmtOaXhrUGcyWFhaN3lxYXExNEFOdm1t?=
 =?utf-8?B?VkIxOXltUlk4SndRN0d4bG5FQ2d4b1pHSlA0V0s4dmQzZWRZc1pHQVRZRUhI?=
 =?utf-8?B?SlF4cGk4b25rVlArM3p4dDJkeXpBQ3A2dXdOZEp1VHl3Y3dhU1lBTEV1MW94?=
 =?utf-8?B?RzBTS1ppVTBXNWE1ZGJ6dDl1clRxWW5tWnZPSkdSWXBybDU4blhEYlQ5MXJI?=
 =?utf-8?B?ejFydndBVTdLZC9iWXlhcGFoNUlQZjhmckpScE9LbGxuVDVpNFRYQ005aDN2?=
 =?utf-8?B?eEdVSGxudGNibWZrOG1VUGlkOXJ6cXQxNVBkWnRDSTl5V3RsU01oajRCRm91?=
 =?utf-8?B?SWdtWnc0ZDI3OU51cGV6d3h2UllLL3NHZWxIYmwxcDh3aXNhZHMrS1Zqd0tW?=
 =?utf-8?B?cDhBZEFhVHBJVDJtcVRRdmhBWVhoL2xCU2FpMDVld2FjMWlRQzJweVEwYjFQ?=
 =?utf-8?B?TkRISWl6TW1weDhJVDBpQVVicng4bU1IU2xkbnY5NVRwanN0K3Mza2kxUTdX?=
 =?utf-8?B?cFVCY2llRFhvYS9WS2llUEVJVkUwbWRKK1dVdnEvbDNzQWJXdllXd0NseUp5?=
 =?utf-8?B?OFF0MjFIVUtLaVVOMGZneFh3Sm95bTM4VUFXWEd3ZmhzcDhSTUh1UDlEbzdp?=
 =?utf-8?B?S1BFNXhHS0JLRFdWR3dtRUFxNmpCa1BRMUxlaWRpZWxvV0l3VWVuTXl3NG9k?=
 =?utf-8?B?NFNVdE9vTmRPc29xSm9NeTdtUHlVc3hsYUkrRUcwZklFdS82VlB6UHptU0Qy?=
 =?utf-8?B?bHhFVWl0ZzMwalRsejJhbCszRWdnQUpnUHIvbmlhU1pta1l6RUl3T1VOWEli?=
 =?utf-8?B?WEcyZS9FT25NSFpJVjhLNmlKT09xN2Z3WXptdDRUTnZ3bmFlM3Y4clJiZjhD?=
 =?utf-8?B?VGhhY2Z3R0xpNFRCZVBHYjR1cTZiVXhjWVU1RmcrbE1LWDhKa2h1dE9yeC9m?=
 =?utf-8?B?R3RWbTF1SVluQjZhQVVKekQxUjRDSm40dDMxbzNoa3BRWTdlVVBCVjdFYWFk?=
 =?utf-8?B?MkFRWFJmQWhqMmZIYUMrN0krNUJaVHI3WDByRmhTelUra2JzVnhYTGsybXoy?=
 =?utf-8?B?M2VXK0VGbDgraFIwb1NCb28zSVk0Z01XNW81aGI3bnFNaW4yUUt1eVQrYkpn?=
 =?utf-8?B?RmFON09iejd4T3UzS21ldGgvZUg3ZDFTUGJIMHhLV0lXY2xZMk0weDZYVDNL?=
 =?utf-8?B?U3lISzMxSEpxalJkbjhuTmdTQm5FNlhYU1FocWp5ZzBrYzJlUG93RjlOU2Jl?=
 =?utf-8?B?Mk1CU2dvN1JIaGk4ZWx1T0l6djhXVmdOZzhFVWl5SHprdGcyS1A4NjZPOGFw?=
 =?utf-8?B?VWlIQ043QlhzbjY4elJrZWdRUkppa0FCajBBSU1hNzJWanBxQnFUQWwvMHpM?=
 =?utf-8?B?L0xNbCtFTCsvSi9VOEQ3b1VZMDNNUloxdkVhL1Vxb2NDRW9PbzBxOENJOUZi?=
 =?utf-8?B?ZXVlNzdPM24rQXU2WDBLMW5lRlplYkRLaC9uMVZWVmlZWGxhRWRLZnUxZDM0?=
 =?utf-8?Q?ScoYxc2dCqrVaVwyVWFNlS5Vd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76064eda-6f37-466d-8d18-08dc48d4c117
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 11:56:19.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9YEyhOnEoBVd3tAsBcfZ7Cgg9EQzQQGg65ekC9vZpiFmRwVEDFI6z4HNxmMIJLuqyZHG7L1/8wMWBZQJ0Xrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

--------------fIAgMHh80Ce49H051itr8kPh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2024 9:52 AM, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
>
> Global workgroup size is calculated based on local X/Y/Z maximum
> and thread group id X dimension.
>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Signed-off-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   lib/intel_compute.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 9d3b97efe..72025a481 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1243,15 +1243,19 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>   	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
>   	addr_bo_buffer_batch[b++] = 0xbe040000;
>   	addr_bo_buffer_batch[b++] = 0xffffffff;
> -	addr_bo_buffer_batch[b++] = 0x000003ff;
> +	addr_bo_buffer_batch[b++] = 0x000003ff; // Local X/Y/Z Dimension
>   
>   	if (threadgroup_preemption)
> -		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size
> +		/*
> +		 * Create multiple threadgroups using higher gloabl workgroup size
> +		 * Global Workgroup size = Local X * Thread Group X +  Local Y * Thread Group Y + Local Z * Thread Group Z
> +		 */
> +		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
>   	else
>   		addr_bo_buffer_batch[b++] = 0x00000002;
>   
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Y Dimension
> +	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Z Dimension
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
>   	addr_bo_buffer_batch[b++] = 0x00000000;
--------------fIAgMHh80Ce49H051itr8kPh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/2024 9:52 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:janga.rahul.kumar@intel.com">janga.rahul.kumar@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240318085227.2624098-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a>

Global workgroup size is calculated based on local X/Y/Z maximum
and thread group id X dimension.

Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Signed-off-by: Janga Rahul Kumar <a class="moz-txt-link-rfc2396E" href="mailto:janga.rahul.kumar@intel.com">&lt;janga.rahul.kumar@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap"> Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240318085227.2624098-1-janga.rahul.kumar@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 lib/intel_compute.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9d3b97efe..72025a481 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1243,15 +1243,19 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
-	addr_bo_buffer_batch[b++] = 0x000003ff;
+	addr_bo_buffer_batch[b++] = 0x000003ff; // Local X/Y/Z Dimension
 
 	if (threadgroup_preemption)
-		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size
+		/*
+		 * Create multiple threadgroups using higher gloabl workgroup size
+		 * Global Workgroup size = Local X * Thread Group X +  Local Y * Thread Group Y + Local Z * Thread Group Z
+		 */
+		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
 	else
 		addr_bo_buffer_batch[b++] = 0x00000002;
 
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Y Dimension
+	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Z Dimension
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
</pre>
    </blockquote>
  </body>
</html>

--------------fIAgMHh80Ce49H051itr8kPh--
