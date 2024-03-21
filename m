Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AF5C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 01:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F2010FB12;
	Thu, 21 Mar 2024 01:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6QT7QdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80120112017
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 01:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710983146; x=1742519146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Dq2N8azZMoz3gLUp+PD28rt+QjfGR77A2ObWiNfh1o=;
 b=L6QT7QdRaU0HUqFB8WKq/6QagSxJ8CKHFjmWipGVPXaeQmkZQGJa6TKd
 pzpKOam3VPuAcEKXLPoQHKRv6xQNhanRVi+NYYj0N4zdJ4E8w+wujA4SC
 9/pwS/KXA/biFCO0tif11QEycceXGp1Zq6IVf1bBWajc2jaSPPcruRW5g
 cilYVK+Es7gWp1YOf3/UPyvFFxAxqOKnUDAi7iLhz1VUQ0eZdaWkNz0PJ
 nM4oy4X2il64FH1ECcfgvicmZFMeZJnQPBYsMdK3sC7GF39hPi/N4EgNz
 gqzLss6UG0VkyrKyn4YNnSjLOokyq9Zc4nAYjByKyoXmWXzittmbJKGga A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5792867"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5792867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 18:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="51779745"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 18:05:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 18:05:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 18:05:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 18:05:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 18:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzSLOgE2q1OQ702tZ2hPlj3lvcAtmzF1+5jpBBjevUGYiU733Vj/R5gS2/P//R7fHVeN7Og7leKMC1VJ5NY5Z+FvPRgfeOqrzfqQyY83oOWT1N5MH5MS6VmjJkLvkobxNsdQaFrGIHwYhYXt0kc4S+tQewGSPPUocRlHL+AstmfwwV/8OuPQoZL1LfX/ubGkCzHBOKAQ3GgWVA1ymiwm92tiyiFIpf5UHpHHt+NZujNJkk6ZMhT91rkKSKsCpGXnGRXRLi7l93PWLATbSJ3nBPCz9NpKTCz5qmgcSbsXBBGJebyDuG/wHx4uBVeqMCxx+KljOKe6JLVH9z576vh6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/a1C8AYiLJKVymzY5Dcz4z5oAfr9dP6SknkisQZIn8=;
 b=QxejNh9o4ZITESGax3uy6AvgTLdzJ81pIbG4Y7PguN4j2D4s+vJvUh46jp48TLY0xrJ/34JE1gDQDEq65maOAtUy8HjvXq7kvaBJM2liCbmhnPcdow+vUCeM2BtVS44Xkc8WGT1cgqpudADvFW65jwLRvQlmo8rZQsNHOTpHfFxoWS7ECeJJoch21PCnx+BD0AVtnP+2bYwrhiTe2U+Ex6N0Wo5fYADukimGUDouv0uG5wAvuyVI+XV2WzWooSsN/f5ICB2gAjwYe9o9Gm5jJrWMhXplTWr8DIDMqD6Ryi7K1wcm57084AOwPNpp8xrzb1/UZODHVPCfyn63zE0Z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Thu, 21 Mar
 2024 01:05:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 01:05:39 +0000
Date: Thu, 21 Mar 2024 01:04:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Fill in GT field for second
 balancer thread
