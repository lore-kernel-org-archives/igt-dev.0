Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62238C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192F810E494;
	Mon,  1 Jul 2024 16:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OsYB5+Fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FEB10E494
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719853045; x=1751389045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=odN3AwOaMRj34hsqtFxZ0y/ar+TBIMb+hMZEdFyGuR8=;
 b=OsYB5+FxA7sSiIXHTGatgFvc/t2G6zwlsnv0Fe+hs8whD7foGJEPoaBz
 xunqnpdvVvAtfadPPr61QDZ1/vrFMsVJC1DecIFyHLMJpBgE0sFxg13fN
 /cu3DUT2G7RuWrDxtey5Ai2pv8W51a9eAMTwJT8PD68MujltfWkyVpW1n
 udG5y2AX+zrK93j99keSukqvpoH97q9e4Z9W+iZjAnBboexHzrY0ZXcry
 BZeZrsJOc06xkV1AVKUHvQQ9EZ7NYMxxHT6QjCQpu9ldZbzHoTs8Oado+
 kmVpQKtAQlLkcep87kUA6ApmK03sKDrUGSuOljblh7N90ZHbIZeNBywW2 w==;
X-CSE-ConnectionGUID: G9qdzoWsTiSogDpy5ZXdhA==
X-CSE-MsgGUID: iOLq0udiQVSFibpYPxyV6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34536466"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="34536466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 09:57:25 -0700
X-CSE-ConnectionGUID: 4AcjRq5/R1qLoDl0BMET4Q==
X-CSE-MsgGUID: s2+iPwU0QqGbFlspdABcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45406206"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 09:57:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 09:57:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 09:57:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 09:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6eocqQG907WWbluMdB/o2jJ3X/TKgOKrjo/kvuQZ3LnYUSAasBf0kUD7Ya+tQd7Y5bxTfzPTzL05Yk9l9GQAwt94j446/4Ek+/YHzzcWUIXiqIj56CHoYEl1y6vN8lYF6tC1KQtdqyRKOJDJwdveR7CHcQqVu83kUI72/hIGQsUgoNjBew3FdfKhy6lLpqAko6RMIUuV6uKq50h0EyKw7vqyBVR7fg9yx+tL2GVssagnIUpQbNvCyYjHbX/Z3LHjssi0BoJVpzaKsDO4LBdrvcOjnNPFuoU6ctCWb57YLy2+bENn/KMZcNnkjalBfQ15dF6piH8VisTVhKx7Gi7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdjBM2bCkAdVQRCseNUUUHdBhXZ11ohfkeVrC+3ETA0=;
 b=MP+QEohcvOCoesA808fWd5xZwOu32z9Vb9fDKCO1/ywTluv78vtwO+omP5riCsPW6s7HXXKl2JnwIVghbeANe/yYrDPKEBcX/CUrc4urIugC+Xsr1bnNIqSCTXH1yWdqbm5mw0p2t+ipu6NYb2U7jhYlo1ZBJsy3QggkC7YIgg9l/WxblRH/PMcplWTu7z0pasJzwj0r+pl20z+Gpg77kHk3ScJn0GvbyKehVCCxzomcjOcXzQYueLh81iAmsiCzb+E5IjtOgJ+NcrYv8NAuffqxEZlVCp12oRKWX7msBota3mVEQtHoA0LdHIU8mHxqAfR31eWxEBznzucxy6cxbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 16:57:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 16:57:16 +0000
Date: Mon, 1 Jul 2024 11:57:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/8] tests/intel/xe_drm_fdinfo: Add helpers for
 spinning batches
