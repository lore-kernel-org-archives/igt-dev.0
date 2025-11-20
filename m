Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F83ACFA454
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 23:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2178310E7DC;
	Thu, 20 Nov 2025 23:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AojVBjNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6856A10E7DC
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 23:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763680748; x=1795216748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+GqdyGK7PveMvh+q15wKXZFbAmGqCu1ObIRadY8KeCs=;
 b=AojVBjNpdpApjXlH6OHmGRd4poWKII7iy3KuwLXPFzdrva3N9r/0/jcn
 APPWMWkdHZg7RENRk2t/ifEScokqSS8hZ6rPmSAonX7wMqptMfbQ+FxbM
 4RAkEcA4+Ywenx8hvLnQSFmBMKHdoJk964fiBG1DU1wDb82FWp+yo/pxO
 mq+ShBDlXuD1Np4aTD6hnt8vZBKlGPu5cD6EBOBaee0Oxm70JMxxiyR70
 ZZlG20mYM0f3aqrnsNF/GaeOH/H33pCT7+kwJqD1BVp4oruAMwGjwsOBq
 Q4pMHRVdDcM+PFBc2j38/bConhY4ThEFcuuWQIu3J8Gx0atwCA5P3qxEB Q==;
X-CSE-ConnectionGUID: z4tn0q30SOq1QGrsOAtPaA==
X-CSE-MsgGUID: g7lVJgJJTmGIs4KkGzIvpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83389802"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="83389802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:19:06 -0800
X-CSE-ConnectionGUID: QwaDhu4vSnuATCJCgvhNFA==
X-CSE-MsgGUID: ioofafL4S6CXIMoCcXNZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="222455271"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:19:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 15:19:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 15:19:05 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 15:19:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyRcSz3sin+51jbqh9HfT86ISkFzEzKa9B1bTU5ZVGBBbQs+80qbdacZtO6ip8QsZSKAFpJILQmbYcY/0UtmJATMa4hK5ve3vjUM4b+4A3oc0iFUS2PMx/IdxyUECUjx2FrI0tDByn4oQa0g0O44x5HOp3sGRipoyY57miaPsVVW16hL++9ATf06WahJkjEUW5i4uGEDkfuiS/PhPNGFc1JErfPr3NIdEWuSxt+Ddjs5vpZZkAYMvxneURZOqeO8QICXWvuS5MfRUEn180dyOSzD7YYXRcemMw7kHpON8mD9VGPStMO+jL3FOa9CJXMKacRtH8E/ka4FGurPGHst6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eZ8IPGQI9EzSFO9yWQ9H0wFN8t3RBmwW69KTfKcrP8=;
 b=y7iBrhMppl8lV65SambTO41dMPJ9zjn2b1eLseKIx/RnUtZm6dkImKMUl2CZ/7SoaghD2wzj5UA2d5M9m4122qPd7yCJ6j9l7eePZcikErr9X5gdHYlYKVJsExdUfspn/rP6UEQmMvYjPCchNUkdQZVLSHW9vbl2A5Y1xXmxd+VyCd58KxONU+ggCJy/mSSE7IXeczzRDCuOwXZiY8jsrkpgJ7Xpxy6AXXXb43osh+5OALjp8LwjmRufo6anc+9jRjA2iZ1+BUkF+MUcKq1IpvG81P1dtLg6zX5C1X8LsOk8E/3OpjP80rOeTJ+TkdqtjtIUJR+aBu44y/Pl76X9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB7823.namprd11.prod.outlook.com (2603:10b6:208:3f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 23:18:58 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 23:18:58 +0000
Date: Thu, 20 Nov 2025 15:18:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 05/18] tests/xe_exec_multi_queue: Validate queue priority
 setting
