Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9183CFA454
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 00:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DCB10E7DE;
	Fri, 21 Nov 2025 00:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdjNAiWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CBD10E7DE
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763685007; x=1795221007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dNZfDiKADsGZDuXWnBS77JewQbfY4AlVXJnc6Ag2Hw4=;
 b=ZdjNAiWKGBKAipeTXtSyBaDvWKtrqgj8Blx4Nh0m5L0o5eOcnPYCLGSO
 AZoALsGpFmFQCorm8GGFx2dKI/pQpL/1fLQrDkXhHsX3OkDi5dlOl7dFG
 PniVERgGTRfGqMsXzvkq779IUwjTAqDNtm/HHOAFjflqNzmXIAsSzR6RG
 aRREWqROhFB7TDvE5VqhgO5zuj5OyI0sAgcZO2HvZA/DbpuM5xUeEnKxj
 rJ54D98RkInMCpPmFng6zZFW+mDaRatRdhZZqxSKI2o9XJVBoTpfSej8s
 D5q9bOpKPic7rDinCMZXyQ3UUT6Uu02i2wWcURH3wLpMfJm5P3b3Q2sGW A==;
X-CSE-ConnectionGUID: pHwCLehCTC+0TFT6Cdgf+g==
X-CSE-MsgGUID: DM5PY7SZQ2+as1ImB7tYBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65470682"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65470682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 16:30:07 -0800
X-CSE-ConnectionGUID: z+bPtQvzRFSagZwivT7Ujg==
X-CSE-MsgGUID: Z9W/VIr0T+aswAwymwB3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190749014"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 16:30:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 16:30:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 16:30:06 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 16:30:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1y5fbUcARH4LGisDuxhcmCcpyVNdacSX5YoZOFXtLdPimtnCzMMl34t3pFf0auyJNzF1jKjiQNElrX2ZB3OIp1qATKQPyFyB5ABZTcuyT7i99lm8XzIuXhlr2adLCmVZ4iZ6eJzRMdBCTOFEsK4HPpuW2TzIs2ADNAoXuUj5Ff5zAgxkIwZ94oe9TvfbRLM6oOtV1OQuKmIAMQoiPY8tUk4oXNaUW9EcHib+hroVbEhzRxOz/6UJi55A5pXYciwUfiRuzLuJ7OKe82eIw3SGnTZwPizKsRANQbljpJap2IU+/5UwI0knKKMiheC0a7yuXqY5wn14jHsEazLb0lnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wefxyLQ7x0hvhxpVkHpaUlGr1kFuFsrRnlqVdZtzf+8=;
 b=ZjhDFS/He7oIajHfpKXJytNlYGe25aF3A0vY1QU2+B0ABhzbLWNMRTV93ZH/ZLyQqKe2/PMy1EKWHkYnbO7wSzEfo4dAIw/pI7HG6xgTX6lw2flG7bWb1ycVXTejn2KRQaAgK6Ak22h1751xdk1aStqIlx2teG2VYZOM3mkczO0T6oCjPbeCSI+GVSZ7wT+cHfYwKHslOhA9DeNUC4fuWLqFRQZBsKVlvLzXhhIX2gBIqg6cdRJN7aQGwGu2tU5jhf8poJuHHYqH+g6FMVqkrADEmzF7OKumyAXJrv0JFLjeXJdG8XgqZvtUZDhZvMKsZgNQNS7thCoieAa042MZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 00:29:58 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 00:29:58 +0000
