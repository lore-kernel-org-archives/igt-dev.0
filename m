Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222C5D5CCB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 14:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B122410E2CB;
	Wed, 30 Oct 2024 14:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ow3R25Jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5E10E2CB
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730297490; x=1761833490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8TasAXR3ejE7jxu8/i5KhnuH2t/ObT31Dlz9Jncqtrk=;
 b=Ow3R25Jk6eYARW0gJy0/xUFoNgcj2v54vYGHxAWl5/E+5y+NNr2YDGO+
 sYhQuHJyAJk1uIRwyFS0xIkl0wkIRRh64LcWXgub0jnp/iUY2cgOROmhS
 ogwubKl4VJFV6a4BUKdLzl662VsGQodnlh2Ez3Z5CjftQ6fmhvvez6MLN
 POBm4jZpcp/34qdIYNMaeaXsqaxwCz3opHsuyQCVboiqCf0YwTld0nhq4
 Dqs0TrxAbW5E3jEo1B1Re44rmHJ0GQmF6gUl9QKPGhZzcjk+AOalXfgZS
 VtJE6YjhCTJ6UITAiVYJ2kpAiBn2UUgdkShCd+Ez4bJN+dau11oa1ybFa g==;
X-CSE-ConnectionGUID: ebmfu+5FRY2FbjZIBibwSg==
X-CSE-MsgGUID: 7BplT2CnSkegLdXktqQ/OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29445495"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="29445495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 07:11:30 -0700
X-CSE-ConnectionGUID: nJqyi4E5Rl+SpA6f5xqEkw==
X-CSE-MsgGUID: ERR7AfaYSLiKtWnZgP6IrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="105642966"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 07:11:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 07:11:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 07:11:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 07:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHAQNnUsl9a2uEsHxbMGHkmGFUuqjzKJYt8XK8a8/fgQMNvL3bLrulojDDK2FxSeAC8rVCpvv0c0i8FajEx/RuYq1N6aMACl35cu6N6V5j8t9fA8qMUh/1qh5KNiOIM/EaDsLP+/cA0COic6SelOTB81shPjxoMZit9ge0HTqIb/3v/y5qhYYda929NkQKcHNKrfHm9NGO6WXgCZXi1Plj0K/Wo1xd4pVWBdHxwTwpt4yCAGDHo0xY0Cpf0C62MGRskj2rtYCDAboWw0V1cxkU3DdmMRQ+bmH3KNjZElok9rgSBRKTeeQTOsKp7zo4cd0qUUmrPXok4cNTxQvDNX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU1H3BCK3Z7BMapAqUjQjGFOjugM1w+Q/BD44klPThA=;
 b=yeTp9HT0CwlS+g1aJ+zoVP8J0a0eI4/AmN0Xj8C+/SYgyX+5ZNf9gqwRWa3OAJ1bZf38GbiEAvHq8AmfkZ3ExYEAuGyFdITIUQnAQjd62WO8wfvQEWjw874gIWoVO/ZP6HCOU6LRXr0vZ53UMNgt64tSPsZyIIZlKod+2L0UKiyeJDrvCgdMFVqWMA1av2q/PVPapg+S4o/aR764OwRi8FHOqullMd1FQiqXbnKGb1v3C5/mxtmsrsVbYeT8LcbdMiWoQoHG8s3DF3I2Y2CUujtU2BVHj6ARmkWKcrjNPEA+yBRfkxfI0CcHNpgx/E6IXngC+jiLpPdtkSec9+OlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 14:11:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Wed, 30 Oct 2024
 14:11:24 +0000
