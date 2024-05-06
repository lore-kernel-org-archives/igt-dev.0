Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A759EC25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6333F10F2A2;
	Mon,  6 May 2024 20:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmpZMnj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FEC10F2A2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715028127; x=1746564127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FHzB0wFFJyxI1qKea88+R6dadwZhOm6i2kePHhnekTA=;
 b=nmpZMnj+aOBVQjboYD4BEpP8ALTcYrAWvBowHWk7Div1+UdBmAnW5fRR
 uTGeiZbdHq4MLe2jhFjkoWjg4yIIMz7lz/cHVigYC8ZW351QDzuCktGzX
 J26wS4K3H0Uv7bGPry6W+dp6jFN1W8+zUW0ops/edny8BML8gdjWMid8w
 d9dbpYo8pG6qvS1ePLvcl/JVUAZMY3MEZXzxOvsjGfXtukRfOMKGJohxe
 /SqCUGHwAoUW/EFaguI98ruBSrpNGIzdBSF13RFI+QWWTSflzssXvJTU7
 6S8RdK0pG0wztyW8Oag4oxhBJx/6yJoGmYoQOhvnCZEPjytkCCU/4oxDp A==;
X-CSE-ConnectionGUID: 2vVmcrRoQnqMA/4Ibrj7Ag==
X-CSE-MsgGUID: 6xyHfQQGRCS8JV8WiYwo9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10671438"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10671438"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:38:45 -0700
X-CSE-ConnectionGUID: +yrTrieMSv6YVjfbD5nv+Q==
X-CSE-MsgGUID: w2MD8w4SSSK+CgDJ9ztpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28263099"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 13:38:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:38:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 13:38:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 13:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODhxnOq+clHpXv0fH8jKskMbzTQddSFUBEP5HXnGp/0jfodQupBbkPLA2Bl9Ar/KMgEwtnFycvNc70QOXKpcrEn/Wz4S6+6IZd3tJQQr5xdOEaPWubDzaWdO/cf5edc78gtjNQjrgm979ZvSx+bjZ0sMjvOHrnJgHuq901DUjjECPSFc5zriIj0C/1hKhj3OTs/O0k4cv8a3horDEMVkk64wgbGG17S126l5h6q6e8z7Pfz1fHXhkjzNNeeh9SzMCLZf0kHglGExlqLq9EcVXR77zgEO9Y0R80V/GrdSi1k/jhHQdEAW+xLIk8piwyCD6DLU+lE09ZerEAYMHadF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Loj1iPlKaYMoUdIoGFptjFcH9sM0hboC8ryq7Iz82jo=;
 b=ZyQFMaWb2D25qaBZK8a1hst6oFb/0y9dsbNt0sMX2CAL8ti/5LwPRVzp1Kx7+A1GUkxbG+gucTJPiOBBUCkrmM21HKPFfqtVnSpdbemLwOB/lhD1do4thEQdj34GWozMEzVUo89boz3geiVddkvPIQMxj7sv07YEwmUNhsnqZvic/2STj33gJkW11FVF09MCONF782J4LFDdxSNYFKhdO4ZbkPzI/lsjjTEO7eRteJnEZmiQQtAO4ZLSD6rsJyH7xBbepAo4oFdjoITgikPaxkCfz2q/g7DZNBcc55SPId5+Pbaj0xm8UU4v2GlAAsYC4xc6ddHvinrWt/jAff72BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.38; Mon, 6 May
 2024 20:38:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:38:38 +0000
Date: Mon, 6 May 2024 15:38:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 02/13] lib/igt_drm_fdinfo: Allow any number of
 spaces before unit