Message-ID: <aR-h39wgSWVorKDs@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-6-niranjana.vishwanathapura@intel.com>
 <CH3PR11MB843486FA9DE31AE5BFD3F8198DCFA@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH3PR11MB843486FA9DE31AE5BFD3F8198DCFA@CH3PR11MB8434.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed7b60f-b32e-463b-c074-08de288b2eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6nmOqY8dI0NpL1PNcl4c4nPdApFrf2iRtAXi6eAIcGxKZ4lfjf24KSQy1Iff?=
 =?us-ascii?Q?7KNSbnkllzk3h1xLdBqi0vJpMaLOAqs9DL5QmTyhn+OoEpJx8K8FbQe4AkyZ?=
 =?us-ascii?Q?7MZ4a7GQQyTQsr3itBZlZ+i2eVpdNFB8rpNTLJ2XZELO/Q+MBcbCTRituveI?=
 =?us-ascii?Q?8te/TNuWL60ugt/pn47CgXWANgL/PDXGrFJ56DkFTPTzxeX7vV6SAuB9tg0/?=
 =?us-ascii?Q?ZhdqUQ9Zn31zJEagnRFvYWIIWzg8UizFZEUzuGklFX7jFmNRPyOqv4i/BibN?=
 =?us-ascii?Q?/4r7g7zrCt8uO801wwvLUONvKVcNBajHjREN4IfNPWxvMrl8K5Id9DFcL1Mx?=
 =?us-ascii?Q?ZbEHY/PIJai3dgWViTYbPPE6S5EowbXyDSRcD4Lp+O0n13hTvU5ZuUb3F58S?=
 =?us-ascii?Q?cNxISGIwSSeod67GbfYxJVysJVsu7GJZd8YfBeIORS+RE779y3OGtIiKS8xZ?=
 =?us-ascii?Q?KvljYPJYMxFObqgOQYN9MP4XeOP3CaS5ok1Rhaw8/anNv5oXD1KGQfz0m1uB?=
 =?us-ascii?Q?GDnl/Nz2SmSTQV4vwWeGZqRZzTnyY8UY+UBjgUnVCkegZ3/wPKUUPTILy4VO?=
 =?us-ascii?Q?/EFXsL+nzn4FUX2620IqpVRWblWFQmb5hQuBNj2kxvGN62RS+xgpNbdJiGZb?=
 =?us-ascii?Q?PlUTwDKE7P0euFYBSPlccKhxhFKkuaewYY38dm8DXM90UBtP8aAQwO84MW8o?=
 =?us-ascii?Q?BsYMeWEv9QZL4O+b9Y+BsmZ5SEGrG5oRznk7XX/aacLA2kL+bQ6qdMJkBGUT?=
 =?us-ascii?Q?Ndx8g/vENIcO6P4X5lgKYrkkm0NAkJG/QKBpd00riED9A53/HoTjAez4DfQv?=
 =?us-ascii?Q?on42vFKntVP1eR2Owkryitp3uSBNSBY8YBokonMvLWvVa2W7GEOLTW5kCXx8?=
 =?us-ascii?Q?Lq43CanVsvNrPndsGrefElRFBm0wcyBUqXu0Ppa7UNdji98gXPKAkxYmYWrX?=
 =?us-ascii?Q?4fOF39DgY6646PXBbgxOC6b91U7ctSOQ8c6NLGaQxkP+dCja2bFsY4QEbC1T?=
 =?us-ascii?Q?r5nkS9bdG1QT3iDczk5ExXih9oV3hM5TpU56zmH1vWf1ZrE3Kuvae8IZD0UR?=
 =?us-ascii?Q?M16DBHewheIyJMUm9TL5zrtaxAfM0K71RttYAzH1tI7zsBvj5TQ11xdQsO71?=
 =?us-ascii?Q?0LSNPUc/jiUfKn2/4QjTpll2uivs52rxWnG/mXuFsXDJyR3/X/MRg3r+kh/X?=
 =?us-ascii?Q?Z2ehc19U+EaEeW7VirM5asydfaHTmCRi1sp+6lX2jkpLQLFd1SZnsqw4j7pZ?=
 =?us-ascii?Q?P3wkka1avhrW2DsnPxb3cfeMl+qf24teR2qUBSKRQrSIbGoajYSWj+mAgvJB?=
 =?us-ascii?Q?7dgTGEah5NY8TJPsWugR08BZD0UKTZLACzk/wEQ6ObNA4h6kKYDLKx+Quj80?=
 =?us-ascii?Q?tdhwAYmUXRjLEHL6vh5Edu8Y8GxHOJHQQfzh8xYvaoMuf+9dYLVTE1aJNzoG?=
 =?us-ascii?Q?OgGRn1jqp9mQ1Ljvqj1Cy3Fef0Eonz1y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBKsSsFoohC46IWaAkAKV31DGbIpGqE0Sc8xibLPP16V/5S08sicSWcotb4V?=
 =?us-ascii?Q?A5S7joUyosiv4P49ECL6tkQR5J1IIggQKygPN0UTlHd+y/Ztahbpuoh4sdZu?=
 =?us-ascii?Q?5kZ8ouY6P6Y+8PxJpa+5pSccha6/UI2A6f9QJnmK9VqJmhGCd36ymE+H9WON?=
 =?us-ascii?Q?TbiVCuwKbJlJyea6a3fsNZcSvzufGYTO/E0xt6htgEoiUysr/g/fkOqs3l59?=
 =?us-ascii?Q?apaO7cmTNhjhLjb6S4Y/5Cky8sqsVMyUP1uCpZG7dprZ70CD/y4bqqyNerRH?=
 =?us-ascii?Q?e/Vpk1r8SHb+WbbKgPCdK2cFGCR0YeuKXCVRgSWLinUYXTMmpvad+1juvPmn?=
 =?us-ascii?Q?QOInx6ZXoemThnuJparhZKxTQS+3JLtEWq07WN3lrtma5YmcquIkOpQxY2Ap?=
 =?us-ascii?Q?U6adBolCPaRHeVaeOcygIRQphgCbQNEIyasYoS55h2I6OnAE8c1+A0aPKKxa?=
 =?us-ascii?Q?tqOVUUZaU7Oody2PKFT20WyFkmSRJ9y49ySbENgcZ+7e4FLSzyzXYcX2DM1d?=
 =?us-ascii?Q?+cs1xjcixd7FnCSn/Js1ANvNyRGE/m1X7awWgwYlUUrzREK8vVB7xknW9lKU?=
 =?us-ascii?Q?TYFr+CMKJCeA+cx6ZdbD0f+K1FGMfDzOAxK0TnTxE9Ex2pwfVIzSYRvqZ+R0?=
 =?us-ascii?Q?RYgALVQNAHxOm7Cwmas1oP1yQI7TS9vNtDnziMsR7QcbV7fFKjFMCqzgzp5d?=
 =?us-ascii?Q?Vvjf6zSsbbtSPyQdiKkB7H2HgHVipkVGYgOmBGpoDDJZQ3aSeV+U+HggYQ+z?=
 =?us-ascii?Q?IDJFO4/Atui/344guZ2FNU93dWMJn9uAaqlOiaCOdlCw6VhziKwlLQqAESBZ?=
 =?us-ascii?Q?mFeoOGBlVTZDM3sC9RLTghXW9G5+GFDg0Bkq0K/MFLfzIYdwDr1unDZKFYp8?=
 =?us-ascii?Q?6ruoLMg3xGV9Lj4cmL2LcJ7j7BEyVG98PHJISyTCudqPA2L4HWS2WBzhsNvs?=
 =?us-ascii?Q?X9YVdSvwIXeceKyMgl27H5KiXzq40uoWfllJ4zSIEpvUV1b3WLMxIw18LTxJ?=
 =?us-ascii?Q?w4pADRHkUyJb6wTyZFvNH/OQuRvaEvZRsvinJ49Ykm6sXAb1UENDYmABLzrj?=
 =?us-ascii?Q?i0BBoeS+ouq2ZNUTlgRzlbGT6eghru5qsIX5cY6rlXtcOE0eKWf8oiPITzJR?=
 =?us-ascii?Q?nJW9Y70gOy3AEbbFNXzZJxlusRH6sA3v2lSASyy1JtuxzxaX+rnaYOUEaIwl?=
 =?us-ascii?Q?cRjEwXfB07jkFAC0qfBry6r/Zkjv3KewRud3jMRCULvr6l57x5V7Amr4Llm2?=
 =?us-ascii?Q?8AUoRMK9Pd+QgynDNA1aorM8pjy6MZ7viO76B3SczGe/KNtk4pztTYWk2ABH?=
 =?us-ascii?Q?JpIZHx3LjKcsCMPim6RAf+BEoLdzcE8XHId+TVx0BqMaPA69AXWsstwweoUB?=
 =?us-ascii?Q?yF9qyvtX/TD0vfbfho64OTWvvQDTTCXRrkzZrdhBLQTgALR3RAucTWRmQaVa?=
 =?us-ascii?Q?geaxZEyFXFVfzglbvvt4cPYMUiw9C8BkCtboEmC4XA6v+vx+ZVDwi3V/3Afx?=
 =?us-ascii?Q?3X5Xi/A26JUoq/5OQDrUslRx+oahk6NeKVj9tJG+cELKZ2Clqo56ZIzumvnG?=
 =?us-ascii?Q?/3o+/ukP4gYTP9fqOpgqM66ephh49QRm17iRI0b0lav6xUbJEBQycE2wSDve?=
 =?us-ascii?Q?FJ4JXJBCMdid/3oSexjQqYQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed7b60f-b32e-463b-c074-08de288b2eb3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:18:58.3886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nCCq0oxJuhpmraSVQvLpb7ch37B8lK7CxFeTP2sBBCUBmYp/Et+UYRZuDlT3JHD1p1H6Pfx5JJHLHhlhjZPFEzWiEpYbG3mtYszkv4EbZ1SKPutGrnWBOQKMSXhJ72N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7823
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

