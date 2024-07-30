Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99411C3DA61
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 00:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3493610E107;
	Tue, 30 Jul 2024 00:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK2aMnBO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578D10E107
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 00:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722299016; x=1753835016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xZwrH4FB2Oh4I+DGZzmhxKm1UO/jJZW2wExpkmfHAw4=;
 b=ZK2aMnBOp2cWZu4eoo6iTYWdNpSoUelMjBkAgcijAKyeFrS7ftkWzq1l
 k4J+awEDOfKUaG0qQqwZgWZAa2KdN9rp/qo2OpvZz97SW3ScmJKcrsIt2
 5zJ03te1Oa9ChsCUWfuPCLZoQ/FZd3Ho7Gaqz2olcjXaLzJyS4b76c1FV
 NWXj7Lg3CnHIVCOgUBMl16xOQqT0lAEZVhTpd+wdhprAt3c0JUR4sAoxt
 SrW7Rnd+OpcZ1PxkUc2YjsOCpd1a8gw7WXg2D8BHsQL4gu83sQkGsKL9L
 S+LdvsQKxn4hx8NFD8fVRmMsqGWKpQ1zN2vm2MihdbvL0U4szQ24qkTlc g==;
X-CSE-ConnectionGUID: wmwa5z2CTZS4y40TyB901g==
X-CSE-MsgGUID: 8DiDKYg2SC+GQzDa9Xm3fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19930353"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19930353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 17:23:35 -0700
X-CSE-ConnectionGUID: veWLvKZmRF2DsVq6Pge3fA==
X-CSE-MsgGUID: CSVYBJMdTuOYk/3iTWMW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54736876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 17:23:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 17:23:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 17:23:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 17:23:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 17:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjYJewscGmgiLlbRWLv70tIF73cDj50x/SuwBO6AedOpLer0WfyDyqOMewnkp8riR7k7EpbkJ36B0JBMAWN+axyk+wu73/ntZmUEKiopf3ELexDldE4nc4EBCZ+ZKnWfBUoQE6hdhl/4b92fHt+P/Et+31+pehJ+KBRgRKDOpQbPZu9jR6YkmEGgRjauIUKMpt0zj8mEUEbiNMqMi9QuyZcxSbUfHKO9mJoYp3rrH2nOEKr2fnyGNjfYpT+B1KQnFRGdoMEJYlYOBFRSOJHU547Kflqhc6A4HrJWolipxJqxn/1PLSAfVtPdsOeAZzvR/sx5zqnwLIIJtPOvkXAWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkBhH8pZ6sBnRdqlsm8pxoDML01uNvrLb7PNHgFmrsA=;
 b=TWYeOLMNRgyEobp6M8LP3GWKPPT0uSES/ceSKnQQaX72DvsHPV6YoL5XjJbZ0KsU14t8ziIv6Wdh6alBT2U+fu3csXzRzJ825ltQtMkf3+beOkbK1cajpSHtphfoGMTdV4USGzlU3lGUHebTfvbV23pY7jiT53fs51WeYQWCc2nBMAjbQI2H2M+ouHbqf6C86Wd69dzxS9egfauPNxjoObvfNyzx6lAfHW1QSMUSj/9jix/S55esoxPkOJzNeuopl82zG2e/Yfrr+joENGLrNDr9TC65INOY7FWkefG+2r49EAIrYWVl/f5xqT3GVGHQ/Ks6z8Qf1fGv9aqJJqCVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 00:23:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:23:32 +0000
Date: Mon, 29 Jul 2024 19:23:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 03/10] tests/intel/xe_drm_fdinfo: Add helper to
 read utilization for all classes
