Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9423606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qs/YpYUQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C1310E0E8;
	Tue, 20 Oct 2026 21:25:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECD910E0E8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792531473; x=1824067473;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UUNDcZROPYN9AB3lygEESPnBTU84DN4dCyeFiq1bOrM=;
 b=Qs/YpYUQgWcF+gs8rFIBoJ5hn8TzuAF5j95M9pjQjJaKdi95EXoY8AJy
 JEUz/rWIDym8oMZfBHg2S+7bPw9cOTV3UFJ4wV6sVXdkLtVXBkQluy857
 02DxI20yxZIumqc0RpT/NuZXsRH29p0EXC/DizeJ7xq3NscKjc24ZcY6E
 jyjhBwv6w7VnF8gfMS9KlQd+OjjdZksO73SMz3dEHm9gYd+XLNDZUKTNn
 4XrtlB/OtgXjiuIKG5+4aGne2apxMDYPhnEp+vpX/QrSlWV93oF6gYa0H
 4txGpng4MUdCfJw+3Fr7TTRmouVvNh7lgB9pNsqk+xZA9hU4d3tVmZlda Q==;
X-CSE-ConnectionGUID: GIImX78ASSW83Z7HyOHhNg==
X-CSE-MsgGUID: JNnY6njpRGm6M+qgNMf+pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1277056"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1277056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:24:32 -0700
X-CSE-ConnectionGUID: Xm3hZ17CQyu9Z+nPrLPdfw==
X-CSE-MsgGUID: 9Lv/zvrGSRKzcmHboRzNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3225488"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:24:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:24:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 14:24:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPCtNUvR1jXNCRubM6ZM2u5Z0678yHM55j/NnolcQTVa81tt0vWBCG1dhDbnnomkgEDvRcuZfkXEGo9uo5GZxIzqM67iD0SCskTi47WlNYSUFPcYeWz0lYLuVICe+5IQArYS8awD+7woOK2y5AgErkJLsPbHbC3mzWd/yoS46bK1m0tWYI6zUrIqd5upFmrJAFTGvj/0iMQFISYKq1tl8CNUCpezQdq716HnTjrCPfFv9ebt9fuyjUP+VO/osxqDkAi2MU/hr7YlhTnWL8vi6PJYZy3OFqoArvhe8PHjUjHNjj2tqSCjDOuujXVHQZRSxcBe+7926dOnYDC3brWJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVTOY79pskuuQau3dhx5EOomoHTlfT7q1iyaW0KcWn8=;
 b=cVhvEHIdT3S+9wQls6Ho/Lh5YuUDsnGjjxwLZax8pGqJozurMLguQzR5nOcd2U9HmmNxAoZ8hOEoocylLKoZ2UItiP+3YzGR/iThAb8A5jFxB+yUJjl47Zw7hJdqtt9/ikMgd8OWreGQjFcwpExDMOVkw5E/jivFDk3s2o8E9h21PIBeGbFbZ1iZhiRCqZ/dLhaQgCD1Cb6amNIc3Utg9QpYu8zds8/hxHFdto25Dm66q1VPa1Tzl1+gVPIWvcdYOaq0Sb8eWprwXEys1G8a1As/sRxze6L1V4pN7D1lMoChcyIt6WA6weGLzM7vS/h913V7yBk12tSQatOqHHL9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CH3PR11MB568792.namprd11.prod.outlook.com
 (2603:10b6:610:362::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:24:25 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 21:24:25 +0000
Date: Tue, 20 Oct 2026 14:24:22 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 03/11] lib/xe: Gather workarounds debugfs dumps
 in a cache struct