On Mon, Nov 10, 2025 at 11:48:53PM -0800, Dandamudi, Priyanka wrote:
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Niranjana Vishwanathapura
>> Sent: 01 November 2025 12:06 AM
>> To: igt-dev@lists.freedesktop.org
>> Subject: [PATCH 05/18] tests/xe_exec_multi_queue: Validate queue priority
>> setting
>>
>> Validate setting priority of queues within the multi queue group.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 65
>> +++++++++++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index de2aae8f2..6c5ff54ec 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -18,9 +18,13 @@
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>>
>> +#define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
>> +#define XE_EXEC_QUEUE_PRIORITY_HIGH	2
>> +
>>  #define MAX_N_EXEC_QUEUES	64
>>
>>  #define USERPTR			(0x1 << 0)
>> +#define PRIORITY		(0x1 << 1)
>>
>>  #define MAX_INSTANCE 9
>>
>> @@ -35,6 +39,15 @@ __test_sanity(int fd, int gt, int class)
>>  		.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>>  		.value = DRM_XE_MULTI_GROUP_CREATE,
>>  	};
>> +	struct drm_xe_ext_set_property mq_priority = {
>> +		.base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +		.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +	};
>> +	struct drm_xe_ext_set_property priority = {
>> +		.base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +		.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
>> +		.value = XE_EXEC_QUEUE_PRIORITY_NORMAL,
>> +	};
>>  	uint64_t invalid_flag = 0, ext = to_user_pointer(&multi_queue);
>>  	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>>  	struct drm_xe_engine_class_instance *hwe; @@ -75,6 +88,11 @@
>> __test_sanity(int fd, int gt, int class)
>>  	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
>>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -
>> EINVAL);
>>
>> +	/* Setting other queue properties are valid for Q0 */
>> +	multi_queue.base.next_extension = to_user_pointer(&priority);
>> +	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +	xe_exec_queue_destroy(fd, exec_queues[0]);
>> +
>>  	/* Adding queues to group after primary is destroyed is invalid */
>>  	multi_queue.base.next_extension = 0;
>>  	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext); @@ -103,6
>> +121,11 @@ __test_sanity(int fd, int gt, int class)
>>  	if (n > 1)
>>  		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext,
>> &val), -EINVAL);
>>
>> +	/* Setting properties (other than MULTI_QUEUE_PRIORITY) is invalid
>> for secondary queues */
>> +	multi_queue.base.next_extension = to_user_pointer(&priority);
>> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val),
>> +-EINVAL);
>> +
>> +	multi_queue.base.next_extension = 0;
>>  	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
>>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>
>> @@ -133,6 +156,37 @@ __test_sanity(int fd, int gt, int class)
>>  			xe_exec_queue_destroy(fd, exec_queues[i]);
>>  	}
>>
>> +	/* MQ priority is not valid for regular queues */
>> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
>> +					     to_user_pointer(&mq_priority),
>> &val), -EINVAL);
>> +
>> +	/* MQ priority validation */
>> +	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>> +	multi_queue.base.next_extension = to_user_pointer(&mq_priority);
>> +	mq_priority.value = XE_EXEC_QUEUE_PRIORITY_MAX;
>Why is it that XE_EXEC_QUEUE_PRIORITY_MAX creating error, if that is the case anything beyond HIGH should throw error.
>Naming MAX is not making sense as MAX mean until that value it should be valid as per my understanding.