Date: Thu, 20 Nov 2025 16:29:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
Message-ID: <aR-yg7TA1vGQqrbE@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-16-niranjana.vishwanathapura@intel.com>
 <CH3PR11MB8434BD6B791069E1740E89618DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
 <CH3PR11MB8434D492B61A7BDECA059FE48DC7A@CH3PR11MB8434.namprd11.prod.outlook.com>
 <CH3PR11MB8434E45870DE6E4741EF52C18DCFA@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8434E45870DE6E4741EF52C18DCFA@CH3PR11MB8434.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5ff2f9-407e-4894-e2a1-08de289519cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kwnv0zaDg5OsUx7TgnI1YOf8oyCqq1ekx/AVHFNW2M/AxBVYBeGBh0j9azFQ?=
 =?us-ascii?Q?n1nFM8a/98FwsIh3qeYt48RBsMDS10ABroZJN5lyKKYUpfpfeq2AvwOEe6GF?=
 =?us-ascii?Q?/XhP7yQnHUVzOB7fypPXOjyVvOpFyhTJTWN6Aq/V5wAwOxEb7Uc/5s+W0jup?=
 =?us-ascii?Q?7wT/bUDjqQouTRQfqK6md9mTcgfRT74LymuBecV4ykehlQTYo1VcGl7/+LH8?=
 =?us-ascii?Q?xvEFgUrVkS2YjqMVy1pnKW5yoCU0y7UlkeIrGCqqeaM3zb5w1Lk81XhSpi5I?=
 =?us-ascii?Q?jNy2u+Z6f9QhXdefw9BKGTKTGirtJmgAkcfs/N1Fe/2H/D4OPNuK8fpQcnPa?=
 =?us-ascii?Q?HJGQp4uadCLcmjAEN0ZSp2m15+di9YNN3zeCq5aP9LpBG7DEoiG4vBO0lqAF?=
 =?us-ascii?Q?F4rIs3IDTBEW9O++Yo2iPsDgJjWN5sDw4KiNZylYEfveEnpS1BT3iBZX5rE8?=
 =?us-ascii?Q?nMQWaQjUCgCrIx8D+I5tzWjbVv5XIOfwPcJpnK6sc8n9KF8x+cSUiIu7ADeU?=
 =?us-ascii?Q?OLl1+9LE1Eu0mzsnyX3lwZJtRqZPe9uWMbt+T1Rp6epjy1vINbaGdUd6q9Aa?=
 =?us-ascii?Q?dcLg5OqTfFHV/cUvP7IOy9rx9z0rKnvtKZXsPfhH1cm5SPAR6YVJQOM2nt08?=
 =?us-ascii?Q?0rski4QSlFFmBtchDZEvETEgZTc3x3fhWhQsHNBbEpvTirOrjQ/t10SjZDTh?=
 =?us-ascii?Q?Ci+S3+UOY8D9gBDNTepboO3F3mXsYi2yIkwl66A0sdPJRx5sufb8JhFpB+6O?=
 =?us-ascii?Q?f2gMmSi9rK0Ho66+lHnL1XuKatU6qPpVG9cyhhTvEH3+hh6grPtlieAwfJgR?=
 =?us-ascii?Q?FcbsmJNL/FUCvYL+LjFDqZAdJErRtLrmV+jx9Tfy7Db5JV6J0yLq0ReoS0Xx?=
 =?us-ascii?Q?ETKxIBVApbb5HzhhrO4E1BNY71qBeox5AIdmJcbJBzRDKTmB5VxkcLi3l+ha?=
 =?us-ascii?Q?+2XBy7dn47yckbHb+NwWBjPejEdKN2w2aO6IPtgXtmg1qrdhQ/bq+0MuwVbR?=
 =?us-ascii?Q?vdOdIh1sS9FSEjSCEW4tW7xgG71zKGSKx6aWKx25N8nV8Pu4EKSXdLSGquyX?=
 =?us-ascii?Q?K8giBT0bDHPJGpvawj8p6vSRXXxW6HL7us055czP+PjLSNVNsgOC6PXMIOTb?=
 =?us-ascii?Q?0hmi5Oox/I5HmsgZCnXYyRyIlvv02AF4D3XMGbCDNZqNzQdRzbcWq6LYz4Qd?=
 =?us-ascii?Q?hNEwWTLK/Jv6As9pHRtLq8/ZRJCSsyrJoToRzuqnuMYyPmeXXSPTTsB+7lCr?=
 =?us-ascii?Q?xyIYj+wx1t3LnjW80ZnyNFt6rQtQv4SZBbndtiMkuKLVXjcYEp1cJgO9VOQk?=
 =?us-ascii?Q?pMSviC88WIBPphufnQPe9RV3sg5ZBG64iNyhCiRmzYRxm0dxe2oXiQIAR+lu?=
 =?us-ascii?Q?kGalOMtDKjkTHFVmu661/yjciFdbPsy4miwBej8XIDxZnSBUqZyS3xgQwicq?=
 =?us-ascii?Q?qVIqZooN/6ZYB2hzetQ30zmHjecl/C54?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9JnyCf6v0vGdCvvcr2hpPEvRRBqWDF3U519H30u/j+GMNgo56zkWGHoZof0X?=
 =?us-ascii?Q?6i3rWtsyKmHHVVi/Q3fS76OEC4Z2v6JTGly/vsOjQKJ6xGI6E2VmeZ41baim?=
 =?us-ascii?Q?af5dGHCh31k2X/mLCWVxiqmjDhrDlS/drQK08kaAJ/x9Nn5Z8ppe7k/l0OQ/?=
 =?us-ascii?Q?4oV6IEeFNEDnfqAkBwKsXX3OCDN8VDL68NNvv2Dhmi7mVAucqhyt6uJ6U8+9?=
 =?us-ascii?Q?Q9Nrh9DpRBhFRKDvaqqICSebFQh6UO9dpUozYpLbbXQt1d+fIHpFjmvzCQDV?=
 =?us-ascii?Q?Hz2lgGkeo+URES8pq9HIlxNYOgnNnC9xIAHovRefYjdftTjS/iWeEKSVvO5c?=
 =?us-ascii?Q?G3MctvxucYUIi5L3GrWN4Q/WBGRI2/ct5K2CpXBoSwElUzJDCRUxQxeQ2zbd?=
 =?us-ascii?Q?QmzW8ProYpwpxIihkF/stjstJXRMABdpLd57pigqneNBd9tPzdDEJ92hONcK?=
 =?us-ascii?Q?K5mIGBEmpXcNhPZlLv8M/cQYFzDY7TLrTa1GWJPTsW8eYo4njJrYf6hHc0eA?=
 =?us-ascii?Q?MYygziRzd+KvP+IiVkCkbgoAFjKGkS+5VrFsv8XrSetPpvpKTcx7MGXLcMMC?=
 =?us-ascii?Q?Mmm0h9m8pUgqVmWMnoR/tGupAJ/ypVTxuvhka9GfctJN+ovwgN7qGFFTcSxW?=
 =?us-ascii?Q?2zk0raOvlNpFhlSJWRu29FKaORWHytvGKYgbMyt0DhIGI4xcClGgYtAjxJRU?=
 =?us-ascii?Q?ZArfG0M6d6TrWrfoTvZC9yXqEjGeq5RQ9UFo1yztwUd/I2Y+W1Qjptr/RnXb?=
 =?us-ascii?Q?C43Uuo1m7ZtynEw7QM0nPKE6OFB9bm7cI52eGRbuLxyDKeO2MpBoNmM+cO1/?=
 =?us-ascii?Q?61GWK8yIM2PfHQhRjoxU6lRel0fdUZd7Lx7SgmPlUK1ZBzAdxfO3T0XzG02+?=
 =?us-ascii?Q?d+lXWDDwZT5bhtgqlV9/9JlWYmSrxF8te2I/olaoMeigNhQE77Mg5Y2HkeCp?=
 =?us-ascii?Q?sJ/BKm7cEi0vREaoDP9CW19IBAYoN0OuX0SL1PIPYDAp7SpwJFDcWMJsorIf?=
 =?us-ascii?Q?B1Dj8cQl+Lf+vup+1x0DOon9crQNTtb+zMshm9zm7NY694uzlMdhjvWQ5tsV?=
 =?us-ascii?Q?Kb/tj8tA1C9J522okj3Iw/cIlsAQbcaGp6R0H9OLnPnDS9amuFn54+izYm6T?=
 =?us-ascii?Q?spt9rt+BQJ/hzAh9OnjDVxMDpr7svlPPZGTrwHKubey1Vcq23Um85LYKnAXb?=
 =?us-ascii?Q?10aNNCd7w/oxiNMkBd2WuuozhAoJTSZREVNoD8bdp44h9OmN0yQLtBK7VAet?=
 =?us-ascii?Q?heiO1ES58ZVo0I3FYSgCsmauUTdGse7S9ABHR5H6PARzl7i3vbb/PSnCPEGy?=
 =?us-ascii?Q?/WzUO/ZqHxjRnfnb1ZBWzxo0gVR5fr1SQoTg522VXDhC/zD80+VSX6mfnHwi?=
 =?us-ascii?Q?N/ePOrwMmbo3nbASLfQHZPneCM/J0i+0y/eMzeBwyOfmfnglTWoCcz1+er4n?=
 =?us-ascii?Q?wJJJ3aXHd0jiRR1aUD1HbKu6R4ccP0nGEKCfd0MFTV5D/PD3LprL1hgkJbkQ?=
 =?us-ascii?Q?imzDdw8yIdFF02CE8Yfc0/SX0NDHfFltuKVfVSYRs9mM0TJAW7FFlDmZaTyg?=
 =?us-ascii?Q?eijSp4vnLfbn2H27NHtxBQVSZEjR2IVg2N7m3B7mUVZ3rwRKzWgP88hPJz0j?=
 =?us-ascii?Q?3R2q8HRW122wrZdlJEyMbrM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5ff2f9-407e-4894-e2a1-08de289519cc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 00:29:58.3773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slM4ZMDth1GqUPDDpVGG0ZNo+nxASyMI9UxdD5TGtAb488BOGIoC1FMS9sH7SOHzYIrPgSvhzKRdA6A48F5nWU2sIpQNVGbjSgxuexRh5k15VrbuMOpC4cm7U+1d6VzQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Mon, Nov 10, 2025 at 10:49:12PM -0800, Dandamudi, Priyanka wrote:
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Dandamudi, Priyanka
>> Sent: 03 November 2025 03:50 PM
>> To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
>>
>>
>>
>> > -----Original Message-----
>> > From: Dandamudi, Priyanka
>> > Sent: 03 November 2025 03:49 PM
>> > To: 'Niranjana Vishwanathapura' <niranjana.vishwanathapura@intel.com>;
>> > igt-dev@lists.freedesktop.org
>> > Subject: RE: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
>> >
>> >
>> >
>> > > -----Original Message-----
>> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> > > Niranjana Vishwanathapura
>> > > Sent: 01 November 2025 12:06 AM
>> > > To: igt-dev@lists.freedesktop.org
>> > > Subject: [PATCH 15/18] tests/xe_exec_multiq: Add priority test
>> >
>> Name here need to be changed to xe_exec_multi_queue and same thing
>> > need to be followed for patch 16.

