Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16098C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 19:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A247210E643;
	Wed, 13 Mar 2024 19:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWg43kIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC7B10E643
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 19:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710357762; x=1741893762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2hc24w8JRgAtGbhrzCViE7h4vN6xgTaVf2HCS6Qu7zo=;
 b=MWg43kISETnFHWiXan6w7lOyZrJ8uUBWq1Yeet3tQBwHWhgrenxvqcgo
 tHev7yQzuOC6gBU/Guc1/hF5DBtfnPMW74Yd9HrrXwHVknN0W8xy90EJf
 UXrCSKUueQaSkvvceoNqM7CsKaAHk1hxXoTYMMJectdSwtDC+QuFvogdz
 cxmfyEyARQKKx7hDaPi/dOBq0rLkg3ZwTkT85UZoaRs9TZ/V4+CEmDCLf
 extK5IbDMUKbZ/ZT78NIqw0vKTtyJ4C3ht5dZj4dO5mdBy609Yd40cIcY
 zKmqBBVznU1BcGTSEBvSyQ0wNYG4N/heG2GmuviEXkRITznHjr2J1yDv7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30591053"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="30591053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="49462259"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:22:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:22:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:22:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:22:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1zUPZgLdDOTCshLeBj2/6Y7iSA9uqNf6f0gi9W3UAMwYpfrxN0viIfd8cqS6mg/hQqswUoGUxZrXf96aOW/OYNc7TvT70PBPKtSSqFyZIm3RtoGUhcfdrtfcKlNjy2+pw7NBTm8hVfFpWl8LGyCtRkd2YVvgodzBlriski/FJ2rFpA2Upo3UwGM2EriCld77XVjoPIqFHzl/uhA6N/f+uIfpkjKkY7pj+qSi1X5cD0NCrdbMg4IJr390lHSHc46DrOsram8fZG6Rvwcw6rJEoJe2dytaZ9UA8XfshYyBo/JF6f3l3B5PWRIfmBf/KQcgRM4sdu8zhUZfdzB5fWwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaPWSZXRimr8WsImjxxzuzRJ3JsPozliqTzdD7AMwrE=;
 b=Qpe9ilnKkgrYHrExw1t7Ejt8TK9N+UMWQIBQZOG5zaYMLmJqNFIVgfV6aYzwPScRx1JpTWdngfUuAXOymYdepM7AQhN20lASSVAZdLXCZ0hFHCBa7WS0vwA4i7S4dfFcE+8MG4KHym24MvrFv5+kklWH5wnX/OhII0+yqs5siMPGaelGfWB0gbzuqN53ZtAvedHksSpivSVbQH/9Cruu/x+jwrEXCpznv1kdyd1zJ9EGuFqGcoJGwzik9X+TnWmTThNQCkXLl341/WYX/nh4CEAFZ9eEwnJeOD/87THbNuMoPqEdks8Gozy/7wsvPZyhdYTjWa7JPPdHWHzIAryHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:22:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:22:33 +0000
