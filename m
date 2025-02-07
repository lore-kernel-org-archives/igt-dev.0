Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4AAC0219B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 16:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879E710EB7F;
	Fri,  7 Feb 2025 16:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbWEiXOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA510E295
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738947559; x=1770483559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OCqEruYnkeEKk6yB20H6vSB2eyHYTVkl80ljbSQbHy0=;
 b=mbWEiXOZuY/U3HRLSo5DKvQE5tjkjON3PF3GZ+G9YjEgT/VSs9BgVciM
 Er6dGkCC6OIzDpWiedWeDjaeNCigqTuPyFMitkA6koL1p0aUAAJT63zVm
 G7PXmCr5XTxZl8sjk5LtnI8eNAmedcfqbd4ZtO/lE/YIgEGL/r44s9ox3
 urSkKEa8cJIsdvl+uUvMpWsv03VBsmqIyyuy5IbDS0/aahVrgYEzcj7iR
 T0Ht8MTH6l1GcgCg9q1kIkdGJnBp2vBOUdmPi8C1WGw8qeRPqsf60jBmm
 ApaNc+cLj8zOM1LtXS0W53u8SouS0MeKj7jGdowY/cQzfGIViMCii0V5H A==;
X-CSE-ConnectionGUID: nX/388FuQmKW1oiMh1i+cg==
X-CSE-MsgGUID: F84L+SkdSbe9MZN/oMQAKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51025067"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51025067"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 08:59:12 -0800
X-CSE-ConnectionGUID: nE9tu0NxRi2+99n4MZ7H9A==
X-CSE-MsgGUID: 0tYUKusHSIukuVMZ4ijeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116581387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 08:59:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 08:59:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 08:59:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 08:59:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoipiMD01J1DHOCFrkCJsHtEQrC7/Es47kYtnzCVvLtoeCtdk88zXnJRxn4qr1iWs5s/OQnix4RidBp7eK70ZhKMK3CkwEpDZMoBSzGbZWHaD06ABQX2gyVP99C0+NfVW+f5rCXUCNSr86GX3fvMkuPa+Yi5CHBTdE2NpDp0yo3nGK4Q9w/C8V5xAoXB1vXMT36ZdHlXpqULhJFp7HK0sBrBNCFGYG8iV4wSkQyoW2tnp72GdbKM1ehEgH79B5j801CKlBVEUqU9Q6EngmkPwZN7qUgRf6Lhblt69GZJVgfbd6BvjmsCfkOkCVXGcC72WjC8pHqiX/ZUVTuneoviHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABfT8Q/37zAXQQglFVMoodL8ykX8CfPO8RXYrmhfUfo=;
 b=S54yuqfkpCl33jBIjSYDjBP3kvUO9w1pTR60bpuaH1ERljaii8vIMCBmQHmJixLAMtfjMbgd3YNpxHeP/xQOHqf2LLeMw4OVbh1XZMqNgj0aA+qz5AZNtgycpuGzi1zSrtsNJOgOJjC3fys2Ofq1UdKqMDLyDyJSlnLPF9Op2FCwvpa3P32IOTbqamWCAsQZ6/3iJSBYidc0gI/pURwBtASjvDprOEdfOQieFIZmy5rxOYEVRU7G7JyXvcP9vk4MdQpN9gG2780I99Py6j0wkFbJZODRgr0GqJyMs+jo0i2OPzb/9lQwuK0spu6pkKnLTbtomJInJK3H0m5Onin5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 16:58:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 16:58:24 +0000
