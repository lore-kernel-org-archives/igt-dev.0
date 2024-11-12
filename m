Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B08D597A4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 20:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040B910E657;
	Tue, 12 Nov 2024 20:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="du6eGB+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38410E662
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731444583; x=1762980583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=64dtgjG1/c+xMJbMqSqCzNyKjgSQ+zqPinApeMSHtaY=;
 b=du6eGB+/qrzghZRANNNSaQmE+sjycSWn8umtV7Q7wJM6aKisIGgT8t8x
 ID5p6sIm4/XnyqXTGqFCnEcsYZw9p4G4ulQ2BVJ/g5/kxHdzVs9CiH2y2
 VDjJ88HD2OG9gx6w+xiWkBJGfk3Gz3aR17ALpjhkajODiJYAoLHSYLo7Z
 xs1HIxurL+JYTTm+iQjgie2jMJlPDEtyuS27XFcoty4NfMGs4x8C/R59u
 TkV7Jh7Ke4W5OwXqfLJMtvFYDz+ljrD4R1Fco2q3BZKjEHrhVCFLNbPhS
 ITkrUqnBXZ2WzOH/VT82V0HMgZGSjRkQuIznT+nbRFBr0sDJOaf8SB12m Q==;
X-CSE-ConnectionGUID: Yil8eX6RSgCFi8arfFYMXg==
X-CSE-MsgGUID: Rl6C+oIrTniaOboAVeNASw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18917705"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="18917705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:49:42 -0800
X-CSE-ConnectionGUID: XT0IQEMURVOoP8fzeWE+pg==
X-CSE-MsgGUID: 6xZ1bzbdRKeY8PacOBs88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87215543"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:49:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:49:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:49:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:49:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdWHsJe4adyDrg0QiOhT1gk66JarcQoOTBLT8uEG5QpDGZsvo5IPVycsJQF53Iui+B/2PbQHL51scDCJ3ZE+qGACGi7fT2YFEWDVIuF4aeqrZtwF8lVaSvRpgOCJlWH6TCXo9/cuV1VJ5dSg1pjbRIzmjyE6gOM5avViv7PxdnIaOlP82X8DXAJNrWyTKEpEBAIv8T6DoFgypQTBY6XwrvBc7ZaSUzTmEwzRgQOdaAWcPlm1lJB1CpyqSjRWw7xWR0lK+9VyEnW5UdHNgGPzGhQOvLedUXoXtRv7IicFQk5CFZuDlNehIsY4TeLZd4N12Ix0+5IIObyWh+K1G62QVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kumWq5UYEC/E5FIcVwH2fJYKSx2YkhBCj0MBSxBHgaA=;
 b=l3zmWXe/IpkE3lXtM4ZqxTMRWxjiGLNZ8+6ACQBTyGzLx/nBZl/ZXq1h/jMKiOZYdgOPhC/LBTAu/ZComHRiu3n3vprclF0JrzantGyhr7iF8kCBEF45pWM4FnB5EqnF/TB1O7OicSUSLtt4qEzBvqY2QDHYZgClNBUDwEu6guTXM0r7EYUN02yc8UKAtdtzSkGaLwPJivaK9CvsQ+Ahta36/zEsRLluoWGKtG3m4GpqSormw6ygn1O4POQ6oUaepjPziAsPNku2dqCbbO1SAvuvORKjD4dBBqfTk39f3lvuN/MF/vRSDbfHHlLE/siZetARs9tyLrvztkK2h3xFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 20:49:37 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 12 Nov 2024
 20:49:37 +0000
Date: Tue, 12 Nov 2024 15:49:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t, v3 3/5] tests/intel/xe_fault_injection: Use
 igt_sysfs helpers
