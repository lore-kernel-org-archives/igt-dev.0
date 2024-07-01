Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E7C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 16:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9430710E479;
	Mon,  1 Jul 2024 16:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc8zgPDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C92610E479
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719852746; x=1751388746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7laGjaxT95SXfHSB5V+nlEL54RnPibmNS2xryjaNV34=;
 b=Tc8zgPDu1RzWJj+UK+UduAMCUoBzNYNV+8wB+vU02kIrDMXct0Zy6DEU
 HTdLmpuZmbBzdYwrUsR5xHn/mH7XZi0+d8ZH7+YyfoJmrUPyWSmp21ZSY
 CwBkbHEQ9W+CNi3ta98WOEMjsFcz2SB/44XfDo3p1oihcV36OO+/m650C
 98Yejcl4wA9t/PbKpPYKgRImUQ1nJJSxH4y4lbBZ3I4TbNj6fTziJgcXf
 sDNuf5DhL8SZ207AhgC8hG5rrFzEF30GHQ6CgHLpwJPBjHo1jeIh41a2m
 UGgiXi2RrSwqEeQeK4j69dWgVveoMXNnT1LJ8gvIgIddlCyDpaYX5VZ3J Q==;
X-CSE-ConnectionGUID: ua5KF1B8RPurU5WPQC/y1A==
X-CSE-MsgGUID: C6r1hqNaQpihZoAl26C6Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17131143"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="17131143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 09:52:26 -0700
X-CSE-ConnectionGUID: 8trURLVjQI+r508ixV3U8g==
X-CSE-MsgGUID: YW9KXYzhQFq8Ged+LAtTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76305882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 09:52:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 09:52:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 09:52:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 09:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8uN6dj2Ofk9k1/3BroRcjcZEQ97ZUmEQo4pEtulp2NeYdljalpucEhLCUohqSAd9QY6VuHQ4c/GdBIJrfE1tQwRXoZF0hjA30h/XbbmeTXB/4YFZ4ygQkW2QFMuKdKstdjggXZmbEMGV+AEZ12QfaD4nOghnuuSiF4A+F1Fd3wa0To0narJvV/6xN9XWAnhwpAltuDmVpV5vT+pzI1acRjINKDcfczQFuIXRcmQKJble3gLfS32dzlISkAeXoy0u/h6Mnj3k14Y0+o535RUMnWywpamq1n2ODF4XKl4SKncLvWhGZVOmbivoIGHt6Xhu9AXYUEfTJQPtzA32dFHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOqm/nykeJNAAPOSRDAEJdRltkkMd/Je/AyhoOTwpdQ=;
 b=YEovA4s0qE32qSk6uNvcdes3zVIYYCPOSPhUFsUluU1yVJCG9pjUzP1iveKyln2VsCBMZVTOxThVdeg45V0uhFrj+RBghyFpOvAZ0CI/Xg+zi7bQALIqOCq46tjsZMqn1XN7cC9HWE73mghOAIrmBF3P0t5l3tT5i34KeE/q07jXTl0J139S+wIse0U+bRNuPNrUYnK/rdXVrDRWeKH/j1Pnu4aVabKvyhiQASIC9AemLG9D8ysuerzTJoU6YPECnRGDDikJ2EzrZdwQ8V8cQpD32q6ezN3ocsYCF+ZPTTnd/iWlgJ6SHcSpythKS/0op7IL7mRhBhS0au1ZvRuE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Mon, 1 Jul
 2024 16:52:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 16:52:22 +0000
Date: Mon, 1 Jul 2024 11:52:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Update basic test
 to include client utilization