Ok.

>> > >
>> > > Validate intra queue group priority setting.
>> > > Validate that a higher priority queue in a queue group can preempt
>> > > the lower priority queue of the group.
>> > >
>> > > During a queue switch, the currently running queue is always
>> > > switched out without regard to its priority.
>> > > The priority is only a factor in determining which other queue of
>> > > the group will be scheduled in.
>> > >
>> > > Signed-off-by: Niranjana Vishwanathapura
>> > > <niranjana.vishwanathapura@intel.com>
>> > > Signed-off-by: Xin Wang <x.wang@intel.com>
>> > > ---
>> > >  tests/intel/xe_exec_multi_queue.c | 212
>> > > ++++++++++++++++++++++++++++++
>> > >  1 file changed, 212 insertions(+)
>> > >
>> > > diff --git a/tests/intel/xe_exec_multi_queue.c
>> > > b/tests/intel/xe_exec_multi_queue.c
>> > > index 7aa5acfdd..9cd4a7a16 100644
>> > > --- a/tests/intel/xe_exec_multi_queue.c
>> > > +++ b/tests/intel/xe_exec_multi_queue.c
>> > > @@ -13,15 +13,20 @@
>> > >
>> > >  #include "igt.h"
>> > >  #include "xe_drm.h"
>> > > +#include "igt_core.h"
>> > >  #include "lib/igt_syncobj.h"
>> > >
>> > >  #include "xe/xe_ioctl.h"
>> > >  #include "xe/xe_query.h"
>> > > +#include "xe/xe_spin.h"
>> > >
>> > >  #define SIM_MULTIPLIER	100u
>Code related to simulation can be removed.

