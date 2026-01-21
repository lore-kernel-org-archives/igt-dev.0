Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E94D262B1
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F319D10E679;
	Wed, 21 Jan 2026 02:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj3Ngcao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E1610E679
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768961704; x=1800497704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3XW9Ovg5C3aCjB6UGJxTse6ucDU38KvcsyIV4xiaL2o=;
 b=Hj3NgcaoG4ytKh94G9GXSpKv+ahvrYIxTMNfCbMBKRunZQbCN3TeL2p7
 EFi5BuszdpRDdljKMYm3hHCjNjubtHajtkd5ZivuhwA59E4WI40DLNArT
 GdejhehCAahtdxZdzX7laB634Grv4EDiBa2EAxfqAGTxoSA0mmSIqGloh
 CN4rsfIFtFt/ggyGqH3kpxmyCJXxLWW8Gu8/fsa7h0qpgFU4UwXq9xBDo
 3j7aEqRiGiDPjpVwOmGROMKPy4EJGeoyJ/CjxqlY9NUzkfdxs52kqLWoD
 QiZsmdqBTKX4ZPIvscu14rDw1WaM39YVuF/1xwkcZzstOOPua3VYp6OLg g==;
X-CSE-ConnectionGUID: vrsH9wyPQi+mBEIJIpBCpQ==
X-CSE-MsgGUID: J0F1mYFoQQ+CxTvNAyb/Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87597715"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87597715"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:15:04 -0800
X-CSE-ConnectionGUID: 6wcMQqc/SZ20XfkpMT6zqg==
X-CSE-MsgGUID: xerDxWh7TM2jJFrFql+RuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206338203"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:15:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:15:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:15:03 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:15:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/EQxcGrCCl/6ePpiGAkVecSDus4t9QOTU0XrZGFEg5XTMWtYH1G6GLKGfmMA+gqaCsZQpYHqmZNQcjD9s2ZoTrfqo2w6YkJ5jBccG4eAHcgfk/xWEXOQIa5pgXZMhZNtYTaqoCEFqOApX+OJbJvMrhQK8gdxulBWgeZInue5d8/iRLxJbCOHZUH5Ed9di66wNbG6u4XBn59FkJBcq8UbogMrZevlmDDAn3vdikcJHYwyyka0360XJ6vYJIEvBEhL/7cHKxy7fZKmerBblMmGyWoRQcRMLVroKecyBmG2Z12KmDCUWTIHfZCKeC63YIHq1sWfEeRYwCIUurJAg0PvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqZYj93mfNto4G73tboCLH8piyCP1KXMgUqu5IqynAg=;
 b=GQM+CripqwZkafQBkb4idOTkKSg7R26Y5Bq0GcJ4q/KwIlRNywfESJ586dzsfWe9/bRCDcUVFZmz+VxFYakOQ//9AzwZyyyPD4KLkx8G4Ud9xtE7a69OcxxSidvuCrIYzDdgaScPBzMi2JPBMN1hXhNhJ/Z3rSJfPPaTLnkkgvl9WpOf8DIVsqz9yQGOSCyXQcLvUnCLsI9V/V6xCOJNQJsglDaQoBWOiZgu1Mup+TwV+QeFXxsPIrlWkDsaXAJIBY+BrUYyd9SpKFpgEJ9odS0qzEGljzXp0FIZ5iuCE2N+dE9m1weNSdMvdtyzFOq9NUG1upVWIqA2R58KdsgPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Wed, 21 Jan
 2026 02:15:00 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:15:00 +0000
Date: Tue, 20 Jan 2026 18:14:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 3/9] tests/intel/xe_evict: Add multi-queue priority
 test
