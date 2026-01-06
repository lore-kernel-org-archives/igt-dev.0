Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647AECD042D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 02:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CA310E050;
	Tue,  6 Jan 2026 02:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSnd0R4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B13D10E050
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 02:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767665644; x=1799201644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kH/RpeEhAFp94gLx0VZ8mpfPZelihwQ/RflCeN2Am4Y=;
 b=CSnd0R4nUQC2EewnNrugiNJMXlL/1zBUX0/xP8enaG4ZFUbkNgkQ2an6
 S9n4fszJNOzzdKBnniA9adzOHkNYgQT5SkS9GPZRvMaW8fXMlmYEYl1yk
 Q8EIU2D+OehWrm8ftrS5a/+xsZZLz7PoHY8QqDP05MVB2MytfO5osHME1
 FQYSBodGzdrO/nv2uhsrfurgpJGNU8AK0tWk8SRwQLqmCXhXI9vr5TSHY
 gPeOiGSXk4pZsNHx9OGYMxC5pdvcrAHCT/0XLVeHKjipzYNfWg7i5+9fz
 CHaSunpNfZALqDsqcSJVlqZUOBZelZFyEdmKQP7ffwczYdqrXK2AYcnD8 w==;
X-CSE-ConnectionGUID: pZ9V3S9VRLal83Pm23I+1g==
X-CSE-MsgGUID: TboNVwwyQFiCZ8b95N5xfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69074565"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69074565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:14:03 -0800
X-CSE-ConnectionGUID: 0NG6ECIDQ6OdfrE6oPsrwg==
X-CSE-MsgGUID: Yea3OlHbRlqxCQN1ZbnUQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202545007"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:14:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:14:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 18:14:01 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUCIb60WuUPXTQVBAaeAtZZdU6SfAmcW3BpxjgNsxjijwscpxBdnMBuUKa/TnJojDRk5XaalNixoGsD/8dq743aEEkpm/cVQ0VH28nu0xNEF39hE3DHt13/C9ncNGn9o5FvgYbL0OTuusvep3t6TJTELXl+3EUvMe8tnn95XBR/xY83LDm+NfdOfoIr4B4N2SlGDXaJqO23fEcBXKNQHAkIqjxnXZaVZL0kYle2WmqB87G5uR4mQRdtlJ4/5o6rN2xcdw/TGZSFMYBtUZ6Ju+NHfEDj/YKZB5GBzOgeVY5LIYyrVCKb1NQLb+0XkwdjfCSqKiEUyKLLRK2tfbv9f9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQp4hP8aZjIqDCAPHVorzSvFRl+ECVqSV2Wd1qMNl1g=;
 b=trqG68Vlwjuxpn8lhNXvBCp/2sQNvjw3ZXyOrK/9zeUBjZjL5mLg4rZY86HD3SvNn5lgTKFTq42mhdTX6JUjYEmFk5u5zDeS6ZqAiimPIKAZXrkftlt88D/rRwI0YXVQTFRSw5H7y3oJL/Gk7z2ZzGkozRFNCyqHEHP8osl1rUqZRrLEw/w6GSMnKD6tijgUJnBxkf6c4SAi582E5hxpRwcWtD1tYg7T27z1l05LwqAeUBxyEacy9qrGegatl7MGDpCyleld3wlwTogUNKRvKp5NRHVhW8mPkrHdF6jccd9jo0+dWPz55FngJR9Lue5Fy1JYg++D8HK1wo+oOzkYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 02:13:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 02:13:59 +0000