Message-ID: <ZfuHpR6TCEnzLw8X@DUT025-TGLU.fm.intel.com>
References: <20240320192356.359327-1-matthew.d.roper@intel.com>
 <7vgrnkw4ndo5ydxybh3qoqriovorgyvrrsatt4tgifis7xo3ju@3g7qmeluwrps>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7vgrnkw4ndo5ydxybh3qoqriovorgyvrrsatt4tgifis7xo3ju@3g7qmeluwrps>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee49b51-91cf-445e-33e3-08dc494305c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nj2nNjAr2ga321pkpoTE9gvLOQ276bcy7j9lrGT9SQNVnNR2zObezFhovGMiHf/XhvEqk1qo32vZDkA3XfQuerY17dGeQ6633BCDX74CRgvElPuM9UD2vgwCTzho9P5boNJnw/J4nTfXY9kk7QXCkLVeeSwP5XS2+EB5J3fgwFUM0YCS/tM4KICTzXmtNEd+EeNnqSlO+XYH1eXAVNwlPmXH95NaOhq1KeJYdcNp5WwqO31vNN/l3gPsq5GULezKUkok8bUXMwtj6d1+KeitHCYX3DKSLpD84zTq6c4eTVtddu7PlVq6aK4Y+7/YbVSK9s+fyiHlwh0xhGtOVcj49A5vlxw7XJ+Jor2mqXCxQYqNMhqEHvWYRRBlJCsomQjdlBAVuoP96IWQai4Zkpt3ZWpCMKw7XsY/igcIaOZJ5vXUYy9fR/iRH/XyauOqR9Ui48PKG1QPjgmrNswtUUH6A7nckoeEonIEhZ3Nwm0kW8643oLQCRQE7l45ev5C03MU02VjAiAZnZqSFEGQsIecXKTrjqeZrdtgVJuTc2ScVDajSYoAq1qK/znz4ROIompUw+2R/U8Fo4wZ+fLwW2QIJpAPMCeXKGJl0ESP5n0WVoBywStDDt+I5YwRkj5SV0pZbcdtTbZut6DTTzI7cQ5iplOLgzMRC02oNBAvB/4f2mI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xmn8PHLp882yDJV31Rz00z/70tW1jjGuoDuTorFsfWmIuq3Iy+oAB1fSdWrs?=
 =?us-ascii?Q?IYvGnksupEIJ5o1gDyy36l6bzjVpamKtn8cwokEabxpLISrt0X594ndsdtNq?=
 =?us-ascii?Q?l0q4kNLxTfFVWRdCBTVF/Ceh43BOL0/bN6hUKPfvXDr+JlAH5K1T9DgjdJpu?=
 =?us-ascii?Q?U7V1lAxICji/UF54LZfEr5zhbzjsNQEuvp5o7OJEIZ1kkRc6R6z3xnKm8VUU?=
 =?us-ascii?Q?UH2bU0AsmxY/TRw2OTBzCNGz00g57t7Y1F0tjGeA0ZRWiDzsMS1L+jg25zK0?=
 =?us-ascii?Q?CODa0hMyYT2ydqGGvBlqZuRZ5rsWuY1YsBx4OLslwB67s0G8rCfiRYm8pqpH?=
 =?us-ascii?Q?UoXh+TXztv7JNjWyVrNuI7Oh86OKvXj5yzoFcC7o7s7flPyIE+w5QghZkzJN?=
 =?us-ascii?Q?Zo4xa63SWPT4KlxAGGeqaLTxNXLkVZfdK3uzjHNlbI9uztjLJGYc4eJjL4Ah?=
 =?us-ascii?Q?2Fn6BLgnLFVGcP2it0VXSrzOFVHnyxnhDeIe2Pk7MBD0uQWPIegfzHzXNMZO?=
 =?us-ascii?Q?+fyN6JO5HLXHnqOyEUAFf+BjIWDDNNDGutwuCgTAFYYa0t3obl4DFoZ4EcLY?=
 =?us-ascii?Q?+cbJuLh4tF2UHq871GI8AJuovbL9KYaHO02tuTQ6bK/3zFhrFPF16zoSVxI7?=
 =?us-ascii?Q?/PQIvfhivn7oYqG8ynzjsy+3L16zitzQC8LDCN4xPGJEu6olvRszUMQlvaLP?=
 =?us-ascii?Q?r7DnXbKGHqxIQw7XxYOKfBQehR0l1zfpyfT+gjY8Z8WaKWu6tajryz1+6SYp?=
 =?us-ascii?Q?LBPXtc8nCZjEoNNStYSx7cXnUYi6+/Y/HR7Z2nLHwym55LAZckwL9p9Lt8Qr?=
 =?us-ascii?Q?/pjnKuWD0DwIY6cZKiS9TGilt9sUqQUr+8ntjtSqHdjv69wbMe097yxtNSQ7?=
 =?us-ascii?Q?Ed8JN58gQk4tM2yEG5Qbm1Ct8lY3L0NbLGW/UTt/GPgLRCcuk/BjTZH2Y93s?=
 =?us-ascii?Q?/EcOTijEKHlcAgOT9TI1sM3RzZDXTH9drDHwJHIbXLbySJlSfhxEj7nHIhor?=
 =?us-ascii?Q?wWtHbdnNQ6HH1iAk2fHNGRxPZW7/a9JX15UXo9i0nTPXp6ZLnCZELCyKVpq6?=
 =?us-ascii?Q?BOcNloXnUNoQ7edkMOCtlOsyfcY6p/fzRPjth4e0jLzVIdNjlRNT0jio7hN1?=
 =?us-ascii?Q?heX/ExK8gwWu/JOCRtj01WUDcOzLgLbaUarrPoNL8ynML70dTz/wCw3eRozq?=
 =?us-ascii?Q?LfDzVEfNUjkeMhsHRRJMHPfj3XJkCGnSONOENSaEQgAbAmUJCYvfa6Btj1ki?=
 =?us-ascii?Q?NqyuggNf2mD5tL6sd9BB+ZE0r3Jr81PDdFNDnJtrmOWrvLYzP6d1bUvtNNOt?=
 =?us-ascii?Q?C+gNRsFkgdIuhlxwMu1w7Fc3ZsolNfxMvFsPCILgNa744vCgOslSXHAV/jHJ?=
 =?us-ascii?Q?JQlqjGWbh1YWpiwpCM0RP9ikLpB+ivlp1cKrqknk7hokEfbl55puqImK8quK?=
 =?us-ascii?Q?4KrfHkydXMHL0B22nbWk0qCE4DVtgLzz9T9J7hJ6lkM676hp2mkZGxSmjIZ7?=
 =?us-ascii?Q?EwResaR0DefyeUOffQBN3ZGDosw/fzVGcjAP4NE5S7njfEhZbcPNF4uuY2kw?=
 =?us-ascii?Q?gE7SnSdHbYqaVj+huoofKznMcKK0KOdk9L+S2jEa9qQh8MykyLUsFbr2jYwQ?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee49b51-91cf-445e-33e3-08dc494305c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 01:05:39.0498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxspV1pWZ+qrvNx6IkuGQvfVlryV2JJ6iFW7mkaogNyH/kgbGEn0l0f/sdk+wqNYPIC/v5wJCiP98dxyV6XzRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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