Message-ID: <e6zd4uajdkzzlx5ip3coidniahcmbazzazpjz3uvani2xtefm6@dcf7a2ddomcr>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-4-umesh.nerlige.ramappa@intel.com>
 <lzcmgzn5o7gqpzalda6gs5kahgawiuofrimvqjdlfbi7j2syn4@mchmw5yfpqz4>
 <ZpA4ie/7N6GwM/BB@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpA4ie/7N6GwM/BB@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:303:b7::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c0e10f-b648-4059-34d3-08dcb02dd826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZyQUcjjcmp0oDFNCVLatUwDe8xnnwpsdjrdzPItl31LhhgENUkT9EFRFQvzN?=
 =?us-ascii?Q?WzjQyK73QJh7T8c2fpEBAeRbKn3KO43CFzWP0PsUB5ccATDYTHwB0pbo5fLM?=
 =?us-ascii?Q?QvGOF8z6/5Wn0WMIAU0MjdzqSQz8w7QZmsycSZk/Me2WmHc/f+Z8DjYjGM9g?=
 =?us-ascii?Q?/BJY3MW5Ga7Cg3LOERBt0rurgorIbgrJtaAM7Iyg2SjIYqObWz4cMWT2/uMY?=
 =?us-ascii?Q?da8t7DkEPzyfSlBWEqFPH9NJD8P08aLg60cBajtzqe4nQHQh2DhQFptZhjbj?=
 =?us-ascii?Q?S5cEgnzFIJENO4G1zt1SXalMHeOhIRqhnaSFcr2v27xU9FkFCTZpV9QGmbgD?=
 =?us-ascii?Q?ajZXG1GnEw0RzEyK9z80jiflOi+oazCIG2mfNLNwfKRddZWl1JW3yi7PVYzU?=
 =?us-ascii?Q?Lz9dae1Jnwel5Ou1GukBbNq+PcqX83XvTu/cSU93JEXvlFTKAF/y95bhOpwk?=
 =?us-ascii?Q?b5OVUib1rxYAgKamPBU2Mg+L08pt7CnFJsdiGczAybdC7U4wNiSmJzuQYrD9?=
 =?us-ascii?Q?6cuP6pdnsj+a8RzOPgKrakGN6MostXIzAba6kD3heW6XKTPxzB/QyzoBmv8k?=
 =?us-ascii?Q?lGM+LaSb8xA1/ThZ3sdwrDN67MEhEbW7eG+fn+C6zS9k9xRO3OY1SQQ5BCxb?=
 =?us-ascii?Q?8KNT30xSE6zEcd0pLCuxbFod+NrlI2Br+4aoC/EG6ugrAyKNXCJ18ixQPycu?=
 =?us-ascii?Q?J13Yx2SPHVHXWHAXyzlZe+9AU3nSoo6su/Oo49sMWpT+74Fl0Pn7GNiasu+g?=
 =?us-ascii?Q?J17pC9nDhhlPDWDAWAHMwL+AFjwsPoHHx+Ek1igCmluPMTCFvZkd1qxna8X3?=
 =?us-ascii?Q?5qwDgq9sFHd9Vvoc2bIIYgF600BG9U3uGWz5b4LV9ua9DbsOMth7+omW1GR2?=
 =?us-ascii?Q?Mp4ZRmUdN7iqJxsjWZ0y0c2iEKpPd0L70U2c209kqeoOLiu+7MfXeNOaIn1G?=
 =?us-ascii?Q?b9zr5I5b9qXW0oBzgF3sf482okB3E7ry29eB48b3FjHuTSCw0JQ0gSYF70H0?=
 =?us-ascii?Q?yEysKSTOutun5j6uxU5bf2bZyi/icmYj1JPmhP9M0myda4IFAE7gwJcRBwkX?=
 =?us-ascii?Q?2tn1FQPY2pRIIo7bDMo2qM/iQhNty/Em4wGWOrxRIEBPKcGkPa7jcv/YYBCp?=
 =?us-ascii?Q?OruJrElc4M/abSgrXpRV76CRUwrj5Kv3Pa26wnJmHH69stp/nwLUKRETFawF?=
 =?us-ascii?Q?u3gXnxzW4PZMhz8ahuiNNP4elyDOlgTgk8AAw9terwAB5vds5wuTnzEbhYcA?=
 =?us-ascii?Q?2BOkREUox9ZT5niTGARXWTqLyRS5FerhCFzuT64yZ0vlZPOh377m9fn8LsOY?=
 =?us-ascii?Q?zcDfWkV/Rv+LRaOnkkS8pdgOWgoh1WDfvWp3lfc/Hqc8Jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lf2wzwr7XFXVgd/PNw21daQzTsskFy1tSHFOm5quU4XrL8gq7ea7Mq/8yeFz?=
 =?us-ascii?Q?B6fXhqCYWdEOJL/I1ZJx9hu0ZJ8s7F4zhUUi4HyA/NMiIlr4iuW/I4iC0hZf?=
 =?us-ascii?Q?1+hNk/Ze+gYqycqNEAJt5Bp+vPNeoGynXhVTfv4YX2SKw6K3w7+5giPet8RE?=
 =?us-ascii?Q?jFDenLv7uqtF0u6ZNdw2HqAg/ZWB0Fz8avhS/XGAVp+CYrZEl7+NM+YtjQKv?=
 =?us-ascii?Q?rrg96sae+pgItkIprkd5ohz0BYCARB62ZoH15fWe/DNR9AlKCS3EcG0RtiF6?=
 =?us-ascii?Q?qqqB6hUO29twUgo655c94MdyAnyhzjnPY8bv4roldOyoHqPsM6+3qIuW5QI1?=
 =?us-ascii?Q?l+muNTNpiozF8z5RxWLYENoBTdICgmgjPvL94NIRbGAqEB5cGknnrQem0x1n?=
 =?us-ascii?Q?0j0ZXEOmyP41n/7A/NsemmjXlSwCalJ8pBaiD7lF0a9Uk8Cyr23F/cWen71I?=
 =?us-ascii?Q?ZiJpDAMh21ps60bB4oupP8So1T++KnvJwB2AIP8MKYINDqDEeEaJ2mUVfK1/?=
 =?us-ascii?Q?VEBTp+PKYQdAtVWeUYSpwNUFuHukp9bQ7iEPkZIiNYaBFM0aJlYFiGWxdZpX?=
 =?us-ascii?Q?JPRNFbOEyx/C+pGKdw9/CYSuzHygE5wdyFP2Re+TDUc02BpUnTXdQRYTvDwC?=
 =?us-ascii?Q?fMY3VSu4XnyooV7Ctrq0dBVsvgf60ginbKSmZJENWBWW558vSrN8NzfgOG0l?=
 =?us-ascii?Q?ayJy0VlNM2IJyvD07YM2oDlNZfMck+CRGWOPCDYP4Hrdm3d2BWD7qvnRWJZz?=
 =?us-ascii?Q?W8WC86mcCIt4qSIGGQYQTtgFgOon/XbL2VFOZPmfgQF7sljzYBXq4EZcM5si?=
 =?us-ascii?Q?IM0Ct31KdV9Mn8+FxIXevDvDu41WUtX0gn7OCMyiXT9HzPodu+rDfy1IbLDP?=
 =?us-ascii?Q?b2vSVWwyiKmbvixnrXtfrA+nyUVgjFgM43lEQkx2ZhU5DESe7uMPYQlMpjWu?=
 =?us-ascii?Q?VoYpvE3YABGLhhDl2pvi6ntSVKCluv6tsh0Aq8yoUSdSEfnGQBoCY9VmSWmE?=
 =?us-ascii?Q?NDFiQrnk97G7cNSkXFwfHCZYM0nQFnSakCEEEybUpEy5nfkIkdoiaG2/sL4Y?=
 =?us-ascii?Q?m5e0MNGR/+CQSe+n8clIZMnlQeicSiFg1P+H9izn5mZ5CQSnUfJPgqqIGpJ1?=
 =?us-ascii?Q?v27ForoE+6RYnae8wZIEN09isBE6SX5kuNo+kJTYgIu/nm7EVlMUcMVj9KbM?=
 =?us-ascii?Q?yw9mD+Jjwf+6yIP8HOxUJs4ayLD37V1A+mVkOVYMr0d4n3+P6xHyAK8EobQj?=
 =?us-ascii?Q?HgD8GSBEIVSQ1bTqZpS5mZdJsit3t1qXy1LPLKyj1+R2GTNxdSSjlgK3/KOb?=
 =?us-ascii?Q?BJNm+9cCozHbPNJKf+hJLDnnUdi5y0wa/jG7LoAWfWb6UFy643sjmy/9Yt0v?=
 =?us-ascii?Q?MVYKhs1MyvdIwsyt7Ux0tSEJrLuqVqholiY/5nmHkcTyMVsNuezN1VxZfnMx?=
 =?us-ascii?Q?3IIlintNNwhb706pTmlDb/iyoZukSON+HDWdtiGIXat306piSqUCBVH9Yp8f?=
 =?us-ascii?Q?8KNIGAdbh43yYBv82Xr+Vv1fpE4WtVUOkGzpnn1tqUjvIu9Z3i2U2vAjyOU7?=
 =?us-ascii?Q?siGNNpelpbEeL3p7YxtQLE5UqV78KAdOZNAqfiU/JvCVZx9cLAj3Pt0fgW4y?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c0e10f-b648-4059-34d3-08dcb02dd826
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:23:32.7858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Elnm4kYIXbTlynU0WIhGhykNqdigrD2GEBP/8SBRv6VToJsWbJcMXKh/V3lCLE6AXMxDQ9P1QH/UtAwPYsf0pynB9elH2nlO+gSQJG+qK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

