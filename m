Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BCFC54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 21:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D0A10E1A8;
	Tue, 20 May 2025 21:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE/s/+BC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C5010E1A8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747775557; x=1779311557;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2sIFspkny1pX4JAAejxa96ooO6rh1kxg/qKLwjRJ17Q=;
 b=bE/s/+BCXB21ZKGASQTafpu7x88xgS83es76k4bw8BJZ8X4YBNkUw4lu
 HuBQOjWbnYFrRssiFL3SkjzFQN6VgrpIfa+68IpnybmOafgA7ICKHejG5
 YF4gfZvFGJ5Cwn35QPCYPaYVKYDX3D6ZTj2OotOYMHR77bj2v5loOzNUH
 gTkkwAntuoRsew3/AwxGsln+wpfZinm//+0da1mFZXMSudgWbVY78AVOs
 Xw1APhyI732KaIFUwBJStuSo240UC6Mik+I278VATfZGvGqb6BXOZUVjx
 vCzIaoKfCIG80H5tuDqwv7+d7L/AK6Gt/C1Wbj3SiVdbeY1qDx8uxptxS A==;
X-CSE-ConnectionGUID: 5JrPa0SXTXKTUEa9EuyDwA==
X-CSE-MsgGUID: Sp7u97kFQlCbXZsK3cnNbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49629808"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49629808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 14:12:37 -0700
X-CSE-ConnectionGUID: qIt7j+BHQK2wjUL7YQjV5Q==
X-CSE-MsgGUID: vuxgXLG3S9GiKzoZTyNP0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144772051"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 14:12:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 14:12:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 14:12:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 14:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4WB8iTlUsagUES6ZaOGtaQNNWt9KnYBUziXp5oxqkVwuwEhG2CnvaLrcaxjwUaeqSlFflvhhvdOdrC6ZboAWH/ZQ7CTF0036X5piAjBH903c2qHDSiBUdKYeYABgGPzZ3C8TJpda/SlzhuJ5sXK95PwZsLCsn0QQP5DHB3pA1g+TkJdlc4juk17fqlcy+BV7AcG5M3TA3bLUpgbvIKDF2NauTYedLgaPi1GYlKf1z7KGfK+dwCwYIGuUQK/mOg4kqniGxIISmVWA4BhrjtsejpxdexaGJsIqHOYbkzGlXWBCBEaQNrTarmKzX4n0hxuohaRePzb0oZXSS53/6t8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHDPVRBOm8DMsMSaLduHtAmr9iy2EqWnsGy9t3pzhkM=;
 b=YQtyD2HYa9KiD7PePajiTcJ+5bPYBv0qkxsHShJW/GkMbQE/6+/RA/GiFoz+Sc86q2zHFqrGApCfXhyfHOcVIvlZhfRkUlslkFbwJ8mcI+JdHx6bbEuq8QKfH96e8/o9zQKjE/27DX+psH7BbU3xFgHjmAieORkemafNpEJfm3sVB/xPBJnyEwwb7vJMjlRlycYA1fCDhg1bRex5UN0j0Ksd17MuXALJiwtkbIFNe1xROwduxiyxRqxLp+fQyMWSqVBbp8REl5vVkzdh8QvnGs9vCmyFg0pbHVwXIR+tjvW6KxqaKkTFoLnV8m2asjht1YGPUZtbg2N9ru59/nR6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 21:12:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Tue, 20 May 2025
 21:12:33 +0000
Date: Tue, 20 May 2025 16:12:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add test to check for
 active contexts