Date: Mon, 5 Jan 2026 18:13:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <sai.gowtham.ch@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH 2/3] Revert "tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag"
Message-ID: <aVxv5Zoiqq6UkBn1@lstrano-desk.jf.intel.com>
References: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
 <20260106013018.2851521-7-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106013018.2851521-7-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbad454-2b6f-4208-e69b-08de4cc940c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Ar7Nh36ji7bjckbuztZFZjgSOm1Q4xsrr+UpB6zf5bf+acWmCeNfLsu0CWJ?=
 =?us-ascii?Q?xCfZekZTFVvVcnQw80+AX5wk283xMkXyqfmCfamgyNrEH4/k4mGsyf02T8E3?=
 =?us-ascii?Q?AINPVcPhlN+gBzfq1ip0qDDb1WemVgUEtkdV39FpL8ruUu30TX/PAurPU59m?=
 =?us-ascii?Q?gF6CEO1i7ZBcoGm8GTn43FKKQdFwD3aywL6Otu+pZbf9jpvd3tIZihypORHe?=
 =?us-ascii?Q?X5Fvvl5Tn6QBHDCq2WwJbANg4J9TLKnR5GAYjan2ZnMnas4fda3u2VAWqpq/?=
 =?us-ascii?Q?3TeFITm3zzOzeVmCgFSqvLjNx0tmsniPWaKdz09GWn+vnorhMMWcSu8XI5FK?=
 =?us-ascii?Q?iJIYzTM7slh1/VUQK/WJN1G7zcJfolvD+xuhocI5/eGbFemhb1+Kzfw4THvi?=
 =?us-ascii?Q?GjANkECcrak4eEndO9gIfAM2lmZL8BpiRAeV2kiVP1IVQZUejcgi3wcaIdPl?=
 =?us-ascii?Q?Qlu3M4+XEEh8wFdSDgd96vp/1kTyPXzYL2CmhuyhmTDEp8sIp0nKUaNg7ibh?=
 =?us-ascii?Q?Ot8nQBcMP4t/OMlzQAVxKi3MfrgsJW3q9GZElsFNZ2IAdV8e6fZZ/zSoRPIQ?=
 =?us-ascii?Q?VAi/fA818T+llqWOpuDLaz95dEP2C9xGFjB7NqlBYLiAZnS7pZff0VcuaxQN?=
 =?us-ascii?Q?+beqP1qfM82oF9oK0w9eq6cLCL0Th2A57o07XPuaHT7/vDtUPKDbKroQYMF3?=
 =?us-ascii?Q?Y8dUm2O4kITzgLdCOu+LVs/RgaGzyEK1lT4QFhYY/S1g0iEAWiUkfp0VMjDz?=
 =?us-ascii?Q?76o1wsa+r7qDu6T43bUiEdhXka3ozBtsEVjpyP9kYN1WgnjqBoFXhk6mAiGs?=
 =?us-ascii?Q?RjMeDTwPkxZiY9P1ul+QtCbVu2Mux7ooIut8Wkn3MTGZ1VN4aCaNsTKO09VD?=
 =?us-ascii?Q?+RBA0qykRnSaz437OUf7NmBDub++5fcovUlBtakCVbVIl8fyHTkk83QO2GB4?=
 =?us-ascii?Q?LyTMnucmeODdwysqVNINychWpTP/k9u8gScVxzL0NLWkNxldhqK8csv5deDG?=
 =?us-ascii?Q?WQkjtox1wRcq3WS1BAyoXeSVkERjO3lJCAzdSebrwJon+mJciFaVhXrRz1vs?=
 =?us-ascii?Q?E7gQhLUSjTY9Tngi6BABY9ElfzhOjWIcAT13qbvld23LtRUNNamzzJ8rjPT7?=
 =?us-ascii?Q?9O/3Fsyj/DUnd60dW/E9Rlsuw1J2xa+5nsINfnJe+ToJ0NcAp0G+eIo+XLSC?=
 =?us-ascii?Q?qxU50iAlqdth74uu6Oa247Qa1Xmtp+IQq92hxHRfcAu3fIwmvF/saPxXQ9Yo?=
 =?us-ascii?Q?M8KOWxmX7hOZK/XsJ+OM7/6XhYi5NNc/wSVSH7PdH1qfDD9b+nPaQKbCZlHG?=
 =?us-ascii?Q?wLNC78PpNeJWpox01S5j4UOSfsqWI6CCVFzTueSzFCgMk6iEpQsZzDqsQ06A?=
 =?us-ascii?Q?IyySHE4m2MIji7HnQwOcgS8Q0V/SThSwaz4Ph08z+MuKVyk+ZYt2PtCMCAg4?=
 =?us-ascii?Q?xvOzCye9nwg1b2J+s3fxFYEH3dbRFFub?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6LH6gk7c7Xy/e9Ch6cqQdjDrHaM1bUzXZzwKvSgYiN59k9/h3IKYawpeA8X?=
 =?us-ascii?Q?8c4278ap4gfpc/GdC1zK7rxv23xgiWWneKkCon34t3z1Zvp5Yftn8O1ql1l4?=
 =?us-ascii?Q?A/KFG8SmdG4OpqU9EnkUmbWKwG5ov9Rq01h11Gyj1U3u7IXyvsrmMqizE9dM?=
 =?us-ascii?Q?fj05J9NGsRlhkLtA7U19pr8SV7FQIXoXJgIyg7DfB9oCtTyK9PpbVnADfjne?=
 =?us-ascii?Q?sUHdukwyP4TYSPHe2P8q5DmYV5uQRtfCOEImJoFgX9tEgIrNkpBrZSNcjCD1?=
 =?us-ascii?Q?IGiHqPAaFH/NqoBpCy0BC9QlacUzLIwOob5k+sOhlSeWy17jU3OMjX2X1tIQ?=
 =?us-ascii?Q?76h9DRc4SgrLjUJD/XEI8AOJDLRhAaAN1ZVrSSI6OnVWFyfOcGa6oNKRGyPs?=
 =?us-ascii?Q?/v6egFlo/YsBwedUNhOp7cjMDSX92VKFvQulKR6xOkLpxAJToYsi7SZjXLu+?=
 =?us-ascii?Q?MMMcB5aL6mGmEIin1/VMx2oSZf9rMhYG7HXaJeYkizRxB/ySGX5XDrGwEpns?=
 =?us-ascii?Q?YsbmXv3dy6Oo+lYWNRjZ4Zocqonx6lcMPitX8XtuKevnEs1Qc1kw6kvyxosW?=
 =?us-ascii?Q?Dey5LsaRBFb1tz0BqqAIwENGCiS96seMfY+p/egKUaJlxUPn9Lc53Ciu/mHy?=
 =?us-ascii?Q?e/SmFAqzko0BnM5awKbnLPk3l1i/AJy/tsBu651uE2Kwaamhu68aEvXcdllX?=
 =?us-ascii?Q?jicKToILAb/GkY4evs4rkNQRefLjr0d67scsfz/5K9S4fAFy86FVn+7Gp4u1?=
 =?us-ascii?Q?Ree4IxZzPGGWUsLwQxuzhrnOc/XuUuEpoXQB/uo8Ym/JiUfWcdugwkrQE1LF?=
 =?us-ascii?Q?ce4SevIgBJL9GV/Wrm7lF4uxYyLEYLETbtOAuaP5NhdUAdmdwcUxwqil/zze?=
 =?us-ascii?Q?sP58bN5USDfDV6PyRcmkGXBzgFROq+cFA0T1+lmnxmBJOTxCOyLFFdg7xleZ?=
 =?us-ascii?Q?67Ym39XhGUdrgU908QKZkemQWrodC3gTqa8AoXN5VeFCtfVRzx+DtenzXrwV?=
 =?us-ascii?Q?r5++Ah/2h/9M/YjNiWjeoTsQWHXt3M7ynHCor/lQKv9nxRq3jcEzNM5DrdYT?=
 =?us-ascii?Q?Ih5UfcK7FiehhYOHp5vzwYgj9o8Sxvepjkx10oxhMo9Crh4qHfbJ1xUPNLgy?=
 =?us-ascii?Q?MI+GMD8wKLwBQ9wE7AGmSgU/zE1sIirtkJ9sHJ3y/nvc+5RvdPwMRxGDwPo4?=
 =?us-ascii?Q?U5QIWkGtdmz1c5PuDAonHrHR1GgFrM2M+9SjMrhvHEFCr6bKT1+4R2meuSu0?=
 =?us-ascii?Q?hHjbvsF4q77PxJL5RMhF4cliBsZb0ZnqaQKWatsmXZzPaf74woa01RjhPB5P?=
 =?us-ascii?Q?08WfcQBu25hzaNHu6DUWsxEExLuaM7U9c7/9Sp3/yb9Iaoq0VYYYL5UW4oMj?=
 =?us-ascii?Q?lp5F1Ncg9jaBC3PN8vqa84YXC97wxObMo1HugmWtgOhlIKIhMYVbHjOd14Bc?=
 =?us-ascii?Q?uKkzfYdTf/yVNRbVAWxSDo0PYBv3npNsJd6DYcdl0rtTsS0TopVYulqazmeF?=
 =?us-ascii?Q?dXgEVWcHmZml/kM9NApOjwqKbfGGQx/Rh2R0DTIIZGQzonBHqBgLWuplYN00?=
 =?us-ascii?Q?HIO/dGxEWcZC1+BLWakafbz7WLFrO7kHOm+CDcKOR0MkvvXISi3M2M+myogo?=
 =?us-ascii?Q?29S7fDkB9iNHMQtgwyo3wZlIuFSmcnoBuABneLWoIKIIty9O6Fimsw/cOP6f?=
 =?us-ascii?Q?3U4eITmZBaYaXPuOM0may8JVla63HEOFesxHVA/jtXZfDkXe/le4oCZpGDBC?=
 =?us-ascii?Q?TnFnv6tY4Ns4Idasn/NCmAlBVON44gM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbad454-2b6f-4208-e69b-08de4cc940c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:13:59.3538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYvKCc18q1g8HpI7zOtRqqvEUQ5g9EHBTpefZmqWJuYK7J5hmv0Woh27+0dfz/SnguU0LjMOW0fediUyWLDmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
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

