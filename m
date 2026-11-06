Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB9606A32E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmaT3Iuw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8278D10EA11;
	Fri,  6 Nov 2026 19:16:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2217D112FAE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 19:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793992540; x=1825528540;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WjFkULYACX03L55SbTcHUhEXAn3AhPgh5nokxCOZ08w=;
 b=hmaT3Iuwbqe+qgZRDW0ZUT+qp3oDH2IYUQ5gw9EtNpEalp/xSrskg1RI
 CKTNUcnEoSxxDUCl339dIjTzWac8ZSIF1NbSwS/DVmOYJ/aL+/q+vEvb5
 bk/KRsxMYN6i2gGEmM8Lc8SKNvS3Rg2WiH0zgu9Uq01AzUYXVgIpptwUm
 mrWI/qMKwmghU7TS9a4uiJvEgJRwGNI+m0DHjXw71Pz2MqggtxrDxN08S
 2KiDrUYVs4oFK5NebUtB+LZNcrEtyIIEYbUCREhjis5U0SQ2moqc1e0hH
 qij7248Vt8X9dhzNgvYfCx74gyvmyRJKZ8wgyHq5qrn4xyUXC40qJtqpS A==;
X-CSE-ConnectionGUID: Y+sRyjv/S8mzwAKRwUD6YA==
X-CSE-MsgGUID: 8/DnlkCcT0iUyx2bnPRu6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2710960"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2710960"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:15:39 -0800
X-CSE-ConnectionGUID: pdaA/DYfRzeHbNy//EJBIw==
X-CSE-MsgGUID: 7XRRET5ySbCigfb2EhmYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7691903"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 11:15:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:15:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 11:15:39 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNvlmFqrVvEHsuwlc2iHLXRKe+KHHoX1Q5W2haFkWSUREjZNizi6EJu/LDQ+nB5cXxCPwCxCalPwfIIrKJyCEQb1up2JvwB46TH5w5Etesj8OuRIHcpywLyPgjtFqrmnv+xJ8dsPS7VdrDokp6w6SmD/64FWcXjc1jvi4f5BtnZnTUuFHew7QAiBpYaQS5B2uTJLM15fvOOOFWb9NQAcrOa74IjGDI0EkhZDQG8oXp1cGfuWstNgBept5plTPF+VNDOYiZ/mRFLj/0XbGjqt21fXsVrizdHkbe2HwRT0OmfG+mbeAiurpl5FApN6ZfApPTYVxloDiaCA6uGq4IoBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu2Vn55FchJ/+PzmlWT5ORu4Eb0fl2VKW0diBWLrdvI=;
 b=IJRRitCd+HFwi5qq5SRlLc35fqmOig8Ml3wITe/RAkPzJ0ERFNTlW/WpUK8BxDUi1Z+Gw1C7LELvkND6eTNbreREr3vY+oLXbPY8xX53JqDZmMvvNzWaqX6g2Y7p5aIKEt6H1IrwBP0UmnznV+25/P9OhayrinvaOef7coWe5MRB1LkrVj+fxT096nCP+XaFYC0EwQDdr575x3q4jIpNH8uIFSvsuCHsEbWrgty0je7AN5BnjQ9okFmUtn8GlN2mmZiRA7EF6gGnNaB+q28WHNTGm45UIcGillgUEtwNcffVYJSAZqKE5hypWi6WBfWirWW/KGio3p7aT+N+D+vfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 19:15:36 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 19:15:35 +0000
Date: Fri, 6 Nov 2026 11:15:33 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v6 1/3] tests/intel/xe_exec_threads: Parametrise
 worker and queue counts
