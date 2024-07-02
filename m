Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A898C3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 20:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3870810E6A5;
	Tue,  2 Jul 2024 20:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrNdiMF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE5E10E6A4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 20:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719953873; x=1751489873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ALYhxuwhoPGRNETzT+AZZf5MN1/YBbWwIkfb3yU4Vgg=;
 b=UrNdiMF5d+Fy63SZTgP7IMbgBVUb1Q3wrexMCvaUhSUyZ8rtZEeGGaFB
 HIdCnGtICghOlBLZ+YA9PorQlBHD7THYP8XdNCTWl3olajk5P2VFtgwcZ
 bhgTl+aZ7AZSwpb+uVbwkYUwSg3qfJStPIO1GZn3S9cJzXLuN521uFZok
 sysovd6gIAQ0dlvG/kvXi8BUjIvPTlDVOj4K1MaurT0lIlEq7aQ/XPwoJ
 MFWMGni0dToOiisGKX3vJDSQi+5AT+Gz0YcTzZ0mTHNmyUSBPSmclPMJq
 +FiA3F/yDl/EeYyx5lgTaFYUnOECxdmZ3xhzJ0K9CATaLU4kIKJBo6MMq A==;
X-CSE-ConnectionGUID: bT5jM/7OQVu8i0WSsTL8WQ==
X-CSE-MsgGUID: OotTbIXPS/aoEhdKyQyWaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34600837"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="34600837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 13:57:51 -0700
X-CSE-ConnectionGUID: PqON85WzRUuF7WFznzkuBQ==
X-CSE-MsgGUID: tRiDzbhMRbGwRsInlmGe/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="69204411"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 13:57:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 13:57:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 13:57:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 13:57:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 13:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjJK0vYdXkXbOpysGhMfcNJ2Da5DWRKEthXLQbcCo8LGCfnIWRiC4W009X277S9Srzwo++XeYXXa/x3FwQ2RXdPUhLbNFFnypumtVTybc3CjUzdDBwHe0XRQciRWOuaxGomHOUAwUs0/DlHNl9vjBogJlz8h1o6AafL6eqHYy6RC2b7bcjAvnTfpgGdIUtezRKeCppsvtfe7D87G62/ikwIHnfGWVJ/foEWk85SC3le3GMkemuKwSYrKEd0/GBCMUEJasLnXooT6esh0DGzKtydFFYrYSALAzNyUtoG2/YVKtaCpPRYHJFfDgKe4zXgkxUrnx0xgpCzKd8Titll3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o6Z7ZK/yYXU1VLfmfhOj30UcTJRyVQlKIOEFrtrtjY=;
 b=jTECbduuWxozoUQ/mZrJn5N5L2M26hMgs5HgJqGXDTo8VYFLgodsQmxCEs5VqcQVpxuERFhKxkF8kpJhGSTub9+VrPpruRKRY29Bpe72iftbQ7hLcZuE+lszNcuxnJUUcU2gALd7AL20KaXY7NiwypekEQTFKD9G5Y8UjXQmxbY5Xhhu6FsfJ6i1aUad8B6Fd4cFmD6UTG+kt83E6+Wd6t+uRk1s95okG8PKZrCcKqtaF2UF168G60SclEUAJGYXd+eBE9vuThxDuLfTXf1OKr3RtP/WQ6jCN+oEKSHIALptba6i+u0kFp1qK0HeNeQPS13VrE6+ZkcGjmsm8440uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 20:57:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 20:57:43 +0000
Date: Tue, 2 Jul 2024 15:57:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/8] tests/intel/xe_drm_fdinfo: Add single engine
 tests
Message-ID: <ye4mxp6akc6mqc5xbkmng5gi72ftgoze2iwkjnz27ixoqx4uio@x4s2bfpceeuk>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
 <hbv7noflzphd4rlkfqbpqfwqaygqfezuavd7p7ovddvm3y4vl5@445l423pjo3n>
 <ZoL009g5Pd+J8XDw@orsosgc001> <ZoREiBXWJethW5kO@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoREiBXWJethW5kO@orsosgc001>