Message-ID: <aXA2oRN59ZJi87_l@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-4-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-4-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: c13eeb64-248e-48db-c981-08de5892e17e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YTlzmeVTt0wF8TRhYlh+BsoZfYwT/0ljH5THq5kD/D9zxx9uZkl+vdnz0NBQ?=
 =?us-ascii?Q?y3Rdy2kYUOpXydCeoscieZblKgFDidfvP2KQEhvlMjY08HOubhaCJpfkvCYF?=
 =?us-ascii?Q?f+Uso37HREG8R0dS1+pkf1WBxI2Tl8b4hWGkbN6q9eUinv35/whbYaeYt9vx?=
 =?us-ascii?Q?rMgryzCKK9DYbzCqO7KGQLRky6/HPdTcWELClW8wY8UkERLJCmxgdqktZuNo?=
 =?us-ascii?Q?ibv48Ho/PpGFOudiYCLyYQvQS9mE2ZukE0cULROe37t3WvBzxcvm0baNdJUt?=
 =?us-ascii?Q?so54qpUphJBI0+LzRJRxb2b0PYS8s6twZ56sqdLOIiTyYNFDoUK07sLd0uyB?=
 =?us-ascii?Q?/UBWrSSCJKjG0QdvZz7XFeMqxozi9qYEPh3VevdOYKUy0ViX42ihJYdRsqxh?=
 =?us-ascii?Q?LG0Tx4E9pYu6GaZ1qn7ToqQGLtpnceE4WB/YIO9+gfNom8nJwAo82/2yE7t4?=
 =?us-ascii?Q?7n1soAEKRuZ2BVvFmrUNudaixtoviqYdRH5SloYLqiWYP+zP7jNQhVrmDjlW?=
 =?us-ascii?Q?AnL1fKLCunVxZTSKo9rC1jUOYoWS9XkIsIP2kXqumALrth3E3C4jXkTfK/WO?=
 =?us-ascii?Q?axbpGF1dCDir/3q1f+6PKq1erqKazdDU/ZKgiDdBAjj+OwYEsXquIXnSsU9S?=
 =?us-ascii?Q?/5T+gtTNn6rpHgCLWh9DW17HKWeK+cTZr7XhVMIoVTBE1JHcGEKzobcqBGJ6?=
 =?us-ascii?Q?CAD8srETCsgmAuFOy/S2tQOR+BfRNz2uiTvASMUOUxcWAjjXxoSQiTfKs2RT?=
 =?us-ascii?Q?sBw/lQnhO6EnrMLwvV+BiyrYt8MnQdF6NkdH22ZkqmDpNg33/8Q8I5hE7uTT?=
 =?us-ascii?Q?PyH4tbfewTp5N8/+c0aAlXfdnXZQB4SpaOeHVDjQKvILADOE0P5CL4ALr3sC?=
 =?us-ascii?Q?HlglVgzZMa87zs9ASnjPn0a5bGrN1T4gsQFGWB5r8wdxp2sMXs+RyMUI2GHH?=
 =?us-ascii?Q?2JzgrHFyJZCgq4ZuDUy3qg1lzKwS0f4lM5FX4e4f54UDwiPsz4fBZU87ffLk?=
 =?us-ascii?Q?EDks+tqLw7ALP3qwhcZbxukjmw6GLs+wQCriFxt56SdB7dNaNzqdxGEdYrwb?=
 =?us-ascii?Q?6w7CM1SZTlPErvNexMitXQlOCHQCAoJEV6iis5r8h5kcckwzAIzKaOri2T5N?=
 =?us-ascii?Q?CtcjKh8AF4+z9Ubf+VmGsXSgwKl6oEp+hamNF7ZBWmDCkO6c9Y/MbgdOVJWd?=
 =?us-ascii?Q?D2nLxVG8TM/8etToTCSdQqpLzPrf9yQo+ejPjkRERs7AWg5AcFV0XC5V1Kpz?=
 =?us-ascii?Q?4zRV9nV0hcPpV3Pv4VItOrvIZpIXypBsJbHV3oUY8XXkawSZPxRhnrzhfo2e?=
 =?us-ascii?Q?jdWwS+a28BqXN3lHjUjbD58hyXKheJjC/6BLLSbHu756AZMlXO80WSVg7LkY?=
 =?us-ascii?Q?czjjSiVvyirSw7/TL/SZyfJw4EvKj0wJyG1h5xsDm+pO6uVNBKwnR9zbRsiI?=
 =?us-ascii?Q?ftEek3zrAynZxfKOy0ASvpv3FzmPLuCMc/CwMBKhr+VGOEjNU/gB3Vo0atVf?=
 =?us-ascii?Q?jtnDO3eu5tmh08lUMa7IGTfsfzX0lMX2i3UMc71RwJkqiblhxI+LpO3qV+1J?=
 =?us-ascii?Q?K2hOEyu4LvTE0s1vcpo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YlPhmiPdrbgPw20oTT2/4LxKD7VGkEDE6S637JyId1OzenpmZa+hQ+Olb2Zn?=
 =?us-ascii?Q?xslWYwDJETjmt54q53ZapQlxe2gL90w1QhxZHz7Uz+luCJ+8P0345uykzTO1?=
 =?us-ascii?Q?ElNKU7NPDhIpJz7SjkcstYqHOa/iePE7jS5xBy9dHl0BCYPaJ9jMuBacoiBp?=
 =?us-ascii?Q?hst4W0RsCBSgKEhzAu4Rj729ftsGl7GzrDoGzPeXmKGomJhB0ZRGCFTn+XCG?=
 =?us-ascii?Q?P9qjbw3EO66fZl5TdaJiERFMQ66Pe2eI3Z1QKT1glaVTfbJiGqsIjf/MPGw5?=
 =?us-ascii?Q?0hU1dRP9cdBBRiMYHVqUBTlKsNLjcO1R15BVjZLwHCK4TLOCGlML9858oRV8?=
 =?us-ascii?Q?EJixgvOWpGGTwdXalEWkL90n2V9JIcYs04gDSpa/EiyNp1ICQ/IALIllVg2/?=
 =?us-ascii?Q?2O2VRQDHeJ1/axW9BD8lT9oIUWIMoptgx0FFhpL4ZISUxjaLGbpikxE3M/v2?=
 =?us-ascii?Q?GTwPpwDXNbRcJq6QzA5J7FKh762WbMQhiqA2kK+ZRX4G8YrAs8EBOpQW1Tk9?=
 =?us-ascii?Q?+en+JNtilFn+pQeiVbGasQ8QWlrQvBswAOQslO1lTFudHiQqzrPq7pHvXvqy?=
 =?us-ascii?Q?v05HaWRE9366xzF1no+fAcgkEZ3OIt/hIj8pkIxB6VM8P38t3R1o4TXxJ3fQ?=
 =?us-ascii?Q?U9ugyk/9vdAdMrpmj0PLkr7vJrzsv4krpBqoHPeP3ZBP8gMzEHaSoboEo9HM?=
 =?us-ascii?Q?j8wPQIiu/n78etbJYclisZi+O47HW9MTHZgvg/3lCgZmeUsPhy5uss9Xz/g2?=
 =?us-ascii?Q?O1Xz61McB5GPgE2K/oXgADIr6QldjGGnMXxLdCL6NffZLghjJBLDPsBfDJDV?=
 =?us-ascii?Q?vU8ccuCE5nF4cJ/06F4CZBFJFJW8FTuGVPoMvNHZ4CTB0sZa7JgLrSyA8F2d?=
 =?us-ascii?Q?/EdEgcHWFAFum2lBD3zWN2cEv1n9fZWDQoOq8xNDt5tqrWslW8x2rpUueMry?=
 =?us-ascii?Q?MmXCZEWxytQhvyIYDQaSYI0woUXM7CaiiY78B9XNKtPyDIjomxtwZ0sAhlZ/?=
 =?us-ascii?Q?t28gUNFIC+CZAwAwP5TDSsCVrXMMe7EOhsyr2+XYSwOeQoFF/uY6hx2+gTql?=
 =?us-ascii?Q?NenJwp1S7vmi0QPFnz2rek28Bw/gSogCxOY3/C7CxB9zj0aABCXiESBIUHw/?=
 =?us-ascii?Q?AVklVhihs+1F33xl1P6Rskf76HjHxR9akkkqmReB6/IGjYAiY2E+To3hh8rT?=
 =?us-ascii?Q?xWHA6R+H44iP9gqBMBNwhJwGuW8ROSwbduhgc9iEILM/NvaiTNsvOOnDrR7Z?=
 =?us-ascii?Q?myOeD1bE8ggiBexJhQiTdJNEfnwJO9g2uL+q+nV7TxGuoSb7UZdvYPLSWUCs?=
 =?us-ascii?Q?8EsjQT0T/GLGl/7GCez9ailUWb4PvvpElrMgnG/KcLbJl3gtZrKtDPdTtaTv?=
 =?us-ascii?Q?1/FL/oALGgvwElr6EhQ8fcyAqd3pmRiP+vcBD7QXim0iheDeNhxAUW5xS0CU?=
 =?us-ascii?Q?KEtkwdn5BwiGl3tnIeZqSYPaxhwAkHGKWS0d2Sn6ty1iC7R0DWFfibe67Nwz?=
 =?us-ascii?Q?VaImwAwuBOIfkLTG3nImPJMhdwyz8N+rStImRyt3W/4NTEwviYBV5yETQ65k?=
 =?us-ascii?Q?+EwJAWtqy36xzxliNkH9vrsx3GZSDGvRbgawVkQIYWNWzw9dq9cd+b1Xk8Zw?=
 =?us-ascii?Q?SJPpKMxYME/zJTUp//S/i+mu7dSKCVpvEe6vHQm/syVPBqB7/N588ubSPv6u?=
 =?us-ascii?Q?V1b7txhgMkBeg0gMY9xoBHRkLhw5tAG1eTpEvBUxlc0ChXltiJ/6v1QWahyj?=
 =?us-ascii?Q?scxJQlg2BUNP4iKOXCvKDVm7/kRiJ/WcmeQOzC0pGJ4T3F9XWnQg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c13eeb64-248e-48db-c981-08de5892e17e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:15:00.6170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jG+02MUeyx6I/SiKbyxByoWZHH6CJv/EcQmVxTHS4UsZBShH9EMJW2d++l+qxd14pC2f5pjY0O+/6bs6WSIZCykwDwTB4zFOpYnp5WgZFFDWnZLnEE0D57sQ0Qh4rld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