Message-ID: <uyh5tx4ydl5kprpschvbtuvry4gjnmdt2carh7b664i24rqqkk@jxpra4l2rkfk>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240621230102.238397-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 61989463-cb78-4c7c-cbc6-08dc99ee2d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Utko5rRCZTWi+uEKgUiOBRaSLVl78LabnzesHTiJeQjI6SCQFOpzL6R0Kk6g?=
 =?us-ascii?Q?xSc48AhAmL0HmZ7ALa57h0+q9W2EKWJ/MpwnTT4nASjriuwoONHJ0ws3x6aD?=
 =?us-ascii?Q?ZaGn05a2x+vrWShoNqXiy9nS/WKrUTSxHBuIYy2auOefde76xQ7JpHawZt/X?=
 =?us-ascii?Q?KZ7ln0U+J6chGTQ/ZoPzF/AxRG5DiYnsaCM7+eP7DAsFPkMwVz5nJ7zep8rW?=
 =?us-ascii?Q?5ZxNsmebA3xoUNsaZi76qKopm28roTWNMV2QJZvU4w6mVrm/Gt5HOtN3amMp?=
 =?us-ascii?Q?M+ZYmvoX5K51+3G+WT9vvXZdSSZ8eLUty8KfCNdWVkesglWYQdLtdDCFri2P?=
 =?us-ascii?Q?2u2870HyEBp2aZ6+dW7e61IXZh6Av04rESPam0B+IbvqA/alF8t8yJNAngvQ?=
 =?us-ascii?Q?D2x2eGVHtb97KKi/Ww81ggciRlBt3q42cqrwWcN5bYZCKblYr7zAiEYKG6Lc?=
 =?us-ascii?Q?EChHputoTd13YTTBBLJFcCHxPZD9jE40b9NSs95TN3VU8tR4yOjD5ojtuAnv?=
 =?us-ascii?Q?GvbmtoGzWiAPgSlOTNMx8jO8dSr4EjdHOTXJrt7XI+NKYlcTO2tyNirL1aKl?=
 =?us-ascii?Q?ONxTst0MPR7e9UdGxV9qlzIPaE24VFXM6ZXefKLTPwJQYpXbZcR2YjRUqzG7?=
 =?us-ascii?Q?l97eDcYIBgsTIU00skgTDqu6ikolz5nM9mLvDUQWT605aPB5Jhwmbq9boKVV?=
 =?us-ascii?Q?qSLwBZOc+bi270d0Rj4p3rc0Du2rWB374bQHFg7kITm9hoAb8vemmONP+q1Y?=
 =?us-ascii?Q?ITLoNKkeIjx/T8Ss7KP0Iygza4G+wauLDWWozVxEnVhPD/x6EZgQkgOv0k4c?=
 =?us-ascii?Q?EfpBks7JWDhlbpinx2W0pQ9s+XmyHOuPpp76WK0u+437tJ9AJYi1HdI+Vakg?=
 =?us-ascii?Q?OCpJ6Vovx0SIbiuB3Mut+TTHfQ64HjRxxVQzLHnWy4eh6yFIdbrBTD1VYs4U?=
 =?us-ascii?Q?OOk18cekFv4eUuYpNCngaxYAile5UMucvmcLrv38EgYdn1NFtA8s5A5oVunr?=
 =?us-ascii?Q?XFHs8IrtG40cJ3PhlPz+6bf+NgWMdMuGHshJDXoL1sCxNYJwtOPbMe9hcY3p?=
 =?us-ascii?Q?rB1IIqyhKHvZArA9mFijo970A6cbG9vGPaSazRphFdOemowECTiHEVUhOc8N?=
 =?us-ascii?Q?Keo6vo1853eLQHrffn5bCWpRVx0Rvy3hx9SNsy4N9moQ4RVsbhTsuLjLQnKc?=
 =?us-ascii?Q?b67WTeFeo2+IUq6vQIkrD1SpWEOSCn+/leEuAFuF1EsJM/cd5sSFw+u+fSsg?=
 =?us-ascii?Q?XpiYfvY4NkW4dbGpP5b5QQVztzqEgdBNZJVEjQHa/YqAFpDdfpuJ4BaUVyOP?=
 =?us-ascii?Q?3RK46RI/c6YixBi4T3lhb5F5OAekh9LtK4y5HesJdUzZKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xoTqh7zItd0IqRM7myxndCeT7blHw99PJZBp4F03bh4w0O2+9Ik1Cccu+xFe?=
 =?us-ascii?Q?pt0lX+aD5QrkqV8ulkKlRTEtByXazwqkGO9+osZce7y968XkYAvMgvJVRGbg?=
 =?us-ascii?Q?2tg+gojGFXZ2Bh/Wmu3HTSbYstKVgtooueVTgpR9ckd0ApXhfOG8XRKZbPJZ?=
 =?us-ascii?Q?i4EEaV1/eU8Ff2O3iuRd/VkmzSJYaTxSidxmNdOWkXvcVT2++IlDyH1/yixD?=
 =?us-ascii?Q?D1RBjdxl5ngnLX9qD3zi0zqezU4PDdKnjfGs2TejWoeOm1c2S+lOPS/+ZLLS?=
 =?us-ascii?Q?8w+kFyw+7j/qQ54OnP0oXYSl/RPbE7HsjZ+fK5f9ZHa8bHw/fAYmZ/dlzQtI?=
 =?us-ascii?Q?+B+zoM4XwXXHJzpfwq+D/UAd9QbUsiwqOVsZnEep5UIDhR9HcVAoI5Ky1O9i?=
 =?us-ascii?Q?WuFUXF5r4M5BcZin62cPoyGza0W09v/PklxxbsikuH0mCUWtf/Jt300EqOQk?=
 =?us-ascii?Q?MIDQPo4oQry+PP29JkXK2xdNwHSQpFpz01USDxZmY13JYRqDeaJjdAHXVfQK?=
 =?us-ascii?Q?yxIRdV0gbdhicsyXSc5LkNS7lg6lZqQEWGY/iCL/1ybNU5FlKZGKDhKpaEu4?=
 =?us-ascii?Q?jjZj7WBRMc/Iq9lROfFZhiM8TxpESqhIwsrmny3UA0PageG3pT9so8QxoLyI?=
 =?us-ascii?Q?JRinJDt0b1a75cW8WJlNg6QdnHT0NBtaYtR/jmAPYLJQSUUPYno7Oy3s8Fuh?=
 =?us-ascii?Q?UNKVYVBpEiGeOBGwfEWL++8uhaXfKVJo++OzuesjTiDTQQKaCakTxijGSbZu?=
 =?us-ascii?Q?ZLTGmp7+atrXCAZeuqpVZaPrp7R80XEtLSUcQ1yZcDi1KS3sMsJDXdNTBizE?=
 =?us-ascii?Q?s/gaIMEadXba5xuJITl+/fq5eGgbuOD/zj3D/t1Pk/4KOXbc/3tziyu9+hoY?=
 =?us-ascii?Q?ttSL0pg2gDcFevVlmmMQ3xq8dVaM8JGp52mOGojLNdq3bq/JgZbWke7tbgAe?=
 =?us-ascii?Q?3nP6j1H9msQeRxiW6eWz6nOAEbiHn0RnFCeMfH0G3lNg8qXATOBXfqTTuX7l?=
 =?us-ascii?Q?jAyPt0ObFMM4FPQSZ0qCaBfgxCdxFeEaBROSIdSLcj5nbS3RXwKsAp2WbbKp?=
 =?us-ascii?Q?dLo8Z4BX/EH55OF2FVQwiMSQpqmPfWRvMuBqrD0QVmnh1TsqlxN3vcKGRpY7?=
 =?us-ascii?Q?wBFNpkbAQuy/k/L9O0JNf8dEMixAil4zKogb6uBCic5URZMXEBIkxQYL0C9x?=
 =?us-ascii?Q?7TUmg/XYF+Hogyaog/75XjryvgenIJRRLmjqXUbr7q/SIqZiiKzIfjYwYjR+?=
 =?us-ascii?Q?Vwl6HEu2mwCSvRpD+GlNfbqVSaqwvutzwkDJ3+XJ2LGN6Wddl9++EzM/jcMU?=
 =?us-ascii?Q?giWYOY2tmsYgJZzwv4MePd5TShkyHjuNVb/pCiPHn7G3TGbTTgacNcZ/yhv3?=
 =?us-ascii?Q?c779FTV25guVu+8Gn4+QK9ZO0GiKEQpeLaV7z3wQBekczCVXSoA8tNp1FKRI?=
 =?us-ascii?Q?OGpBI1RrQYibqxhnQOMNQlq4ZKh/hdMvMygjiRpSY3KEPwHvE40kSRwSvpXi?=
 =?us-ascii?Q?6npZlfn/e/iteNRpEjaUuK+q85AnQHs/EcKi2MWQe4uuQpDdP388F+q3ZRVf?=
 =?us-ascii?Q?K9859amVKky1plAmxO+WfL3B4J9HvBayPvM/YsQZTm1ZL6VVeyatbXl1kjgs?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61989463-cb78-4c7c-cbc6-08dc99ee2d91
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 16:52:22.7636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSbjFW7AKJXGyB6qMrUpl6bNJaRFdc/44t+7v6K3fuPdhn6Wth7rFzZym/b63OPpcpv/B4uTmGjR5sYxBNJWRNmfjLyvUDnGdYgBToXoZgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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