Message-ID: <cfwmcfrcyfi3l7xmqzkvzsqfqmq6oln2p67kwsqpnxfx2bhjyz@arbemoopbn3q>
References: <20250425192102.1551877-1-umesh.nerlige.ramappa@intel.com>
 <14ccfccf-2d7d-4381-9688-9945ddbd1491@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <14ccfccf-2d7d-4381-9688-9945ddbd1491@intel.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9c6378-6727-40f9-b77d-08dd97e309dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vzdlJ6tdlb4QYrsiqyXKONpsyQTxj50fGWyBhiv4FVdC5Yjx2C745eFyNRdU?=
 =?us-ascii?Q?TvXLaUv/8L8pToW2AkTs0Eaxud1lz3ZcnqOHJmCk0Md6hlVtAkXM0INEXIAy?=
 =?us-ascii?Q?0Jd9BpWXcV3j3mGyYXBXrNHCP3dcbYPV/4Pbqumur01WSgdgWUpLB+BBcYX7?=
 =?us-ascii?Q?1EYTzHyhhIL+oa7/Tz4QQfJS5/jj6mKoXDJlqCdlq/M1mG+ZsCuAC+Vu/b8J?=
 =?us-ascii?Q?YjJfu6nk/mItzZAYO7VB++3uNqoElDsOtcywStJew/aM+EE6CbOb7a19WMkc?=
 =?us-ascii?Q?ExySI8SxEwR2DfHBIIiJHKxhrE/YW/k+gKWcIlO/+n2VkCypoEHApC+I+TD6?=
 =?us-ascii?Q?RwrpFkSugIkUqpXfpFRYmXBfiCA4kGQ6KlNqLXHsovRn8Cq6F7WWlunSaqzf?=
 =?us-ascii?Q?qBUtonG24xy0qlCdb0boNaUOlpUoyVk+J4tjmgmSOMZtuYO2a4x2cvSZS2r5?=
 =?us-ascii?Q?PSNHt+RKc0NyFVr1O1YDH0+J63dUNxeJBhliPVGCRM/4v+y+qPVveZftCd6I?=
 =?us-ascii?Q?opwmSqMd7W44mFavlQYAOh3LtvkPk5IVkQhTnTpD55YFBS6tbr4tjjf9JIWg?=
 =?us-ascii?Q?FaVY7ZyqQJ2yuSz4qw/elRftvnzi1by5wB3i6X+LfvM6VhumMTmOHaaVgVIz?=
 =?us-ascii?Q?y4yboMaSdr/C0R43XagoqTxAByKGz9lL/YGxoExV2L+qqAGflum8ma5Y/wpl?=
 =?us-ascii?Q?Z7Nw/74uq80bybah4GJYbyIHsaD8iKAgBZrNd33NKWP7iZp4FTsr6u6kyu8k?=
 =?us-ascii?Q?QZAq90aGOF4pLNhYUXogXQEfZqgykcX7/dAG9o5I5qKIthZK0PKUB+TKFeh3?=
 =?us-ascii?Q?1KgDRF0+PcVItTNj4JYpkft9IhrAaqmFuJFwGqPk/DF8dGwbfOeqZQSfGySK?=
 =?us-ascii?Q?tISc6csKCoq2q/86a0ecEpd6qil4NaDLVYdQGenc4iENqEvY2JL7TU5IGxSH?=
 =?us-ascii?Q?zC3SA3DpyKLQQR06VMuLrNnC9oyJ3HpUg8X5OCV34VUeQm0SN4VO/h0Hvlsk?=
 =?us-ascii?Q?vaT5KabUAOwVB7o+NuVFCfO7hnaplbSpBx0ascU1PDCCJmLhS4V6XINK70mk?=
 =?us-ascii?Q?/7MvulxVwuPRg5dbywgixBTlFsAHBoL+GtUh+qh33bATO/z9NMxXfOYMasQG?=
 =?us-ascii?Q?fFLPUwNh/tZ7ThGWRhuknzg7Blvnr3ZWpF433Bcf3vWAcXtbCNfQKY6nOYzm?=
 =?us-ascii?Q?gyY2VFaag8HZzqvxNUuhW+CIaOE9oMsw3A+0ldvh1fDITT52XdLjSkfMcaC3?=
 =?us-ascii?Q?bYraW2u11w6DV4trEBmqBCHm3BKbRmX/pu8IzmVreTa0K1gTDU6sxY5zVlNp?=
 =?us-ascii?Q?XEZTy9+Drx6rJIJN61wmG4Ghqf54lyEr69MbD+W9mWXL98t9p8FwR69yuodO?=
 =?us-ascii?Q?KGqu/w34oBVlSkDh+RYROWFoQ3o25Z08pQdJiGkZ9UvWY94kAfGvLVxjFKbI?=
 =?us-ascii?Q?d4rdHRQEcxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBs3tlI3KE39YaOMzAfCED7Fnmg/ZfVRvCipxoIdkIUsIWwVfsGYN+dmeNfx?=
 =?us-ascii?Q?hSnwPDEFKKZPE9RwMu1Hu9AxnIJgJNEgSA5vh9C75ldSN8j7n5LOuqzO3bQF?=
 =?us-ascii?Q?LcLHhnJBrEogy3X1M9jeYASV+8L49R1h+awWVhOde/xcjmESCdO+ZHixybvk?=
 =?us-ascii?Q?gKjT6k7bOlwQ304VaEjouipyIObTlnO3PQT36BVApAjIrQVnCxGDpslhf7Ga?=
 =?us-ascii?Q?ROVEo89KVOL+qqOyfjrf1DvGtMak11b30fTgbppB2P4/84YrCBeloznLUhAS?=
 =?us-ascii?Q?Anwza6uS97vCQHz8a1RroDPcrsbxmhvzukQO0Ze5SVAt6aWRUbXdxCzCSL5X?=
 =?us-ascii?Q?QYhh1cKwaoONfXgwt/JTN02U3lNLxbx3NyVgyG0ILVKr/XUyLL6dMe8a5fog?=
 =?us-ascii?Q?W+60g1aSskr9/cr5Sp+pmS1eqbvo9YFfix/mx0ZakYLnBUT8JvSALUKh4LKH?=
 =?us-ascii?Q?B0FUSkOF9Xz5E9ecUyGo/g9Ce+8QKYx3QEdfe2aWQnzTTmQn5AC9K4v3E4f3?=
 =?us-ascii?Q?0hYhihdBZki8jYS0Kdiq9jolbPuxWC1YmVweMdaM/gml5KEwyVpYnn8PgEBL?=
 =?us-ascii?Q?U23gnKhDetAMqwHJ/k9lHv0+L9jrSz1GIYYxumZI33nrtcADOBscCtl3rACF?=
 =?us-ascii?Q?5+0wa+mMCNioYx5UrA47GvaDsqTar6DFJJO90377YXbXcqD7DXAbM7Buoo/g?=
 =?us-ascii?Q?ybIL/PX1xWe5vIEKkFvKckSAL8uW8VljAlo5O96wntnhECExUgP9U1sSUyNq?=
 =?us-ascii?Q?PKGxQEw2iQXsCfm5jE3RK9ZQEc0gVQbh/5qbGUrYvI/CzqCsLohy0wHiz7Za?=
 =?us-ascii?Q?KbnEcvgAIJltBOF7VZLeEfEFFNN5XYaORbTTJ38hqefq6cqpa29Us3bO6Jgc?=
 =?us-ascii?Q?Swf7zyC5gjMYhz3UDUuPGdqGi3/V2GlOiLnMaEpNt5ndjnothABHAFO5Ht2X?=
 =?us-ascii?Q?lYMvHu8YcIO1dIrFHq7x+PExp2jLu1QsWOx6C2QflmCZBPQQfFF8nuQFCV+F?=
 =?us-ascii?Q?SbEyiGKXn7pkqplj95krJLoCKeCOw6lEuoFLuAHvjIKuFHbBEV2VAPm5T5Un?=
 =?us-ascii?Q?D0XBbwwvhFD71S6NhphEy+rDV4LYt+Dv8nxjyz7t/GciD/FsyDZinmpfLQW8?=
 =?us-ascii?Q?/ZeJZi5AssMkJW7qsNedO5/7Fx6AvrxrjhKBlPAsNyMMPUvpe2k1P4XYrqxb?=
 =?us-ascii?Q?VYWVl2tO1M7+bh9vCBPafa+92mIbb4zDz5Bervnol1UYZ/4KiTXBWtXHmYb+?=
 =?us-ascii?Q?NBwg/8+x8xWDejBzs6M5u4y/JQOdP/SUJeb/mBAhkgTNnlIizvunBfLJ7vY4?=
 =?us-ascii?Q?Zea9jE+ZB1JPXw2RvcdhRPOimWlAWUrTkszxDMfbPExVn+dJk0L/BDtzNOh6?=
 =?us-ascii?Q?oltoI4VRQVWzxb1RM1Ce3GdJDWV7wnFy6JvrU5tzR5weYuKUGna6WXRvPtW5?=
 =?us-ascii?Q?FyzY9mSGU1rllbg25xhlMEc14+qh1m/HaaOsRWvOduwUdoIgLjGu/qQbMsf8?=
 =?us-ascii?Q?4DgA7m1KRM+Y0wuJtDOxbr0NU6yyDzm40El0x7iNsyqosF7ZQ2DDa+Z/K0Qq?=
 =?us-ascii?Q?DU2FXNWKVw9lbuL4FtfBvXYPgcohfu7PysS8QF8p32DXjchlgylafRg0HRrO?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9c6378-6727-40f9-b77d-08dd97e309dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 21:12:33.7277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kkis3CIChAYfJcBLM9AYs4Q/FfKlZqE+X1LAaATnfFT3d7ruWvWRwevqDN3KYBZk9jyX0pXqX/k8E3cAM++F7ufpo9afNhbMJG0p5kCzvTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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