Message-ID: <c7e6ky3yigthdiaepiejffcdc4gzhkeg42dfphmuarudbhg235@wzndtk72wrxq>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-3-lucas.demarchi@intel.com>
 <Zjk9cSpBdzyTcz54@orsosgc001> <Zjk+UJ79kIQCXfiJ@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zjk+UJ79kIQCXfiJ@orsosgc001>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: a07e73e4-b6b5-44d8-cfe9-08dc6e0c8228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fkycwcDE+isENmvlMOCsHO+orFFJpMPZlxPkneifCKLG6bhKadnN8MC44PJu?=
 =?us-ascii?Q?fJbvnlUH/uE/UQw9QcuQX1bd6MsVDuVpTD2FRhVVpK5YD5XZay0zaOufsErQ?=
 =?us-ascii?Q?fjruHGq4j2NKByUqbMxYcSmE97yUkMcxP0Rpe+5ujWVsKe83cnQFND8zTjq6?=
 =?us-ascii?Q?8D06c9lVFCA4O4NxEZfWpqx05FipHvuWj7hlr0kJiHr7ZcOi2O3r8ZLmzBS8?=
 =?us-ascii?Q?EfAEAKoD+DVsWoRn9ypWN12nbveJ0bZgeiqBAKZZKBuD+jdB3KFMqd7G1Imu?=
 =?us-ascii?Q?HaG0hPDYagq4AKTvThThswHUpCGqNRtHKKinq8BTkzNdKzlpFZspNuRITSzw?=
 =?us-ascii?Q?YhECpBz8lzXeP9Oza+GE6y2iGBsdbb4mAWlplHLiHWt1y5MtYYx8rUltc0px?=
 =?us-ascii?Q?KC6XDmqTTkrSW/gop8AvXuJNYEIjLcQAmNzDEmmJF154tzHz7xQHNSzLzU/U?=
 =?us-ascii?Q?U1NjrL6GI+WZUESMuU+CgdM0JkTxY4O8crE+fJoNTsrGqLyQRLOUdzMNw23S?=
 =?us-ascii?Q?A3mkyuzD96QHb3jMdvoUbR06hHV2ZU5DDU1Yo/UtpTynyZp6hsmMsGMhiHZ+?=
 =?us-ascii?Q?YN8DrafDC7GBtij6QQdFkFbhjIaXsgAvgV5u7jBVDmuEhhDsxKPn4/a9DFVX?=
 =?us-ascii?Q?wEVLJ8RRoWoQtRzEQr9F7kWasdPgyObVGMdSV2vOlVFcgRRiGbwwc3GgXeGz?=
 =?us-ascii?Q?ByTFHLcUUJZveeF81azEzoi5OXOiBzuhuishVT8KOaEyzh8Yk3XPsAEtpzf2?=
 =?us-ascii?Q?6CGTi7ymrOGTW6nCe7pQYH55/t8lNniuvpUQ7IWOFKhnTastkWSggcyE8R0Z?=
 =?us-ascii?Q?47Qlzt5R96ba0ECu65BCWSr/Lkv61xaCh/wxweSd5+4SBd8NERm17617r/wI?=
 =?us-ascii?Q?MWNg4dskqve2HbsF3LRdzCnmg0eZQfJ76OUnt8FoXPLhevZ1WUtZsY7AO+gi?=
 =?us-ascii?Q?x44jeLmSGtRrvOK3o2P2nXSpa9+u+nOY2w0LNAlp43VZK2sBoBOx0chtf0m0?=
 =?us-ascii?Q?7DJP6NwH2l2/iJH5QP+CSRA+8Fdnr+3X3+q0XQbyiKu2XqNGEl6yDZGENO61?=
 =?us-ascii?Q?V8aSlTPN8s2NIe/CEurM4ozs5oHhS56e+RD2bIVva/f4xTFp0vHms5n5MVpe?=
 =?us-ascii?Q?3Ec7P6ifrnPa45Czd8ZEEylrVi2MvyVidgoErHd7+/SiCZ0CzrSha1bZxOAd?=
 =?us-ascii?Q?Yzr+hjl7Q01DI8QCQq8H8TzRtUFq+ZL2KJ6uwwmN2jnO84qvH3MsocroU25Q?=
 =?us-ascii?Q?XgNoGAE+VAM/guErFhKA2ezEx+00iGXMX3vj2QuZ2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r3K77vpBU8fqkPx9orbgp7gURieNRL1Prg+ufr7ypiR652wd2+LPz/0ljcsn?=
 =?us-ascii?Q?Z2SZBt6jyPniOuZDnyX3Ja++ay9fnl8H7Q5+9oPvy9jg6wKIHoXqCf/Zltds?=
 =?us-ascii?Q?Ne9qcjFlvnx2JfzZ2tenNKHWLPu9DJd06PlbtYJKeI6uD0LxKFyvTifgmArk?=
 =?us-ascii?Q?HXpUalSjfKXOgLCimGSagVLXER/90UDUUTgw7g0SX7OxkNw/FgcBkV4nHcHT?=
 =?us-ascii?Q?12S1IGF0xjAER+svDSVGLtrl7NYapBpGpxm5ovBUCnWJQbjXXQrtqu9BAznH?=
 =?us-ascii?Q?1BpDHJvfUoV1YlzsAdfQ22+xvSYcxiAtmKm4vq1z2nh8tTK71FTf7nR0jm1A?=
 =?us-ascii?Q?1QIEijPV+YemyPUvZd8x3KVyjpCjZ864CtcfdZaxEU2oRJKRui0iD0V5gr6D?=
 =?us-ascii?Q?Ad2kD8r2iE7PSedvL/YFXmH12vIx0VK30jzrgSQnDeaJCjvojwpB+HsVXSkt?=
 =?us-ascii?Q?1RUmxWHuSwnr8ynteD7kNcPQoYOsnrKjBJncxldbTR37tkEJz3qXWEt2aRNg?=
 =?us-ascii?Q?v0NDbslM7S7JHewg/hwfs+p1uf5cs7M3bbzFCaIlfIt0B/J/rsnCZfoMifCE?=
 =?us-ascii?Q?bnK6yL2vk+L43DTtNfrF6APZSN46sDXqs8MHo4bhu95ldt/zNG0ChP5bas99?=
 =?us-ascii?Q?cVYFrQ7J/1ELAqiTLh2mwcj9Xfgb7H3+bifAXEDNmx/gBmysBS+EBW5edIni?=
 =?us-ascii?Q?aJ6YkFyroOA1VQty4mpaz9iT0bnRQTu6BHav7zF7lT4vsO5LzclTeWek3kAX?=
 =?us-ascii?Q?UoUaG8bkRMJtH2QKQyl6OHEazRSJkKwqKIkCaR8sEdWxYXstS8cND1UUx7z/?=
 =?us-ascii?Q?WW52R/jqWJLhEdojuisf8IP8Tv1/R/I3Q703xg7w5t6WH0irkSOQhqsV13R8?=
 =?us-ascii?Q?09u6zlaBFwbncs4aRr6BhkoWPfB3wd5Kymit9dW5Y54bjDLQ1Ffx1WPORfPk?=
 =?us-ascii?Q?wnbR69Z7zIVz2TeHduS3GhH+e33vnjOCm3Ax15Vh/CDM5ordICVRpMpX1Ord?=
 =?us-ascii?Q?j6+UAf+TKhmpWJgdReg3UDA0+vq9KVt0S6Hvx95VGiHAGb7Stx0YzJTlryV5?=
 =?us-ascii?Q?XRmJ+oj01wEkWyni3uxMsVr0Gkjkj0Lj924838k/k6KOq45vivg0kghfin+F?=
 =?us-ascii?Q?YvpDV7tjdkmqa9FxdsuWeNdXPTgGxgYdOffdTYDch9Jne45DW3b9J307QaMP?=
 =?us-ascii?Q?jESPU5QkVtIynSkuZ5mwiI10TeQ6gpOeXjVodn3XykwNHCztQdRnRnT15tzC?=
 =?us-ascii?Q?T4FeEVW+ODvgzN29+pkUtIGlu7NjlrFfrWiMJ5mdCpUoK86/pW+TA18u2oUh?=
 =?us-ascii?Q?M1iLowCFm2YYxgkUxHVRrpaQ8/7SiQIHAwWRmMecRbmlkPlM3Is+4d1jN4Gi?=
 =?us-ascii?Q?380ZnyRw8Q51Tvc08r3ktaw39uyYW045aEYVWLJGLw7Zf0aw/YqTRtxBmJXz?=
 =?us-ascii?Q?EarXKl/LVoqrvY5E8z4pgPxhyFR+Dfxmx3CxiMjvustebrMmbg4reaPH1Jgw?=
 =?us-ascii?Q?1MtbFhHoU1wZWE7pzzkVlWCOQiwJtqwZ7ZuFz9p8sB0f4AfD2Ol8YpUy3fO7?=
 =?us-ascii?Q?VxO0+Eg6fQAfPFpJmHpo74MkEFipGtFu9/jCea0bTh0V+kOrVmFJsRz29M50?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e73e4-b6b5-44d8-cfe9-08dc6e0c8228
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:38:38.3551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoQ0AmbQXd6D82mz7dcMZ5Z/G9YfQ1uccl2pS8rzdP5eKTN50vI3Y+eQAopd4ILrkdhpLvAMPFS7l+t+TyYZgSG2z856HRdGWmt13tAZ10Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
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

