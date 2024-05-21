Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EABC25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 13:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9D10EA9B;
	Tue, 21 May 2024 13:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8hXtVId";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6910EA9B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716299241; x=1747835241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=omJ9BJIFLn6PAmORY50BPePTh0wtcPMe/b5QjYQRlZE=;
 b=U8hXtVIdW4relC9t/Q6ICY63KW9Qt+JQSB4sJiILVY2YSo9Kes2LDXKR
 E9BlTm+jcGg38PW6KZZlxFoyMvlZTksjopCRGo/Ios3BOjY51lYCQrcwA
 gzYkz3qdiPomMk+PBKi5v0tlPyBR7zjgksTF5LbKRGwtczxMUL0N2sPbB
 Wv0KJg6J9B5FxFfrgFWVfR5hjpzXzf4dLHlENceNbWmduMyDXmnia5oTk
 QH5pZfnevSQPAa2f2tJX2WdzBquhiIKaziNHUVxx0Iwegog08SE6f8QNk
 FBd1IsvxMZxDn7r/sw05I9lu/lhZCI21ttqHK5alexYrUaAvzhmhwZgBH A==;
X-CSE-ConnectionGUID: dy4CbBPETSKFhQc3KBkxfA==
X-CSE-MsgGUID: B51xLkAUScOJwG04rMl95g==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15439798"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15439798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 06:47:19 -0700
X-CSE-ConnectionGUID: MgUPNtMWQ0C59tP3IdS9Fg==
X-CSE-MsgGUID: Gw7dxKc6RUmDxvna305/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32831068"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 06:47:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 06:47:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 06:47:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 06:47:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 06:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH4OwYbkNKYFw2BG4/ISFjPPORcs0IuZdeLbMGMIvVMCHMUlJ/ewe/HV4qdYN2Y9K58KZC7KlIihAx9TCwsPvkjN6dsyqMW283t7G8UD+0LarIQOvEUj8Q8jHIYGvrgHJY/6B2sFnprotUoniDuoeqcA3GxD55ybmgTX6Vm7bsYH1aUUb5ZW2mRxvznpc/8qJM4dyGqCvNQdinvG2BFEzCXuqnE06ogkVU1FqqXfR6HItRovAcIOWwsB5bMH0JK8BoJIBdIZ95SBJVJnKL5CKG5RHERo66q4ROe1QErCtY/ecEUNnqmTRau4OrPhQj6MVxQ9JPajy1HTsy/PLFbCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiAVJlS+ds+7UJkZje/Qqozl4HIMvFfqRMszpcYgr/k=;
 b=lxj+5xuRWEUr/rw87WSxapwe/UPVZ64LXApKUiZmXkCIceT/tGfShZuYnuxnqX8zYSTD7wx7SOcqbUdrLakGYtRYXhHRvVlLnMyNyNfY0wnqXHgA59DN789YaQOPc8beurTXV2kzdgdUE8o3kmFwheoY1G3tM1+G6px00K4wD++SYprnx9DXFIJcsxTIoJeQaHNn/smICq14Efvg+6WvusBkeAg2CVUK26U6IzhHTgBXxlfkdx0E5bdeNIOudrVjtxb91v2mnh/6gQxr3qcJGJg4L64UnpF1gydfcibQp3J7Z1voaoJWMKEKMd7brChixVTenHnmMrr8DQvDJQNI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6751.namprd11.prod.outlook.com (2603:10b6:806:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 13:47:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 13:47:08 +0000
Date: Tue, 21 May 2024 08:47:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 08/13] treewide: Rename engine busyness variables
Message-ID: <r2p3res5jroa77xvrg5gqgnlow2yfinks34oqnvjwz6d67beaw@jkfkkyznx6ns>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-9-lucas.demarchi@intel.com>
 <ZjvIL8XimXrfEkI4@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZjvIL8XimXrfEkI4@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:303:b7::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 17da111b-fa6f-4390-8721-08dc799c8232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yv7OYwiBlQ5vRw6DdIFPokWMQcfGNCsVd89vkYOcXpVdhcE1fl0pGnFXfUXH?=
 =?us-ascii?Q?aw54bcKBrEe+VK3CkFYlm6q0SN/OHtYcq3IV5IeSApQWSnRGMmOLwoVUmhyY?=
 =?us-ascii?Q?LesRdBRlc4JQz2LemmnkhotTm/SQPRDVodVwHq4AZpE9Kro4obwq93xSuGbb?=
 =?us-ascii?Q?R5H9bdpS1O3tUMLb4+wPF2SRYWbWxCRd0U1smI0+epI2N4r0lI+Bl6lkSC5a?=
 =?us-ascii?Q?zaMSvhOQKYJ7t1osirITWu0vjjUxnZXXkIdIEcTOeMNxxJP+ji9FA9EsZO7Q?=
 =?us-ascii?Q?j5tQ9+zsGhI9+so98xT5dl4hYPZGM0UmzN7YGUfw1dygV2vgGVJftlEltwDH?=
 =?us-ascii?Q?cwdYSyWdppSoBGu9mn7oP8ZTOoxZdLti/9CN7jJFY9h99zvLQ0gMz5IqXmP2?=
 =?us-ascii?Q?rvunySdzbvDqNhZmuiy0cd6pymIm73Jx0jsDgYXH+YOkHPhG4jCuF6MbNPE8?=
 =?us-ascii?Q?US83W7E4tSg8nN5EWTN3s3fhGoGGuFma5iuymfwpPXCn+/u6ztwc/DlAYZl1?=
 =?us-ascii?Q?OYJCzcMhZ1jdFtpXEd+46W8W7qwNuVYdswCQh2+oXqDsOo7NMu/jkvb8Hn8/?=
 =?us-ascii?Q?OqmvpCrLrVPgbCcrwYoFxljjbvow46cK/8tP04RB/omBGegfI7pHzAja9nzf?=
 =?us-ascii?Q?Gtfjas0x2cRYRH51j1BZmfyefzgGCQI2Ev77KWJtYSzUy657VyypXNqnYJPD?=
 =?us-ascii?Q?c/2b5sCK3wM+czv6i1aUR6DvPwv1jpwO8No+T/CLY5vZG8Vg72swjgVmb1/t?=
 =?us-ascii?Q?kIyw/mop4hs17jzsV/9HS8gYTjiJrFWkkkV2Y76mL/zRlXUfm7zp8zlc/pZS?=
 =?us-ascii?Q?KrPGjikUE92jVFNEl0b4IwWRLSMvHD679SNM/Xwo16yT7zsoHz7mRbdf0GKK?=
 =?us-ascii?Q?M06ck8JG9ZAVmRsNrNlCIqCpepp5ePBflkst3H5VuTJe5ji1sqPrjRRsXsoG?=
 =?us-ascii?Q?z5+Uif23xBWDfpa5+O/Yrr4VtuMYYbfjcpNxpVOTNlQHus1dIJAyf4dLtMgA?=
 =?us-ascii?Q?WLhmW2GqZAEYtBnxujK+lMhJqXiZA1zIlwBLX4uYnb7vJr/c9ECOAk3qB5Ka?=
 =?us-ascii?Q?iVYPX60Qs2h4l9YTlsYPH6yZTosK75a2whslybM1A17xd9ADzrluDaa3rB8d?=
 =?us-ascii?Q?t9Qawiatat5IURK3Syx4qeJj5tRFyILVc/nanIElAKraEpUrA/d0QICawA73?=
 =?us-ascii?Q?KI6BwdMyAPOvZf/FiVyV9QXwFVNq6/ukaoHYsz5yDOoHwuKFTuLb/JO9SAjY?=
 =?us-ascii?Q?tFA0pIwGLJnOsTI24efUYtbadWXABldxpp9uWEc74A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?paVa2Hwo4KWqbz0f3op5DBK6xgZjuArL1SpikmklfQIV96rLnoBecmfS5EFe?=
 =?us-ascii?Q?t+ySom/gtZqcTphzpmkku9/ZjiXBtWp6JYsBC+eTSLoKywzs4aQwAhEueT82?=
 =?us-ascii?Q?fKsKX9hU/EkPhSM/BsdWDvA7Qnilf8X6wO5CPwegG3NjSpLUbcD3pEi/FJHm?=
 =?us-ascii?Q?hp7GpMbQLJsbk0v62UHZzJ4PBaA0eLrp25cj/TPgf+uxFNsJv/8K1wE46shU?=
 =?us-ascii?Q?jWCyC9iagM4QtE45T7f6HJ+BnvPWUviWE9/fFKkHHoZshINOSRTXZ1AaBRL9?=
 =?us-ascii?Q?yZFX9WRdptB46wsCaLYCzA+DW6nblXsukM0MkY0Z6SUmn13ya3Ez9oErVfsv?=
 =?us-ascii?Q?sHZBvL1oj0UAgkktT9aDJ3Od3fDGCQZluh8rzbUX9tJrExGuA/Ztx9y6zvGO?=
 =?us-ascii?Q?t4rwiRzwP6dREnXsm5GYZ19MmBtRZnUjgk3CWN3wPjGwbAng3rEeYWhzW50n?=
 =?us-ascii?Q?8G8YxtwmHh+0xQfQ9giJf7GcY61pwrpaZ0y9dU0Lqho34V/GBVgVntff2KE2?=
 =?us-ascii?Q?qNAEQwIEHMwm/rK5Uw/mcvqNqXzAPvGQ0JCOISAUBRt1kSa2UAOfvrfBy+Sm?=
 =?us-ascii?Q?Bm/WPTysJuVofDfwXBdOSZINlcNxeA08TYdCGVvVM3uMd5YhXZiu9dEfbAm2?=
 =?us-ascii?Q?7M+90y5zk+fSkT63mv+l2QeCoJzZYnX3tIBefIQG3TQyx/fni4+t+Ddsvc7l?=
 =?us-ascii?Q?vX9YMWJrTVV/oYR1KMgkQ5Vrbpn3us/z5yNwHtJXWBEx6wNkNYntuR4KiIOE?=
 =?us-ascii?Q?JZjpJtwlmVLPBoiCt+/WHht8PQzrXLrjkdqGYncBdeWyc1wxYNNMK7rB2BYN?=
 =?us-ascii?Q?kQ6sNMzb7CYsPgcSaGLWUqls++rRiuDizJ3VYMXCtKsjww7C/iot3TCKU0bc?=
 =?us-ascii?Q?J0/z80nMH/fntYHxW26hLxVgdN3cJieFHfHtuNn0rr9B8Lrbr7fo+aHgB83I?=
 =?us-ascii?Q?IXeQAgd6EPEP6YmVgX5+zNjjhIi5QcFXUFyNpmyO+eM8XgyV6Loc065ZGc3i?=
 =?us-ascii?Q?7tI9bhT8I0wyXM6PmxnDCwM9R1f/+kjhUnxV91XtmQ+dVNhdsXW0mbTgFCH2?=
 =?us-ascii?Q?0l1NAzAOto8k5VFM2xdLoICFZEH6Ji8tRCJeObXiPHcaxWGQtR2l70K4lc0t?=
 =?us-ascii?Q?pgokiADuHERe0NOThlTWAXDo9lfNijU8pWcK4MJgIl0psCBwgEefqLhXLITu?=
 =?us-ascii?Q?ak6sHcx0II/7QsJw9H1/h97+I0u4jRJwTufnnYZrhSCQJM7fhL3/n0wgsbjh?=
 =?us-ascii?Q?EozhFjjkkURK0hVnqg2tXSD631PsAxsRbQEApynq/krYLwQH3WfIBvP1+orO?=
 =?us-ascii?Q?UKDQKSBhWMZmFvD1r6GersbXqZxRayQqUtVetFB+Yx3oGcqZibBgrBDiKV0e?=
 =?us-ascii?Q?p32Ypw7U2YSsjt7zgYU+Tc+7H5kzQM/Qs5OC+ChWRkUf/Qid/6JAohd6Zvym?=
 =?us-ascii?Q?x6ZRtGa31OIbmpAn97PEvSjZ4r5qQIKH1oeigiwfH605ci7/q9K1lcwv3Ee3?=
 =?us-ascii?Q?MYfW9ks8v7UW3i89qjsRaGXaDeCpyALURnyQvZ4EIqI/VUcbvKGSHHRgXMS6?=
 =?us-ascii?Q?rZgmbpBFiEQCcxySOMpDFuRXNLwVHPMVOtqhNyE1pcq1+T/lWwTvEi4hBzrg?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17da111b-fa6f-4390-8721-08dc799c8232
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 13:47:08.8466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY2N8DOAbesqdmHX3nbQq9hXELopUOdi+O+083R2/+b7+rjhAu4SXBtN2ucf3ZLxwYeBEL4x2dI6ysan/EfID0FWkFLaa2fRWjrfIw1HDiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6751
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