Message-ID: <hh7keiq3cvkqznczez5xqqxycci3yn3x5w7i6f725qt7f5fqgv@s5fbq5lqzlug>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240621230102.238397-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW2PR2101CA0019.namprd21.prod.outlook.com
 (2603:10b6:302:1::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8de358-2d26-4561-cacb-08dc99eedce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yLv0LuymEl0eD+gcVVmdoQ6mV6WQlwU1cCLiXdeNzauHIJJbdhVI2BN2ZdaW?=
 =?us-ascii?Q?klbAwpcV8I0c247f+VRcXSEmv09ulJ2waOdmag7XDLjAdWPRxX+2e2e+ZRo0?=
 =?us-ascii?Q?CujPhq30LAimlv+VMRA/NUJxU8hqWnx4/39togP7ooeYAUcOFzCC0/sl+248?=
 =?us-ascii?Q?F2al3XT+JpREIornqY3XzJMk9qBFL0SFUrBQeRfz3cR5gqQPibNSSO7euepq?=
 =?us-ascii?Q?IrBqRxXnzDyVqDBg1Oy9Cy6m+z0bNDwuQ356x7Q1MYJmQFH1wUv73WM/6lWk?=
 =?us-ascii?Q?Krrys/xsylnaL6JbYSRMQLaioYGckX+V3WErhh8engv3/yt0l0QC9p83Ys+J?=
 =?us-ascii?Q?t8guuneKUuLyk6EVF4bVu04t+zXFS7ZzY35Fa+oIXR7wYHKsbO0eidQddtbx?=
 =?us-ascii?Q?aDWGVsAarDqMb4KSgIv5n1UfppkuuvMZU7q+gMbIfG0qV4kMKR+ybHx6f/Ez?=
 =?us-ascii?Q?63uP7HKq/fMCqkheLVHYwuLPSWLEb6hhjclRPaymdyIBteKnv4iFEkwMTigi?=
 =?us-ascii?Q?ZcSsoJCcLEGQPUCYFV1KlB6d0Fv0PUDN4cP0psWENtd410fcpP1fEVGUfrhe?=
 =?us-ascii?Q?h++/Yi3+0JfjeROkyOvSkwP2Fm7eXLCJ3bTIxKdeEWLPaF3Y/abw8jFwcQ9W?=
 =?us-ascii?Q?PSpwbPDstW50qzIb6Nu4FzKVoOOuv7R4yo1ZrrlDceiIiRIyWwZEC+eTDbWi?=
 =?us-ascii?Q?fNDbWkgqm7gOl0CMWYFdZMFDus/MYwDOAfP23iTo1AU5S5sUv6HVV9svRB09?=
 =?us-ascii?Q?UrE4HsOmhe9ru5IVtnTBD/Zcc82rtJypeNGJnAZEonTWS7bgaEbCXocxH7NO?=
 =?us-ascii?Q?XE07yQzKgrP99LLIUNuKDxqOW2VBrMUczFj9frncDmkq2qFgy0bgjNnF/bUt?=
 =?us-ascii?Q?7BlSOI9SIFu8uZtk+gFHuQ0A3iraLzmnBb/Vv5KzuAs89haabuzcueO5q9HF?=
 =?us-ascii?Q?TKRCvsr2idqDtGv3SuFUeGGk/E0hrfTVNVjBcD1QFLqPggBxRczRMicrMOy0?=
 =?us-ascii?Q?/cnv4vnb+Vu2RL4hscBmkrlJaRkC2dBArw9BGnNJqMwiVJ7PtGdpy4OaNhLv?=
 =?us-ascii?Q?7x8h6khc9NfNCFrrtptH7w9KfOFzXh3Mb+GHxBMWDZVpEVxkTIpAjB0N54xI?=
 =?us-ascii?Q?yFjMlwI27qPqPp8IC8NXj5aeb/OOJr+jpdr1F+VCK53P9/B0BBcHaJ07rLqp?=
 =?us-ascii?Q?0Uxcx2+Rn9QpKVfwOZwAmb7xisJcjCazGzAu2U6qGeSErvec00QE2iBuxsRd?=
 =?us-ascii?Q?6runm3Z701jsEDxCD4Mniao58bNkHEvUchxFQA6IHvGgGBcl1dNoDCVRzVbi?=
 =?us-ascii?Q?3NLEuz2srNzsTdRV/MDuzC5pmIuMo7i1xDb3PWVU/hVpwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SJtHmOlvtlZ/MJpAcopZOo8F4llX6FUigCFNa5xWXFhT4QRjBeWWvwRfBeY4?=
 =?us-ascii?Q?wnc3IwaZXdxrFhrnPsksR/OUxEVaNnsEP2y6c5JRteyTYeIx8yh8NyE5p3S6?=
 =?us-ascii?Q?2GY/C405J0xcuQAflOv89Z0mjgH5yb9ZEJ7TQz3sOlbdspCfwI1tD/q2pFee?=
 =?us-ascii?Q?UbtMgQnwwerLsGO2hpOZDbnXJz/LKspdPb4ZlLfQHoLQVYFhnQHUqWWh2WGX?=
 =?us-ascii?Q?nfrAgRwxx3CGz3nxuM+FEbTFxXOCBH+BU8eED7U13DsFPwEcOAGh7ISynFAA?=
 =?us-ascii?Q?DF5eFw2WlIsY4uEmkQDv216kbPjXlEDak4NbtI+dsP8RZ1N9ionQ3zVTZjiC?=
 =?us-ascii?Q?QvBuiJbISRcLakp7avQKndcLJO+XGzbSCxWHqcGStIBCAIJX1V1ig6h15JbC?=
 =?us-ascii?Q?wmY8MbV6yusFExJfY6J7+4upQom5xPLel9AFb3Z3t4r6ii8n8AumTVfIQ9PY?=
 =?us-ascii?Q?Vb8EDeuBUx6X6+axvydatRiV1GxYS3+4iJxRSFSSSwR+uDNKn6prIZG7KvQR?=
 =?us-ascii?Q?zlryvHI+SuWkotCQHjpfkEb8vNAfFB6eoC5IWrmWWuXlX9ETfZgPl1qOHBfJ?=
 =?us-ascii?Q?6/NwCLwe+DiQTktfyxvXhaDsGFPKq1FRsE1gn0jCpaL0yag9IFMZU+AsJTVa?=
 =?us-ascii?Q?5c/Jx48kksVhECnbAUhvJa2dQ06Kut7C5oIh9qjbwLZeK1NWL/03fjF7f9yF?=
 =?us-ascii?Q?ta6h7LqILcvb52c634jHV5hVGV969w3SCmk6hcBAOr4s4X4x9pUYwV6kTreP?=
 =?us-ascii?Q?z+uxKA+wYOUaa+g6yTnDaowhfkX+uoYORCAowjdRI0yXHxPFRd+WJL0GB0Rl?=
 =?us-ascii?Q?gzfAHqYb0ZFDwlEtW122NmZmb9DJWUTEZy/eQEsklePXyGDf/zcwIEYY+RRf?=
 =?us-ascii?Q?bEbQYFaJwOIx/fXA+ZoZhI8CxiagquxG8HUj9bH7l4fMPSxYZwNGgDdUjiyL?=
 =?us-ascii?Q?mJKPZl6TpEpRPWr0G4ruCYDpsgcQ+FWx6OhpUY21NcS7A8dFd4oerLGQHJbe?=
 =?us-ascii?Q?9p3WExNhktnrhpHnnV+xVULGvVWa03c8zyWn+oCTfDZkbI8Y4QseswYIYkf4?=
 =?us-ascii?Q?EIldL3rmc+1v/TRnbTuFEJU1hZYG6SfKZRJvLNcv2OOic1clTsI08XuZuFwy?=
 =?us-ascii?Q?L9Gc+fVd1zceQ5IkuF910iMGhQijsw2jlfWj4AjEnUWF8Qq17KLgNnTEi0mi?=
 =?us-ascii?Q?SERQykhbf1o2YIQQ2VUk5KNBTLQ3/Zio3Tn54pwr2XWezeZSd9Z4kU1gen3x?=
 =?us-ascii?Q?Hwfc+yyIxvanpGrDifYkWvOLjnFvZtb4MePoudjdkm+E2ySVo/+OAc12UjRe?=
 =?us-ascii?Q?9RZBhxVrC0N0MZ8CziL5SbPFW0l4eggkKUa6JUN4MVj086nCVldgz86KOAFu?=
 =?us-ascii?Q?AFwd6ARu5oF9S3aqkP00V2bZb/qR/JuXa1HPEAv4WSSfngm6KK25fTVC9Gvk?=
 =?us-ascii?Q?Ycsg6AW2TAnQlAZWUkPs4N6z0CdPDeIzR6xOPWV3YixHLijoZTK+ygc/UdyK?=
 =?us-ascii?Q?5Y7geYM8QAlb3BXcE0N85klrdCUy6AG4KKiWpm9NI9EkMEXHq0r5TNtBzZHZ?=
 =?us-ascii?Q?LdxTaDBFU5qWUhdLQIkqTE2ogicXZcjvRSaPC3IY7yF9AOfa/HE72zmE8Fh1?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8de358-2d26-4561-cacb-08dc99eedce9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 16:57:16.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIZs90MCuHkpGAwcMCzG7QmfncbZ8w5/Z97NYdWGsmxCoiqdhSHcABR9W+6sTmV16nBrCVwZb+sMXlp0mh0t80FwDgHGaURbOdEDfR+s2LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
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

On Sat, Jun 22, 2024 at 07:00:57AM GMT, Umesh Nerlige Ramappa wrote:
>Add helpers for submitting batches and waiting for them to start.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 135 insertions(+)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 41409b2d2..27459b7f1 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -51,6 +51,17 @@ static const char *engine_map[] = {
> 	"vecs",
> 	"ccs",
> };
>+
>+static const uint64_t batch_addr[] = {
>+	0x170000,
>+	0x180000,
>+	0x190000,
>+	0x1a0000,
>+	0x1b0000,
>+	0x1c0000,
>+	0x1d0000,
>+	0x1e0000,
>+};
> static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
> {
> 	struct drm_client_fdinfo info = { };
>@@ -316,6 +327,130 @@ static void basic(int xe, unsigned int num_classes)
> 	}
> }
>
>+#define MAX_PARALLEL 8
>+struct xe_spin_ctx {
>+	uint32_t vm;
>+	uint64_t addr[MAX_PARALLEL];
>+	struct drm_xe_sync sync[2];
>+	struct drm_xe_exec exec;
>+	uint32_t exec_queue;
>+	size_t bo_size;
>+	uint32_t bo;
>+	struct xe_spin *spin;
>+	struct xe_spin_opts spin_opts;
>+	bool ended;
>+	uint16_t class;
>+	uint16_t width;
>+	uint16_t num_placements;
>+};
>+
>+static struct xe_spin_ctx *
>+xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>+		 uint16_t width, uint16_t num_placements)
>+{
>+	struct xe_spin_ctx *ctx = calloc(1, sizeof(*ctx));
>+
>+	igt_assert(width && num_placements &&
>+		   (width == 1 || num_placements == 1));
>+
>+	igt_assert(width <= MAX_PARALLEL);
>+
>+	ctx->class = hwe->engine_class;
>+	ctx->width = width;
>+	ctx->num_placements = num_placements;
>+	ctx->vm = vm;
>+	for (int i = 0; i < ctx->width; i++)
>+		ctx->addr[i] = batch_addr[hwe->engine_class];
>+
>+	ctx->exec.num_batch_buffer = width;
>+	ctx->exec.num_syncs = 2;
>+	ctx->exec.syncs = to_user_pointer(ctx->sync);
>+
>+	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>+	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>+	ctx->sync[0].handle = syncobj_create(fd, 0);
>+
>+	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>+	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>+	ctx->sync[1].handle = syncobj_create(fd, 0);
>+
>+	ctx->bo_size = sizeof(struct xe_spin);
>+	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>+			       vram_if_possible(fd, hwe->gt_id),
>+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>+
>+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>+					     hwe, 0, &ctx->exec_queue), 0);
>+
>+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>+			 ctx->sync, 1);
>+
>+	return ctx;
>+}
>+
>+static void
>+xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx)