On Fri, May 16, 2025 at 10:49:37AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 4/26/2025 12:51 AM, Umesh Nerlige Ramappa wrote:
>>Add a test to check if fdinfo returns the correct ticks when querying
>>utilization for a context that is currently active on the engine.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  tests/intel/xe_drm_fdinfo.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 9a8811b4cd2f..73346ee9b1da 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -48,6 +48,9 @@
>>   * SUBTEST: utilization-single-full-load
>>   * Description: Check that each engine shows full load
>>   *
>>+ * SUBTEST: utilization-single-active-full-load
>>+ * Description: Check that each engine shows full load when active
>>+ *
>>   * SUBTEST: utilization-single-full-load-isolation
>>   * Description: Check that each engine load does not spill over to other drm clients
>>   *
>>@@ -456,6 +459,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>  	if (flags & TEST_ISOLATION)
>>  		read_engine_cycles(new_fd, pceu2[1]);
>>+	if (cork && !cork->ended)
>>+		xe_cork_sync_end(fd, cork);

wouldn't it be better to add a flag to be explicit about the test
behavior?

right now we have the following combinations:

	- 0
	- TEST_BUSY | TEST_TRAILING_IDLE
	- TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION

TEST_TRAILING_IDLE is kind of pointless right now as it's actually tied
to TEST_BUSY. Doesn't make sense without it, does it? So yeah, maybe
drop the TEST_TRAILING_IDLE flag and add one for this.

I'd call it utilization-single-full-load-while-active. And update the
doc on top of the function to differentiate them.

Lucas De Marchi

>>+
>>  	expected_load = flags & TEST_BUSY ?
>>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>>@@ -769,6 +775,12 @@ igt_main
>>  			utilization_single(xe, hwe, 0);
>>  	}
>>+	igt_subtest("utilization-single-active-full-load") {
>>+		require_engine_utilization_data(xe);
>>+		xe_for_each_engine(xe, hwe)
>>+			utilization_single(xe, hwe, TEST_BUSY);
>>+	}
>>+
>the trailing test can be renamed to load-idle and this to full load
>
>Test looks good to me
>
>Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>
>>  	igt_subtest("utilization-single-full-load") {
>>  		require_engine_utilization_data(xe);
>>  		xe_for_each_engine(xe, hwe)
