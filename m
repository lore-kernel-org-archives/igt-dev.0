Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684AEC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 15:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2048E10E5FA;
	Tue, 15 Jul 2025 15:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB2fYjQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25D10E5FA
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752594442; x=1784130442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KcrOVArNsm8HjbkNr+E/dpXH+W2fEn00547C1PIEE48=;
 b=CB2fYjQCckx5cE/rbiTTljTbqm2o7p8tcEPRg4BhCRliAPXICjU75Twj
 7UCj6L3m2Ww9HDFr5qQ9N5Il8q5qxMlrcFMc8XohtbjoR92GhMAHZIael
 9dcu4HOm11CcIZ7DgHRo7Tf1sNdwLGzZz6lenMk58s5O6Gzw7RHp10sWs
 DvaW0SD1gd+Xd0vhNkAasItZS/5f1ouZdtwxp5AIZabUeHBP9GMUm2NmY
 VcalEueTQRJKwl67ht9LdUd1KZG4kz0XQGO1lxD7+ug1DshvQK15bjMZt
 Oct+Q3ZauYVSrKhOoDJb2EObpd2ZOEVRX+gG9KwcunP+dVsehveuRaoDW Q==;
X-CSE-ConnectionGUID: mfvnVOk0QXWnxXVMPuCAtw==
X-CSE-MsgGUID: lkOr5TtgS0C9n0QF6NOCYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="53933827"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="53933827"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:47:20 -0700
X-CSE-ConnectionGUID: 8+snzemoQgGDVBj6CDBUqQ==
X-CSE-MsgGUID: PLywPf3JQRGQhBQVcYDGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="188271568"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:47:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:47:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 08:47:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn90/1TRMlCx1h9CS9UC3U0Xb1T1PVwLj7G8E2VyWAAeWqeNrYTKWoReJtQLl2HLjFWna8kG0tHJeArdeds/UvHRQm0MCcJy7grLaJHRTtkwL7OrLdbJ03eiVxiGNRLYIPefHJFPu657w1xz9Le9J8Wze1mcsUpmPpJH62hqM+PrFcfSQG2DZ5zn1Rf6idbwRx63krDSYqp3UduAmkUmyvXqBk2VVIrvKA2M1PB5z97bBnZh8RaVSAv+GyEYWk8Kn2GhW85Ed2WFA5Fp8j+4Kl/WiSdsudiSFFzdOSdZvQKzSEgesXn9gj7c46xOXWXJcjYN7//Lm9lkAvHoqEx2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYv1zXAXIKKpeFbX9GkYRb6HW0wxQuRPQyhOtRRbcto=;
 b=TOZ9R9OxW2Qo02RzKHJDQZDFPz2DLBgC/z0As2xG4FinNWwsSo3SZCRrl2AiFOB2dyUL2/OB663Thm3LllakEMo0oBwYEP/mByfSqZ9ld6aIbo9KzYMddtS7Qu+Nwz/QVCb0QqRtg/z3Ib5TxE3XvMWW6rsytgA8DQaoYJfkmDSTvg88mFSoIUxN2YLLHcyGe6hdoLBb5ZHi9hj2VR4gbQf9XJMrtWLKgtE538gmGUCxXYUOzh8rqstM9q0lb8xgmNd804AZyszfhiJE+KUtuhrYcPj8mPRgdZFFm7NEeEFuzJLdn55nlrIO7nJF9lBsejos05uhRf6RMOfFeCEFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 15:46:59 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 15:46:59 +0000
Date: Tue, 15 Jul 2025 08:48:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] tests/intel/xe_exec_system_allocator: Wait on
 mapping BO's to mirror