On Thu, Jul 11, 2024 at 12:54:49PM GMT, Umesh Nerlige Ramappa wrote:
>On Thu, Jul 11, 2024 at 08:40:46AM -0500, Lucas De Marchi wrote:
>>On Tue, Jul 02, 2024 at 05:25:25PM GMT, Umesh Nerlige Ramappa wrote:
>>>Add a helper that captures utilization for all classes.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 20 ++++++++++++++++++++
>>>1 file changed, 20 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index b64bef339..c697f3e53 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -42,6 +42,11 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>>
>>>#define BO_SIZE (65536)
>>>
>>>+struct pceu_cycles {
>>>+	uint64_t cycles;
>>>+	uint64_t total_cycles;
>>>+};
>>>+
>>>static const char *engine_map[] = {
>>>	"rcs",
>>>	"bcs",
>>>@@ -49,6 +54,21 @@ static const char *engine_map[] = {
>>>	"vecs",
>>>	"ccs",
>>>};
>>
>>nit: missing newline here, otherwise:
>
>will add
>
>>
>>>+static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>
>>I think that would be better to give the compiler a hint about the
>>size of the array:
>>
>>static void read_engine_cycles(int xe,
>>			       struct pceu_cycles pceu[static DRM_XE_ENGINE_CLASS_COMPUTE + 1])
>
>Never knew static could be placed there. Will add.
>
>>
>>(it would not be a bad idea to have a local __IGT_DRM_XE_ENGINE_CLASS_LAST
>>too, but outside of the scope here)
>>
>>Otherwise,
>>
>>// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I was checking if we could apply this and rework on top. But both this
and the next commit have the same issue of adding a static helper
without a real caller (so we get warnings).  I will keep looking if I
can split this differently to get things going.

Lucas De Marchi

>
>Thanks,
>Umesh
>>
>>Lucas De Marchi
>>
>>>+{
>>>+	struct drm_client_fdinfo info = { };
>>>+	int class;
>>>+
>>>+	igt_assert(pceu);
>>>+	igt_assert(igt_parse_drm_fdinfo(xe, &info, engine_map,
>>>+					ARRAY_SIZE(engine_map), NULL, 0));
>>>+
>>>+	xe_for_each_engine_class(class) {
>>>+		pceu[class].cycles = info.cycles[class];
>>>+		pceu[class].total_cycles = info.total_cycles[class];
>>>+	}
>>>+}
>>>+
>>>/* Subtests */
>>>static void test_active(int fd, struct drm_xe_engine *engine)
>>>{
>>>-- 
>>>2.38.1
>>>