Message-ID: <20261020212422.GB180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-3-528b575299d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923-wa_14026539277-v2-3-528b575299d2@intel.com>
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CH3PR11MB568792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6f5b7f-c0a2-4a84-68a9-08df2ef083ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|10070799003|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Pz0ppawJVluINk7gW9bhiCPDpuLULDwiI/Ng8fOmD97Yiutisage89IlQspxzaZ5GO/zCd7HawoE1r9WcH40xZEKRQkVibjbr0ITpjF/nE4xf+1YqPRUuX6I5f7mv2oy1IPANE5OEZNYa+XURP2AxG5BhDa4rk7ORKVCoBxrAV3HGzBvSsH+5mipDAQHjihaHQlLFOMeiymiDe0z/T8o3lrD++/DArAyrRozJ9gdkcMYft47VPAHBhCTqkbxmb33Hhj1kJNmn1B19z0rl06oqWoBSZy1XKN78b6wWakQ9K1v33/xlEiAqZugSlH3Cpte259CSTBzBu+WDzqEG2+q23h8ZA0+k9qZst5ffuOG6c7dNaWZdH/KuNG1YUbuII0YVRMFuhBEvRHwr0PhYiMvVsFlYoIMMOyPIBTvVZwmtTIGhBJt+AOSJMo/3TNC0uEP4JEC6MIE8QW9k/orBMT2+lP75DfKbOlyID7fijqCQedXUWboegHKjegQCxmw025JrirgPVb3lyEJKWTvPkHhIAoEywq6EMlY3HBdM1J4UtHQ1xGdOD4JTsqXjBLkhlhM4lDreaGBG5lbY2gkwKzuS6a8RNN5Uih6orjHJmXbLiKbPgCz4CZhoW7G0fNBfGfr5ZFw3GrinaC30humYSJoqE7BOedoS6u/s9X+9rjz0PA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(10070799003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CKHjU/blpoLDAl3lb2Vu5J3q0ur56vkelFxWnaQnMcwCPCdUNh3Tf1AQRqw?=
 =?us-ascii?Q?qxHermDynl1jyuji9m+0dgk5D8MNTzZ729gDnOq72lVm+JBjjfpzKODI8E9V?=
 =?us-ascii?Q?94w5H7m8yIZTTGar06YTfAyfOFKGSw4TZqhRATST0DvH+6FhP3F9NH2q//ur?=
 =?us-ascii?Q?VOcd5WvC/aocT8kG7d61zycQw4xOcGXercSYmrjvhhhZrw9HrLSQOh7mgOBO?=
 =?us-ascii?Q?T2bwum1Fglrk2QJGTcLhzbA8vB5tSzEb066eRNycuBMGnKfrhlfUjxqgP3cx?=
 =?us-ascii?Q?fjw/COMfWAwHeHPuFMhsBGgz3Cf953TGB9RXGNVDNPWlK25M+UY8v4OUXbgk?=
 =?us-ascii?Q?xrPKEKX3AevRUEQvJBn+wQBMHoewXj+hmr1eAg4bkKtReScXXzCNv0T5/OCl?=
 =?us-ascii?Q?tG8/GIw1OX9uBI0zkCmgk9sVWKYhDvNcCgNO9aCfnh/d5iu8JueP9cPaXAEY?=
 =?us-ascii?Q?UrZTAUhKPsLB6ffj64ZgaQhzuc/tLwzzjff68MGdbSuYRni2OpwqU6bPtb+7?=
 =?us-ascii?Q?wSbBeWtZhl+u2I+aA3uueT8eM9hfhQCakHN4qMkqv8uzNb9tTM8zdxf2Ey9s?=
 =?us-ascii?Q?HKXuKZ1h3oI5Km0N3kK8gnnw3+9pna1QpIA6j3G009pikvJ3b33x/mq5BEGw?=
 =?us-ascii?Q?u4KtqFebjEgO88nQXZ1XRgxweRUL2H5j6OQXbCXl2sfgkgzN9dqKi+ermLgX?=
 =?us-ascii?Q?Rax9QvWT4hoxoBnYMriOSR/HrWZqh/OUlpPCmWMFQvsA0GST0kUBVqZHourz?=
 =?us-ascii?Q?0Z24WYOPlnAqX+YsW31GuT4igkbrR4585XAijcQDjU3U+BLySAY7MkJnu9Dy?=
 =?us-ascii?Q?K6RZWQNyKRmki8aQKVZoUQHwHLRSE2MX+UrV8lPyqjJ6vKOBYZoHpE/UQcjC?=
 =?us-ascii?Q?AUmnTB92U+pPlhTsXnBUgW18mU5Mw/wf6Z+LhedsiClz/8WRo6GcX2bl5Ei7?=
 =?us-ascii?Q?c+g8wzcn7YVMNFUIhREkkabp1+US557rwhG/rl1MeAY5WBTfXb220IilAbKs?=
 =?us-ascii?Q?dE760tp797OIrSt4oA0rnHB2c/0flQAMIV8zSRp8emM9QQ0S7Tdtry3HotMm?=
 =?us-ascii?Q?pcEmf5s5sbTc7IJ+2LE8EVwhC3NWtavk5TZRYreuaViggGB7j+ABV1l14mZP?=
 =?us-ascii?Q?BCH7JtWTkMqmLjb/WVLAHH7hQ+SEbycqEShwPrisBvC8pH4Az6UK6X9n0K/b?=
 =?us-ascii?Q?12G1Zs1J0QlVSkaPn+FfFRkwIeT8iTyqtPFx7Aghi8zB3SXydAPN/DBR5hdP?=
 =?us-ascii?Q?FTo/8wVenQl/W19EquhnZUVCWZQbss4nEzAC3SSsAN+W6MD16bCrPe7+Id//?=
 =?us-ascii?Q?bpR7BHp9a9Rai06Vyde4KSFtQfjcnG50l4V16cjoXaGTCjex7IzuclHlt/Go?=
 =?us-ascii?Q?US7VSx54mXl31W8bF+EpKLVMGuotVpzylkhtzFQd2KyzDwON71qlJZSTUw+o?=
 =?us-ascii?Q?yj46EW1P1IzYt6Ra1VF0AYgKI0kqHWa07da95bHPMpWgaJK4e7tMG7JFMB5Q?=
 =?us-ascii?Q?gIz0CJysFprrJVUXwdQ9/eOMa/RC1vjJRppiOcxd6adTlvAGAO6fjhX1dcCC?=
 =?us-ascii?Q?obLKAcIuPhH153YaA8B0ra1wARrOny4AtVT35fbCKRc6e6rEtdSqnWCVKOiz?=
 =?us-ascii?Q?/uEZotTeUYexNXDz4F0vsl9BXgiLr4Ksujwr29lNcaC8o1dlMjBgaq51ZjIF?=
 =?us-ascii?Q?XkvfsRWt+2azIKMyfXGSXg1kWj9GPE96ZGaR93QLBs4ySK5aJn5tD7t5N8tr?=
 =?us-ascii?Q?woELv0kMvEYk4H6YAUIh2xVzTt6I4fAHBtIY3os5ckfrE3NTGrN3n/2J/4ka?=
X-MS-Exchange-AntiSpam-MessageData-1: Rt5zNplt9n6vPxQbgOtT9M5wpWNW8x+cDSA=
X-Exchange-RoutingPolicyChecked: q0HM8v+VRIUEsDzqQcs7XTk3WJREuGJVtcM5OAfqGNpPmeWAXziALDw2HiRBwzEkmj2+YhcT4dHQruCDb9ryt4kOHUInsb/S3Aj6T4eKBxDH8oPQD7WvIL0/3nBKfrYn8kb7gRCAPLLbwp/Sm3fT5Z0GvUEfScgw1vajlKemU37GY2WlqE9pA9O8qbILAD9ehiwGkkCXHwl0k5t8cs0lSy7Rd7L/kk8g4c4nRVcv0nwd87cHqxLbpqBIkCD0Sm+6MLAsFxA+tQIYsKL69xmYpJfviE+MjKupRPmuf7hB1OBJTMpWzWm8Zyu3J2w8EHXSGllEFdHxf+fkn1LhXi5h3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6f5b7f-c0a2-4a84-68a9-08df2ef083ee
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:24:25.1935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iskl8rnURnzNaB9mqfzkj5tOJN+7/QRAJlf/3PtDe0yvhsYD0DHDdwBnMaRN4edenfWTFVCKCGkpSaBEiaXu44ZVsGw4Jm/gzib6wksg8hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB568792
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 23, 2026 at 06:41:10PM -0300, Gustavo Sousa wrote:
> In an upcoming change, we will cache workaround information in struct
> xe_device.  As a preparation for that, add the logic to gather the
> dumps of workaround debugfs files into a cache struct.  Such a cache
> will be kept attached to xe_device as a follow-up.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
looks like MattR's rb got dropped from series one
> ---
>  lib/xe/xe_wa.c | 140 +++++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 106 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index c0c97e244564..93b97c7c1476 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -8,6 +8,7 @@
>  #include <stdint.h>
>  #include <stdio.h>
>  
> +#include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  
> @@ -16,6 +17,101 @@
>  
>  #include "tests/xe_wa.h"
>  
> +struct xe_wa_cache {
> +	int num_dumps;
> +	char *dumps[];
> +};
> +
> +static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
> +{
> +	for (int i = 0; i < wa_cache->num_dumps && wa_cache->dumps[i]; i++) {
> +		free(wa_cache->dumps[i]);
> +		wa_cache->dumps[i] = NULL;
> +	}
> +}
> +
> +static int get_wa_debugfs_count(int fd)
> +{
> +	int gt;
> +	int count = 1; /* Device workarounds */
> +
> +	xe_for_each_gt(fd, gt)
> +		count++;
> +
> +	return count;
> +}
> +
> +static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
> +{
> +	int gt;
> +	int debugfs_fd;
> +	int count;
> +	int ret = 0;
> +
> +	debugfs_fd = igt_debugfs_dir(fd);
> +	if (debugfs_fd == -1)
> +		goto err;
> +
> +	count = 0;
> +
> +	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
> +		goto err;
> +
> +	xe_for_each_gt(fd, gt) {
> +		char name[32];
> +
> +		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
> +
> +		if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
> +			goto err;
> +	}
> +
> +	if (igt_warn_on(count != wa_cache->num_dumps))
> +		goto err;
> +
> +	goto out;
> +
> +err:
> +	free_wa_debugfs_dumps(wa_cache);
> +	ret = 1;
> +
> +out:
> +	close(debugfs_fd);
> +
> +	return ret;
> +}
> +
> +static void free_cache(struct xe_wa_cache *wa_cache)
> +{
> +	if (!wa_cache)
> +		return;
> +
> +	free_wa_debugfs_dumps(wa_cache);
> +	free(wa_cache);
> +}
> +
> +static struct xe_wa_cache *build_cache(int fd)
> +{
> +	struct xe_wa_cache *wa_cache;
> +	int num_dumps;
> +
> +	num_dumps = get_wa_debugfs_count(fd);
> +	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
> +
> +	if (igt_warn_on(!wa_cache))
> +		return NULL;
> +
> +	wa_cache->num_dumps = num_dumps;
> +
> +	if (igt_warn_on(get_wa_debugfs_dumps(fd, wa_cache))) {
> +		free_cache(wa_cache);
> +
> +		return NULL;
> +	}
> +
> +	return wa_cache;
> +}
> +
>  static int debugfs_dump_has_wa(char *dump, const char *wa)
>  {
>  	size_t wa_len;
> @@ -76,27 +172,6 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
>  	return debugfs_dump_has_wa(dump, wa);
>  }
>  
> -static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> -			       const char *debugfs_name, const char *wa)
> -{
> -	char *debugfs_dump;
> -
> -	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> -		return -1;
> -
> -	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> -	if (debugfs_dump) {
> -		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
> -
> -		free(debugfs_dump);
> -
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * xe_wa: Check if a workaround is enabled for the device.
>   * @fd: A drm file descriptor.
> @@ -106,25 +181,22 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>   */
>  int xe_wa(int fd, const char *wa)
>  {
> -	int ret = 0;
> -	int debugfs_fd;
> -	unsigned int xe;
> -	char name[256];
> +	struct xe_wa_cache *wa_cache = build_cache(fd);
> +	int ret;
>  
> -	debugfs_fd = igt_debugfs_dir(fd);
> -	if (debugfs_fd == -1)
> +	if (igt_warn_on(!wa_cache))
>  		return -1;
>  
> -	xe_for_each_gt(fd, xe) {
> -		sprintf(name, "gt%d/workarounds", xe);
> -		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
> -		if (ret)
> +	ret = 0;
> +
> +	for (int i = 0; i < wa_cache->num_dumps; i++) {
> +		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
> +			ret = 1;
>  			break;
> +		}
>  	}
>  
> -	if (!ret)
> -		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
> +	free_cache(wa_cache);
>  
> -	close(debugfs_fd);
>  	return ret;
>  }
> 
> -- 
> 2.55.0
> 