Date: Wed, 30 Oct 2024 09:11:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Export igt_kmod_unbind()
Message-ID: <5qff6hpibotyugon246bhuen4dvkvwx3jyn4hvlhv4wxgorp4v@qbyuw474hlkp>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-2-lucas.demarchi@intel.com>
 <ZyF450skb7ukCuaw@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZyF450skb7ukCuaw@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: 554d231e-cc3a-4df7-f401-08dcf8ecbcfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s76gaXpq9xHalmQA0BDqExuZV9nyHxp6jTqnIWnWLpw5AoNr0jpcYKzZJqr6?=
 =?us-ascii?Q?Xd00bufovu91vldF0buoDsbj1dH2ZD0Mu0b3z7g7bxWJHDpdFjC/1+j/BW0t?=
 =?us-ascii?Q?kQNP+qRVKbj67mVTMX68kdbcXX+v9pDR4EIsPuovruPujtyi4jGZXnb+cB2Z?=
 =?us-ascii?Q?aKk9BWbB3pYDlecfiaPwGIz+k54j4h/Ps/SEPmnINxOfN9KJMaNGWqUfIa85?=
 =?us-ascii?Q?Ugwv8O6TX1nhWqdIIEuVs8yfZJaiiRb5CQUiV4swcZ9eAyZ1nEjp4KY/k8Lf?=
 =?us-ascii?Q?lV/bNnjxBmpqvXKcSusGtm8aaPNYIHytIWOJDaQJkOmdYSMNz3WQ5vmfYLIg?=
 =?us-ascii?Q?ua/eZEy+vM7CUgktv2Su7/mOi8qNUNY3W/y2yfi9omnjGWWtywi+nwye2xb0?=
 =?us-ascii?Q?CvUD+2YOvKOalXCVP8/E4zKM8yN3t1E9Tth2UOh3FCBIbzWtvhR2rTWtv3d4?=
 =?us-ascii?Q?B0OwdQVQ7Zwh9XAjBaqRd/wNVKTKB7AM+aeKn7AlTCssoFVk4Z5j7NzRqvIB?=
 =?us-ascii?Q?tNpjFrNpIs274q4r0F0iHH0qe5FcSmILp34w3K17iabklM/AhKLJXzysR9SE?=
 =?us-ascii?Q?eYOax4bpTG7Z6Zyv7YMcLu0go62d53Qcnxquzz9wbspI+3EQSO+ouaR4CEKq?=
 =?us-ascii?Q?KteSNICYlP7o7wvauK4+ViICYtdl/DWy4DnQ+PxrxPuyxXkHV5pU4IzymBZf?=
 =?us-ascii?Q?I90U/ut+UhWIb9pgRouDUWRqO4pupZMazL6SL349ZInI1lN/SDHlwB8xJS/6?=
 =?us-ascii?Q?P9IwqIKaAqpVx0rLgD7iMeScSGTkXcKlqYCe8vlRUU8KPJ3UUbl6+nL2zD4z?=
 =?us-ascii?Q?W7i3jRZF6FXmhqEjXYttj7OzVKwW+kbaJhpJhI1wDLYb6lhORGLfjvR/K3oS?=
 =?us-ascii?Q?f+PDXc0T2e1n1y4lpvnymMTswSbCGxxUCyPq6SaPPO0Qpj8RZlBr0zvtqKzQ?=
 =?us-ascii?Q?O6M8pafJFikGeQzYMPxlrbxrIwvDjO5ANRYsBEfRwTt+b0E2AFd5EyZS/efT?=
 =?us-ascii?Q?qNP0UkMMJn81vEv2W5Q1IzBqm5U6/sPJNZQ7DDUxL/kNShBLZxq2qKUU0+Et?=
 =?us-ascii?Q?a4uXCwrbUceSY3KYWmx7zUiC+frikSi6j7D+3wzOK7ca5ebVjust5d/NdzjC?=
 =?us-ascii?Q?2gcoIRibLq0Fy+q0G3QPu2HJHOSpxMLUVlHTv6cEJ4x1nvX18j04MctuZxXo?=
 =?us-ascii?Q?NGUWizSjygfamxuRRu+x2W2Um3qt2rb0AsaI8kV+3EMyq5HK7/kWpejkahHl?=
 =?us-ascii?Q?orv1dnk92tVV43C4FH9Udx9Cx3hpGl7zWHREFm9bj2eu+NHGpUr5BA4OGbZn?=
 =?us-ascii?Q?5XgLWQ7O4ZJYiy0gE3OV/HV0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e0kweKuagLzlczumhWLBxSGzPw+dnKDZ7u93hXsVOhUHREfZGYXGsAPA88WE?=
 =?us-ascii?Q?yPwH7bmukkUcxhxdGVpJmlxjDm/Ujn8cUslp83T91atLNktiOW4ppP7dJOvE?=
 =?us-ascii?Q?6BeBFioyvKLuGU23VY3ItHVeEFJ/2hOvaQr1DXPKvmo65dpP48rsdNz0Czwu?=
 =?us-ascii?Q?JS9lwr1AUQg8ItCMjcMJIcO2vnt3QQ509vECdkhzOaj8bxVYfQX7CzNEYvRn?=
 =?us-ascii?Q?WFbFqhMwHAdF8C2+XsdNu6AmGru1Qv+XdpdIMywxkN6gmvHFq5nBNLYPGEUm?=
 =?us-ascii?Q?FpSKfdji3JOGR69JCskKxa+PBTDqzEfqqM102qtBzChdzOx5jLioKf7zL20u?=
 =?us-ascii?Q?+TtxB1WGfdrhaHZ3pL6/G/XIzEzVwzEsRu8s0LmNJPZZPAsJVgeK5o7mBT9A?=
 =?us-ascii?Q?z/wWe3W0Rsyji6r5zYodLr3RtdX8LfzxZRQ1BGKBoscqN/2WkGCzLyptdq0b?=
 =?us-ascii?Q?UhQohePX/Gp/xdNZ0kW/sSX+RS4ySSFW79fttgYm3047uTCOiE7pqLY3dPq0?=
 =?us-ascii?Q?pLz4sFVKd4jIcPqlL/kytVtQbjS1ssmQ9mi8Ta0qv+uGiRMGMbofHOk0DVBV?=
 =?us-ascii?Q?+tzqhSvCD3a6u8Sattw8E2ANLOpMEeNz3zD4ccUyhjKPsNFKPcdvJCoGtPt+?=
 =?us-ascii?Q?uyTig6gtX8nXnbHX0rb2P6IRzqZW/qnmxLeKmfiVa87KYIsCF8PlYbMB6sX+?=
 =?us-ascii?Q?twxAL4VvDDRQNorntAD3NMak/KwbK3NsjgRDNeKat64xq0v+ydlFiULdMQjh?=
 =?us-ascii?Q?EYPEIMcnJJrGnPYYeljKn01AZQyYE22GfD87j5K0k8vATNrvJKp3aKLQD/ho?=
 =?us-ascii?Q?hNmg+SVbvbPovue23zeokfdBmZ/QRo3Cz6EDUGC6VDjmpJfbHoh1crtnM+fq?=
 =?us-ascii?Q?5KNazmaybGL9bn9v09Pd6QSfmYLWJiCVFq5OtczDoZZainup3gJAQybf6hIc?=
 =?us-ascii?Q?kSji4ppThKBFbYbXsXC/weSCEvbpW/3KPuNB6aEVBYKD36+05fYjDpZZWJ4I?=
 =?us-ascii?Q?dl3CFpJBAKfsSuydxzC7blmYYjoyGkG3x5gjObg96dAv0YgZbC/mYZOgp8rE?=
 =?us-ascii?Q?Ul/kB3uysJIRMmO1eKWWCUFB635PGm70hB9Q9Xqowf9uk52dRa2fwB8PfPwk?=
 =?us-ascii?Q?t+I+nFPYBP7ULRimB0EBqrBIkPy7woTCxoEwwL+GlUU1LG/fuyIjrj1M6A0L?=
 =?us-ascii?Q?HFbPGE+akEii4BtJUe6X1reBtu2UaVLRN7VNagZbFJBuQfoGvnoG4O8D1Xri?=
 =?us-ascii?Q?D4UNtnFSkGS9CC6uj/XPryOw29aXEFNMkDPeEbz3Y6V6lKSEl3L+CK9wKv0j?=
 =?us-ascii?Q?TsqfRQ1icm4xgJIde0HFhEFNxJ3Er1RwxCtq4wFGU/j8f4LkREmiPbe2sAiX?=
 =?us-ascii?Q?md0J2iFuSZ6gd6nkxw3P19NMasBFWtVvGjHu+nM3z/LDYoIeKztbjSMY81Fm?=
 =?us-ascii?Q?3X+2+9nRKRus7ezZx9h+97VZGQTqJNw6TcdY255xYSxIEHbdzsvdLdp3UFkn?=
 =?us-ascii?Q?g29EXVYu5XWSqNTUqxXiodB41aR7iZSGRrMRK4mjyzoGiB7uck6jgskJ8BIz?=
 =?us-ascii?Q?vaq7Wresdk7EFTX4ZgAyhv9mm7n9S6m3Eo0nqX5bDIscNStVezj5Ie6UDaOj?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 554d231e-cc3a-4df7-f401-08dcf8ecbcfb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:11:24.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvqddDcbgfx42roOc7shtFYeG2e1HFukmjrdXARTn2woY/dRWaZETIWAVYuWgAkLZmUFh6k/cKXgF0lEJS36bVL2QZUkOC/fize/KelqyYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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

