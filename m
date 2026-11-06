Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C0606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HsKy2ZLF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B16110EA11;
	Fri,  6 Nov 2026 19:17:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F6112FAE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793992561; x=1825528561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aAuazbDpZrKBK+OjCL592rzHKfYddpVfPdui/BesQIc=;
 b=HsKy2ZLF9YV4nGDVJ00POlFbjdcZKMrKRfngdQRUar/2soMhMxAuVyFu
 E/qCReQbF8xqpijwExwe+m7L9ZChB7hO4mhcSN2UUVUSpdW1xpTXDiG9L
 Z3roR5MHfaKeLLR9AGfxVxHGAMDXgSTK3xtvQH2Ej3HdjKywDtcyl/9JG
 hh3mNg6DbVLuPIHHLS2cQnSGHjeEEFBuJLPKrx2IGYf8n04a6MIUA5qR1
 kSa+uhqME6f5MJmntd+NS8VRuoekqja9fWfAFJzzpb+XeOFjarElxX3Re
 vLy1OEQM9GrI+Ala14ZPCcm2CSUv+PMG/h2w3qwebCahjJw3PpKFQEXCj g==;
X-CSE-ConnectionGUID: 4baN4GyvT5uSi2sYCQLLbA==
X-CSE-MsgGUID: y5+Ih1Q8RZOnbQubbnQPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2804053"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2804053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:16:01 -0800
X-CSE-ConnectionGUID: x4MNs1tdQDmjEd8c4eCfJw==
X-CSE-MsgGUID: A+0mqGDnTJuU/zdKR8i19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7378419"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:16:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:15:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 11:15:59 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:15:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyIC1OgOPSKpCvcfR0eUd69GLN9a7vr8arCqs/g/WgIoFrPY/Bs8bhxYe/dbIj4PrwVWjdmP+UfguYBWpe82PuE2jk6VI/sP4iDGR4QSuIAMMwGfgdAXBMKE3vV72GbcJFK6jBpyiBsBynqaae+ewZ+IiBvXcewm/SS5puFb8EoWdr55WU2kHcJtRfSqa6ywxqb5dbkEuIn/CnMpLSYyGyD6HPPa9slaoKNdk6vH/rqL2cxyNWiGnrBCkHiqIZeOgaOYtrhrUy3XIk+RgOihnToVeiNziexD1sY7NVyj3xzyrJI0AChotvIvH8GZ7p/XFHL5z3igxzdJtIxoT1GLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRdE4NK20Y+NcgmhsajKFc51zXbxfOQdP1B7ocAGdTg=;
 b=HtbxiEO0DhnsPBrV6AY6mRY+klznsXFMFtGF8WaPeNjvQEU6cLETc8WCPW7Jm//UP01xAWMyql6h3l2/hZ5lCaexf9uLD2K6lauYQKqRrK0D/AY3LybNKSYQdsMoMyanbhZOqS6G5BIIXM4u38kz1AXaR5DsvQjTilyVDfkMnYBfqkxP9jDYTUn/0fcJSElkXpIZed7GZZ45C5IEDNKoFLJCt12dQj+Sqfe/Z8f39yfZiDXW6Zbll00Elxt7d4bH4UV47cuPtPMNczl8kt42l/uf4D0pnVm337Vi2PMNV6O7rh+TAXDP28bs0g/NTRUwk78L2CEr4Ii7FDLrYCi13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 19:15:55 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 19:15:55 +0000
Date: Fri, 6 Nov 2026 11:15:53 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v6 2/3] tests/intel/xe_exec_threads: Allocate the
 exec queue arrays dynamically