On Wed, Jan 14, 2026 at 12:29:19PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add 2 tests small-multiqueue-priority and small-multiqueue-priority-cm
>which sets priority for multiqueue.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_evict.c | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index bcf13b8cf..2f23538fc 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -21,6 +21,7 @@
> #include "xe/xe_query.h"
> #include <string.h>
>
>+#define XE_EXEC_QUEUE_PRIORITY_NORMAL   1
> #define MAX_N_EXEC_QUEUES	16
> #define MULTI_VM			(0x1 << 0)
> #define THREADED			(0x1 << 1)
>@@ -30,6 +31,7 @@
> #define EXTERNAL_OBJ		(0x1 << 5)
> #define BIND_EXEC_QUEUE		(0x1 << 6)
> #define MULTI_QUEUE		(0x1 << 7)
>+#define PRIORITY		(0x1 << 8)
>
> static void
> test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>@@ -89,6 +91,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
> 			};
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>+			if (flags & PRIORITY) {
>+				struct drm_xe_ext_set_property mq_priority = {
>+					.base.next_extension = 0,
>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>+				};
>+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
>+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>+			}
> 			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
> 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> 							     ext, &exec_queues[i]), 0);
>@@ -279,6 +290,15 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> 			};
> 			uint64_t ext = to_user_pointer(&multi_queue);
>
>+			if (flags & PRIORITY) {
>+				struct drm_xe_ext_set_property mq_priority = {
>+					.base.next_extension = 0,
>+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>+				};
>+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
>+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>+			}
> 			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
> 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> 							     ext, &exec_queues[i]), 0);
>@@ -540,6 +560,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * @small:			small
>  * @small-multi-queue:		small multi queue
>+ * @small-multi-queue-priority:
>+ * 				small multi queue priority
>  * @small-external:		small external
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>@@ -571,6 +593,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * @small-cm:			small compute machine
>  * @small-multi-queue-cm:	small multi queue compute machine
>+ * @small-multi-queue-priority-cm:
>+ * 				small multi queue priority compute machine
>  * @small-external-cm:		small external compute machine
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>@@ -714,6 +738,7 @@ int igt_main()
> 	} sections[] = {
> 		{ "small", 16, 448, 1, 128, 0 },
> 		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
>+		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
>@@ -740,6 +765,7 @@ int igt_main()
> 	} sections_cm[] = {
> 		{ "small-cm", 16, 448, 1, 128, 0 },
> 		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
>+		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
>-- 
>2.43.0
>