On Tue, Oct 29, 2024 at 05:08:07PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, Oct 22, 2024 at 10:05:01PM -0700, Lucas De Marchi wrote:
>>So it can be used directly by tests and other libs.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>lib/igt_kmod.c | 6 +++---
>>lib/igt_kmod.h | 2 ++
>>2 files changed, 5 insertions(+), 3 deletions(-)
>>
>>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>index 75a0d057c..039309328 100644
>>--- a/lib/igt_kmod.c
>>+++ b/lib/igt_kmod.c
>>@@ -663,7 +663,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>/*
>> * Unbind driver from devices. Currently supports only PCI bus
>> */
>>-static int unbind(const char *driver)
>>+int igt_kmod_unbind(const char *mod_name)
>>{
>>	char path[PATH_MAX];
>>	struct dirent *de;
>>@@ -671,7 +671,7 @@ static int unbind(const char *driver)
>>	DIR *dir;
>>
>>	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
>>-			  driver, driver);
>>+			  mod_name, mod_name);
>>	igt_assert(dirlen < sizeof(path));
>>
>>	dir = opendir(path);
>
>Maybe unrelated, but another issue I am seeing in this path is that 
>power/control attribute is not present in some kernel configs. Can we 

humn... I think that would only happen with !CONFIG_PM - is this really
your case? Also, do we actually have this running anywhere in CI?
I'd expect a bunch of other tests failing in this case.

