Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72ABCF9C5F
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 20:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE1410E2B4;
	Fri, 20 Sep 2024 20:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSL5Xg3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485410E2B4
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726863654; x=1758399654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9bgM6hp9SZyZtMFT7gFr4Szc1g/puVxX66089fld3ug=;
 b=BSL5Xg3sn8gOUCzNP+/aLk2zmSbu4lxjD2LdeQ1tzLMP4LM0aFVBzi5/
 bGYmw4RB7IRf1H67gn2tRwCQ07sIbTkFWhzWCyJNQ8diUFPbAhKPRzqrG
 Nod3bEcS9djn7Fzsl/Ss3SPd8ojtSa+xOKQZM3wm7DbHwKrqQ+6WGG0Oe
 tYTRnk5stavb0yFTva6iHNOlhRC1kHfUtNTM7tlpDF6HjJbAabBZKJW+d
 nAc13ZXO6l+hWB8zjQ+5XxslofVWtpi+UYu7ar98t2+WPqGrtogWSeSaU
 HH5dgcPKqpbFCApPyrijdPl48Yzd3+7u8WVSacINkUmKJJu2TAXWQlFxc w==;
X-CSE-ConnectionGUID: YHx6Wy7wQUCZUKm0SmHklQ==
X-CSE-MsgGUID: m7fqg2lvRvCtJfrZ0wQTjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="51305860"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="51305860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 13:20:53 -0700
X-CSE-ConnectionGUID: uTBB/qKLTfeE9NHwoYR20Q==
X-CSE-MsgGUID: mdlFBbkQRM2bk3IrbeAxgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="101267431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 13:20:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:20:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:20:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 13:20:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 13:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFFR1syHq2ZORqBEBy2MPCxE+nBq3rY4mCm4Gb+bQxCvCl9J6hhg3Nl4MgfGxndeY9+iiBDLsTx9yHnmqipF3ri4We9NuLW1P6Ow9rqJKN99f1FZJkqdbQMxlGBEfdI0z2v5A6ZH9gpTx7GKEFVsHFXITBd02Xd7Ose9NBlMyeHK9tX75WPnNwGuk4Hwx0b+2qspOs7weSe4dBK3DaK1pfofMFivebkip/bVAcg6mkR5uKYsWzxgTt3kQO2pEMmeI5tZKs5eVeish1DCvppbfLlWaCgBIyQLVrj25PBsAuCWD2v7uR770E3PZRSPIz4WYSNqqT9syli52N8fAJIhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tf3JCuxXVOftZqUC9tJEb9gOxIbva61dKbyUVmIRcI=;
 b=HJHTJynsjGnh2OCZDYdYkutKA1inC64fXrHI+KBVrRbbDUEY3i6u8UR2HioJn2PGMqRtuRHwLqLi6QhmDe3h5GKVIMGp5oIxrND7mSLFgL9w9Go9Q+F0YpYSg7ONVjOphCJcrPaMJ/M58y4IUrzmSxa87y7MbYhrSIPDzonQBv8rpXl/dM+K1s9Tl3TET5NjW4Y5NK5EWR5ugp45ur5DZvZ+j8GYhm3jqHQWpglt51tiiqW+AVyamB5XEdc2Mtzr1eEB8y0vqEKZSGbN5QJcrbVp9a0FOHObSNnbdi0wHW7S4ic5oWbkB0Sz3dw7JSRjo7bq9+c+cPg0Z7AKYNGIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 20:20:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 20:20:45 +0000
Date: Fri, 20 Sep 2024 15:20:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/6] lib/igt_gt: Document fd argument in
 igt_open_forcewake_handle()