Ok.

>> > >
>> > > +#define XE_EXEC_QUEUE_PRIORITY_LOW	0
>> > >  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
>> > >  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
>> > > +#define XE_EXEC_QUEUE_PRIORITY_MAX	3
>> > > +#define XE_EXEC_QUEUE_PRIORITY_N
>> > > 	(XE_EXEC_QUEUE_PRIORITY_MAX * 2 + 1)
>> > >
>> > >  #define MAX_N_EXEC_QUEUES	64
>> > >
>> > > @@ -33,6 +38,7 @@
>> > >  #define INVALIDATE		(0x1 << 5)
>> > >  #define FAULT_MODE		(0x1 << 6)
>> > >  #define SMEM			(0x1 << 7)
>> > > +#define WAIT_MODE		(0x1 << 8)
>> > >
>> > >  #define MAX_INSTANCE 9
>> > >
>> > > @@ -210,6 +216,208 @@ test_sanity(int fd, int gt, int class)
>> > >  	__test_sanity(fd, gt, class, true);  }
>> > >
>> > > +static void
>> > > +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>> > > +		unsigned int flags)
>> > > +{
>> > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>> > > +	struct drm_xe_sync sync = {
>> > > +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> > > +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> > > +		.timeline_value = USER_FENCE_VALUE,
>> > > +	};
>> > > +	struct drm_xe_exec exec = {
>> > > +		.num_batch_buffer = 1,
>> > > +		.num_syncs = 1,
>> > > +		.syncs = to_user_pointer(&sync),
>> > > +	};
>> > > +	uint64_t vm_sync = 0, addr = 0x1a0000;
>> > > +	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
>> > > +	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
>> > > +	uint32_t vm, num_queues, queue_priority_max, bo = 0;
>> > > +	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>> > > +	int64_t fence_timeout;
>> > > +	size_t bo_size;
>> > > +	/*
>> > > +	 * Q1 - Q6 are used for the priority test.
>> > > +	 * Q Priority = id % 3
>> > > +	 * 	QID	Q1 Q2 Q3 Q4 Q5 Q6
>> > > +	 * Priority	 1  2  0  1  2  0
>> > > +	 * The Priority 1 and 0 are the same priority so hw should pick Q
>If 0 and 1 are considered same priority then why are we defining it as low and normal, just normal is not enough?

Architecturally they are separate. It is just a current platform limitation
that it treats LOW and NORMAL as same. But it may not be in future platforms.

>> > > +with
>> > > priority: Q2, Q5, Q1, Q3, Q4, Q6
>> > > +	 */
>> > > +	int expect_order[] = {0,2,5,1,3,4,6};
>> > > +	uint32_t already_in_order = 0;		// bitmask to record Q started
>> > > info
>> > > +	struct drm_xe_ext_set_property multi_queue = {
>> > > +		.base.name =
>> > > DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> > > +		.property =
>> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> > > +		.value = DRM_XE_MULTI_GROUP_CREATE,
>> > > +	};
>> > > +	uint64_t ext = to_user_pointer(&multi_queue);
>> > > +	int i, j, sleep_duration = 1;
>> > > +	void *bo_map;
>> > > +
>> > > +	queue_priority_max = XE_EXEC_QUEUE_PRIORITY_MAX;
>> > > +	num_queues = queue_priority_max * 2 + 1;
>> > > +	igt_assert(num_queues <= XE_EXEC_QUEUE_PRIORITY_N);
>> > > +	igt_assert(num_queues <= 31);
>Here already the first assert is checking for num_queues <= XE_EXEC_QUEUE_PRIORITY_N then no need of next assertion
>As it is not adding up anything in comparing it with 31.

The test uses bit mask where each bit represents a queue.
This assertion here ensures that num_quues is not more than the
number of bits in the bitmask. I will replace it with,
igt_assert(num_queues <= sizeof(uint32_t) * 8)
That will more more readable. Though we are within this limit,
it is good to check for such overflows.

>> > > +
>> > > +	igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
>> > > eci[0].gt_id,
>> > > +		 eci[0].engine_class, eci[0].engine_instance);
>> > > +
>> > > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> > > +	bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
>> > > +
>> > > +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>> > > +eci[0].gt_id),
>> > > +
>> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> > > +	bo_map = xe_bo_map(fd, bo, bo_size);
>> > > +	for (i = 0; i < num_queues; i++)
>> > > +		spin[i] = bo_map + i * sizeof(*spin[0]);
>> > > +
>> > > +	/* Use the default priority for Q0 because we are explicitly
>> > > +waiting for
>> > > it below */
>> > > +	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> > > +	multi_queue.value = exec_queues[0];
>> > > +
>> > > +	if (flags & DYN_PRIORITY) {
>> > > +		for (i = 1; i < num_queues; i++)
>> > > +			exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>> > > ext);
>> > > +	} else {
>> > > +		struct drm_xe_ext_set_property mq_priority = {
>> > > +			.base.name =
>> > > DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> > > +			.property =
>> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> > > +		};
>> > > +
>> > > +		multi_queue.base.next_extension =
>> > > to_user_pointer(&mq_priority);
>> > > +
>> > > +		/* Create secondary queues with increasing order of priority
>> > > */
>> > > +		for (i = 1; i < num_queues; i++) {
>> > > +			mq_priority.value = i % queue_priority_max;
>> > > +			exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>> > > ext);
>> > > +		}
>> > > +	}
>> > > +
>> > > +	sync.addr = to_user_pointer(&vm_sync);
>> > > +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
>> > > +
>> > > +	fence_timeout = NSEC_PER_SEC * (igt_run_in_simulation() ?
>> > > SIM_MULTIPLIER : 1);
>Simulation code is not required and need to be modified.
>> > > +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> > > fence_timeout);
>> > > +	vm_sync = 0;
>> > > +
>> > > +	for (i = 0; i < num_queues; i++) {
>> > > +		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
>> > > +
>> > > +		xe_spin_init_opts(spin[i], .addr = spin_addr, .preempt =
>> > > true);
>> > > +		sync.addr = spin_addr + (char *)&spin[i]->exec_sync - (char
>> > > *)spin[i];
>> > > +		exec.exec_queue_id = exec_queues[i];
>> > > +		exec.address = spin_addr;
>> > > +		xe_exec(fd, &exec);
>> > > +
>> > > +		/* Wait for job on Q0 to start, allow other queues to run to
>> > > completion */
>> > > +		if (!i)
>> > > +			xe_spin_wait_started(spin[i]);
>> > > +	}
>> > > +
>> > > +	/*
>> > > +	 * Wait for jobs to get submitted to hardware.
>> > > +	 * On simulation environment, we need longer wait
>> > > +	 */
>> > > +	if (igt_run_in_simulation())
>> > > +		sleep_duration = 4;
>In upstream, simulation code is not required.
>> > > +	sleep(sleep_duration);
>Is there any other option like fence be used instead of sleep?