Message-ID: <ZzO_XmXHHk10L6Rz@intel.com>
References: <20241112133034.1919573-1-francois.dugast@intel.com>
 <20241112133034.1919573-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112133034.1919573-4-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e28e06-7acb-4f31-cf1d-08dd035b857f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U9DEwG5BxePVwG2EoXL0dCsrvxvRF2rVtypEYHOByktL4ZP6tFPSxAdb8y0Y?=
 =?us-ascii?Q?wwcyeePtLfcD6O354I8UCM5IFyIytNHilE96MCmHyn1QS3hUXCeoyZlflMXi?=
 =?us-ascii?Q?v4TaLk66Xm3R7YnyJSv+cREU/x976gLguCxbIPJ3/+kmA/ZGA41p6j0XgCm5?=
 =?us-ascii?Q?U4oT91cJQNBq+MzlW5eML7uySaGsOapGwHrGgA3GmJ1KEe0GRyH09P/+kgoY?=
 =?us-ascii?Q?gIo7gq7SPB5DlwnAK5ZKZYH6NuVoGwc4kWr6uf1oToZNijFl+doLpEF5mK5Z?=
 =?us-ascii?Q?AX66Q2uULXdWSEXvXAtpHEYgGxgYKlwGPyNhYHzBTlighcKpjqr8DUPT6y4P?=
 =?us-ascii?Q?HBk8rY0LbRp/IQXqmIPwLHB4X7YMz5WiO3EYwJHctmJmmUr3/ojUgKiC/vP/?=
 =?us-ascii?Q?B27vzundrlzOuE/VWmMOppC6kXYVbAeCMKo45M2WkZ1BFtGDik/OF0qRnlPD?=
 =?us-ascii?Q?/7+QmrSPpZnPzCHLp1VW3KmKaPrv+uHaMzBm5ZhkRs6K1RoeOqFP6Liz+H8a?=
 =?us-ascii?Q?QHxySOs2QfVfFnmxjbs+5CDig2V64COgfnf+0NJ0kv0hdTokomj44oIl4ul0?=
 =?us-ascii?Q?+0xz9xCwuhTJgJetVFi6rK3aSRjKE1zDB6f7+gFVH+remyzEs1mXyCNyKLCw?=
 =?us-ascii?Q?u7X1ZgoYnTHGdcnQ3rZCgGxu57zizKkApFl2EZci+glpXOmsyErY6JezeNVf?=
 =?us-ascii?Q?DEruTKI4kqjZHRbsPsS+6Kq0VN75YhMuVHk5FHqnCAIMwgmD7dTaIau1uTfH?=
 =?us-ascii?Q?fQ6V3Ut2/bowiwXe0rQb6IMdR2Rh79Ots5cmuK7CuhGwRbRCokycs7ZCeLpU?=
 =?us-ascii?Q?zJ51rJG7hUASIMUsQIRrEloGW8rzKvQAQdei/TUcrQriPhHXPdGWoBufr6iY?=
 =?us-ascii?Q?DSpxNZmPwR/UXDih+5joeG4H/WNAGHuI6DuWTcsZ3HRez+Oe9wXv0nz6XoD+?=
 =?us-ascii?Q?oDTV59jZrQiixi+xn6qvfOGlx1acwz4drZduOmhxIPhrNnx271CIy5tefOUD?=
 =?us-ascii?Q?5mQJn7DrxbTl4H9iosl5rFY1rcYjXY+U0WK7KYo28SxH0QcYtbqsBmIaA/0O?=
 =?us-ascii?Q?f8BYPHC5iIW0/eMljZcHAeft+VUyqZ0CMqpxMoN3T+i0k/isiY+sOl3yey58?=
 =?us-ascii?Q?Xkd1J/k/tolQSaCe5JWd6yj1Iv9amwNNR6d2/MYsvVabMP54p8yxIDa4XKwa?=
 =?us-ascii?Q?fXF+XaGbyIkagxLMJDSd57ap/NrgB9gfu1pKLjfS5cu9YZfiyMzshHCz5ewj?=
 =?us-ascii?Q?ehvj8g/eSJDRiJK0tcpDfF9ZSWenklSrjdKZ1xQP2YWYedPyOAD8s6ZiMryg?=
 =?us-ascii?Q?AYTL0aMlUj+OEmdDo1JlO2Fv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3E3eCukpPiKGdHmCpkHti2a73mDnuUaTRem6cJ3iaVx6NclRCXQUbXafeCh9?=
 =?us-ascii?Q?LajlCyBWUhPKc45iOy1Y+vLuTK2GKMCweWsdlOncVvW3CT00XM8NP+P+2MYZ?=
 =?us-ascii?Q?ETbPW+TWOsa0EElM3WC9fersLq5paxKvb7OqR6FQ/UojRZEZwixtQAKw+aSt?=
 =?us-ascii?Q?QfGKzrRpOTEVTm1Hd9wTWAJSsLOLADp4/XyvnbqO9DQgD+ekdfRB6XIjmcCc?=
 =?us-ascii?Q?KR5Xn22WJMYkpQocF2CI1ZFAHMQSAnT0zoZ70o9I0iuLLprK0PBIFtYjoO6W?=
 =?us-ascii?Q?M26c3pJ6yKC4hzfbZfKm5O8qctTEOw4799llwFgATpErFwojFFWYSbCAb/9s?=
 =?us-ascii?Q?xS4rExpzys5LUGbUF6sMu3ox8JM6M9vOj1yRGzSGr9NowIfFkrRdBScCXCC+?=
 =?us-ascii?Q?XjhEi37/6GFY4m+yq9G9HW8etdKFPov8GTUn4NqBX8umASObmDnWvSSJ0hUV?=
 =?us-ascii?Q?oIo/QHhccadlsSEmxqEckPz4sW8+DxV1sPZZqNqNh05F9YttX7enE9M7o2BK?=
 =?us-ascii?Q?t9snCcIkzwU5KEF2dMbUgY13PFenrn85FMffLKcUNyq/H//1UwK6on3fUuUe?=
 =?us-ascii?Q?z8E3KFASGTCJk4dCUmlsi20YE0jxA3LG8k63PV5FzBWKn/dg+LRiii1yglbs?=
 =?us-ascii?Q?KItpgCR2Y+RFYx/nAHuzAeHzVQFN4R1bzB4HIjQ6ZxhOFC/oODVxajFatQa5?=
 =?us-ascii?Q?yqTMwKuXlfnqVvOc+5V53OUVJylQfplPvjZnLiY9GT72EgQJwr5gn4xZpwL6?=
 =?us-ascii?Q?4PgoaF4Qfo9c2M52b1fr1SVngdDbcqY23QnWCkOPmHLa2b286SV8GsNEzVqa?=
 =?us-ascii?Q?be9Un8/3zHpY8y0r3cTqTaybqUNjiLMlgTVxQXuzBkCX3JebtdevhSkNedH7?=
 =?us-ascii?Q?JnJvAgyQfn5wStzfm/FlvyaCvcWORKnX+TiVwQj9CO0ACuhTNsbfvKxSfLUQ?=
 =?us-ascii?Q?K5wwi7W1xgie4SKXdiYNEFeVGYQ+fkbUjWKePXDCSk2kR+tmmizhW71lySNZ?=
 =?us-ascii?Q?T0ftLFoZPIpq8saG2L6ZSt99q9eX+avaVEohFgPDNlSI0suUvLpH5XJGzcYX?=
 =?us-ascii?Q?Cjj11G6YJnWOTfhVxogBJldXaUHjskXfECnQ9GfRkYOcwad6hkRY3gWTwnzj?=
 =?us-ascii?Q?aJk/8b+l49E13aesLE8DXnL9IYzXW3faAx9QJ4yW81OmQ2J27hC4r4oTv2c1?=
 =?us-ascii?Q?PbUEdTFONHTfUo1fy2mQFuIAyIx1LbANZM9bjZIx0CtJ4qw5eSNSuap5VhTv?=
 =?us-ascii?Q?6VeJj4h95Pjb79iRJ9Dv8/5u1CxeL84BA6qznD6TV3AzA1P0IoMHBPLwRSPg?=
 =?us-ascii?Q?ey9UpR19qPEhoRr1K7wdg+v/jWMxpWUzSZSMcZat2UXtnp/nd+2ZvwAi6kwu?=
 =?us-ascii?Q?2LzeKhjNEkqN80+FbzqX2t3KsvOG/zF36XO9k0Di1R10ls57PCYXZXKs0Krx?=
 =?us-ascii?Q?jh/slzgB0ck5JayNYw4bpLxuHMNx6Ijgq8KazY7G7IazKrN+hVJukxreZhwn?=
 =?us-ascii?Q?+mxgf3kVmp/E5S+3yb5Tr2sZMChvru6KXw36oBEVSpJqrq7xjpDr1gsK5obo?=
 =?us-ascii?Q?Dy+fu4Qd6AXHbNyVcUuDhjom+hhevjamX9VmA047SjXYacZrhpLiyojpLubN?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e28e06-7acb-4f31-cf1d-08dd035b857f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:49:37.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5JIz940iyOr4SlywHkx+aiWN0p0UAXCzXC56caCun0wA4cZwaL89YUPNmvhl6VRPZcwAAftyAGvODHLKc0ovg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

