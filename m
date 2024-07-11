Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41370C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCD910EA7A;
	Thu, 11 Jul 2024 13:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxRZfQz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29F910EA7D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720705257; x=1752241257;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MTTnPv7Y7jrQy+QeOaOZkAa17BxmDagWz/0VUU54lnM=;
 b=JxRZfQz8c/m4JB9oLHRk9Qygj+zJaRgFMiQxaXR/ZSTIAtbR7/hMyAYo
 T4EPiXMelFe/mKkKDV1LjfjxzvEFBike+RmjieU+TKiDzy1ZjMNqzKwWZ
 Bns8Mr/BhCGxfapBCiI8PDtt7cRO/OsKFjIwNuFBoFWG+KtAjk1p/Zy2c
 C4hT9UJE9XAmm5DGtFQYCKLs6J0dAsRHvt+hSW8duLUwvnVlUxBzsBwWh
 89OX7cVMQXtP+rxuPKx1H9xQzQU12jyWWdk69cn1e9Mf19m7owDCsCHML
 5KQOshph0qCRAbRXwAAGsG4PKqxDWYftQnRXn9p1gQCNwrTwsrCxuejYS A==;
X-CSE-ConnectionGUID: y+xZlJ6XQ4ibGFTAcOlOEA==
X-CSE-MsgGUID: oLc0fN1PRQuMAnWU6pbzxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29488518"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29488518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:40:57 -0700
X-CSE-ConnectionGUID: 8CzPBsFZQBqeIv1VxAQmWg==
X-CSE-MsgGUID: JWLc/BiIR5+1FyOQLOodcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79694456"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 06:40:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:40:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:40:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 06:40:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 06:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGWOUh1NH9xhbK48QzoVfKZ9+bKb2WhG7iQGndN8nCxPcCpxtI5fEI4L4jSH78msSQ0tZ4mCYJ3uUlTc2Ul7bxSdQwpJNbnu6Q1GQaMxEyQMfAmvK9rIr5GzgyiLH6DLx+fobFNqeC8xeaGp43Y7oOZn/OCxGvBeBcir6xYjdRikc6wjx+3rIHz2gat9hA3HAaohtDoNbWQ4bDumpAiGmUBmuQRohK++Dw86cv1Qm0gSsIu9M9kw/KXrKCFJiN8mi0rRMti0JME/DqL5dIL6sTpiZUX3rR5L7vUcWInlZ8hUQtw5zNcRokozpjcE/1ir7Tj6CF0NkAo6vaWZ8wu8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/fe1LSX2FNJmcR3ofD4msbjCY4TdDMLfXNvxpT/7wQ=;
 b=UGS5E+vVsTEACxy+4YPrG7T1mbK4NhyIxA1aaCUoLJRtzPN3Rr9RcQvcbJyLwXjXbFoB8u4Bb8EIG7q0bjRb1QCpwwsU2gf5Rd/hnN2ezVVEoPcruVj7+BbVwnE61II2vw6coHH3MEVgDfd3FmVHr7zPhVft/+R2aWi2Q3LqOqqjE6M29wf1GA6pXfSg1UITuSbWVbIy3B9wlyubEUvE/oj8N5p1/rt9D5Q2CK6N9x9sbMRPnuLOc68JnoefrIo1hrCzkm0JV/UtWosbDxY1N0719hdtMOSmrYTFB5g4OBIMff610x24AvpJQxKlldkG38luV6jcLmoEZIR/5qGuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 13:40:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 13:40:50 +0000
Date: Thu, 11 Jul 2024 08:40:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 03/10] tests/intel/xe_drm_fdinfo: Add helper to
 read utilization for all classes