No, there are no event notification upon job submission to HW.

>> > > +
>> > > +	/*
>> > > +	 * Expect the job on other queue to not get scheduled while the
>> > > spinner
>> > > +	 * on q0 is not waiting on preempt condition.
>> > > +	 */
>> > > +	for (i = 1; i < num_queues; i++)
>> > > +		igt_assert(!xe_spin_started(spin[i]));
>> > > +
>> > > +	if (flags & DYN_PRIORITY) {
>> > > +		/* Assign increasing order of priority for secondary queues */
>> > > +		for (i = 1; i < num_queues; i++)
>> > > +			xe_exec_queue_set_property(fd, exec_queues[i],
>> > > +
>> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> > > +						   i % queue_priority_max);
>> > > +
>> > > +		/* Wait for priorities to take effect */
>> > > +		sleep(sleep_duration);
>> > > +	}
>> > > +
>> > > +	/*
>> > > +	 * Trigger a queue switch by making the spinner on q0 to wait on
>> > > preempt
>> > > +	 * condition, allowing job on q1 to get scheduled and finish. When
>> > > we end
>> > > +	 * the spin[0], it triggers the CFEG to perform a queue priority
>> > > arbitration
>> > > +	 * rather than a full context switch out. Consequently, in both
>> > > semaphore
>> > > +	 * (WAIT_MODE) and non-semaphore scenarios, a priority check will
>> > > occur.
>> > > +	 */
>> > > +	if (flags & WAIT_MODE)
>> > > +		xe_spin_preempt_wait(spin[0]);
>> > > +	else
>> > > +		xe_spin_end(spin[0]);
>> > > +
>> > > +	/* Wait for jobs to get scheduled */
>> > > +	i = 1;
>> > > +	while (i < num_queues) {
>> > > +		for (j = 1; j < num_queues; j++) {
>> > > +			if (xe_spin_started(spin[j]) && ((already_in_order &
>> > > (1 << j)) == 0)) {
>> > > +				start_order[i] = j;
>> > > +				xe_spin_end(spin[j]);
>> > > +				xe_wait_ufence(fd, &spin[j]->exec_sync,
>> > > USER_FENCE_VALUE,
>> > > +					       exec_queues[j], fence_timeout);
>> > > +				already_in_order |= (1 << j);
>> > > +				i++;
>> > > +			}
>> > > +		}
>> > > +	}
>> > > +
>> > > +	/* While ending spinner on q0, bring it out of preempt wait */
>> > > +	if (flags & WAIT_MODE) {
>> > > +		xe_spin_end(spin[0]);
>> > > +		xe_spin_preempt_nowait(spin[0]);
>> > > +	}
>> > > +	xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
>> > > +exec_queues[0], fence_timeout);
>> > > +
>> > > +	igt_debug("Order\t Actual\t Expect\n");
>> > > +	for (i = 1, j = 0; i < num_queues; i++) {
>> > > +		igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i, start_order[i],
>> > > start_order[i] % queue_priority_max,
>> > > +                         expect_order[i], expect_order[i] %
>> > > +queue_priority_max);
>> > > +
>> > > +		/* The priority 0, 1 are the same, so we can skip the
>> > > comparison */
>> > > +		if (expect_order[i] % queue_priority_max <
>> > > XE_EXEC_QUEUE_PRIORITY_HIGH &&
>> > > +		    start_order[i] % queue_priority_max <
>> > > XE_EXEC_QUEUE_PRIORITY_HIGH)
>> > > +			continue;
>> > > +
>> > > +		if (start_order[i] % queue_priority_max != expect_order[i] %
>> > > queue_priority_max)
>> > > +			j++;
>> > > +	}
>> > > +	igt_assert(j == 0);
>The above assert fails if any of the ordering fails and doesn't give the details which one failed,
>can it be mentioned in the above if condition with debug print and then assert it.