On Tue, Nov 12, 2024 at 02:29:52PM +0100, Francois Dugast wrote:
> Make use of existing helpers from igt_sysfs where possible. This
> improves robustness and removes code duplication.
> 
> v2: Keep verbose value to 1 (Rodrigo Vivi)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 127 +++++++++++++++----------------
>  1 file changed, 61 insertions(+), 66 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index aca3f1ce9..f99cc48c6 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -11,15 +11,13 @@
>   * Test category: fault injection
>   */
>  
> +#include <limits.h>
> +
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  
> -#define MAX_LINE_SIZE			1024
> -#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
> -#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
> -#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
>  #define INJECT_ERRNO			-ENOMEM
>  
>  enum injection_list_action {
> @@ -27,40 +25,66 @@ enum injection_list_action {
>  	INJECTION_LIST_REMOVE,
>  };
>  
> +static int fail_function_open(void)
> +{
> +	int debugfs_fail_function_dir_fd;
> +	const char *debugfs_root;
> +	char path[96];
> +
> +	debugfs_root = igt_debugfs_mount();
> +	igt_assert(debugfs_root);
> +
> +	sprintf(path, "%s/fail_function", debugfs_root);
> +
> +	if (access(path, F_OK))
> +		return -1;
> +
> +	debugfs_fail_function_dir_fd = open(path, O_RDONLY);
> +	igt_debug_on_f(debugfs_fail_function_dir_fd < 0, "path: %s\n", path);
> +
> +	return debugfs_fail_function_dir_fd;
> +}
> +
>  /*
>   * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
>   */
> -static bool function_error_injection_enabled(void)
> +static bool fail_function_injection_enabled(void)
>  {
> -	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
> +	char *contents;
> +	int dir;
>  
> -	if (file) {
> -		fclose(file);
> -		return true;
> -	}
> +	dir = fail_function_open();
> +	if (dir < 0)
> +		return false;
> +
> +	contents = igt_sysfs_get(dir, "injectable");
> +	if (contents == NULL)
> +		return false;
> +
> +	free(contents);
>  
> -	return false;
> +	return true;
>  }
>  
>  static void injection_list_do(enum injection_list_action action, const char function_name[])
>  {
> -	FILE *file_inject;
> +	int dir;
>  
> -	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
> -	igt_assert(file_inject);
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
>  
>  	switch(action) {
>  	case INJECTION_LIST_ADD:
> -		fprintf(file_inject, "%s", function_name);
> +		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
>  		break;
>  	case INJECTION_LIST_REMOVE:
> -		fprintf(file_inject, "!%s", function_name);
> +		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
>  		break;
>  	default:
>  		igt_assert(!"missing");
>  	}
>  
> -	fclose(file_inject);
> +	close(dir);
>  }
>  
>  /*
> @@ -68,61 +92,33 @@ static void injection_list_do(enum injection_list_action action, const char func
>   */
>  static void setup_injection_fault(void)
>  {
> -	FILE *file;
> -
> -	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
> -	igt_assert(file);
> -	fprintf(file, "N");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
> -	igt_assert(file);
> -	fprintf(file, "100");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
> -	igt_assert(file);
> -	fprintf(file, "0");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/times", "w");
> -	igt_assert(file);
> -	fprintf(file, "-1");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/space", "w");
> -	igt_assert(file);
> -	fprintf(file, "0");
> -	fclose(file);
> -
> -	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
> -	igt_assert(file);
> -	fprintf(file, "1");
> -	fclose(file);
> -}
> +	int dir;
>  
> -static void cleanup_injection_fault(void)
> -{
> -	FILE *file;
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
> +	igt_sysfs_set_u32(dir, "probability", 100);
> +	igt_sysfs_set_u32(dir, "interval", 0);
> +	igt_sysfs_set_s32(dir, "times", -1);
> +	igt_sysfs_set_u32(dir, "space", 0);
> +	igt_sysfs_set_u32(dir, "verbose", 1);
>  
> -	file = fopen(PATH_FUNCTIONS_INJECT, "w");
> -	igt_assert(file);
> -	fprintf(file, "\n");
> -	fclose(file);
> +	close(dir);
>  }
>  
>  static void set_retval(const char function_name[], long long retval)
>  {
> -	FILE *file_retval;
> -	char file_path[MAX_LINE_SIZE];
> +	char path[96];
> +	int dir;
>  
> -	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
>  
> -	file_retval = fopen(file_path, "w");
> -	igt_assert(file_retval);
> +	sprintf(path, "%s/retval", function_name);
> +	igt_assert_lte(0, igt_sysfs_printf(dir, path, "%#016llx", retval));
>  
> -	fprintf(file_retval, "%#016llx", retval);
> -	fclose(file_retval);
> +	close(dir);
>  }
>  
>  /**
> @@ -161,7 +157,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  igt_main
>  {
>  	int fd;
> -	char pci_slot[MAX_LINE_SIZE];
> +	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
>  	} probe_function_sections[] = {
> @@ -182,7 +178,7 @@ igt_main
>  	};
>  
>  	igt_fixture {
> -		igt_require(function_error_injection_enabled());
> +		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
>  		setup_injection_fault();
> @@ -194,7 +190,6 @@ igt_main
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
>  	igt_fixture {
> -		cleanup_injection_fault();
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
>  	}
> -- 
> 2.43.0
> 