X-ClientProxiedBy: MW3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:303:2b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e9f180-fe4b-4942-24d2-08dc9ad99e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a76ECcOqqlQXA+dG1IIClDQrtsA1sfnn0VPJPjQdFw2r9HRGzV/w5iiXwM1Y?=
 =?us-ascii?Q?VVQT7rOfcoYgcwRk7SVsg4d02NhNPfI+TK/vxlfxGEoA+QmE3r+5rUaHGLma?=
 =?us-ascii?Q?ixqDrnD1DucXaS4A2TX1ihnaBfTcqvzZfYytP8NibZWqGJddUU+M92cPr3Zj?=
 =?us-ascii?Q?9rgsSsYOPnD6eFXDncpxr0cmLe7PBkitR2WNuv2L/myucOfk3jhi3HP4uqJx?=
 =?us-ascii?Q?LA/HxnGraISvdcJwQ4C+EzcYYXMK+psCDqfkKMQADS+yMldBUW2SiGXlsg53?=
 =?us-ascii?Q?HacAsRPSmGAd12AN9iUqs+WaMtx7NaaGXCeBjxlPuGtqZFoTyPlm/Y4g6e4j?=
 =?us-ascii?Q?+v9MEyXUWeyhjs+njUPe1l5PuQjyOKC8EbatIlBpbstf9XXlOWJfsRBTrIzT?=
 =?us-ascii?Q?dooA3G78qJQKbdmEKVYXBwg4i6Yh27ncJnoncypQ4jVUuH3skdlA6SbtsCps?=
 =?us-ascii?Q?w/QEWxGuQrXXLjqn3R/BXyiG9xSrOCGCAlUct4bbf6bT4WCWnGRij/9zGy7o?=
 =?us-ascii?Q?S9NOASHjmzPNSEp3xmwkDl1bKYhowDT77g4UFYpB7skbn0eT5FqoqiVZvX6h?=
 =?us-ascii?Q?c1t8NKXVUXa+r7rA/tKyW9SinYJWGbX69Bkrj8lvyc+J2LBStXszs1jQEDQw?=
 =?us-ascii?Q?J8PusOLDAVRe6AMS1d3Kz4BMlK0Evr7u/A7LRidHwt8wt2k5QnkdBV62Dldv?=
 =?us-ascii?Q?Kj4NagjVia1AKWyUjrF6LHtVQ6rts4pFzHy6SEnKP7fadIxN7p0VV6yzSmtJ?=
 =?us-ascii?Q?JxqmMhwQ/XUB/TmB65KecIlxRNC+C1NEUfB4rjlgIqtMGv+Aqhk/2HIZcfGX?=
 =?us-ascii?Q?T+pt0uyeKqeMdTOAm0N1EU1WbzXWI9JmXOYr+kXwDDxN6HtBhXVLYVFu6JRw?=
 =?us-ascii?Q?yDWtFvrdajqtSQ9acEkpI+81jyRLmY/9xw+MceaokA0GG5eDKGIdFYLHSnOp?=
 =?us-ascii?Q?SL+XvP9fGvsyJ+pOuR8f0aIHGn3hhRmp5I04hs1oB+o7BXdnwna6fVZbeDTU?=
 =?us-ascii?Q?uxni5EEVWv+yhbnryhifufNu28YqU72Zv2xLHB3owGY2YKFyljvPZ4I/8p5g?=
 =?us-ascii?Q?MDX4KBGRzIvFbaCX64uAgkgoGai8IFnvuKlyr7XszMv9TMidvbu6MfSYGjop?=
 =?us-ascii?Q?UA1wFDoqrRTM0ZXST5igE/91td7Rzp8+02f1j7xIiBY2U8ZC6bhrOzKnh0bQ?=
 =?us-ascii?Q?tyVXa2f8sqPNpvEjOEhcevl+HOFRWBDb3cwRSIpQS8qwEw6sq64UJs23pXJq?=
 =?us-ascii?Q?wJBqL31OPS6AKUSKiUJAg4dYwhrgThfDSObZGd0jJ3cYD4JdH72PtL6vs4HC?=
 =?us-ascii?Q?H6NGEnT+2Odzy2Tkwa87hQibWy1ijV8+90lC00D2xKi5aQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?co0JeGbaOF8/CNjYARsb5Jr3m50xVolz/iqBhgBt994CSTyBMnwOkEkX7xgw?=
 =?us-ascii?Q?ce8+0p729Rpbr8eaGxtS5KlzV7D8LCtS3cxDGPryNEPNypU5J1cURj31/Kri?=
 =?us-ascii?Q?qGREDddTr1TLvEK6mhUMAcT0xJT4SYILExX/RyLv5m8+2QUWbyTV9rgOXrkH?=
 =?us-ascii?Q?FqqilnvMaVqsfQ0G0LZ54ICeeNLdzNGH28pyeeBJff/baC0ny8WcY+ptudV3?=
 =?us-ascii?Q?SN4PXUHqe2Ozk8vrXp3luFRQ1dUkFeZLt147/qLFHQZeJpIeAFszAelGwDC7?=
 =?us-ascii?Q?mNBJNnweNatkk/RQW6oz25Sc2UaWg3sN1xIuc+RvBRiazLXUfdkGLA37Kf9V?=
 =?us-ascii?Q?MxrG3VMyPt9z1dw5t+FchkMcql2IlnGNHZHMKaQDF3Sc1JsxxlC0nL+qC8S9?=
 =?us-ascii?Q?5ZSfOx4p2kLZPj7tYUo9aO/DTOP65vUVlm3GmAuVu2Tgh/BDYXfoWym76uw0?=
 =?us-ascii?Q?nbJL6QDwoJzt//9mRTteyQ/OXoDjPXXyl0rtM2sb+sfD7ST9EIvEYIm5Ofkr?=
 =?us-ascii?Q?I2NcEllwnEpkdI/3vnNbfv4Hp3qr04ejmv1jXsPSWNdV0NrpnoiG3azbPffA?=
 =?us-ascii?Q?0yDDd40cNPyz6U9CHNtpwzf8keSa9QVIZ+naf8Jbjx4DFGkqhhjCfY36YdUj?=
 =?us-ascii?Q?wbxGA58HtCFR51uUTwieeuJ8jrOCg2RxpaTei7mx6NpZMp4RMeXtfvf7cN6Y?=
 =?us-ascii?Q?5OdJviaChq9HXmuE3JFjk3/Bj/VRbglVW1IV/Zbds4RLbjr9dfoQ+mDYFjnH?=
 =?us-ascii?Q?y8zkPepsEHUnb22+s5t/xlGqgpUhh6BBUeomZiyk/fQTng7ax/+wjdNiMUq3?=
 =?us-ascii?Q?2ATmxlX+BIuAEd45J8M9zlW33cyvNguqWNPz45MeI6+ByPN2bYCQmujJUSQi?=
 =?us-ascii?Q?DS/QtCes4aIk8M9iYqKQ9FCFU+7MjzqTjNo8FyncLGHHdRhbrCR/+z6OYlz8?=
 =?us-ascii?Q?NLgbRl4LWjnb6WWApDwBrMEo7hJPchdb8az96NsKRLQSNmbDEIr2ibjuax8n?=
 =?us-ascii?Q?K916doGAhlfg6Cy+Bdomof9RcmSxd4BsyUDfvASrxEm1fY8AdJNTcxGantxL?=
 =?us-ascii?Q?ThFDUjGslD+DfU+yP7iDerEaZK0mSSwYm0Xis0zj9V2R9XoMbSEMhR4iJ0mG?=
 =?us-ascii?Q?qpjC9QlinXO7ilqlU/77WbpAhPx6w0DHtXLZ7bQH/qXgU/VW0j6aww/xExO/?=
 =?us-ascii?Q?aI6Lc1N4bTbGTus3aOhLj8wIOM5AfLfuIKL1WW5Ui6nVzJYTFj9j0Zk4Vf7m?=
 =?us-ascii?Q?XO0WVmsmHxy+qetIO0p+2U7C5gZuI20l9s8nGihcuQA635IoqBtfziAq7zyO?=
 =?us-ascii?Q?KLOm80PBO7YO8jamX8nHLioCs7d4lGWHIo6qhFyGaV8wDzaqjSzavQd/DJPO?=
 =?us-ascii?Q?VWWhnwcyhs082zhiybQlcZENSh8aj1EekAE2uDpfjhlNh6EXgMoz5DKLau+u?=
 =?us-ascii?Q?5Kk6G7UG2O9bJINZvVvK6PjTk7XK1JT03XhzWqdYv9C8osZXOeUSJyiKDk/c?=
 =?us-ascii?Q?h714PkvPfrElElOBfIEouI2S9/Lq13ouQEvi+4KYmLHTMFJ9zAmoo4uH3Dc+?=
 =?us-ascii?Q?BNiKRDlmiaxqHoIxLwptYe2ugE7+UBZf7BQmuzu16zVIgrGuSlv/2APaybeU?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e9f180-fe4b-4942-24d2-08dc9ad99e54
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 20:57:43.6446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8i5iqR8ukWf/g73XWFbLEuVt5K5yyEtGVhlNSzmfwMs66kJyQ4uaVud1I7jJk0oEaN28EsO6SH41ulnf29iOPkgXtAEMquHt61zxNQEVw8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