On Sat, Jun 22, 2024 at 07:00:55AM GMT, Umesh Nerlige Ramappa wrote:
>Add per client utilization related checks to basic test.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 40 +++++++++++++++++++++++++++++++------
> 1 file changed, 34 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 2ceafba24..e624029b8 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -14,11 +14,11 @@
> #include "xe/xe_spin.h"
> /**
>  * TEST: xe drm fdinfo
>- * Description: Read and verify drm client memory consumption using fdinfo
>+ * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
>  * Category: Core
>  * Mega feature: General Core features
>  * Sub-category: driver
>- * Functionality: Per client memory statistics
>+ * Functionality: Per client memory and engine utilization statistics
>  * Feature: SMI, core
>  * Test category: SysMan
>  *
>@@ -35,10 +35,17 @@
>  * Description: Create and compare active memory consumption by client
>  */
>
>-IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
>+IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine utilization using fdinfo");
>
> #define BO_SIZE (65536)
>
>+static const char *engine_map[] = {
>+	"rcs",
>+	"bcs",
>+	"vcs",
>+	"vecs",
>+	"ccs",
>+};
> /* Subtests */
> static void test_active(int fd, struct drm_xe_engine *engine)
> {
>@@ -259,18 +266,21 @@ static void test_total_resident(int xe)
> 	xe_vm_destroy(xe, vm);
> }
>
>-static void basic(int xe)
>+static void basic(int xe, unsigned int num_classes)
> {
> 	struct drm_xe_mem_region *memregion;
> 	uint64_t memreg = all_memory_regions(xe), region;
> 	struct drm_client_fdinfo info = { };
> 	unsigned int ret;
>
>-	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
>+	ret = igt_parse_drm_fdinfo(xe, &info, engine_map,
>+				   ARRAY_SIZE(engine_map), NULL, 0);
> 	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>
> 	igt_assert(!strcmp(info.driver, "xe"));
>
>+	igt_assert_eq(info.num_engines, num_classes);

I don't think they need to match... I think this is more asserting the current
SW behavior (engines exposed to userspace always have an entry in
fdinfo) rather than what we could/should be doing.

Lucas De Marchi


>+
> 	xe_for_each_mem_region(xe, memreg, region) {
> 		memregion = xe_mem_region(xe, region);
> 		igt_assert(info.region_mem[memregion->instance + 1].total >=
>@@ -289,19 +299,37 @@ static void basic(int xe)
>
> igt_main
> {
>+	struct drm_xe_engine_class_instance *hwe;
>+	unsigned int num_engines = 0, num_classes = 0;
>+	unsigned int classes[16] = { };
> 	int xe;
>
> 	igt_fixture {
> 		struct drm_client_fdinfo info = { };
>+		unsigned int i;
>
> 		xe = drm_open_driver(DRIVER_XE);
> 		igt_require_xe(xe);
> 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>+		igt_require(info.num_engines);
>+
>+		xe_for_each_engine(xe, hwe) {
>+			num_engines++;
>+			igt_assert(hwe->engine_class < ARRAY_SIZE(classes));
>+			classes[hwe->engine_class]++;
>+		}
>+		igt_require(num_engines);
>+
>+		for (i = 0; i < ARRAY_SIZE(classes); i++) {
>+			if (classes[i])
>+				num_classes++;
>+		}
>+		igt_assert(num_classes);
> 	}
>
> 	igt_describe("Check if basic fdinfo content is present");
> 	igt_subtest("basic")
>-		basic(xe);
>+		basic(xe, num_classes);
>
> 	igt_describe("Create and compare total and resident memory consumption by client");
> 	igt_subtest("drm-total-resident")
>-- 
>2.34.1
>