Message-ID: <aHZ4XOOXhvjbBJoU@lstrano-desk.jf.intel.com>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-4-matthew.brost@intel.com>
 <53d0b625-df65-4e08-b37d-6eaca3354bea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <53d0b625-df65-4e08-b37d-6eaca3354bea@intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: f09ba01a-fd86-4ba9-5f12-08ddc3b6d579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?15iauxEW69O8pmZwxtbnHNkmRNLKBExB92x0xSZBe9oXzlXTZCyy/aoVcN5/?=
 =?us-ascii?Q?WVQSmp8D+WqouiJ8o05CSYGuHNhXBWYVWn1zo7oX/qRtyfigkn+VGZuZCwI9?=
 =?us-ascii?Q?zJnpVr3MM01MvRatX5zbxVqaapIOle/MVO04tq4wwrJUm+ZX68Inym+A+HjW?=
 =?us-ascii?Q?gC6SI0HW5VMeO7iB2WVWA30qDit1rS5oVzXO9GQ3FUTUlOFchxyqiGnTp/HL?=
 =?us-ascii?Q?qg5nYa1z0rqoWJXuNQcZQaqAznMYPejzkAoJL71V7ySNPxkh23rjWcjw42Ht?=
 =?us-ascii?Q?ajoqOyerOAmWPtA5fnMWkEU10ySRxhgMzOLJMKpOSlLZ1zB01hxZoXIhY+FJ?=
 =?us-ascii?Q?wLZ9riuFNd81nEMN9t2WRuMSESz55N0n816pyqO0WA6ZaXEAARCynQLy4Hgs?=
 =?us-ascii?Q?eDHP3fuQX5QnRHSzyBp2ndc9p9whItO0FMq2QsMN4HjvhFze73dafLk2D8Ep?=
 =?us-ascii?Q?PYCopiF2FrvM/QLC7zrEnAgF2KPCSSd936GrAG8j4L3FmYPpdlXxWBqKKr0v?=
 =?us-ascii?Q?y8Toi84tT85AMmymAGE82B5vBXOkgb4zj7SLf9qs39E5dv/f+N/U8/+zBlO3?=
 =?us-ascii?Q?EQQ6ajCrDxI0fLs3z92hhs/Awe0LroxW1rJVgpAIdFK14by3hcSMzO+yCc3c?=
 =?us-ascii?Q?YxPlvO1nWyaz4q/PQbatkGMKRwDMfh/Hpth7p17SjO3zN6XUcdU9vMdCEcTD?=
 =?us-ascii?Q?gywvWoyQzAL2WIG2AA8kpME3lFWKM/Y6r4Lo4exRtSJg0ya0hhUvSHHmXkZX?=
 =?us-ascii?Q?taFazrRSkJs1aHhD+PyqfnU5+XCwQKaN8tMO6n8I2Q26IhMS+QPB+CiwKlPg?=
 =?us-ascii?Q?oN7ZNP/k1RTtrysWKrSJlROgeZ8iDBmKEV83JBZtI/szgW1My2ES5y0iI8iO?=
 =?us-ascii?Q?9z2wAM4xBso9UcSC5mnt1KF2rOGqZse79I/TNFgytt4LbKd6gpcGnm6Sc6qV?=
 =?us-ascii?Q?xq94iyCcj536L3K7YXb+dSedVRF6ruHn8DA83X8COd18SC3LikteUvxmPn0O?=
 =?us-ascii?Q?/jSF3e8048/mzcjKet0ASTpCvaJgQAy7PUYv8E5p0/4+VLsKmbdvrwvxMfuW?=
 =?us-ascii?Q?+fuKmX01CibVTAfiNOcTzMjYHOkj/oxLjIjbeARtJpXLAHVT+RdW2VAqk7t1?=
 =?us-ascii?Q?VSx6AF6aNdwvZy1CqMY9UL1yq5WSfxgIf+UrqiN28GAl2YW8HTGO5VM54Cjp?=
 =?us-ascii?Q?cBtFLNfyz0dWBF7mTeJQ/kKCChmHJKyLtlPf2xbSvy0PQh2PKCUuuoSRJ4vw?=
 =?us-ascii?Q?Hp3NMdlzRVe8HM97M0fUGeeDaHf3732jFHOfafSajhYdg+9QcVonGT/5l1W6?=
 =?us-ascii?Q?tI3zFJL+JrGiS5kVN57x2U4yNGXeoFitzxWG5NRs69SIkqZkM6w2sGf49Hs+?=
 =?us-ascii?Q?fO4/he04HvVAjnSjUOWGU2Jlm82nvGvSHjiI7qkaRHcChel8KZ8eaiKWmfL4?=
 =?us-ascii?Q?0TjngrJORhY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CCpnTs8fRIAXTJl43vqzgihujQ/JoBZAfx3HarjrQ7yFDRQXD2lrBAsuyQKc?=
 =?us-ascii?Q?Ketj/inCkjkUaROroUSW0bVtfQsgxSxxS0Rl4A43NMPFz7+6kRZM4LWS9l1L?=
 =?us-ascii?Q?sYGmtt+6qqp9cMjm4xz0wh7m1SntszEP+wS03LRtd4ONSA8r0kS6ozRAum6c?=
 =?us-ascii?Q?H8jYEgZaba7yuWW4pI6Uiw+dISLZdCHwxelb0ftnh9nr0StIMs63iVOUV1xP?=
 =?us-ascii?Q?qomDgTFsCieqoHZx4e03FU3+vcrFhI8dZQ/TFS81y29yM8vDTiZe0LHXHD3R?=
 =?us-ascii?Q?tNmhUR5R1dgnZK1M+9Dl5k8narJpbCL3vEJKv1H2S5e/CSarjgXMEXNYIVOO?=
 =?us-ascii?Q?9SqaCK0UKYX9wAVhOP5YywwAcz8D6q6w1NBm0xCGyZ7hDM99i6uk7Sl2AZrd?=
 =?us-ascii?Q?7UCWifXm09kBMTU2IzZ9xZj3ydmKhQMAQch5ZGsEeVWNHqMKU2drhA30B8Sg?=
 =?us-ascii?Q?ahJty10hfGM5iNKwd/YLvm2NwUS+z/9kWsmWUa4q8tuZLBjtLnKjFq6OT1PW?=
 =?us-ascii?Q?GsThnmrIy3Vpb3y7vXDydihcIrP2MMKGcabXs/TbGUFW0WgZoaHiXSFBC11g?=
 =?us-ascii?Q?61nMo/u2YpZm99UK15cs1eAqcKZUirARp2O7Q7etUAquqSqUag0+BtavTL46?=
 =?us-ascii?Q?AnHoU9l7yhyU98hMBpMV+aFzDplOD+wxlPH0rsGOucKaMD/hisKTa0iO9kcf?=
 =?us-ascii?Q?DnwQsFBpdQ5GbmT0gOnM9eE0ua8gVzQy4YkoSLuZad12FugLG1G3NoMHNhAF?=
 =?us-ascii?Q?conX612Q8sJ9gGLvkGoTUcDeVZ8FT9XnglJV/yKyQzishUTHBoHYSMHAH9Zo?=
 =?us-ascii?Q?PIArTDydMdA/VjQOoC647vcr+J90hPa1Wjc8KYptqrrbrFmu+CFagNF+DF18?=
 =?us-ascii?Q?zlapjBzUfzQlwTT7DpLY17x/EJ/GpvXSiTqgg1fJ4vbZxlW15zohQn3nEzXk?=
 =?us-ascii?Q?GCJDdpHCbn5wo1lVtRnGmOqOqp19q9l8g4CzX9ptKwA7XyiDuSF6rlxtFZMn?=
 =?us-ascii?Q?tJTB/yma8n6tfR7A8/db818kcTAvO/ORyYJiel7ORZDpHunXLDc4HoT94Giv?=
 =?us-ascii?Q?GTb7jtGnDAGpY1Hsq/dCGrKsGOo2gAiX2YZj23CgaznFAuQ6TKJ/dA35wCbu?=
 =?us-ascii?Q?m6Dtjd30FZm1UW6jsbPwA8B/s6CHpMmTjyFR+SAhXlGt/KGOLq6YOnawu0Ue?=
 =?us-ascii?Q?6CfNncN6dSg6mlV+lQkKIxMY6o8p+Cb1dN8H4QYPbIcvttvGnkiRUpxDLlqX?=
 =?us-ascii?Q?5uHXizlkPw32KPGs65bSkTR/9lokpzcIdgCEruHRHrDW4QZGPEifjGR68ve4?=
 =?us-ascii?Q?WvUlZfdc9iGLT87JBfOaTn/nNK9ieocn+gXbXkzfxbCmBj/jd0lXzN61QngM?=
 =?us-ascii?Q?97Dl036phoCrlly3NkgT2N99YKOkPJQH3cprKghMgyNCnjsxoW0KzIJ3viYr?=
 =?us-ascii?Q?BE7vLcumOttDFdf3XsSAh14h4iJWt+FVb8Ko3pbXxyN/aw9pfYOyCcfug0zO?=
 =?us-ascii?Q?DLxd7CcMIi0cRlw0AK3bDu+RMdgCg2uC6z9DeNXlj5CM8WKRtT0z1jA0QmUR?=
 =?us-ascii?Q?mhkEnsMB6pcVr3izTbOCCwOQlQou/yPSz/F0/5sYcTgkrwNKWsG8Djq9HO0R?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f09ba01a-fd86-4ba9-5f12-08ddc3b6d579
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:46:59.2181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYwc+Y6axRgV52ZqsVSW2j57oK4HNw7TFjpDf77BCnpwK4+Xv3PAJqPgmV0+L+Kfz1WTWjTf39AQxlP29vovOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
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