The test is already printing the actual and expected orders above.

Niranjana

>> > > +
>> > > +	sync.addr = to_user_pointer(&vm_sync);
>> > > +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
>> > > +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> > > fence_timeout);
>> > > +
>> > > +	for (i = 0; i < num_queues; i++)
>> > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
>> > > +
>> > > +	munmap(bo_map, bo_size);
>> > > +	gem_close(fd, bo);
>> > > +
>> > > +	xe_vm_destroy(fd, vm);
>> > > +}
>> > > +
>> > > +/**
>> > > + * SUBTEST: priority
>> > > + * Description: Validate queue priority setting
>> > > + * Test category: functionality test  */ static void
>> > > +test_priority(int fd, struct drm_xe_engine_class_instance *eci) {
>> > > +	__test_priority(fd, eci, 0);
>> > > +	__test_priority(fd, eci, WAIT_MODE);
>> > > +	__test_priority(fd, eci, DYN_PRIORITY);
>> > > +	__test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE); }
>> > > +
>> > >  static void
>> > >  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> > > int num_placement,
>> > >  		  int n_exec_queues, int n_execs, unsigned int flags) @@ -
>> > > 708,6 +916,10 @@ igt_main
>> > >  			xe_for_each_multi_queue_engine_class(class)
>> > >  				test_exec_virtual(fd, gt, class);
>> > >
>> > > +	igt_subtest_f("priority")
>> > > +		xe_for_each_multi_queue_engine(fd, hwe)
>> > > +			test_priority(fd, hwe);
>> > > +
>> > >  	for (const struct section *s = sections; s->name; s++) {
>> > >  		igt_subtest_f("one-queue-%s", s->name)
>> > >  			xe_for_each_multi_queue_engine(fd, hwe)
>> > > --
>> > > 2.43.0
>