Message-ID: <lzcmgzn5o7gqpzalda6gs5kahgawiuofrimvqjdlfbi7j2syn4@mchmw5yfpqz4>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703002532.3156277-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW2PR2101CA0026.namprd21.prod.outlook.com
 (2603:10b6:302:1::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0a5e7d-38cb-488e-2e1e-08dca1af13ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pR7x+qbZo26Mkl5+9Wp+kKuExRDVTwtoTQq04ziSijNb0IOTpcN0wbxtPp0q?=
 =?us-ascii?Q?IKPBAYwBiZNKv6RVrh9bl6z3iPNwXOrpzC6MsODlhjwGAX8wqE6FF4ynsA0s?=
 =?us-ascii?Q?iwxz274O36lxP6vxzZX7uQV+bYn0x1hXjVfx6aQMVoKiYvoKVmFgLgzqUvNF?=
 =?us-ascii?Q?QszZwUfk9XC4ptsE7W/VZemyIJxa5nn8ziX1XVM4jJtM1i9+7SlmNf3V88O5?=
 =?us-ascii?Q?BeBeYbiw4xN3ZD/AHHpS+mvFJm6eaKX0bq1r4VOjB2BMPUZeyYctcxDkKwFW?=
 =?us-ascii?Q?2FOWMHhminkz/SSZq2M3yxy1fzls+qGBY3VjWGO2X6OcNXmzspQUDOC6hFbg?=
 =?us-ascii?Q?Talp1I66lKtz6yj45DXMXdFX484rfPx0onKwPnqj5kd9id1beTPmIZ3cfTtw?=
 =?us-ascii?Q?3NxBIahXhKz7tdaUBENImRb4YYDlCh0PXiWNz55KW4JzIicQY24xwJPGJXVh?=
 =?us-ascii?Q?6EwVCFHtkcwp0aF0jCLTnhm+7STlMznxWIoxDSVNPkurlNML4ulu23EDhMtX?=
 =?us-ascii?Q?8YhTF/50B4JVgALOEvlLBY60yQejnh9J/S6X43IAcZIlOK8908H0PFaDR1UU?=
 =?us-ascii?Q?0e4twlvZV3JEMwft9dgJQtHHWD63pd3cvh1N9qN1dI/JyOVWqhdSBjewfIOo?=
 =?us-ascii?Q?uIlzgUY9lVEUvEtl6eBd9WpXm6Uog1Xpy540IGggth+/H69m3AA/O/Q7LXSP?=
 =?us-ascii?Q?bWeHGqnwqm9IdQZOKiYuAA5T8DcI9+/87AwcTekFGBK3gKv8NX7J0jeraoSv?=
 =?us-ascii?Q?S+9xM7LNENnS12m0r6pDGp93Ac5zk6gES+XmTdQhprx39qTbGfXFO9R0/r+9?=
 =?us-ascii?Q?lJ2rlCaQFcW8vyFgKExyjMZyvGRBAexibH/0qJjgcfn+XqYVBQ6GCKCywK1u?=
 =?us-ascii?Q?RttHgov5xHX0j0Q3PQatxNploOAlMOIKgb9i4UbEq8UPTgQtzfOaLhg5ZGPg?=
 =?us-ascii?Q?SV9G3Qf5192LKYc0lhtzyLv6xeedY1JzkxXzKGoYWQ1uBCJW9ECb6Y3hs7PC?=
 =?us-ascii?Q?9XN2Z/5G1qhUSfJ2YohblxLeqIDNTTSzxhrk4VU/SOFkj1eGJPzUXc+2o5rg?=
 =?us-ascii?Q?Cr2p83uzuZOqSfb9nc59gYs1RIvtUK+TDDFwk2sDUDYCDqPhQ/LfVpHQWo1c?=
 =?us-ascii?Q?umFocx1wbAQBXN8iukQ0YdzBYu5W/LcdmU/xy3OM5hSFRj9iVi+yA756NI5W?=
 =?us-ascii?Q?xNrY5xddHBTj8T24FyDlFG3jqvGPiPLwUNCRo4sK5cO/wLSdawXLVkRYS03o?=
 =?us-ascii?Q?R4K0dYEKM6ynAFvDbrT0EYgGOKinES1uVJPjgtBysV8s4t8bs4N1JyELrvSR?=
 =?us-ascii?Q?z3R9eoi0A3fjO2x2oPZtTCtcq+1tu89ah/NKy7Jsy8xetA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkbBOl0qCNukjUyqghQh39v/LH6VQWyCqEDb0UMv2E/i+YvmF6G0vLGl1i05?=
 =?us-ascii?Q?DBZ2I0H/7NSZPKCqjL4DPDYPjZTr6AsXkI+GwZoKkZzQZsXkw5EWFYAnIaMi?=
 =?us-ascii?Q?xOHNWKHDBPU14wVQnLmWLxKlxBtZUBhhuaYa1RZaOjQqPS7WUfYBeGRJhkD8?=
 =?us-ascii?Q?nabZTocAkjIpU7O3GcyTqC8UbzqdrLnBOHmHkcV381MynWqk0SHbPRvHEQV8?=
 =?us-ascii?Q?ezBMW+DZfl6d3KVf70UJjxvGxTNBKpT4BDtPvejkbCHW0KGzhR1zDZvG4VzC?=
 =?us-ascii?Q?Rr5HC/lzZoIL8wwtzVmSJgn9DeoAmHQakg5qScWtHwbeAkfs9xVROWkwyG4y?=
 =?us-ascii?Q?v8aiHLS5pnGThc/l95g6H+O905VSB3RhDkZAi6kaMNBMbUx+j75MEh+GtNY/?=
 =?us-ascii?Q?TsGthtnAhBVPVyO1t2nNdndXsnM5BkWf5rYSFpMT5ne85Pc8pJKzWbCNiy6w?=
 =?us-ascii?Q?jkjYaNDQIRvOCVIyUtcyknLIB7UFFMZnu2rOI01e/5zWIYJDBYyfIGDWg0fL?=
 =?us-ascii?Q?N5UOFfU6vDDM96LCrT73YEGqTW40bnRra0KlzsfKyj327J/gd9KP6J2PKZTr?=
 =?us-ascii?Q?SblCYA/nxYLPRGC4NOXJa9sNRaKbTTIREiubFgvyXSGPM8gZPa0kLzCIeDo1?=
 =?us-ascii?Q?tPO4tr6LZwnSWkEHhDrQethuKNOj6+jeB6/gwrGp/5Q6xQqs4ldDcAvLWBTA?=
 =?us-ascii?Q?Mpe9ynDupn6G5FZ11LZnWqOz2LxB9PTpbdVk4xS1SXScT/EVCFeOtEf7dHSC?=
 =?us-ascii?Q?ELBFlGw7qg5mwiuNMISTanFyvmJ5zMpK8UpdlIo0/RzdRGa+7iAUXFVhNfcF?=
 =?us-ascii?Q?AuO6lZL1bXlxzaLO0udrgShzDQ4Dq/l5AiyMyVhuLZojZLlzvrWljOS397SB?=
 =?us-ascii?Q?bTMJpxw/yhkhwwpUtdjUVy8zd1a0a+VKW2gFIBDo1MGoRRQFsXiIfhNGfWUG?=
 =?us-ascii?Q?f/YgdqjvzDRToyPx3BtkOOlV5N9CKMiGuYlUhSOzN4prvsQPuWTPQoM/QtU2?=
 =?us-ascii?Q?kkN4iQkdEFolyqcKxMU+IgcxrMkDJRTaEuX+CWlLkKSvkSomXxAECBdhVm1Q?=
 =?us-ascii?Q?HfztBFgqJarnW0/6xrOvGVZM0R96UnvdADhLhs6hV5/fs80swJ6Y9Spqgw2t?=
 =?us-ascii?Q?LWHVGMYrXKRXH8WicRU4kzua5dRvttQji5YNGWljHBrwzo94qAntd4IY4Mcr?=
 =?us-ascii?Q?82vnAi5BQsl8S8Lv/pMESvMXFEWKYV3BxHoeqUSrCZQsJ9g8yabMg30xKXl5?=
 =?us-ascii?Q?73e4HSPGhoM4gP9ezGDQFQB81H6Mp4ik7SGlGo8g+M4WjKV63WCjG2sH4mMc?=
 =?us-ascii?Q?CndOfxxhzsyGWHDhYC4Qsz2yEjTqHTl1EXKgKpjnLmgvKP+TZeo9Nge7IhZi?=
 =?us-ascii?Q?zH6bUol+VZE1LsxcV3zI8JIEirw+Ib5yJhmc5wHeGQQUNAS2xUFwzHkHK3HY?=
 =?us-ascii?Q?NquFwf6Ziy4m2Q22ixJB5W87LZtMl7wXNDdaCcBSVBiLjvwquFdK9brbkxVu?=
 =?us-ascii?Q?zlsOzr4MzFMLZ+yPkNTGVPqkmgLhLDV90hdBY016iAxr6GaONjj5gZSqTbGr?=
 =?us-ascii?Q?kDsg04S40SnoSvxsCNjBswiWhmxk29rWyeLWO12Al4CxzToUSP1Z0nel73tO?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0a5e7d-38cb-488e-2e1e-08dca1af13ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 13:40:50.2073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3UWTpmmobovJda/pmNwrcaNxGVqlfSc6U3WfitDlp2X6YJr1S9cKsaIOGVjCf34pVByuq+eHZre2NZH1tFCumkoGu8dJy8Z6hPijjMNh4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

On Tue, Jul 02, 2024 at 05:25:25PM GMT, Umesh Nerlige Ramappa wrote:
>Add a helper that captures utilization for all classes.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index b64bef339..c697f3e53 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -42,6 +42,11 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>
> #define BO_SIZE (65536)
>
>+struct pceu_cycles {
>+	uint64_t cycles;
>+	uint64_t total_cycles;
>+};
>+
> static const char *engine_map[] = {
> 	"rcs",
> 	"bcs",
>@@ -49,6 +54,21 @@ static const char *engine_map[] = {
> 	"vecs",
> 	"ccs",
> };

nit: missing newline here, otherwise:

>+static void read_engine_cycles(int xe, struct pceu_cycles *pceu)

I think that would be better to give the compiler a hint about the
size of the array:

static void read_engine_cycles(int xe,
			       struct pceu_cycles pceu[static DRM_XE_ENGINE_CLASS_COMPUTE + 1])

(it would not be a bad idea to have a local __IGT_DRM_XE_ENGINE_CLASS_LAST
too, but outside of the scope here)

Otherwise,

// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+{
>+	struct drm_client_fdinfo info = { };
>+	int class;
>+
>+	igt_assert(pceu);
>+	igt_assert(igt_parse_drm_fdinfo(xe, &info, engine_map,
>+					ARRAY_SIZE(engine_map), NULL, 0));
>+
>+	xe_for_each_engine_class(class) {
>+		pceu[class].cycles = info.cycles[class];
>+		pceu[class].total_cycles = info.total_cycles[class];
>+	}
>+}
>+
> /* Subtests */
> static void test_active(int fd, struct drm_xe_engine *engine)
> {
>-- 
>2.38.1
>