Date: Fri, 7 Feb 2025 10:58:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: add missed include
Message-ID: <eevaeec2ady3vztu7nm2vwi47aesui5dful4op3rs6kmpfilx7@odwow677ap4z>
References: <20250207155152.2506970-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250207155152.2506970-1-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MW3PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:303:2a::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2ad84c-5ba9-4354-b1be-08dd4798a293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TcU8wF6EnntYVnCXLM2ShaZ3G73aJI88GLmR4qbMjgf9RRYdnwh3AavrcLDA?=
 =?us-ascii?Q?q7tqHrqReEtsA7Ze18pk69b7jLymtpzfIsb2qBP4bxa1WR+hMG+pDQLvrvgc?=
 =?us-ascii?Q?eg+6dqaJW7jFbu9JCk+2hBOHrpzcRgLFfiT6GmpepkO/TcKF7awdCL2gNmmQ?=
 =?us-ascii?Q?JATs5dO4mUVsRkhRPLWQKnQcMjuFPW4e4nrkDwGNZ7pcTSw78qmU94E+KnVM?=
 =?us-ascii?Q?PmaFOr+eG4wwJ2qo6ULHes9nPoJRtGzjT7E7mRJF8Nt20Dg5XHiljLur53Tg?=
 =?us-ascii?Q?AQVn4PYry+Qqiq5pogr0b+5KtqwgSbq6KAmNrgVH/LjJqcrzEmgpkO/gquhH?=
 =?us-ascii?Q?Y6YHC7/GtOx4n+vTWUUfY3/bsgCkcPCi5Lk8qOteo3n9vL/Tou3lofjSIoTb?=
 =?us-ascii?Q?5AukXrbub/Opx01sBargwpEc30PVmN9JVvHkKIMqJzvLDEyDiJavZUpVifS1?=
 =?us-ascii?Q?Pp2pAbyDZSTnPVU/QlX9zL/OB6eLVjhEaJdNNlsCwNXFrXdwjV3UjEunseh2?=
 =?us-ascii?Q?EvG0h0rfxS6gimD+Um0W32CF1SOaJ1ivWPF+rKkC76MCDrI3ZuoMHYs1ddYp?=
 =?us-ascii?Q?9L4ipkXvXiMzrt0VMDVHmHRytcje+XvFKkGf4u2zNIRQfhLm0zqc5kBIcZLc?=
 =?us-ascii?Q?S9fmdTb33QCCX8WocESzZ4x5YmgDsvkQHYFZZKZ2qn7+Z7qBURPh2DqFMHsv?=
 =?us-ascii?Q?aVPGZ7BQRO1Viy07J6gvmVlRhG3osu8hQmtVf/c7l5VoZmIb3vbyu67wCr13?=
 =?us-ascii?Q?wnV0fKNgt4uXciSvHxV3lqTkr+ifRTZZOBgidW6QEv+isfRLDsiAfqDPuWcf?=
 =?us-ascii?Q?1rd7MMNvSWdbl7P9JysbM72MyVu+ubjgKw3yUSH7E1ZeTgpxXOtkbBGGta/t?=
 =?us-ascii?Q?X4nzmGnfbVc8xgZTj5zDXQpCChl3FK1/xv9CaVfmKi0JX8XBdY7LoWyMVm9/?=
 =?us-ascii?Q?hfLpXd/E4/kQJV7q50onzVBtQTWNIgBXe/Wju2CIkHxxk7p0cz4jo6iqw69v?=
 =?us-ascii?Q?SeBWliSKHDL4C6sX8HFKjxtzip07/10sJe6Fp/v3Cro/FAiiTfZ5uByaxZxZ?=
 =?us-ascii?Q?dmvTUEaj2e8zjmuVFPbNK/798WYM5eTTihL8JQ2bTvTV0y2lDS8wdt9xEt9G?=
 =?us-ascii?Q?b5Yz9cmvSymS34nVmRFBe13PqUcB8zKuF07w5Qh8Cuy4hl6zpEUWzZsau0QM?=
 =?us-ascii?Q?uV0CeVI8Tc9yQYjSB+Q2wYnlFFaw0tAOodn0AKkOASwTJe0EQ6g632XayPtj?=
 =?us-ascii?Q?zr1BA83IAKbfEqG6DxPzdss09y3+Xzs/fcu0iwkcXky7poEqR8V/Ukt8OWEW?=
 =?us-ascii?Q?7VT3Na57aFbUK3SWuzd4WCGuzC988xS9jKGFFVWPBqEnGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YdnkoroStav4TO3xn7Xw23gbprgvkmprjn8zapt5pFhK/l4bAYo/96q5boix?=
 =?us-ascii?Q?tdDIxNTTIMFDDII+/RlCBbiM3O1zmFY0cahzMpyJzH+wb8ApFEaceqzqjF4O?=
 =?us-ascii?Q?6+Z4EEwy5vyGrOW3YXPH2lJGPTMMaUua3a2bpaKPuo11XeM9gzLTaKIfMiPN?=
 =?us-ascii?Q?afkqfnKp5bQ/lMgMspqkrEbdO/PeHSwPfA56aWZHlnZ02zkEGkTJRbdJ2W+0?=
 =?us-ascii?Q?C+1BMi96bOKa+4wUU0Begxf4rPPD0k8uBAiNo98WzzwWOF7zo0xHw/w+bMhU?=
 =?us-ascii?Q?1GLJ+rtUg1uMdncHE9TAaxRhp0g6B9Voe8+ad1Onaet368IhT7i1xWIBK+f/?=
 =?us-ascii?Q?pfseOveh4UJD6KW8GUFaiU6wyR/zalrFzDxrJl3s//ZjXh1Uyqic78Lp9vMI?=
 =?us-ascii?Q?rL3821jKMbuy6Twje+KTQdACitgqSvCGeKM0jh/iJuyHmfoPRNt9+WJNdR0F?=
 =?us-ascii?Q?OYO26QTDkvM8pk8BEKQGzt+jdV1Sb0ulw7upuoZaHwIGz0e6bfUhGFL7NuGT?=
 =?us-ascii?Q?KUICTuumjikXJxIkXvVOLq1/kGwzv1fPntMZFpQ3k4TnQ3pyCp72moQ/Llb2?=
 =?us-ascii?Q?g3grtPV6xy7y2wWWPBpbpaxFw8/tprs0JsL1i1cLFexmK3s0i6yCyO7SpxEK?=
 =?us-ascii?Q?hb8HAZagX4Tu5hriQnEDhw8oOwVqYHLFG6VmBWJOvB4Le+n6/WIAtxZuy0n5?=
 =?us-ascii?Q?VkDBkLDcUIWyx1lCPkHr2BDUM3zpNT9o+ivDY4d0w1JT0MS22SqT4PIl3EPM?=
 =?us-ascii?Q?6P4FuzC+7Qvlbxke13rIgPaNp6LnjPkHapWjtMXGzj+n7MXUyrDuzIjcusSi?=
 =?us-ascii?Q?7T8oXqxjiqKlTtFoa69zRUhthhMr+2eLBq5b9v/lzCuRVzgufmN2GkzeWyxL?=
 =?us-ascii?Q?qGqzZkdmJ/oNIxwCQvc2WO7D7Var7Xi2O40fX+RPX9dMjyGKjMZ7cqnExR93?=
 =?us-ascii?Q?4BAxoz6tC62Yvs1kFBZ1fetSdzFIdqxkANfSuxyQ0ZAwB/xrUK7D6QM9TE5w?=
 =?us-ascii?Q?fVliOX9oAzqWXZBLrb5DhbS8dOOelxYIxnDabbtv9mxrLQbai58zpG5BfNzi?=
 =?us-ascii?Q?FpcGxBIzeNpYPq63m3ybfOrClRqFbRkWpozcRo9cPJWDv+nu1s6vaj4Ml1GW?=
 =?us-ascii?Q?XikWe4yWNKfVMJ4rCdevz/jSjO4aqRTjpRC+snGqjthxo9fWpQL1hklZEMrl?=
 =?us-ascii?Q?3Aec54Vyb3ELyHvhVLdgWUoMFgIAlgwPSpN8yWBpkgjegZN8PUKTg7UnNZDI?=
 =?us-ascii?Q?KDrPqg6vGt/KN74C2moj+3r16znp0AAr07AhibONESv3K/iKdu4+fTTlY56Y?=
 =?us-ascii?Q?mT/jESFg9tEMzO9VVPxivK7ZrKe6gqVH3zOUAF8dkRLNz3PgJjsRfRSeFIFE?=
 =?us-ascii?Q?m+umm9G1BQkW/tN76i6tmi1aVrKNlVrF7B1Ppz+TOWOgtFKroj02fQIfpxkS?=
 =?us-ascii?Q?nsIJGfRZwjujiuAXVBU/6oHHv/HAtmRX+bgkz2Yv4lDDwKdW7GG1lQ0U1iZh?=
 =?us-ascii?Q?3FemkQFjxRT5YTAGQZVUsXpKq+oDSE84yI5QRjVsVGVdiPQw3VyBU7Z9lNPx?=
 =?us-ascii?Q?ynk2ZwXLAThHywqm6/POLDfgsXtoiP2AOi+RWnGzbrd6YrxVH3jFPNpGilgL?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2ad84c-5ba9-4354-b1be-08dd4798a293
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:58:24.7250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8dmo/GEUzlmYrgq7J7Vq1avxCZGR6IuUNpqSIFnKq2uIBK+yQLe0kJ8ftB8XXcFnZ8oh7VNnIHAHThxjQ7vNRaVnyE01odg9ObOHzY9rls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

On Fri, Feb 07, 2025 at 05:51:52PM +0200, Juha-Pekka Heikkila wrote:
>seems <fcntl.h> is needed for O_RDONLY flag on some platforms.

I found the error in gitlab and added to the commit message.
Here is an example: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/70719166

>
>Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/d3602c12b73fc950da9ea575a95d8b923c7a27ec

Fixes should reference a git commit like this:

Fixes: d3602c12b73f ("tests/intel/kms_ccs: add hiberbate test")


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed. Thanks.

Lucas De Marchi

>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>---
> tests/intel/kms_ccs.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>index 8be3c063a..ad0ffe589 100644
>--- a/tests/intel/kms_ccs.c
>+++ b/tests/intel/kms_ccs.c
>@@ -33,6 +33,7 @@
>  * Mega feature: E2E Compression
>  * Test category: functionality test
>  */
>+#include <fcntl.h>
>
> #include "igt.h"
> #include "igt_halffloat.h"
>-- 
>2.45.2
>