Date: Wed, 13 Mar 2024 14:22:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel module
Message-ID: <d32kgefv22nc5ycmskryfak6s6qnnjtoz5xjjtbnyrl6p4rcpg@nxvo6pjcbpkj>
References: <20240312174533.2417630-1-lucas.demarchi@intel.com>
 <171035100667.15349.11201123748895892444@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171035100667.15349.11201123748895892444@gjsousa-mobl2>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a151b9-422d-4397-96c0-08dc4392eeab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NFMImorafnzPvha8DF4MwZoGmnphxX7/+YJmBNfZOkzstE4WfOUMtHB34AidheFGD737nGbhNJo+kI4e8Vhirwh4IOnfGU6LIKBEN6PkuvQI+QiY48ljjrOWSVssb1W/poIwj4+wqcPKBhgdGYZFUehI8LG5VDS0B7Uft/ay6Mpf80GePN8uZPxVQrHwLYgNggLKnyIHohr4cT+pqU+s0uuBvQHIOtNz15ewXh29f7UaMBwPm90r1JQww5EoJOF4cdE2rEfRDxW7SdGVMY44iu10F3Yy5hTmVnYSNVq04U3hOpHxdfLpvWWI8OqbpP3fQESlC1s0o9hn2EQvr0vpRKe8a5c+oAj3aUArd0HXj94sjhhuZS/Ax7UNeFCNE19TQHwq+aBG+n2IJ6hKa55LRxQPNjnfQqp237Q7LaGZIqtBk/HeXg97ny8usjRaLO3DZWLTl1itF1Byml/v4Jk/jX7OE1DZ7HQDd7diMulw/KJl0QCxrF4S0BVgvC9r2NlV3xVjkjPfNS44+EYcjeVtBS3cXnrSKi9XrxPnWrgtG7unUG+rH9imlHmk7SFcuiU2AS7z0ForRDRfXdxlxOPIBl4M/4uTyX5uU3Qp2ZWSfsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?39jHfz66XFFiDudeMiZD/3uVFUm2+/zLMLR4kIjOWq9WLhBFlpShEfUDd30y?=
 =?us-ascii?Q?Z/zDGXNdGqmQqb2JJA4R0WKIgDPjqGJmr+zcsNZ4Ex1l1F/r57+XXS/RPSIp?=
 =?us-ascii?Q?mwZr78f/t8nmcvPVyfKqw/i/63vW07FZNBGnXxuRVFCXNWmPR8F1/fqFTg8z?=
 =?us-ascii?Q?Jn9rCd1bMPlOOQBpc/E+bLI7c1OPj2ZOviz71qfbKI/LY8kIawUyyz+Ez6de?=
 =?us-ascii?Q?VrTgsuZLWMWK7bjBUr81T6mD78UgUqGV4msxpL9WBvpZ5sPFU1v4b2o/3vMy?=
 =?us-ascii?Q?cjd9udAjmVBQZIl/KKyiRiL9C3fkppM2S0BAUesiKCxssybYNO71+cm6DAeB?=
 =?us-ascii?Q?JJrBLcC+K2Im+raO2VXp9v5+pkwn3LCgcFnyXrBoBPdigXtrBf1KuhsgYuJg?=
 =?us-ascii?Q?SOHiKdj2LlssLo5MzQrS3bFVFuMS6hGD+uqHMvNjd15EuxxcbbiZ9r3EMZRR?=
 =?us-ascii?Q?kRnbuChi87UgnTNLTbbOZ4mXFCgm1ZgG4QOaKqY1EBDOwpbYiuf73qSSFY/l?=
 =?us-ascii?Q?TnAuNDmKnWdWk4iSpGXxcYE9Ap6r6rXF0EzlBUoGikns+z5jEHdjQfO7iNsQ?=
 =?us-ascii?Q?hfIoSZkMnv60OdBnmSmoCgHDRnBzIGJOrRL7TYIfXn7UsNbPUARzEfWa/FLF?=
 =?us-ascii?Q?Q7bk8/fNju3guQxjN0YILZMOH1bvyjt0sB2FfVtWuRSnpqgQ9CQvO0rBuqko?=
 =?us-ascii?Q?WnSf1iLQw+s/U/B0HFVLS7nqhGbJRrATdjF3cT1Rna7Hou3jlngjzx8NY3g9?=
 =?us-ascii?Q?dBNeQ07IO6jEbPASLYtVGJvCkJ5ZlyBfwf7IAB8p/vsrIrOI7Xtx1YhS74QU?=
 =?us-ascii?Q?mLg5zl4AF2keSBN8vArbiaFHSR2+SjQCU4UlZkOoqmjOvUIpr8I7JVs8sP8t?=
 =?us-ascii?Q?zPQaQ+XuyLRJEOgCBIDlD4fMYp/hWaQuCFjQXKweNDC2AitTigqkIFbJxevy?=
 =?us-ascii?Q?TfpQh8SPfHVyyhMtb+FSFtw9FVZNxONOZpCHvu3PUR4JIj54qUMBW49FnHhn?=
 =?us-ascii?Q?m3zuXcf7+nROgyXZAdfCnFeF6frbvm2csP6nMtV699tD/PxYBrjyUAxqCA/g?=
 =?us-ascii?Q?oaCScXX2GmGimOUMygXeQm0BGgBcwnTCGoxW612jDZ2aoGMTbzuYtHWI4NgE?=
 =?us-ascii?Q?JMJxmdnHrMB9hyKTtkpxXeE+Ivtoyxfo5qXoUiduHS/iTA5ht+5gCtX9Umr+?=
 =?us-ascii?Q?GzztW0LQZ/lqzOTqlICIyzrEdL1OgqoElqlztFGLs9uu8mrPXD7ovttqota0?=
 =?us-ascii?Q?7J8xVOf0qFwpr+eoXRbC+pjNxuhxj2NhQXP5WECKtxD+4XIWHUpChQeB2Fz8?=
 =?us-ascii?Q?RN6Xp+jCClinYsbwU4yJlbOaeXRxHrUxTCCR5jbY1TRrtQdtIFaJK0wnY6Ng?=
 =?us-ascii?Q?mUZwx4ZDhoZZiqIKO4eCQDtJ7jBQRnw8wyiRADE0NRWsZyX9BZeC0MIeJv6t?=
 =?us-ascii?Q?PVOSfCSR6pP9wo+VvVUHGZdj1/1qaaUvCNaHPx6bFaXyoDapP0W/cjKSmNQ/?=
 =?us-ascii?Q?iU+nQxVWeMiH8IHALbl/wiV301ly21mAHf8yyY/9/7pGNxna4bcO7vYm7ug/?=
 =?us-ascii?Q?4eVBbkG7ANr2qazsuw13xEKqFla97w+xOkr/Qot3kZlNjqhDUX0I/sWMN3Zj?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a151b9-422d-4397-96c0-08dc4392eeab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:22:32.9611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEb6cTeBLqxFPW7kzaV2JSTRuCTUJg3BJEiCz/1TqxQVPHVRRNq6bSreKFxpqUBBXzB+dIKXueLU4yMBlZtUxb2SWPF8OhK5yt2Z0ra2948=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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