On Wed, Mar 20, 2024 at 03:47:57PM -0500, Lucas De Marchi wrote:
> On Wed, Mar 20, 2024 at 12:23:56PM -0700, Matt Roper wrote:
> > The balancer subtests spawn two pthreads per engine class if there are
> > multiple instances of the class.  The GT field of the data structure is
> > filled in properly for the first thread, but not for the second,
> > effectively leaving it set to "0."
> > 
> > For platforms with standalone media, this will result in failures when
> > the thread tries to find the instances of a media class on GT0 and trips
> > the "igt_assert(num_placements > 1)" assertion in test_balancer().
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> do you know why we unrolled a loop in there and did a wrong copy and

I think the for_gt loop was added after the original version of this.
Likely an ommision when that was added.

> paste? That together with vertical spacing on flow control seems to be a
> good source of bugs. Good find.
> 
> The only difference between the first and second thread data I'm seeing
> is flags VIRTUAL vs PARALLEL. Matt Brost, is this test from you? Could

Yes, I wrote this one. Not my finest work in terms of copy / pasting,
indeed the only difference should be VIRTUAL vs. PARALLEL. I think this
should be consolidated into a loop.

> you add an overview to its documentation? The boilerplate doc added
> there after the fact looks less than helpful.
>

What kinda of documentation were you thinking of? Most all the IGTs are
light on doc but updating the doc for ones I wrote is on my todo list...

Matt
 
> Lucas De Marchi
> 
> > ---
> > tests/intel/xe_exec_threads.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> > index 55907e2b3..977e8c600 100644
> > --- a/tests/intel/xe_exec_threads.c
> > +++ b/tests/intel/xe_exec_threads.c
> > @@ -1081,6 +1081,7 @@ static void threads(int fd, int flags)
> > 						threads_data[i].fd = 0;
> > 					else
> > 						threads_data[i].fd = fd;
> > +					threads_data[i].gt = gt;
> > 					threads_data[i].vm_legacy_mode =
> > 						vm_legacy_mode;
> > 					threads_data[i].class = class;
> > -- 
> > 2.43.0
> > 