Message-ID: <au4nVdldaKEhVsJg@nvishwa1-desk>
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261106183246.14482-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|SJ2PR11MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 3866adf1-917c-4960-ad81-08df3c3a55d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022075727099003|261102123227099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: kDq9NeRjac5UhiGkTEteHZU/uSFWDMsYR8guNQA3FCz2IOTq521JuMorLtn6cDSPRYOEz/iy3jvGfEfnyDk4NDLilA82i+R4+HprKj6MT6ATx/8mplCRefKIhEDwN954m7Oc8T+odDeHDakbHbkmG29rX0/MwnSqy9/m139R1wlUhDrUR9G3GdBzFlWag2HvmbayLjYPlcaJnIx881M5XMfUkiG4eLZokJOBgUmgqXof4/mjqZ6rW21gTvLhs8NDtXd9gSVlGaa5qUDFnFpAmKfr5acOZ5TMLqp1fuZTtkJVh8ysO4MlixNSfqFHa02HmNKwkx3zdeEuajoJhKZxq0UBqZWYH5nA6BKeRaA8fBHFDwjOHiz5fiHQQr/6/AjOv/HUo7Ms7cw7ZC/1C+ANgVLsS9tCspVRIg+ldF/KiFZzayUmrISaOSxuBa5fEMQ77DTEIHfiR8dJYAmrmSF0eavDpQCBV03pg5DwPzH3qKLQOQmX2ps6KUWZRrZKyOmcjzw0wBwpk8w7mk9+x32L5+YiTgtU4qCPQZjcPci6ZaJBUn1MaYolHd7MXEgDWZ+TD/Ol66PQsPR4LQAn4XI0gaxF+g97uE4jyn5mLAm5sbhyDW0y2UlTB7e1KHb6HjwmG0FaEHiblLfPiLGmPjGeIIKVe0q64AJmaKY4gpfA8cA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261102123227099003)(261022105027099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2f/FsibqhjHP5V01T3WGaba4slWL2eU+IYvKLW2iETloOhEx/RSPm4Eo2Sf?=
 =?us-ascii?Q?Xo/9+krwW4P1iioznSFObRsJEXBtd9ZEJ68MAlWJlFn6CKKtkFgn1Fp9lyRT?=
 =?us-ascii?Q?KaCAuEW8yqYOlmaY50URjMtdg4aSBMdmOjQ1h94j4odfUGkLvyhDytK3CafB?=
 =?us-ascii?Q?f90EC55F74JYbBceSsJmMHzasqCaZ6Ba6aAhFNufyNezOTFWavIuv/2Gy2NA?=
 =?us-ascii?Q?qmA6H+iuMV8WrmrnZAXZNzgOskY8cDpX6oznEUDtWVE3tfB1GPydYQkp+5R9?=
 =?us-ascii?Q?noEsFXyY4GlilFsr+BCa1X0Aq6ZdUsmMuc2DNjazFGmM4SHkjSiZuWMea23/?=
 =?us-ascii?Q?BEPs0Q0o7rd09iWzkms/UyYgAEQVrXjyoxXo5IRCBhSgHTaVxbQJgMisAawh?=
 =?us-ascii?Q?zOw77hcXSCk92kH37HrmiGToWQPWaZ+D9vj0CzsEW+bSjns/fn/vLQXuikQP?=
 =?us-ascii?Q?CsbBBT5kbABiUDQjIT5Y/7zgKCJIVYAkpmm2/b2gT/lK8t6srf4GDAdipuWb?=
 =?us-ascii?Q?3PVWyOeGpxZiixVKhqXPaSI04O87bXLC9z0O9mSxN33Sv744yFRDFBTG5JQj?=
 =?us-ascii?Q?cSkMiEEZuU4KwPHXkUd7TsbhxFtFbWsJ+XmfkNBGpQDkHcG4+5eXOYThn164?=
 =?us-ascii?Q?tfRQlLhErcAij161iYp8IM5od9V0xjGmRZ3eg0jKOceSsEjMpsWZR2W7QsQa?=
 =?us-ascii?Q?SRBer4H4kohyhPYAwDu19om+adt8wE2++17kg9c1DC4LbOOdyAdrCi0KEqQp?=
 =?us-ascii?Q?3M8UNDTVFx5wzzDY87optqtZbAMuQJX3KYW+rUoCyrgGC4rqK2wpJ9XVV6qr?=
 =?us-ascii?Q?u3kGE/TwMNdOZ5OLff6An92NKgEjrq15yHXdMmU3ZVHQ8I8dm8GoG+jkQ8o8?=
 =?us-ascii?Q?L2OIXw/XnDd9euBgwkcYmQ+mDm0SeCuBPyB+WBHHMx3Rm+uriBl9hX5zSxWL?=
 =?us-ascii?Q?xzFybTtuTF+bQ6TL9VXE0VE+bvGeB7D1yRIYFaUvtblbGM+bpiwkyneIcJ/5?=
 =?us-ascii?Q?189HHDZxB3UYTZ6gM0zi/1c7a+kiDANgfgyXWEF2TfnaGRipKMPYQqN6IF+d?=
 =?us-ascii?Q?8fwwfhSzdCHbeXdXhbQ8Qnc/G5IdChi+yuKJ/ifxeNHc9XWImR+Y/Ygi5BRZ?=
 =?us-ascii?Q?WgNQYYj3FCJBpjPlw+d4LGU61w8AT6jzln78ZL0EB+o2PQZ4mGSVP6FO91YB?=
 =?us-ascii?Q?YyC1GMlPlGe//p/8PhDh+3lZ9W2DMr+/T4Gfyx4fTmgKltEWXtyihCnJcCeD?=
 =?us-ascii?Q?f32EHa7nvvQ8vgaJlYj4u0O/0F1cOzRc0EphvNXetM0ZwFNKwSEAr0r8pmaj?=
 =?us-ascii?Q?wQV8jJ5HMYOp8FcGQgHLbW1Hh+u/tZ7IHZJ7aBTrQ4K/kG7/tbhBV5HEqzbm?=
 =?us-ascii?Q?ufg8BPj16pTQxQSdvophsNaQi+VBrgNzhVFRg5xbVny21rkOjSAMGTsYYVZR?=
 =?us-ascii?Q?d+oEIa7iwg/MCeajeWc2kpsAeOv99bxC8tiKe4HyOj8UyH+vH25+ZahPXdLK?=
 =?us-ascii?Q?+h+jNFQZSIp948gGvnZMr9Vg2ur1a2x77r932AauDeQ2Gf16ClfkNbz4jom1?=
 =?us-ascii?Q?t7lb8eqW4TqehbD/kpPDMgG5VIqsTlg4a4yMzx6T4K225IyjWz65CdFd2rLP?=
 =?us-ascii?Q?jOwBYrvfTnSpnn9jOWX70JnpJxFL2QpJyUUeS5YYfX1ILOYzFMQMzIgkorqg?=
 =?us-ascii?Q?9+tDJa0SbLw+z6Xjz5LRPMrERZEEVCF5XOjK6NTYdCe1EKzPeYZRweQ+vjo+?=
 =?us-ascii?Q?bK0jMiA281Q2dUxSwTKIob1PoMIBRKzlTlla+0OOuW6IxLm/Tm6i?=
X-Exchange-RoutingPolicyChecked: 2oR0hdJ3YtyXtBMVWssynAzGRFhbELK2lrm2RuWNZoRcAvzndhWglyfftdMdgxvbyHDMcUBGI66F8YM4nIZ743uJejdWNVu3p/JFamlQECdJT0VKOUfBKiBnXKOPAplJ3YEbkL8UNVbtDt9eLNUt9RuWaG73Dm+aphgARHG//ddZgyzu0grIczhUyDkOP6cCG+eb5SVTw5Uib3qs77OqIZ5Ui8SZr/LSrLQ0pfakx0u+I9MpfoPuNTRWil1isI1Q33D1FHDDUmyBopVMot0wRLISjf9Kp0iTrV50wcg/vfDdL5XPXfy1aDE4orhs83J3VcIyykM+jhScLLWjkfAEzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3866adf1-917c-4960-ad81-08df3c3a55d5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:15:35.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1yT1EoZxp04bx2Nz9ZN/r6BAhP5O27sCAaN05LOFadXd0VBDo+zscFoaa4bXU+ofLmax8+pj5S10Muka8sEJ6OJCvmSnXoB6ajH64GqP6xs00N2rIe0990z8kfpJNd7
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

On Fri, Nov 06, 2026 at 06:32:44PM +0000, Jagmeet Randhawa wrote:
>threads() hardcodes one worker thread per engine and N_EXEC_QUEUE exec
>queues per worker. Subtests that need a different shape have no way to ask
>for one.
>
>Pass the number of worker threads per engine and the number of exec queues
>per worker as arguments, with the existing callers keeping the current
>behaviour by passing 1 and N_EXEC_QUEUE.
>
>The balancer threads are not created per engine, so require one worker per
>engine when BALANCER is set. A queue cannot be destroyed while its
>multi-queue group is live, so reject MANY_QUEUES together with MULTI_QUEUE.
>
>No functional change.
>
>v5:
> - Assert that MULTI_QUEUE and MANY_QUEUES are not requested together.
>
>v4:
> - Actually use n_exec_queues for the per engine workers. The previous
>   revision still set the fixed N_EXEC_QUEUE there, so the queue count
>   never reached them.
> - Nest the worker loop inside the engine walk, after the engines that
>   cannot run the job are skipped.
> - Assert one worker per engine when BALANCER is set.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_exec_threads.c | 73 +++++++++++++++++++++--------------
> 1 file changed, 43 insertions(+), 30 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index f03f20142..773627140 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -32,6 +32,7 @@
> #include <string.h>
>
> #define MAX_N_EXEC_QUEUES	16
>+#define N_EXEC_QUEUE		16
> #define USERPTR		(0x1 << 0)
> #define REBIND		(0x1 << 1)
> #define INVALIDATE	(0x1 << 2)
>@@ -1343,7 +1344,8 @@ static void *thread(void *data)
>  *	multi-queue compute mode fd userptr invalidate race
>  */
>
>-static void threads(int fd, int flags)
>+static void threads(int fd, int flags, int n_threads_per_engine,
>+		    int n_exec_queues)
> {
> 	struct thread_data *threads_data;
> 	struct drm_xe_engine_class_instance *hwe;
>@@ -1351,13 +1353,18 @@ static void threads(int fd, int flags)
> 	uint64_t userptr = 0x00007000eadbe000;
> 	pthread_mutex_t mutex;
> 	pthread_cond_t cond;
>-	int n_engines = 0, class;
>+	int n_engines = 0, class, t;
> 	uint64_t i = 0;
> 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
> 	bool go = false;
> 	int n_threads = 0;
> 	int gt;
>
>+	/* The balancer threads below are not created per engine. */
>+	igt_assert(!(flags & BALANCER) || n_threads_per_engine == 1);
>+	/* A queue cannot be destroyed while its multi-queue group is live. */
>+	igt_assert(!(flags & MULTI_QUEUE) || !(flags & MANY_QUEUES));
>+
> 	xe_for_each_engine(fd, hwe) {
> 		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
> 			continue;
>@@ -1374,7 +1381,8 @@ static void threads(int fd, int flags)
> 			}
> 	}
>
>-	threads_data = calloc(n_engines, sizeof(*threads_data));
>+	threads_data = calloc(n_engines * n_threads_per_engine,
>+			      sizeof(*threads_data));
> 	igt_assert(threads_data);
>
> 	pthread_mutex_init(&mutex, 0);
>@@ -1388,33 +1396,37 @@ static void threads(int fd, int flags)
> 	}
>
> 	xe_for_each_engine(fd, hwe) {
>-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>+		if ((flags & MULTI_QUEUE) &&
>+		    !xe_engine_class_supports_multi_queue(fd,
>+							  hwe->engine_class))
> 			continue;
>-		threads_data[i].mutex = &mutex;
>-		threads_data[i].cond = &cond;
>+
>+		for (t = 0; t < n_threads_per_engine; t++) {
>+			threads_data[i].mutex = &mutex;
>+			threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>-		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>-		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>-		threads_data[i].fd = fd;
>-		threads_data[i].vm_legacy_mode = vm_legacy_mode;
>-		threads_data[i].vm_compute_mode = vm_compute_mode;
>-		threads_data[i].eci = hwe;
>-#define N_EXEC_QUEUE	16
>-		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>+			threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>+			threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>+			threads_data[i].fd = fd;
>+			threads_data[i].vm_legacy_mode = vm_legacy_mode;
>+			threads_data[i].vm_compute_mode = vm_compute_mode;
>+			threads_data[i].eci = hwe;
>+			threads_data[i].n_exec_queue = n_exec_queues;
> #define N_EXEC		1024
>-		threads_data[i].n_exec = N_EXEC;
>-		threads_data[i].flags = flags;
>-		if (flags & MIXED_MODE) {
>-			threads_data[i].flags &= ~MIXED_MODE;
>-			if (i & 1)
>-				threads_data[i].flags |= COMPUTE_MODE;
>-		}
>-		threads_data[i].go = &go;
>+			threads_data[i].n_exec = N_EXEC;
>+			threads_data[i].flags = flags;
>+			if (flags & MIXED_MODE) {
>+				threads_data[i].flags &= ~MIXED_MODE;
>+				if (i & 1)
>+					threads_data[i].flags |= COMPUTE_MODE;
>+			}
>+			threads_data[i].go = &go;
>
>-		++n_threads;
>-		pthread_create(&threads_data[i].thread, 0, thread,
>-			       &threads_data[i]);
>-		++i;
>+			++n_threads;
>+			pthread_create(&threads_data[i].thread, 0, thread,
>+				       &threads_data[i]);
>+			++i;
>+		}
> 	}
>
> 	if (flags & BALANCER) {
>@@ -1448,7 +1460,7 @@ static void threads(int fd, int flags)
> 					threads_data[i].vm_legacy_mode =
> 						vm_legacy_mode;
> 					threads_data[i].class = class;
>-					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>+					threads_data[i].n_exec_queue = n_exec_queues;
> 					threads_data[i].n_exec = N_EXEC;
> 					threads_data[i].flags = flags;
> 					threads_data[i].flags &= ~BALANCER;
>@@ -1471,7 +1483,7 @@ static void threads(int fd, int flags)
> 	pthread_cond_broadcast(&cond);
> 	pthread_mutex_unlock(&mutex);
>
>-	for (i = 0; i < n_engines; ++i)
>+	for (i = 0; i < n_threads; ++i)
> 		pthread_join(threads_data[i].thread, NULL);
>
> 	if (vm_legacy_mode)
>@@ -1762,7 +1774,7 @@ int igt_main()
> 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> 				ignore_multi_queue_hang_warnings_in_dmesg();
>
>-			threads(fd, s->flags);
>+			threads(fd, s->flags, 1, N_EXEC_QUEUE);
> 		}
> 	}
>
>@@ -1863,7 +1875,8 @@ int igt_main()
> 			atomic_store(&wq_stress_hang_detected, false);
> 			igt_until_timeout(WQ_STRESS_DURATION_SEC) {
> 				threads(child_fd,
>-					REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
>+					REBIND | BIND_EXEC_QUEUE | WQ_STRESS,
>+					1, N_EXEC_QUEUE);
> 				if (atomic_load(&wq_stress_hang_detected))
> 					break;
> 			}
>-- 
>2.53.0
>