On Tue, Jul 15, 2025 at 05:35:55PM +0530, Sharma, Nishit wrote:
> 
> On 7/14/2025 10:33 PM, Matthew Brost wrote:
> > Mapping a BO to the mirror is a non-zero time operation, especially
> > since TLB invalidations can take a while to complete. Without a wait in
> > the test, this can race, leading to possible data mismatches, job
> > timeouts, and other issues.
> > 
> > Make mapping to the mirror a synchronized operation.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/intel/xe_exec_system_allocator.c | 57 ++++++++++++++------------
> >   1 file changed, 31 insertions(+), 26 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index f8d144328e..006a3dc920 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -1012,9 +1012,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> >   	struct test_exec_data *data, *next_data = NULL;
> >   	uint32_t bo_flags;
> > -	uint32_t bo = 0, prefetch_sync = 0;
> > +	uint32_t bo = 0, bind_sync = 0;
> >   	void **pending_free;
> > -	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> > +	u64 *exec_ufence = NULL, *bind_ufence = NULL;
> >   	int i, j, b, file_fd = -1, prev_idx, pf_count;
> >   	bool free_vm = false;
> >   	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> > @@ -1154,20 +1154,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   		memset(exec_ufence, 0, SZ_4K);
> >   	}
> > +	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> > +	bind_ufence = aligned_alloc_type.ptr;
> bind_ufence is u64 * and ptr is void * in struct aligned_alloc_type. Should
> be typecasted (u64 *)aligned_alloc_type.ptr
> > +	igt_assert(bind_ufence);
> > +	__aligned_partial_free(&aligned_alloc_type);
> > +	bind_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> > +				 bo_flags);
> > +	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_4K,
> > +				      to_user_pointer(bind_ufence));
> bind_ufence = (u64 *)xe_bo_map_fixed()