On Mon, Jan 05, 2026 at 05:30:19PM -0800, Niranjana Vishwanathapura wrote:
> This reverts commit 6d2f428f573320ed81ae26bc711637e3b3984137.
> 
> The KEEP_ACTIVE feature is being reverted, update sanity test.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_multi_queue.c | 31 ++-----------------------------
>  1 file changed, 2 insertions(+), 29 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index c37aea0a25..6bc6f9f63b 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -37,12 +37,10 @@
>  #define FAULT_MODE		(0x1 << 6)
>  #define SMEM			(0x1 << 7)
>  #define WAIT_MODE		(0x1 << 8)
> -#define KEEP_ACTIVE		(0x1 << 9)
>  
>  #define MAX_INSTANCE 9
>  
> -#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE |        \
> -				      DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
> +#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>  
>  #define BASE_ADDRESS	0x1a0000
>  
> @@ -86,8 +84,7 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
>  	if (!n)
>  		return;
>  
> -	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
> +	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>  
>  	/* Invalid flags */
>  	while (!invalid_flag)
> @@ -122,15 +119,6 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
>  	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
>  
> -	/* KEEP_ACTIVE not supported in preempt mode without fault_mode */
> -	if (preempt_mode) {
> -		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> -		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
> -		igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
> -		multi_queue.value &= ~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
> -		xe_vm_destroy(fd, vm2);
> -	}
> -
>  	/* Setting other queue properties are valid for Q0 */
>  	multi_queue.base.next_extension = to_user_pointer(&priority);
>  	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
> @@ -231,21 +219,6 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
>  	igt_waitchildren();
>  
>  	xe_vm_destroy(fd, vm);
> -
> -	/* Validate closing FD while keeping group active */
> -	fd = drm_open_driver(DRIVER_XE);
> -	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
> -
> -	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE | DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
> -	multi_queue.base.next_extension = 0;
> -	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
> -
> -	multi_queue.value = exec_queues[0];
> -	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> -
> -	drm_close_driver(fd);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