On Mon, May 06, 2024 at 01:32:16PM GMT, Umesh Nerlige Ramappa wrote:
>On Mon, May 06, 2024 at 01:28:33PM -0700, Umesh Nerlige Ramappa wrote:
>>On Fri, May 03, 2024 at 11:46:32PM -0700, Lucas De Marchi wrote:
>>>When parsing memory region, allow any number of spaces between value and
>>>unit by using ignore_space() and adjusting constness of the variables.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>lib/igt_drm_fdinfo.c | 7 ++++---
>>>1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>>index b3f6fc35a..3b2778eee 100644
>>>--- a/lib/igt_drm_fdinfo.c
>>>+++ b/lib/igt_drm_fdinfo.c
>>>@@ -134,7 +134,8 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
>>>			const char **region_map, unsigned int region_entries,
>>>			uint64_t *val)
>>>{
>>>-	char *name, *p, *unit = NULL;
>>>+	const char *name, *p, *unit = NULL;
>>>+	char *end_ptr;
>>>	ssize_t name_len;
>>>	int found = -1;
>>>	unsigned int i;
>>>@@ -180,9 +181,9 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
>>>		goto out;
>>>
>>>	p++;
>>>-	*val = strtoull(p, &p, 10);
>>>+	*val = strtoull(p, &end_ptr, 10);
>>>
>>>-	p = index(p, ' ');
>>>+	p = ignore_space(end_ptr);
>>>	if (!p)
>>>		goto out;
>>
>>I think the next line of code here is
>>
>>	unit = ++p;
>>
>>but p should already be pointing to the unit after ignoring the spaces.
>
>Looks like this is fixed in the next patch. Not sure why the next 
>patch is a fixup!.
>
>Maybe squash the patches into one and then this is

yeah.. that was actually my intention, but I forgot to squash them.

>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

thanks
Lucas De Marchi

>
>>
>>Regards,
>>Umesh
>>>
>>>-- 
>>>2.43.0
>>>