Maybe we can just remove writing to this file since we are writing
"auto" (the default) and I don't expect anyone to be writing "on" for
our gpu. Even if it was "on", unbinding the driver would still work
AFAIR but the device would be left in D0.

Lucas De Marchi

>add a check in igt_kmod_unbind that would check if the attribute 
>exists and only then set it? If I do that, then unbind does go through 
>and the test passes as expected (with this series).
>
>Thanks,
>Umesh
>>@@ -744,7 +744,7 @@ igt_intel_driver_unload(const char *driver)
>>
>>int igt_xe_driver_unload(void)
>>{
>>-	unbind("xe");
>>+	igt_kmod_unbind("xe");
>>
>>	igt_kmod_unload("xe");
>>	if (igt_kmod_is_loaded("xe"))
>>diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>>index ee1719a8f..193b95627 100644
>>--- a/lib/igt_kmod.h
>>+++ b/lib/igt_kmod.h
>>@@ -36,6 +36,8 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
>>int igt_kmod_load(const char *mod_name, const char *opts);
>>int igt_kmod_unload(const char *mod_name);
>>
>>+int igt_kmod_unbind(const char *mod_name);
>>+
>>int igt_audio_driver_unload(char **whom);
>>
>>int igt_intel_driver_load(const char *opts, const char *driver);
>>-- 
>>2.47.0
>>