Ok, will rename it to XE_EXEC_QUEUE_NUM_PRIORITIES.

Niranjana

>> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val),
>> +-EINVAL);
>> +
>> +	mq_priority.value = XE_EXEC_QUEUE_PRIORITY_HIGH;
>> +	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +	multi_queue.value = exec_queues[0];
>> +	exec_queues[1] = xe_exec_queue_create(fd, vm, eci, ext);
>> +	xe_exec_queue_destroy(fd, exec_queues[1]);
>> +	xe_exec_queue_destroy(fd, exec_queues[0]);
>> +
>> +	igt_fork(child, 1) {
>> +		igt_drop_root();
>> +
>> +		/* Tests MULTI_QUEUE_PRIORITY property by dropping root
>> permissions */
>> +		multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>> +		mq_priority.value = XE_EXEC_QUEUE_PRIORITY_HIGH;
>> +		exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +		multi_queue.value = exec_queues[0];
>> +		exec_queues[1] = xe_exec_queue_create(fd, vm, eci, ext);
>> +		xe_exec_queue_destroy(fd, exec_queues[1]);
>> +		xe_exec_queue_destroy(fd, exec_queues[0]);
>> +	}
>> +	igt_waitchildren();
>> +
>>  	xe_vm_destroy(fd, vm);
>>  }
>>
>> @@ -195,8 +249,17 @@ test_legacy_mode(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_place
>>  			.base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>  			.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>>  		};
>> +		struct drm_xe_ext_set_property mq_priority = {
>> +			.base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +			.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +		};
>>  		uint64_t ext = to_user_pointer(&multi_queue);
>>
>> +		if (flags & PRIORITY) {
>> +			multi_queue.base.next_extension =
>> to_user_pointer(&mq_priority);
>> +			mq_priority.value =
>> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>> +		}
>> +
>>  		multi_queue.value = i ? exec_queues[0] :
>> DRM_XE_MULTI_GROUP_CREATE;
>>  		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
>> num_placement, eci,
>>  						     ext, &exec_queues[i]), 0);
>> @@ -297,6 +360,7 @@ test_legacy_mode(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_place
>>   *
>>   * @basic:					basic
>>   * @userptr:					userptr
>> + * @priority:					priority
>>   */
>>  static void
>>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
>> num_placement, @@ -314,6 +378,7 @@ igt_main
>>  	} sections[] = {
>>  		{ "basic", 0 },
>>  		{ "userptr", USERPTR },
>> +		{ "priority", PRIORITY },
>>  		{ NULL },
>>  	};
>>  	int fd, gt, class;
>> --
>> 2.43.0
>