Message-ID: <au4nad0paG5A9fzw@nvishwa1-desk>
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-3-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261106183246.14482-3-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|SJ2PR11MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb10dcd-8b6e-4023-feb9-08df3c3a61aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: imfLwSCwf6LydVZsp8lc65DGBI6xcsFkRgnJ157zlQJFQKmlQFp0dumRTkN1dH+snB50bqf2RMX0Pmu9niRh/ZjGj3IW5wBgpVSQY3BHWcyKVJzJ+o4K1DYh9zOk9lLBQLJzVcQNn3OZTTWmU/d0yxdsvFvo4Dvj+0SYjzwaSo9/Vzh/DwEIuI5Y7hx5bfKxyljltQZEx9ppjbqIVhkswHI81W28cDvbN5/jD5a0G1UF7wVjhPcL1WSZNmwuNzdoXjQEPX39zMrnm21LMF77HGTip7vSBvKbC1H2yZSLH+tZKi5rwZ+YWl6KY1r4SG1WhxWW6KfO8ovvalciYOR5xe+mRaisgbXZ9wPzSpszayx4jIABCWwumJ8Ipr1e7Qh7erSwiyi+tMqS78XCLs7W2OdRL5ark1bQUtJKnqxhQ56CXfy+FQxHzn/p8KfbEXYawPrRi7GBq/2GnyWuUtBoVaUVAiKq2cPgZR8wg53C9Oy7s1pR4a4oLPMV51n315i6Yv9/cYRQEeQCgcvY7fYh2uvOIJIszr/ZfulKryO724BYEc5cYNsANs1nTHigBuZ9NZmKCD5ZI2hFMvi0MDAEJZpZuzpZLoDmJMlHeh+K6cLFLhWrb+8iJ+zKLV90jdKQCZGRNvHWaQU5LvQBpU692b5ieNlCuYWj/zngoT51xBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261022105027099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5Ds4eTMl/y5SsjcKE5cHp1jg6ckIRLXQrq1d4/kpypVt9qapNbOQrJYD3BG?=
 =?us-ascii?Q?zmd5Gei8b5Ph+jb8O2wQl51sN7CvRhNJG3wBqlCkX5zPrLL8JLEWUZe/Y/X3?=
 =?us-ascii?Q?CSjdFs/4oAPpjq54z+QgLrqT9w5ApU64UmtWpZctSlK9GdLlhJzvF26Z/zfY?=
 =?us-ascii?Q?owvtG++Nn5lAm28Epc6Lap2Yp4CrjxxWnP506dZDFU9AOI1/QBd/sMKxOwAm?=
 =?us-ascii?Q?TX6OAXsqxyq0pGpJVvyamtuXNFRhoy0LAQwNylbRAG3qmLiVObWin2yCavd8?=
 =?us-ascii?Q?GoA0z3AR7NcTqZh8ywkz2VS5kagBvT5apEwauNWZ5GZtkbTIysQyJ8ELssES?=
 =?us-ascii?Q?mrNfvq3SmVC0E7sEGLB481LGBAYa94POJzx/oOmZUKQ/5S9VWl3uvwpFnP1n?=
 =?us-ascii?Q?jHo5SvU+n4BLZ7qtkazjWw3/vyOGsTMf1wkgb9g+B6t7bqedfRm1yaw8avt3?=
 =?us-ascii?Q?IlNpvus+U906y3aiRlvMRiSRuAcvF3T+GBVs7MpQhzn2bMM48nHov1uobryL?=
 =?us-ascii?Q?MgVGphRgAZa/gWwe1WqvaJgXB0AL7znJPLZxvB3R9VULb7KvPTWnV5tuy3xK?=
 =?us-ascii?Q?DOl9qoRmgO9jwrg/C4ZyT/cLKdxefqCGV71OgTOEK3JGIB3vAq/CnN6MarqO?=
 =?us-ascii?Q?ZVZuJNm841iN4F+K2qpIUOFj8G95R3+xEAxHFj9ys4k5yIoHjgE2Q/XjVv8M?=
 =?us-ascii?Q?ZyeN+yV34QxRo8M+4hOjm3w0n2v3xdRmju/NLyC7S0a2Urf3mhBVEKEGQ/7Q?=
 =?us-ascii?Q?Uf6188bWlvJcRaWLiEtrkWYqY4qax3Ihjh3owsTmsk960J4JqV75nZ1fKd0U?=
 =?us-ascii?Q?AR37VI6N8ZIkHF0ps9pLMtaEuMJUOGOvxkngFvIPFDZ/zbqotxcDjUkYwkKz?=
 =?us-ascii?Q?aZ3o52XHZfOsF1+UnKsLkVmVwiQwv7HNddVVFw+fEWYFshUzT5mxt9fLUGsC?=
 =?us-ascii?Q?LKLc+CT89csR4zgrYzA1jXkui+IEIETquAng33EDLr68DlClXmsQiJgpLz8I?=
 =?us-ascii?Q?UOfpyBvDVD4G7UDhOuj3PWtMynGcf8Gya1pg2KI/bdz7JVjVUaDZxHOaHtcy?=
 =?us-ascii?Q?WngEEcNg+pt3Ffw4Ef8x2SGby4lVe6B6afryrNIhrrajPH0DQfZZ+WhRbWnP?=
 =?us-ascii?Q?5fJUkkryPvLNQLnTtPK7t6Cwrk2YCsnArh4+RA82iR2+bvDoQ09fPTjV0xNz?=
 =?us-ascii?Q?PRGjzAuZKCVDoLbmNNyk7+Eh+dQOEo3cXMrKv9U7RIcgvWBdDtlYiEOysqSU?=
 =?us-ascii?Q?jkdYtMmI8fG4sbkdw/M+vmJ/uMkNQCHyLR2VSRXehllU9QYRB1F05EW4OBgd?=
 =?us-ascii?Q?O/GDFe1AzbQzvWk2koReoPG05Wt9lqi+MR3jyq7o07jCP7ozFRpFK2AdwjRZ?=
 =?us-ascii?Q?PLVOB0q2pIrr0Q6r62BiYRkuafNYmVM0/xVPKE1whEt/r766J6Qzejh+26vU?=
 =?us-ascii?Q?YATOIZl/M98baURXhHXyIsEC1zUPLkOOGk0qaBcSAgcF2OmKy8p4KOn/tbQL?=
 =?us-ascii?Q?x8+Ci5GAak9nye139sFicHCNr7lQwV8+ewyfkMS0NqHjIGM+AK/sWMWC66xM?=
 =?us-ascii?Q?+grPLcqL4V6EBC8HnE0SFlAAjp1ek2VtYrEkRb20bQaL8ManqTsyDAo1sRuU?=
 =?us-ascii?Q?4YahwsHFqP3s7USG78TCNigeMz3zc+JJGCuGkPxXBvgQqv/K6k8icFiK+5ym?=
 =?us-ascii?Q?+7FQF/a0flHg9PlNf7nzrxvZcUHbgAdiDwUQW0EhTyXOlhjJfkKhCtyMit10?=
 =?us-ascii?Q?OXmfjGWT0cQGRSIca829tS+x9NUF+XOTpkG1lQQR/puJHGj+vmHy?=