On Wed, Mar 13, 2024 at 02:30:06PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-03-12 14:45:33-03:00)
>>https://patchwork.freedesktop.org/patch/582554/?series=131032&rev=1
>>groups all the live tests into a single kernel module. Use that
>>module to run any of the tests triggered by igt.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> tests/intel/xe_live_ktest.c | 17 ++++++-----------
>> 1 file changed, 6 insertions(+), 11 deletions(-)
>>
>>diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>>index bb612bae3..08b80d4e0 100644
>>--- a/tests/intel/xe_live_ktest.c
>>+++ b/tests/intel/xe_live_ktest.c
>>@@ -31,16 +31,11 @@
>>  * Functionality: mocs
>>  */
>>
>>-struct kunit_tests {
>>-        const char *kunit;
>>-        const char *name;
>>-};
>>-
>>-static const struct kunit_tests live_tests[] = {
>>-        { "xe_bo_test",                "xe_bo" },
>>-        { "xe_dma_buf_test",        "xe_dma_buf" },
>>-        { "xe_migrate_test",        "xe_migrate" },
>>-        { "xe_mocs_test",        "xe_mocs" },
>>+static const char *live_tests[] = {
>>+        "xe_bo",
>>+        "xe_dma_buf",
>>+        "xe_migrate",
>>+        "xe_mocs"
>
>I would keep the trailing comma. :-)

add the comma while applying.

>
>With or without this nitpick,
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks. I pushed this and the kernel patch.

Lucas De Marchi