On Tue, Jul 02, 2024 at 11:18:48AM GMT, Umesh Nerlige Ramappa wrote:
>On Mon, Jul 01, 2024 at 11:26:27AM -0700, Umesh Nerlige Ramappa wrote:
>>On Mon, Jul 01, 2024 at 12:35:24PM -0500, Lucas De Marchi wrote:
>>>On Sat, Jun 22, 2024 at 07:00:58AM GMT, Umesh Nerlige Ramappa wrote:
>>>>Add simple tests that submit work to one engine and measure utilization
>>>>per class.
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>tests/intel/xe_drm_fdinfo.c | 109 ++++++++++++++++++++++++++++++++++++
>>>>1 file changed, 109 insertions(+)
>>>>
>>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>>index 27459b7f1..852931d71 100644
>>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>>@@ -25,6 +25,15 @@
>>>>* SUBTEST: basic
>>>>* Description: Check if basic fdinfo content is present
>>>>*
>>>>+ * SUBTEST: drm-idle
>>>>+ * Description: Check that engines show no load when idle
>>>>+ *
>>>>+ * SUBTEST: drm-busy-idle
>>>>+ * Description: Check that engines show load when idle after busy
>>>>+ *
>>>>+ * SUBTEST: drm-busy-idle-isolation
>>>>+ * Description: Check that engine load does not spill over to other drm clients
>>>>+ *
>>>
>>>can we split the mem-related basic check from the utilization-related
>>>basic checks?
>>
>>will add a separate basic subtest for utilization.
>>
>>>
>>>>* SUBTEST: drm-total-resident
>>>>* Description: Create and compare total and resident memory consumption by client
>>>>*
>>>>@@ -39,11 +48,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>>>
>>>>#define BO_SIZE (65536)
>>>>
>>>>+/* flag masks */
>>>>+#define TEST_BUSY		(1 << 0)
>>>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>>>+#define TEST_ISOLATION		(1 << 2)
>>>
>>>shoud we document the mapping to the subtests?
>>
>>If you mean something like what the xe_exec_basic (below) is doing, 
>>then I can try that.
>>
>>{ "basic", 0 },
>>{ "basic-defer-mmap", DEFER_ALLOC },
>>{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
>>
>>>
>>>>+
>>>>struct pceu_cycles {
>>>>	uint64_t cycles;
>>>>	uint64_t total_cycles;
>>>>};
>>>>
>>>>+const unsigned long batch_duration_ns = 500e6;
>>>
>>>please use * NSEC_PER_SEC
>>>
>>>>+
>>>>static const char *engine_map[] = {
>>>>	"rcs",
>>>>	"bcs",
>>>>@@ -76,6 +92,27 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>>>		pceu[class].total_cycles = info.total_cycles[class];
>>>>	}
>>>>}
>>>>+
>>>>+/*
>>>>+ * Helper for cases where we assert on time spent sleeping (directly or
>>>>+ * indirectly), so make it more robust by ensuring the system sleep time
>>>>+ * is within test tolerance to start with.
>>>>+ */
>>>>+static unsigned int measured_usleep(unsigned int usec)
>>>>+{
>>>>+	struct timespec ts = { };
>>>>+	unsigned int slept;
>>>>+
>>>>+	slept = igt_nsec_elapsed(&ts);
>>>>+	igt_assert(slept == 0);
>>>>+	do {
>>>>+		usleep(usec - slept);
>>>
>>>mismatch between usec and nsec here in the first sleep. I guess it's
>>>easier to convert the arg to nsec and then always have the same unit
>>>
>>>>+		slept = igt_nsec_elapsed(&ts) / 1000;
>>>
>>>NSEC_PER_USEC
>>>
>>>>+	} while (slept < usec);
>>>>+
>>>>+	return igt_nsec_elapsed(&ts);
>>>
>>>wrong unit? you receive usec as arg and are supposed to return usec, but
>>>rather return nsec.
>>
>>Hmm, there is a lot of unit mismatch in this helper. I think I will 
>>just convert everything here to nsec.
>>
>>>
>>>Also, I'm not sure why exactly this is needed. usleep() from the C
>>>library already guarantees it's going to sleep for *at least* the
>>>specified amount.
>>>
>>>usleep(3):
>>>...
>>>DESCRIPTION
>>>     The usleep() function suspends execution of the calling thread
>>>     for (at least) usec microseconds.  The sleep may be lengthened
>>>     slightly by any system activity or by the time spent processing
>>>     the call or by the granularity of system timers.
>>>
>>>RETURN VALUE
>>>     The usleep() function returns 0 on success.  On error, -1 is
>>>     returned, with errno set to indicate the error.
>>>
>>
>>I think the requirement is to know how long the delay actually was  
>>because the "sleep may be lengthened". All utilization/counter 
>>comparisons will be against the actual delay.

that would be a recipe for a very noisy test that doesn't withstand
minor disturbances. The exact amount of time the task slept on the CPU
doesn't mean the same execution time on the GPU.  What we can do is to
provide a margin to gurantee it's approximately that number

>
>Looks like I am not using the returned value from measured_usleep 
>anyways, so will drop this helper.

yeah, I don't really think it's needed.

>
>Umesh
>
>>
>>>
>>>>+}
>>>>+
>>>>/* Subtests */
>>>>static void test_active(int fd, struct drm_xe_engine *engine)
>>>>{
>>>>@@ -451,6 +488,66 @@ xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>>>>	free(ctx);
>>>>}
>>>>
>>>>+static void
>>>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>>>+	      int class, int width, unsigned int flags)
>>>>+{
>>>>+	double percent;
>>>>+
>>>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>>>+
>>>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>>>+
>>>>+	/* for parallel engines scale the busyness with width */
>>>
>>>s/parallel engines/parallel submission/ ?
>>
>>will change
>>>
>>>>+	percent = percent / width;
>>>>+
>>>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>>>+
>>>>+	if (flags & TEST_BUSY)
>>>>+		igt_assert(percent >= 95 && percent <= 105);
>>>
>>>percent should never be > 100.
>>
>>Yikes... that's a miss. I did see a couple >=100 though!! and 
>>modified this to check how far it goes above 100, but completely 
>>forgot to debug the issue itself. Will debug.

it would be good to know when it happens.... maybe because we read the
gpu timestamp earlier before looping through the exec queues and
reading/aggregating each of them.

	read() {
		read_gpu_timestamp(); // 0
		for_each_exec_queue()
			read_exec_queue_timestamp(); // 0
	}

	read() {
		read_gpu_timestamp();	// 10
						<---- process prempted,
						      lenghtening even more x below
		for_each_exec_queue()
			read_exec_queue_timestamp(); // 10 + x
	}

so, yes... it seems it could fluctuate for more than 100%
in the spinner case. On  hindsight I think the margin you left is good.

>>
>>>Also, for >= 95 to be true this needs to
>>>be the only client.  Should we check for number of clients and skip if
>>>we find others?
>>
>>Didn't think of that. Wondering if there is a way to enforce a 
>>single client somehow in the test. If not, then I agree to skip if 
>>more clients are present. Any idea how to check if there are other 
>>clients?

instead of reading /proc/self/, scan /proc... Even if there's a TOCTOU,
it should be sufficient for this test. If there is more than 1 drm
client, then you can't assert the conditions. If there's 1, then you
*likely* can.

Lucas De Marchi

>>
>>>
>>>>+	else
>>>>+		igt_assert(!percent);
>>>>+}
>>>>+
>>>>+static void
>>>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>>>+       unsigned int flags)
>>>>+{
>>>>+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>>+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>>+	struct xe_spin_ctx *ctx = NULL;
>>>>+	int local_fd = fd;
>>>>+	uint32_t vm;
>>>>+
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		local_fd = drm_reopen_driver(fd);
>>>
>>>so you have 2 clients in the same process... Maybe add this info to the
>>>subtest description above.
>>
>>sure
>>
>>>
>>>>+
>>>>+	vm = xe_vm_create(local_fd, 0, 0);
>>>>+	if (flags & TEST_BUSY) {
>>>>+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
>>>>+		xe_spin_sync_start(local_fd, ctx);
>>>>+	}
>>>>+
>>>>+	read_engine_cycles(local_fd, pceu1);
>>>>+	measured_usleep(batch_duration_ns / 1000);
>>>>+	if (flags & TEST_TRAILING_IDLE)
>>>>+		xe_spin_sync_end(local_fd, ctx);
>>>>+	read_engine_cycles(local_fd, pceu2);
>>>>+
>>>>+	check_results(pceu1, pceu2, hwe->engine_class, width, flags);
>>>>+
>>>>+	xe_spin_sync_end(local_fd, ctx);
>>>>+	xe_spin_ctx_destroy(local_fd, ctx);
>>>>+	xe_vm_destroy(local_fd, vm);
>>>>+
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		close(local_fd);
>>>
>>>humn... it doesn't seem this is actually testing any isolation? It's
>>>just reopening the fd and testing the same thing on the duplicated fd.
>>>
>>>what I'd expect of an isolation test is, e.g.:
>>>
>>>/proc/X/fdinfo/Y
>>>	drm-client: A
>>>	drm-rcs-cycles: 0
>>>
>>>when executing on another fd:
>>>
>>>/proc/X/fdinfo/Z
>>>	drm-client: B
>>>	drm-rcs-cyles: 10
>>>
>>>
>>>so, check that read_engine_cycles() returns !0 for fd where you
>>>submitted the spin and 0 for where you didn't.
>>
>>will do
>>
>>Thanks,
>>Umesh
>>>
>>>Lucas De Marchi
>>>
>>>>+}
>>>>+
>>>>igt_main
>>>>{
>>>>	struct drm_xe_engine_class_instance *hwe;
>>>>@@ -485,6 +582,18 @@ igt_main
>>>>	igt_subtest("basic")
>>>>		basic(xe, num_classes);
>>>>
>>>>+	igt_subtest("drm-idle")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, 0);
>>>>+
>>>>+	igt_subtest("drm-busy-idle")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>>>+
>>>>+	igt_subtest("drm-busy-idle-isolation")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>>>+
>>>>	igt_describe("Create and compare total and resident memory consumption by client");
>>>>	igt_subtest("drm-total-resident")
>>>>		test_total_resident(xe);
>>>>-- 
>>>>2.34.1
>>>>