See my reply to patch #2, not required.

> > +
> >   	if (!(flags & FAULT) && flags & PREFETCH) {
> >   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> > -		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> > -		prefetch_ufence = aligned_alloc_type.ptr;
> > -		igt_assert(prefetch_ufence);
> > -		__aligned_partial_free(&aligned_alloc_type);
> > -
> > -		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> > -					     bo_flags);
> > -		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> > -						  to_user_pointer(prefetch_ufence));
> > -
> > -		sync[0].addr = to_user_pointer(prefetch_ufence);
> > +		sync[0].addr = to_user_pointer(bind_ufence);
> >   		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
> 
> This conditional statement should have initialization of bind_ufence as
> bind_ufence is used only for PREFETCH conditions. Putting initialization
> outside make available for every test.
> 

Yea, it is used in non-prefetch cases, hence it was moved.

> Test should continue if pf_count_stat is not found in
> /sys/kernel/debug/dri/%d/gt%d/ path. In current implementation assertion is
> called when pf_count_stat not found.
> 

See my reply t patch to #2, out of scope for this series.

> > @@ -1176,18 +1175,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   			region = 0;
> >   			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> >   					     1, region);
> > -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> > +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> >   				       FIVE_SEC);
> > -			prefetch_ufence[0] = 0;
> > +			bind_ufence[0] = 0;
> >   		}
> >   		if (exec_ufence) {
> >   			xe_vm_prefetch_async(fd, vm, 0, 0,
> >   					     to_user_pointer(exec_ufence),
> >   					     SZ_4K, sync, 1, 0);
> > -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> > +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> >   				       FIVE_SEC);
> > -			prefetch_ufence[0] = 0;
> > +			bind_ufence[0] = 0;
> >   		}
> >   	}
> > @@ -1246,16 +1245,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   			struct timespec tv = {};
> >   			u64 start, end;
> > -			sync[0].addr = to_user_pointer(prefetch_ufence);
> > +			sync[0].addr = to_user_pointer(bind_ufence);
> >   			start = igt_nsec_elapsed(&tv);
> >   			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> >   					     1, region);
> >   			end = igt_nsec_elapsed(&tv);
> > -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> > +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> >   				       FIVE_SEC);
> > -			prefetch_ufence[0] = 0;
> > +			bind_ufence[0] = 0;
> >   			prefetch_ns += (end - start);
> >   		}
> > @@ -1374,11 +1373,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   			exec_ufence[0] = 0;
> >   		if (bo) {
> > +			sync[0].addr = to_user_pointer(bind_ufence);
> >   			__xe_vm_bind_assert(fd, vm, 0,
> >   					    0, 0, addr, bo_size,
> >   					    DRM_XE_VM_BIND_OP_MAP,
> >   					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> > -					    NULL, 0, 0, 0);
> > +					    sync, 1, 0, 0);
> > +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> > +				       FIVE_SEC);
> > +			bind_ufence[0] = 0;
> >   			munmap(data, bo_size);
> >   			gem_close(fd, bo);
> >   		}
> > @@ -1456,20 +1459,22 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >   	}
> >   	if (bo) {
> > +		sync[0].addr = to_user_pointer(bind_ufence);
> >   		__xe_vm_bind_assert(fd, vm, 0,
> >   				    0, 0, addr, bo_size,
> >   				    DRM_XE_VM_BIND_OP_MAP,
> >   				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> > -				    NULL, 0, 0, 0);
> > +				    sync, 1, 0, 0);
> > +		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> > +			       FIVE_SEC);
> > +		bind_ufence[0] = 0;
> >   		munmap(data, bo_size);
> >   		data = NULL;
> >   		gem_close(fd, bo);
> >   	}
> > -	if (prefetch_sync) {
> > -		munmap(prefetch_ufence, SZ_4K);
> > -		gem_close(fd, prefetch_sync);
> > -	}
> > +	munmap(bind_ufence, SZ_4K);
> > +	gem_close(fd, bind_sync);
> 
> if(bind_ufence) {
> 
> munmap(bind_ufence, SZ_4K);
> 

This is always setup now, so no need for the if statement.

Matt


> }
> 
> >   	if (flags & BUSY)
> >   		igt_assert_eq(unbind_system_allocator(), -EBUSY);