On Wed, May 08, 2024 at 11:45:03AM GMT, Umesh Nerlige Ramappa wrote:
>On Fri, May 03, 2024 at 11:46:38PM -0700, Lucas De Marchi wrote:
>>In preparation to have more possible ways to calculate engine
>>busyness/utilization, rename variables related to the current way: it's
>>reading the "engine time in nsec" spent by the client on each engine.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>IMO, I still prefer the earlier names since the word "busy" is 
>ingrained in the PMU work that we have done so far :). I would have 
>just done this:
>
>s/c->val/c->delta_busy/ (since val is descriptive)
>s/c->last/c->last_busy/ (since you intend to add cycles later)

but then "busy" would refer to what key the kernel exports? We have more
than one and need to differentiate between them in 2 layers (fdinfo and
drm_clients) and resolve it only in the application.

>
>The new counter would just have similar names, but with s/busy/cycles/.

I don't like the current names much, but I think the alternative is
worse.


>
>It looks fine as is, so this is
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

thanks
Lucas De Marchi

>
>Regards,
>Umesh
>
>>---
>>lib/igt_drm_clients.c    | 28 +++++++++++++------------
>>lib/igt_drm_clients.h    |  8 ++++----
>>lib/igt_drm_fdinfo.c     |  6 +++---
>>lib/igt_drm_fdinfo.h     |  2 +-
>>tests/intel/drm_fdinfo.c | 44 ++++++++++++++++++++--------------------
>>tools/gputop.c           |  8 ++++----
>>tools/intel_gpu_top.c    | 24 +++++++++++-----------
>>7 files changed, 61 insertions(+), 59 deletions(-)
>>
>>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>>index ab0c2cec2..3f4265015 100644
>>--- a/lib/igt_drm_clients.c
>>+++ b/lib/igt_drm_clients.c
>>@@ -103,19 +103,19 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>>
>>	/* Engines */
>>
>>-	c->last_runtime = 0;
>>-	c->total_runtime = 0;
>>+	c->agg_delta_engine_time = 0;
>>+	c->total_engine_time = 0;
>>
>>	for (i = 0; i <= c->engines->max_engine_id; i++) {
>>-		assert(i < ARRAY_SIZE(info->busy));
>>+		assert(i < ARRAY_SIZE(info->engine_time));
>>
>>-		if (info->busy[i] < c->last[i])
>>+		if (info->engine_time[i] < c->last_engine_time[i])
>>			continue; /* It will catch up soon. */
>>
>>-		c->total_runtime += info->busy[i];
>>-		c->val[i] = info->busy[i] - c->last[i];
>>-		c->last_runtime += c->val[i];
>>-		c->last[i] = info->busy[i];
>>+		c->total_engine_time += info->engine_time[i];
>>+		c->delta_engine_time[i] = info->engine_time[i] - c->last_engine_time[i];
>>+		c->agg_delta_engine_time += c->delta_engine_time[i];
>>+		c->last_engine_time[i] = info->engine_time[i];
>>	}
>>
>>	/* Memory regions */
>>@@ -183,9 +183,11 @@ igt_drm_client_add(struct igt_drm_clients *clients,
>>		c->engines->max_engine_id = i;
>>	}
>>
>>-	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
>>-	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
>>-	assert(c->val && c->last);
>>+	c->delta_engine_time = calloc(c->engines->max_engine_id + 1,
>>+			       sizeof(*c->delta_engine_time));
>>+	c->last_engine_time = calloc(c->engines->max_engine_id + 1,
>>+			      sizeof(*c->last_engine_time));
>>+	assert(c->delta_engine_time && c->last_engine_time);
>>
>>	/* Memory regions */
>>	c->regions = calloc(1, sizeof(*c->regions));
>>@@ -223,8 +225,8 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
>>	}
>>	free(c->engines);
>>
>>-	free(c->val);
>>-	free(c->last);
>>+	free(c->delta_engine_time);
>>+	free(c->last_engine_time);
>>
>>	if (c->regions) {
>>		for (i = 0; i <= c->regions->max_region_id; i++)
>>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>>index 52888aedc..f2ff13182 100644
>>--- a/lib/igt_drm_clients.h
>>+++ b/lib/igt_drm_clients.h
>>@@ -63,10 +63,10 @@ struct igt_drm_client {
>>	char name[24]; /* Process name of the owning PID. */
>>	char print_name[24]; /* Name without any non-printable characters. */
>>	unsigned int samples; /* Count of times scanning updated this client. */
>>-	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
>>-	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
>>-	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
>>-	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
>>+	unsigned long total_engine_time; /* Aggregate of @agg_delta_engine_time, i.e. engine time on all engines since client start. */
>>+	unsigned long agg_delta_engine_time; /* Aggregate of @delta_engine_time, i.e. engine time on all engines since previous scan. */
>>+	unsigned long *delta_engine_time; /* Array of engine time data, relative to previous scan. */
>>+	uint64_t *last_engine_time; /* Array of engine time data as parsed from fdinfo. */
>>	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
>>};
>>
>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>index 79b72c54d..9deeadd4e 100644
>>--- a/lib/igt_drm_fdinfo.c
>>+++ b/lib/igt_drm_fdinfo.c
>>@@ -190,10 +190,10 @@ out:
>>		}							\
>>	} while (0)
>>
>>-#define UPDATE_ENGINE(idx, engine, val, utilization_key)		\
>>+#define UPDATE_ENGINE(idx, member, val, utilization_key)		\
>>	do {								\
>>		if (idx >= 0) {						\
>>-			info->engine[idx] = val;			\
>>+			info->member[idx] = val;			\
>>			info->utilization_mask |= utilization_key;	\
>>			if (!info->capacity[idx])			\
>>					info->capacity[idx] = 1;	\
>>@@ -260,7 +260,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>>		} else if (strstartswith(l, "drm-engine-", &keylen)) {
>>			idx = parse_engine(l + keylen, info,
>>					   name_map, map_entries, &val);
>>-			UPDATE_ENGINE(idx, busy, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
>>+			UPDATE_ENGINE(idx, engine_time, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
>>		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
>>			idx = parse_engine(l + keylen, info,
>>					   name_map, map_entries, &val);
>>diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
>>index 3f641d79d..ea90edd79 100644
>>--- a/lib/igt_drm_fdinfo.h
>>+++ b/lib/igt_drm_fdinfo.h
>>@@ -60,7 +60,7 @@ struct drm_client_fdinfo {
>>	unsigned int utilization_mask;
>>
>>	/* drm-engine-<engine> values */
>>-	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
>>+	uint64_t engine_time[DRM_CLIENT_FDINFO_MAX_ENGINES];
>>	/* drm-cycles-<engine> values */
>>	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
>>
>>diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
>>index 61c66079e..2d155180f 100644
>>--- a/tests/intel/drm_fdinfo.c
>>+++ b/tests/intel/drm_fdinfo.c
>>@@ -192,14 +192,14 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
>>	}
>>}
>>
>>-static uint64_t read_busy(int i915, unsigned int class)
>>+static uint64_t read_engine_time(int i915, unsigned int class)
>>{
>>	struct drm_client_fdinfo info = { };
>>
>>	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
>>					ARRAY_SIZE(engine_map), NULL, 0));
>>
>>-	return info.busy[class];
>>+	return info.engine_time[class];
>>}
>>
>>static void
>>@@ -229,11 +229,11 @@ single(int gem_fd, const intel_ctx_t *ctx,
>>	else
>>		spin = NULL;
>>
>>-	val = read_busy(gem_fd, e->class);
>>+	val = read_engine_time(gem_fd, e->class);
>>	slept = measured_usleep(batch_duration_ns / 1000);
>>	if (flags & TEST_TRAILING_IDLE)
>>		end_spin(spin_fd, spin, flags);
>>-	val = read_busy(gem_fd, e->class) - val;
>>+	val = read_engine_time(gem_fd, e->class) - val;
>>
>>	if (flags & FLAG_HANG)
>>		igt_force_gpu_reset(spin_fd);
>>@@ -250,9 +250,9 @@ single(int gem_fd, const intel_ctx_t *ctx,
>>		gem_quiescent_gpu(spin_fd);
>>		igt_assert(!gem_bo_busy(spin_fd, spin->handle));
>>
>>-		val = read_busy(gem_fd, e->class);
>>+		val = read_engine_time(gem_fd, e->class);
>>		slept = measured_usleep(batch_duration_ns / 1000);
>>-		val = read_busy(gem_fd, e->class) - val;
>>+		val = read_engine_time(gem_fd, e->class) - val;
>>
>>		assert_within_epsilon(val, 0, tolerance);
>>	}
>>@@ -282,14 +282,14 @@ static void log_busy(unsigned int num_engines, uint64_t *val)
>>	igt_info("%s", buf);
>>}
>>
>>-static void read_busy_all(int i915, uint64_t *val)
>>+static void read_engine_time_all(int i915, uint64_t *val)
>>{
>>	struct drm_client_fdinfo info = { };
>>
>>	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
>>					ARRAY_SIZE(engine_map), NULL, 0));
>>
>>-	memcpy(val, info.busy, sizeof(info.busy));
>>+	memcpy(val, info.engine_time, sizeof(info.engine_time));
>>}
>>
>>static void
>>@@ -312,11 +312,11 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>>
>>	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
>>
>>-	read_busy_all(gem_fd, tval[0]);
>>+	read_engine_time_all(gem_fd, tval[0]);
>>	slept = measured_usleep(batch_duration_ns / 1000);
>>	if (flags & TEST_TRAILING_IDLE)
>>		end_spin(gem_fd, spin, flags);
>>-	read_busy_all(gem_fd, tval[1]);
>>+	read_engine_time_all(gem_fd, tval[1]);
>>
>>	end_spin(gem_fd, spin, FLAG_SYNC);
>>	igt_spin_free(gem_fd, spin);
>>@@ -388,11 +388,11 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>>	/* Small delay to allow engines to start. */
>>	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>>
>>-	read_busy_all(gem_fd, tval[0]);
>>+	read_engine_time_all(gem_fd, tval[0]);
>>	slept = measured_usleep(batch_duration_ns / 1000);
>>	if (flags & TEST_TRAILING_IDLE)
>>		end_spin(gem_fd, spin, flags);
>>-	read_busy_all(gem_fd, tval[1]);
>>+	read_engine_time_all(gem_fd, tval[1]);
>>
>>	end_spin(gem_fd, spin, FLAG_SYNC);
>>	igt_spin_free(gem_fd, spin);
>>@@ -443,11 +443,11 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>>	/* Small delay to allow engines to start. */
>>	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>>
>>-	read_busy_all(gem_fd, tval[0]);
>>+	read_engine_time_all(gem_fd, tval[0]);
>>	slept = measured_usleep(batch_duration_ns / 1000);
>>	if (flags & TEST_TRAILING_IDLE)
>>		end_spin(gem_fd, spin, flags);
>>-	read_busy_all(gem_fd, tval[1]);
>>+	read_engine_time_all(gem_fd, tval[1]);
>>
>>	end_spin(gem_fd, spin, FLAG_SYNC);
>>	igt_spin_free(gem_fd, spin);
>>@@ -589,11 +589,11 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>>			else
>>				spin = NULL;
>>
>>-			val = read_busy(i915, class);
>>+			val = read_engine_time(i915, class);
>>			slept = measured_usleep(batch_duration_ns / 1000);
>>			if (flags & TEST_TRAILING_IDLE)
>>				end_spin(i915, spin, flags);
>>-			val = read_busy(i915, class) - val;
>>+			val = read_engine_time(i915, class) - val;
>>
>>			if (flags & FLAG_HANG)
>>				igt_force_gpu_reset(i915);
>>@@ -610,10 +610,10 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>>				gem_quiescent_gpu(i915);
>>				igt_assert(!gem_bo_busy(i915, spin->handle));
>>
>>-				val = read_busy(i915, class);
>>+				val = read_engine_time(i915, class);
>>				slept = measured_usleep(batch_duration_ns /
>>							1000);
>>-				val = read_busy(i915, class) - val;
>>+				val = read_engine_time(i915, class) - val;
>>
>>				assert_within_epsilon(val, 0, tolerance);
>>			}
>>@@ -700,11 +700,11 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>>		/* Small delay to allow engines to start. */
>>		usleep(__igt_sync_spin_wait(i915, spin) * count / 1e3);
>>
>>-		val = read_busy(i915, class);
>>+		val = read_engine_time(i915, class);
>>		slept = measured_usleep(batch_duration_ns / 1000);
>>		if (flags & TEST_TRAILING_IDLE)
>>			end_spin(i915, spin, flags);
>>-		val = read_busy(i915, class) - val;
>>+		val = read_engine_time(i915, class) - val;
>>
>>		if (flags & FLAG_HANG)
>>			igt_force_gpu_reset(i915);
>>@@ -718,10 +718,10 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>>			gem_quiescent_gpu(i915);
>>			igt_assert(!gem_bo_busy(i915, spin->handle));
>>
>>-			val = read_busy(i915, class);
>>+			val = read_engine_time(i915, class);
>>			slept = measured_usleep(batch_duration_ns /
>>						1000);
>>-			val = read_busy(i915, class) - val;
>>+			val = read_engine_time(i915, class) - val;
>>
>>			assert_within_epsilon(val, 0, tolerance);
>>		}
>>diff --git a/tools/gputop.c b/tools/gputop.c
>>index 8cec951b4..80bc94be4 100644
>>--- a/tools/gputop.c
>>+++ b/tools/gputop.c
>>@@ -176,7 +176,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>	int len;
>>
>>	/* Filter out idle clients. */
>>-	if (!c->total_runtime || c->samples < 2)
>>+	if (!c->total_engine_time || c->samples < 2)
>>		return lines;
>>
>>	/* Print header when moving to a different DRM card. */
>>@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>>		if (!c->engines->capacity[i])
>>			continue;
>>
>>-		pct = (double)c->val[i] / period_us / 1e3 * 100 /
>>+		pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100 /
>>		      c->engines->capacity[i];
>>
>>		/*
>>@@ -257,8 +257,8 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>>	 * Within buckets sort by last sampling period aggregated runtime, with
>>	 * client id as a tie-breaker.
>>	 */
>>-	val_a = a->last_runtime;
>>-	val_b = b->last_runtime;
>>+	val_a = a->agg_delta_engine_time;
>>+	val_b = b->agg_delta_engine_time;
>>	if (val_a == val_b)
>>		return __client_id_cmp(a, b);
>>	else if (val_b > val_a)
>>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>index 5b4f94d7d..35122493c 100644
>>--- a/tools/intel_gpu_top.c
>>+++ b/tools/intel_gpu_top.c
>>@@ -793,7 +793,7 @@ static int client_last_cmp(const void *_a, const void *_b, void *unused)
>>{
>>	const struct igt_drm_client *a = _a;
>>	const struct igt_drm_client *b = _b;
>>-	long val_a = a->last_runtime, val_b = b->last_runtime;
>>+	long val_a = a->agg_delta_engine_time, val_b = b->agg_delta_engine_time;
>>
>>	/*
>>	 * Sort clients in descending order of runtime in the previous sampling
>>@@ -812,7 +812,7 @@ static int client_total_cmp(const void *_a, const void *_b, void *unused)
>>{
>>	const struct igt_drm_client *a = _a;
>>	const struct igt_drm_client *b = _b;
>>-	long val_a = a->total_runtime, val_b = b->total_runtime;
>>+	long val_a = a->total_engine_time, val_b = b->total_engine_time;
>>
>>	if (val_a == val_b)
>>		return __client_id_cmp(a, b);
>>@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
>>			strcpy(ac->pid_str, c->pid_str);
>>			strcpy(ac->print_name, c->print_name);
>>			ac->engines = c->engines;
>>-			ac->val = calloc(c->engines->max_engine_id + 1,
>>-					 sizeof(ac->val[0]));
>>-			assert(ac->val);
>>+			ac->delta_engine_time = calloc(c->engines->max_engine_id + 1,
>>+						sizeof(ac->delta_engine_time[0]));
>>+			assert(ac->delta_engine_time);
>>			ac->regions = c->regions;
>>			ac->memory = calloc(c->regions->max_region_id + 1,
>>					    sizeof(ac->memory[0]));
>>@@ -908,11 +908,11 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
>>			continue;
>>
>>		ac->samples = 2; /* All what matters for display. */
>>-		ac->total_runtime += c->total_runtime;
>>-		ac->last_runtime += c->last_runtime;
>>+		ac->total_engine_time += c->total_engine_time;
>>+		ac->agg_delta_engine_time += c->agg_delta_engine_time;
>>
>>		for (i = 0; i <= c->engines->max_engine_id; i++)
>>-			ac->val[i] += c->val[i];
>>+			ac->delta_engine_time[i] += c->delta_engine_time[i];
>>
>>		for (i = 0; i <= c->regions->max_region_id; i++) {
>>			ac->memory[i].total += c->memory[i].total;
>>@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
>>	 * or borrowed fields which we don't want the library to try and free.
>>	 */
>>	igt_for_each_drm_client(clients, c, tmp) {
>>-		free(c->val);
>>+		free(c->delta_engine_time);
>>		free(c->memory);
>>	}
>>
>>@@ -2120,7 +2120,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>	int len;
>>
>>	if (output_mode == INTERACTIVE) {
>>-		if (filter_idle && (!c->total_runtime || c->samples < 2))
>>+		if (filter_idle && (!c->total_engine_time || c->samples < 2))
>>			return lines;
>>
>>		lines++;
>>@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>				continue;
>>			}
>>
>>-			pct = (double)c->val[i] / period_us / 1e3 * 100;
>>+			pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
>>
>>			/*
>>			 * Guard against possible time-drift between sampling
>>@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>					 iclients->classes.names[i]);
>>				pops->open_struct(buf);
>>
>>-				pct = (double)c->val[i] / period_us / 1e3 * 100;
>>+				pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
>>				snprintf(buf, sizeof(buf), "%f", pct);
>>				__json_add_member("busy", buf);
>>
>>-- 
>>2.43.0
>>