I don't think we should create these wrappers on each individual test.
If a wrapper like this is needed, can we add the proper abstraction in
lib/xe/xe_spin.{c,h}?

Lucas De Marchi

>+{
>+	if (!ctx)
>+		return;
>+
>+	ctx->spin_opts.addr = ctx->addr[0];
>+	ctx->spin_opts.preempt = true;
>+	xe_spin_init(ctx->spin, &ctx->spin_opts);
>+
>+	/* re-use sync[0] for exec */
>+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>+
>+	ctx->exec.exec_queue_id = ctx->exec_queue;
>+	if (ctx->width > 1)
>+		ctx->exec.address = to_user_pointer(ctx->addr);
>+	else
>+		ctx->exec.address = ctx->addr[0];
>+	xe_exec(fd, &ctx->exec);
>+
>+	xe_spin_wait_started(ctx->spin);
>+	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>+
>+	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
>+}
>+
>+static void
>+xe_spin_sync_end(int fd, struct xe_spin_ctx *ctx)
>+{
>+	if (!ctx || ctx->ended)
>+		return;
>+
>+	xe_spin_end(ctx->spin);
>+
>+	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>+
>+	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>+
>+	ctx->ended = true;
>+	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
>+}
>+
>+static void
>+xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>+{
>+	if (!ctx)
>+		return;
>+
>+	syncobj_destroy(fd, ctx->sync[0].handle);
>+	syncobj_destroy(fd, ctx->sync[1].handle);
>+	xe_exec_queue_destroy(fd, ctx->exec_queue);
>+
>+	munmap(ctx->spin, ctx->bo_size);
>+	gem_close(fd, ctx->bo);
>+
>+	free(ctx);
>+}
>+
> igt_main
> {
> 	struct drm_xe_engine_class_instance *hwe;
>-- 
>2.34.1
>
