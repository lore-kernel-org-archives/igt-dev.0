Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F724CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 16:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E572112C1D;
	Wed,  3 Apr 2024 16:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUk2+sR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026D3112C17
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712160281; x=1743696281;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tlTZ6eHvCu4JcWDBGLRsOlbDPsnZ89lWw/x/ApXTzzg=;
 b=TUk2+sR/neWNfaLHj06mUyLezsWE9lWN9CAksTwRLQunM9TswY8Ho4L+
 lXsuYSPWWs3jfGLy/0pibm0b3ih7gQai+qOssu/2JUs0IPwrndlnXRRBB
 ROPPkGr54PIaNUOr03XUxX8cSKIVlS9XyMEfHRZx5LqgBbO2xBWx7PrfY
 g4G9W1cs/Nez1Q4GxRO4Bdiv/O+FE+QCfbxc9W4BTdi4GduMbNETgkbAh
 FwpgN4UOB035a3rL+rnQKMrc5ll0h0IQxKEAOhcaoUQO2z15vvD1zpHOP
 nVIFiurBciDWuQVrc0eNQKJzB75tJg4jvsHsGtbMweZYs5EasJja2UfPv g==;
X-CSE-ConnectionGUID: vJ/cYVh0Rrqm1qEoGSiYXg==
X-CSE-MsgGUID: pQ5cpCP8TbWl3ibZTkxLaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7982305"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7982305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 09:04:12 -0700
X-CSE-ConnectionGUID: MfrTsWufRGW1aL7Xrblzgg==
X-CSE-MsgGUID: zUsYgU1QRHqzSVK/+HliAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18923174"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 09:04:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 09:04:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 09:04:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 09:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op53Z/IKSzqPvcR5YFvPHnk3sLcd1CjdK5JJkm+zk9Adv24ji0kmHquqCuv3XN3TJbmqYvgIpofrxkQp2mrwJu2zph0DFvTYGPHw5FwYKIKY1gb+RakFYvFbuIhoR4s/faKyeoNdqXJEOYvuMmQJvmBbNhZXoic99GzpJZufG/pIPhq0ZdaM2sLyjz5Yf/hnXFQUFnc0Qs47ZYE0fklvCkcwoY20L4dEhF1FKCibu+iUQpWzClAW4Sdc/HgQYjuuzmNlf1X/wtaoqBR+7Ebn+jWqm+QnKvi6FMmQwla/H2Qbf/R9uZ6Q60Z2jiOdNQDXjybUnJ5Dxt0EPe9GCBbdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCfb4OSU9/GHW8BicC7JxFacwqMxh1C3Lbd7JOmkLAs=;
 b=idqIuKpkcr01VG5jOYafkqvl3aW+agfUN0tmJCUyFErraffJYVF+MtJktgapHc/Alf+HpKM2q3g15hqXbn6KWmKeOwBTxdCkwVjURJbVJW0Np2mIZe8TAzCs9yIIUEtxIqR+rmrLFxv1w5RaY8gwSZe4BNuKS3mdXwfoMblAy8BPUhsfwuoAByOFObAjBD9fdG1T6zN87g5vQIH4vhrq1cj6CI9KedoaUtIrWwQlqfxnqmyK7cMZc8/+DloBli/W51zG3S4mPrF2QOj3tLzg3qxvjIkBgN6mJJHDaxY3okGjOA+Gu3F+Y5AHSDU8dRGYlY1fFeL3I3cJukdAb91Xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7843.namprd11.prod.outlook.com (2603:10b6:610:124::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 3 Apr
 2024 16:04:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 16:04:00 +0000
Date: Wed, 3 Apr 2024 09:03:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 4/8] gputop: Free clients on exit
Message-ID: <Zg195fJ144wde2zz@unerlige-ril>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7843:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pCBif2Dv2GYfYt/+fFmsyVRj7I/+1Yc1fQlCvmf3iFgD1zsFt8p7Ru+m/WROZZgIcZeJqeC9v02DscOTGrYPvXZpB5AgI7m9l4pgd0khqJ4u2SCbn5a1ve99Rq8MGrO6YswNo6+QhxJZaspfndSO5np+V1n/RvDgP4iVIkxnU/Pvp32UqOw/4PQmq7igiREHEzam4BjrQUAJFsWe5wPKq8BE2ceEZd5gvTeR3o4G79LKlrmZRI9m0AK0swWOCuyqviSjDHYTXRoIOv3cihk20joBD3yiGGmed3exek98TxOcGOynT9WUwvli6nvQ8jHfYUmWiHUkTMgkj3333B4qEJvI6GO2GbTwc1zemU6PS0dPcZXfdxzuRsSkoVOCF2VTa3pW5+nayn9cr2Mr+xfvEtbmGZ2m16Xzp4n4aIk4YcvK0QWU0a8fOQrKV9MnnxiTZyOz/LlY9Zob0Bhut+kl/EL0A8oH7V5Cdp5/tfy2BYrB4kD2pzba3MgW6qz0hFq5kt93PNj41bxTPfjxLKWvEjCOOv+Hgjdwvl9PChRlur4kZaJvBpyZ1treqMn4fBIDY6jf5Z9rF52HUGu92Xx/mv/ySMqYauHnuYfJ9DXj6RwIGBAU3stE+gdqHTXW/6llCS87Ag8o4JOjW4EAp8FMzsayJNAsOLojEWtN8keft5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnlHbzh3bGVMR3Q0VTJJc2FiU0E3YlBKMGJXMHRoNjM1MGpidEdNelY4SzJn?=
 =?utf-8?B?YWdFRUJzQTUxTkpvdFQ5dWZhRGI2VGpvZlkvb25ybjN5dm9lQjB1WktqcEVU?=
 =?utf-8?B?ZExiNXpwUHpDampNbFhtWmJyeW9TVVBYU1ZYbmhwMXpwSzdnME9IL3VrWGNF?=
 =?utf-8?B?MG9pRVdpbDJBWXBxRElaVVdoS0FyVmgyWTNHbTZ1dElOSy90ekJtWnJwQ3BE?=
 =?utf-8?B?TlFBaTFkNmRSeHRKam9NNHlmQ3pxaHhuMXVCSk1lbFBRaEdoTDFVR2hWZU9U?=
 =?utf-8?B?cSsyUW02MWhIWlRreVIzNDM3VFVtU1dCRWdPTmVEQzNOMHdVMTg2Q29mcUxy?=
 =?utf-8?B?Y1N2RnpLWE9LQXEyR3FyNXY3V1dGeFhlOFdoMlpnSDBrTjlaY1FBZmVxRUgr?=
 =?utf-8?B?TFZNK25uUFZaOG1TQ2F6eWpLa290R2xrcFg2QlczM1FNLzFRVjQzV3JRYmk4?=
 =?utf-8?B?aVoxWEZXL0VHa054RmcvREpCekZMellLL2I3c0Q3aE5TTGlMVUFUemx3R1NG?=
 =?utf-8?B?aGViZ2g1dEE0N0xDYWxWTjN3YnpVb3BCQ1QzNTZZaGhaaTNhcHdwZTVBOFRy?=
 =?utf-8?B?Z0ZNVDZ5c3pFZXh5MEJ6elJjZ0xaVDNwem5EOUY0SHhyTE01ZkNFRnlNR0Qr?=
 =?utf-8?B?YW5qTmgzK3ZIZkF1c0NkcUIxcEcwelQ3Wk1RZjV3YXBpSjc4aWJrRUIrNlNw?=
 =?utf-8?B?c080aUNWQkhlc0pYWnYrN3ZaWThpRUxHMzhiSnBycmtPemV5MmVXSm1JdU5m?=
 =?utf-8?B?OWZiTUEybCtNLzc2OEdaY1kwWHdVTUVDWE44eWpzcllsaENudWRHM2h4OXBi?=
 =?utf-8?B?ZVBkNXoxL0VKZ0VoOVBNNHVBajlTem5vZFlaaDZMZDJxZS8rRmF3bXlMWm5S?=
 =?utf-8?B?Ymt5QVhCT3dqSFJNN2tmWjF5VkVYc3Q1WlJocjZzTEwwVENIQnJSUnIvTFpE?=
 =?utf-8?B?UFN0QlVNeit3U0pZMnBaZXpPYWpKRDNWSDFSbnZONkFhdDRBcjEwU28wbyth?=
 =?utf-8?B?NHRERkduaWhGR3lvZHRXcHpwcXk2bzZwVnlkQU1vNnNZTXhuUXZTOVEvVm0r?=
 =?utf-8?B?OWdaUTRMZnl0OW5mbE1XcDl2aGVOVmVkaGcrbWpFTDZVQ2p3OHI2cmpIbUYw?=
 =?utf-8?B?VnpzVWR6THVLcEV1WHRyakJCN1BBSCszT3I3dGNLZTcvY2k4MFpRaEE5bm91?=
 =?utf-8?B?L2owNGdITngyYlBKTFRaUTFPUHNhdmxXZjV5bklwR29tWHN5VnFBQXd1dWtO?=
 =?utf-8?B?d0tMeW1YM2daMVl5eDkyZTJrd3YvaDhkcllFbnFJTkhXTzlMWExVZ21Zc2N4?=
 =?utf-8?B?bkdMM21BYjVIUkhRc1pnTVNCOHVBbVN0VXdTRXFhTkh0bFdqT044dnNLVExr?=
 =?utf-8?B?bDdPVTNKcHljcWZQU3R5SUdPUFNJYTE5YlkyMUZhQ2FMTjQ2OWQzMFZPR1Fh?=
 =?utf-8?B?bmpIUnVqbEl1UWNTem4wcU9YUUlPSVRpVG5GaVl3SDZ2MXExd1FKc0pJN0g3?=
 =?utf-8?B?Vmtvb01qZERuYmJ3RXZTTWkvc1RDdEl2RWxSU1hHSGFvWUlZaGdZclFTUGE1?=
 =?utf-8?B?SDEzM2hGb1pSaDF1WE9ET3pDSXFSbDQ2bHl6ZTVkeXpjUFBjcHQwek5ld1B2?=
 =?utf-8?B?YTBoRkdFUTM0a2E5MDl5YkFlSkZwL1NmZmVPL1hGY3VRU3crbXFYMzZsL2V6?=
 =?utf-8?B?UXVaZkJyYk1HZmpFUGE3VC91NW5hYUEyWWdZQmgzSitTVzd4NmVyeW5zbVVT?=
 =?utf-8?B?N0Y4NWxBcm5BVnY4aHJiRFRib3hCN2sxaU5mSlhhSWJzeU8veFpjN1hFWUZy?=
 =?utf-8?B?Y2xweGFEWTBYL3haVkZTNG01MXdvb2UvVVdLMTFJQ3VQb1puRWFjc25rcmJQ?=
 =?utf-8?B?S3psM1FhdnZSc2NzRkw1N3ZhSGY5cVMwOVZVcjV5aXZGTlUrT1RQeWg2SWxz?=
 =?utf-8?B?ZHV6RGpzNGN5QjZDaWxzUDg1L0hldGJRWElpNHVWVEpWbUZScjB1TjdkSjFs?=
 =?utf-8?B?bEZWLy96VlZUdUs2ZVRxQnRkcUN2K0RVSFNvMUxhUVBvQWtrVlNnR3dxRzF5?=
 =?utf-8?B?ZE1FKzBnWGp2MVZHY3NqViszQm16ckVrRmw5WXNMODB5UVpkMU15ZjVRWXhl?=
 =?utf-8?B?b3loZlc2NUw4SDd1ajJOTk5iNUxCR21BSXpJS0RSWkJ6QjZMRmhEY3Vick80?=
 =?utf-8?Q?czAKDVrzKqgkSt3dakY3H8M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 351c197f-f00d-4fa5-03b1-08dc53f7ace7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 16:04:00.3759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnZFGakID1RwcF9tvGQZ6fx01AxtzNGqx8t5630F+9QLgsa6nAl0eOa8mUeMjDjJGfdoOyVWaCiKdzOFD/+LMnijc1Q8Y09wQLMUhc2vAuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7843
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

On Tue, Apr 02, 2024 at 03:17:12PM -0700, Lucas De Marchi wrote:
>So it's easily checked with valgrind if we there's something leaking.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tools/gputop.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/tools/gputop.c b/tools/gputop.c
>index 71e28f43e..b13044b50 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -293,5 +293,7 @@ int main(int argc, char **argv)
> 		usleep(period_us);
> 	}
>
>+	igt_drm_clients_free(clients);
>+

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> 	return 0;
> }
>-- 
>2.43.0
>