Message-ID: <ne5yal7ufibss3elyislgzywbyzsvoxcnqmv3bfh4ksyk27e4u@sfj5lh2aewf3>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-3-lucas.demarchi@intel.com>
 <20240920171514.GN5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240920171514.GN5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 1365af8e-b19c-4df4-c83a-08dcd9b1b52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mPOjbygBh30STT+Mu9Z+DopPI9dJDJgnnPo5vHg0D24p/n7qCFM5MOsVJ64l?=
 =?us-ascii?Q?yEvNG6SULKlfyR51+cBaYUyd00p/GP4DQLMpNhwvgcVS9QofDbJ3ZsvDd/Ey?=
 =?us-ascii?Q?fYusmANKCiNJ/l9/rfOMWrnBHV+VMSW1/N6WkPG1+RDiFQQFu2ogBxCe8Oys?=
 =?us-ascii?Q?gSN43hb7TkKxJEfEFMCE0EK3Gixufqv9KB+IR4v4FyQuibAgwI2UtE1cPDNy?=
 =?us-ascii?Q?Qmp8A2G/2W+9kcARMrv6Unu4QwRMVcxnwXpslxjoCkr6mVSl3xca8Aun+N90?=
 =?us-ascii?Q?xca+fZzUD7h8jVmdmvIhEp8zyQVbFNffBhOrODJvaxHoy9p2GC/KpucfT4h4?=
 =?us-ascii?Q?5YWORVeqDqELSWYhp6XEGgXfVLqoe/eo2KmGiNojpSK4yCTFXvvI2ERLcAim?=
 =?us-ascii?Q?ZAKwjFT0vNVcamq12WfSlF3Wn44H0RFbBTlOqWank8pRQe4/vZavrci0RCre?=
 =?us-ascii?Q?V2aJd+jLNOXWjLrt/7c800pXSrKNnn/UOSvcidfRojabABfZpV2iYpfztV5P?=
 =?us-ascii?Q?jLN2hAov4sNJwbhGeA4lwnjXnGOgDYL1WPiBf8YzlJfg2shC7UIHhMrKQsoi?=
 =?us-ascii?Q?XLaY0+BC4u1WQYZtZz5zKHQktHqblWwmAu/nggZHkvWVu9ALe99zDIMHcxEG?=
 =?us-ascii?Q?gNQC28Rnl5z1o4JQnkwCG1+Oxuv2qCj5vDsgzR+ujeXSbgOY3UPinW7lldWK?=
 =?us-ascii?Q?BspZXWoaGGDOUwcrZ3RkEkGKNvfgMklUCH6nh964rA0pMmF8rXW1KdqIFwr7?=
 =?us-ascii?Q?6LPtVICGtjYfrtmhjwNEl9i/1vTH8HHffGDmKrkLrd1DRlWBkzHV1xdvb07E?=
 =?us-ascii?Q?UvIw6abEJEMxLolz3z4XSIPKoVqrZXIceOYPwxjjq2necP+f/dYXYp2tkCPa?=
 =?us-ascii?Q?2SqfC6j99QUhjKWUo0yCgVtkvdVQwa85dbh/YAQ79dIc5zcv+r/HNxK4oIaP?=
 =?us-ascii?Q?kWheEp9lA/u18cEDvzhWxn45rPAu+l+P6vD/HfbtwEYlLglYG0BaPuTE5CMD?=
 =?us-ascii?Q?hmsJFLBCYsIFHsZC+G/ScLaMPnnWqXSLrdsD0xNMnNXhdDkIn5W1L44Iassu?=
 =?us-ascii?Q?a6KgobFBIZYw/hV0Tx/QxwLPt0SazdGhGtE2HCcb8EItdFDfQJPkvhwrpu3I?=
 =?us-ascii?Q?eLHdsA2ufSQt0RQ7ag2tbOvyG/igJBo030znA9ylGxnMBrmgAUvDBBisYEN2?=
 =?us-ascii?Q?xtq/4qbi90LWzrFfLcjpfAESbe/6xEvN3BmKRT28q9I62kX97wQjYAZLXpTA?=
 =?us-ascii?Q?rMmTcJkRDJblULzbmZvOjM066rv8AXaMpMhhAmGAKD8ae2EiAXYykaFsyY+d?=
 =?us-ascii?Q?/ABtllevmDR1cQGY5SOPNNKNGzzBan4bUfSaUGlSVSTJCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c7WKokAAaLhnhOTmNNjYSy5+W9+tb2Z4vScMiiYkD0Y5T2l3s6XDpnfPQ+9v?=
 =?us-ascii?Q?3l98OIqdrxOwA/i3Xu//EWmbks3kJyvBUlYym0+vnDlC3IJQ82IV412rR41L?=
 =?us-ascii?Q?0gA01sTFp1PEKPkJRr7gU6zZXvmyRBSqnZLpur2F9vr1qZx8emO72CDI6Hq8?=
 =?us-ascii?Q?ysPxC72eGw/W9Mn76vZDjcgUAD3mPViHEqTLQNSTCLWGAwiK61U39TQ2JRCh?=
 =?us-ascii?Q?q+3rEef2MuYLsePgzXyYIPwD/qG7ZLm0AD7YGedRtzM+JF2FSn08ApHdoWCZ?=
 =?us-ascii?Q?punlmNSeGC6Be75m594mPTg7RWZd7QGHq/AgROGEcV8AL+Uxp3r36YkhpMgn?=
 =?us-ascii?Q?aJ4BJwrzXPDpMX06FVu0RsQ20IU2INseS/R9s2faQt65lfiHnbneUv8XLdp8?=
 =?us-ascii?Q?AiGjYJi80F6iXv2E+iDBvHtOIADymSSwbnsJaNRbjJPtYsmXSMEhjYenYLo0?=
 =?us-ascii?Q?0xMORxVmZTg8LOqs47Nq3HGmzYuWLzICPTTZHAsLktTmFWjMrD4VctylqQ5z?=
 =?us-ascii?Q?Kvom6ZwH5tE4gb8n0/dEgVBMjNtzHmRbD5jnxq85/lmehGEqWTCUieqWL/Hf?=
 =?us-ascii?Q?u9TKj4ENviPJsdBe2jKgQzwHWt8tmb9NMLTbhv26rBf5vxBsl7Y4SVPpLlQL?=
 =?us-ascii?Q?nhGZObzGrMpb4sQkh72fYlR/T73l4ZwOCBxf2ZLKma9UHPElaNRlQ3lvTTB6?=
 =?us-ascii?Q?iET/YTWNutxjbn834Hcq7LcY7jJUdoKtn5eLVL4+0r2xlDqFFbyHEcIScImX?=
 =?us-ascii?Q?XescUaxZPxHG+26Wm1VKwXK5D/QhZsT0RUuMgnXuV1QWgkKlkxsl4bv3toF3?=
 =?us-ascii?Q?oyt2Vx5eooPSD4acpwgPBFS9N4pAZPTvQwhCtTzCtvUt/C5BNqM/tcR4XKvK?=
 =?us-ascii?Q?cnj+wYhf7nmy743Esjbu0gX7eVfmdaaQ2aBWnZ3XIv8ooM49iNOpdsGX1yoB?=
 =?us-ascii?Q?6fe/S1JgY4ET/rWSjAJ+THPJLX6nb1rdE4Z8NTCjJiBJsp2Ben/zNToNlWCk?=
 =?us-ascii?Q?KLCdPe7k0ShnYxSFNPnZkVUtOSFnhKbsoRywLsWM4azDd7gaY8zBXTyAjXDq?=
 =?us-ascii?Q?T/tGWSWIeqbujBiHKme/6/5ydKePglHlth+HGQII8U05DDqrD0+Wnr5ecccD?=
 =?us-ascii?Q?gBcnIdrZstgZzxrlSQuoCyWdPk0WLDbK2gDgG73UExNma36Dp809fBWuT4Lw?=
 =?us-ascii?Q?9JWazEVlYY2w1tmP+qlN9JOlbUDsn62gPIHpkwVtFFTfyrNxYcE427NCPDFW?=
 =?us-ascii?Q?XV7fLaduxlVZi1gs9j5knGAkcOryLBW3uH+cj1QM0mIU63IuU+8biExmnDLI?=
 =?us-ascii?Q?mQmWjUTgs+JbcdWyI3CHe6fYlh/5zjn40BR3uT2zhqtF79Nj1ZWQSlr25/7H?=
 =?us-ascii?Q?K1iR1PPw2K6+ahXkLueQQH8e/G1Bo8ocTeLxORk2q9CwQgyJ5zHv+j6XcvZ5?=
 =?us-ascii?Q?IgyDh9VCB+lPi8qUJkxzAjUi8j37g+SQ5ImY5KiQ60wm1oUQI77hrfPrbCbJ?=
 =?us-ascii?Q?xXTmnNSwNE2G6pEyvk+DLHaEimJ3i8ac5nLWWTaexIS+LjIk2F6wsZSNqUHg?=
 =?us-ascii?Q?D503lT3omTrzG7CTi39c+AB21yFTbcAarcc1c1lRIqG3QlJQsOFhNwzA/GAG?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1365af8e-b19c-4df4-c83a-08dcd9b1b52e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 20:20:45.3915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AStZgOVazfNzHaNHq6fO8K2jy1aYfc9FOCc4GAfYfTPU/533WN6aCXS2sbx/lecqWG6QOXXwY6FCY9h76i+qNN98KE8KC3QIMt6MMeSAciE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Fri, Sep 20, 2024 at 10:15:14AM GMT, Matt Roper wrote:
>On Wed, Sep 18, 2024 at 09:36:25AM -0700, Lucas De Marchi wrote:
>> Document the fd argument to make it clear what -1 means, which is
>> usually not the desired behavior.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_gt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
>> index b043e2d41..d831d2448 100644
>> --- a/lib/igt_gt.c
>> +++ b/lib/igt_gt.c
>> @@ -492,6 +492,7 @@ void igt_stop_hang_helper(void)
>>
>>  /**
>>   * igt_open_forcewake_handle:
>> + * @fd: open i915 or xe drm file descriptor or -1 to use the first device found
>
>Is it actually "first found" or is it just literally device 0 (which may
>not even exist anymore)?  It looks like if -1 gets passed down to
>igt_debugfs_path as the 'device' parameter, we just do a memset of the
>stat structure to zero it, wind up setting idx = minor(0), and then use
>the resulting idx (which should be 0) in the debugfs pathname.  Am I
>missing something?

no, that is correct. If -1 is passed, it goes to <debugfs>/dri/0

>
>It looks like there are a few places in IGT passing -1 to debugfs
>functions like this.  Maybe we should add a #define for it with a more
>descriptive name to igt_debugfs.h?

I was so annoyed by it and my thought was "this needs to eventually be
dropped". We may have been silently changing the setting in one device
while working with another one.

Now I think forcewake for i915 has always been broken for DG2. And
sometimes it may have worked if it happens to be dri/0 :-/

So I'm thinking.... rather than this patch, maybe just fix each place
passing -1 and rework it? Changing the fallback to at least respect 
igt_device_scan.c wouldn't be a terrible idea.

Lucas De Marchi

>
>
>Matt
>
>>   *
>>   * This functions opens the debugfs forcewake file and so prevents the GT from
>>   * suspending. The reference is automatically dropped when the is closed.
>> --
>> 2.46.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