X-Exchange-RoutingPolicyChecked: 4n2tBf6miQtpaWmVsUSry19OcDoarxm+6wdOj0D4sVlOfrmD4KYAqjsacfSstnCETF6zCY7TDmC4bqFtZ6b/y3ovxrfZRO5tTd/+wJw/krlDEvhbHzo2KHbb7ydP8bAXsg3/9W1mek5n0GZrq7/aYQDkwk0drNkzcGHxUDDPnkeem2CIZGTXGrB4DKRXa78SBS1Ut+PJ6U7XFQYSAEAwwTUW0DN8qehGHaUBNM7uO8U2qu4MrFXPzFd3cSL0J7qwBGxQRAYCzQ1lOto2swe/8WHwy8WjFMQxiyNJJn76zKxku+eYswKZZK9cAT/lKjUcGFbu76q4O3MELp8vgUTbTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb10dcd-8b6e-4023-feb9-08df3c3a61aa
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:15:55.5043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCduLJRJMsceE8U+a25FkJd6Xl5lhuwOO4wVfI00fOqHOumVLvdGiHWnmEipZBNBGy+DszPa251g2b0Srf+H4NlVkyjUaYRuTBaSFUzMT1MWZhDXRXtd17xvejGDj3/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 06:32:45PM +0000, Jagmeet Randhawa wrote:
>test_legacy_mode() and test_compute_mode() keep their exec queue, syncobj
>and sync arrays on the stack, sized to MAX_N_EXEC_QUEUES. A caller that
>wants more queues than that can only be served by raising the limit, which
>would grow the arrays for every caller that does not need them.
>
>Allocate the arrays to the requested queue count instead and drop the
>limit check.
>
>No functional change.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_threads.c | 25 +++++++++++++++++--------
> 1 file changed, 17 insertions(+), 8 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 773627140..6f46781d8 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -379,7 +379,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		.syncs = to_user_pointer(sync),
> 	};
> 	int64_t fence_timeout;
>-	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>+	uint32_t *exec_queues;
> 	size_t bo_size, sync_size;
> 	uint32_t bo = 0;
> 	struct {
>@@ -393,7 +393,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	int map_fd = -1;
> 	bool owns_vm = false, owns_fd = false;
>
>-	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>+	exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
>+	igt_assert(exec_queues);
>
> 	if (flags & FD) {
> 		fd = drm_reopen_driver(fd);
>@@ -609,6 +610,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	if (owns_fd) {
> 		drm_close_driver(fd);
> 	}
>+
>+	free(exec_queues);
> }
>
> static void
>@@ -620,15 +623,13 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> 	};
>-	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
>+	struct drm_xe_sync *sync_all;
> 	struct drm_xe_exec exec = {
> 		.num_batch_buffer = 1,
> 		.num_syncs = 2,
> 		.syncs = to_user_pointer(sync),
> 	};
>-	uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
>-	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>-	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>+	uint32_t *exec_queues, *bind_exec_queues, *syncobjs;
> 	size_t bo_size;
> 	uint32_t bo = 0;
> 	struct {
>@@ -641,7 +642,11 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
> 	bool owns_vm = false, owns_fd = false;
>
>-	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>+	sync_all = calloc(n_exec_queues, sizeof(*sync_all));
>+	exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
>+	bind_exec_queues = calloc(n_exec_queues, sizeof(*bind_exec_queues));
>+	syncobjs = calloc(n_exec_queues, sizeof(*syncobjs));
>+	igt_assert(sync_all && exec_queues && bind_exec_queues && syncobjs);
>
> 	if (flags & FD) {
> 		fd = drm_reopen_driver(fd);
>@@ -676,7 +681,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	}
> 	memset(data, 0, bo_size);
>
>-	memset(sync_all, 0, sizeof(sync_all));
> 	for (i = 0; i < n_exec_queues; i++) {
> 		if (flags & MULTI_QUEUE) {
> 			struct drm_xe_ext_set_property multi_queue = {
>@@ -942,6 +946,11 @@ wq_stress_cleanup:
> 		xe_vm_destroy(fd, vm);
> 	if (owns_fd)
> 		drm_close_driver(fd);
>+
>+	free(sync_all);
>+	free(exec_queues);
>+	free(bind_exec_queues);
>+	free(syncobjs);
> }
>
> struct thread_data {
>-- 
>2.53.0
>
