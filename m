Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C9AC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 06:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9628B10E1BD;
	Tue,  3 Jun 2025 06:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GG3Yngvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20D10E0B9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748932672; x=1780468672;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H3uCiWewhnt9cj0s+sy1xKkg9lYoDEVDiIJfyHne2FY=;
 b=GG3Yngvodl2pSNoj8NRO5ArageXQZSTVkCHniKAb2SMBXMtzn9YyfrBK
 RREDpFD6JX1K0YUEkP4LiyNUA8VJGkL4cmUTYVYEX/Kf/5idKR+YFFzyq
 hrBtNVAVGxeTRi1J0NeYJWoxkQgCrXeoujbUsy38ndKdy15gp3Zw4/DTq
 PnNLO9O/1Vo5XBWEFfAqk8cV4KNF0A2CHZHA7uZWTDVNFeG2xAsqsytMo
 jbps7noas5Cqd0/XtCPEXbp5cxtIc9CBQnFkAWIuVFHPcCWkjl1ya7ii5
 zWxKAYZk5dHmAQQX3kTsKuvFYI/WqdpB6mIvehfyCbRmW2jOlIxrvIsyW A==;
X-CSE-ConnectionGUID: matzEcv6QwKb6GJwSF8kRQ==
X-CSE-MsgGUID: 2Mb9AvyCRTaEL4WyR2SNxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62315787"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62315787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:37:51 -0700
X-CSE-ConnectionGUID: r1pbKWOGTOO1ep3USv1Zsw==
X-CSE-MsgGUID: h7RgVL0VRQm8ksWU5il+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="149540858"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:37:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:37:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 23:37:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 23:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqyDe4LlA+weibtUZBdU6g8WetcsAFiNgiKGvFHZwGF4L3vA35pVzw4TFZ3hdijbU05IEbVILGWiPAVwvGJp7n1lJ8UhDVgDMl8+/PwDa/IcB9o4uEeVaJFTSi76RkPenCy0f12vAVnTk556zgtvmXEkijzmeuW0trVdRs7pdknyxlmDYkV/oSo3jNh6E7+BKDqDj1ZajrTp14w9pi4UlqXhJvUR+h0My+WT0JjD+s77fKu8Xxr7pe0+pXBzVEMMcDdxIw4mZeJDQhX02Z5rSKKzMz/RZNgmnSPejQuLOoWdkGsfQhGZjLF/jQbogxg6RqhQIceRJgELzkNWzzcP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtMgKDpFOAzIMX6of610beeCGgg7ap1ZSc/vjD37xSQ=;
 b=ShHHUhnx/JngSUd8eu+XTh+ockmpb/AUMy0eNvNerTE8zHJNsohTMoAMkVpI1hd+08HsHCqMOJTEH0EHaA4JL2mGOMVvHVShRS2FyDMU7C/lvExksP6LvF/kR+bW87bt9+YFA+7WK0pUlZh+6Bp/7QpckF1ErJ1CKsQ0DjT70LzOlZm4QMCswev6yL6wimaUrqlCcp9IxIOludT66nAojtQhT+mwY56ItZ+RqLeDd0U4P9GqW5G2uQH6X8DJQDcEq18oUEPkJG4hnT9tvuaUU4Ul2kC1CwnObGiWMBT7UNLSkmhXMw9Oduzo3mVoUEj3uMfPYimWZiVSwg18Oi7zWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF208195D8D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 06:37:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 06:37:49 +0000
Date: Tue, 3 Jun 2025 01:37:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_configfs: Use openat to
 simplify check
Message-ID: <udnpvmau2xmjtnwsvw74kjh3ktjmcsuzl67o3dktlycvuhbll4@kv5zhicqhsgv>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
 <20250602-engines-allowed-v2-1-52bffe717766@intel.com>
 <886273d8-b3ac-4ecc-ac14-15a1e4887bb6@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <886273d8-b3ac-4ecc-ac14-15a1e4887bb6@intel.com>
X-ClientProxiedBy: DS7PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:8:2f::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF208195D8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 39dba43c-8a60-4274-8b39-08dda2692846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ykCJuN1yeSjo6CvthC3sLiqbSpYYTqoTjuD6gtOZHcN6MXBeIedcNzUcThK?=
 =?us-ascii?Q?CiW8URzMX83I4vac7rHD4BcPeVb6Psmbr7FNAD1R4Y3o4hELfZEP60d8cA4L?=
 =?us-ascii?Q?2SgreNmsjcuABIQlKR3JtGltoKm+hx6f+k8Q6xTghTyc2d/Ef8zILsKkibVA?=
 =?us-ascii?Q?jJUA8pG6s+A1uhFSkxcfhpAkCEMLZZ46tZJJOEQKtO8ai1aTjb9Ruszh4Ddl?=
 =?us-ascii?Q?FKNLJ++eYET6vn18uqrVPPeuoViJD7nmqGcP1RAzHhJxcAG7OiOXpOpdy1tN?=
 =?us-ascii?Q?LlQBYdJ11uYUMZS6BXdP1Xr4R83G8wcHTPWySk9MSP4NnD04vpdEnk3BytkH?=
 =?us-ascii?Q?NLbVrl1MzLazgnkXkMD6kksZOEFQhAzwpj5nWGv3cLruTIQ4LwZzEqBrBDlT?=
 =?us-ascii?Q?fCsuSjs8O2xkDDPwn0aM3eeWLg162jhlCO/Aakj0kCFia/byUePS/0QdhAEp?=
 =?us-ascii?Q?eLleDfMEWs45JaG5FcsEJ20wLmspAoRWMKCSAFzx/q29W10tbn4qdV6WhWGE?=
 =?us-ascii?Q?+f3foy0UYAJDL3aJYD55gisR5CsyhlU4RFi/c3Jvl6K9sAn3yQU+Mk06AwlL?=
 =?us-ascii?Q?B2VyR+TdVJIxYVsjOZQNX6UlrXNqzLmAtjQeUccp+onYCAVTELfmdrilsTTQ?=
 =?us-ascii?Q?qwVUkndnQepsiOc5ll331rcZoJkJQB1nYwmaJMfSka5YobPgbKZ7HCH4Izbr?=
 =?us-ascii?Q?7LNfFC+mu23HOAmDjI7NFqoKl81uw8OE8EPEJkwhsDBgbeXbInWxI+f13Ao/?=
 =?us-ascii?Q?fE1udWlQOpV+z2xMYtrAu4Ao4TSxkr6MVDyASavDA+g0JYP4F/CQ15415eGQ?=
 =?us-ascii?Q?aaqV9Jqns1BNTUqrtSLLCiAbjQ9y2teZgAUX6EM0RP2DsY+28HbYYsqivejF?=
 =?us-ascii?Q?e1mno7hlql/oyZANY7q6QngEweMHKAV+okzoLhZySbanEn7uLd01TJnm7OT4?=
 =?us-ascii?Q?UAsLSDnbAvfBGxdGFptH9nnlePNp2Wv7eG4sIcOEFdkGNkxMG2b9p9POd3mE?=
 =?us-ascii?Q?kwIIft86KLcVdqbDvKbaW7oF7xHEUTDq9anS2k04ccgAtJwmodJHwj0oykfm?=
 =?us-ascii?Q?M0NjstgKHW7mcvOjlWGTYAjaFPVU5gB7hTA5no3GtA01gisygMoGJ+rrFd9r?=
 =?us-ascii?Q?LumEkzAT3zS9EOvMtNC+eyiS2hRELsOiaQxB5+GWSPmW+VshawPZBPeD0eiZ?=
 =?us-ascii?Q?lqx48skf2jzCuUoUifkM0rSYWaOwtBbKE4PSoKF/pKaJsqqVUODlQMoc1l2u?=
 =?us-ascii?Q?SM5pwF7AqqeeCMaETXTco7az7aj5hSY1WJ938wzzY3aBbz+Aj1Ndtfx7EgIv?=
 =?us-ascii?Q?idrJw69iOhLayX4AOXnhE4iNIxDunKIMhUgRH+eeQVLpJ6+RUPVVM7lsU3+y?=
 =?us-ascii?Q?6SXNO0uQxYBqA1kaYWCpyhbpp2hE0iOKh8JuxzH7Dnw3jAkReskdxK6ZVlOh?=
 =?us-ascii?Q?O36dkNChyfE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ZhzIr/d2AIVnd516X1ojTGbzluA9LZiyu2HutvAKyaFbc2I8D09jPFZOQJT?=
 =?us-ascii?Q?8w1KQGfdbo+V0iC5mXLUTe1yFbk/9oi5N03GdTK+8Px9XLCH6lx7OqJxPUtN?=
 =?us-ascii?Q?ii/ylPmTwkSvVS9bNMLtff4PFmjzRps+LpN8W4HFog/Om2kUonnTaErLlWlq?=
 =?us-ascii?Q?WoARPh0P9VWpmdRTQqtXloBPjI1j049MuxVYdhJ75Pho2tJK9ed2MoGc+/Va?=
 =?us-ascii?Q?A/KTQ51KkkdKgoIJUwufaQPbDbUg7+2X8CuoNjz0fSi2WxVrClkZhpeShBZQ?=
 =?us-ascii?Q?DxbV9myeGpy1dJ0nsxt/wFU/ZYjlPZJWLJRt4A4THrwW9Lh6HzQJCh2HCgM0?=
 =?us-ascii?Q?LGTq7FsCrdvW1YmSq0vKfD8jkPpsnOafDld9d9eOu5znSB/4r8T8H32h/YO5?=
 =?us-ascii?Q?7teXHLQcNVhIDfATQDh6SZHJtOYfX66E9XKWwhQzmkCa+k3jWnMdr+JvY5Y8?=
 =?us-ascii?Q?EHoUq9438N8pdY+LlQH3/YG7zm14jgtKV0oPJm43Gx290X7PDS0mVGAHcmY8?=
 =?us-ascii?Q?i7uWP0PrZJEPWau7E57O1zzN8RZHZBUy+Aevwx4huvCqgpYfpc9pf3Yss7dK?=
 =?us-ascii?Q?M1tDjtkGNlQxBHfgwZW6aRbnibhArGAAM8gmg3LPqABZVTYgB3UXmIJXFEPZ?=
 =?us-ascii?Q?zjtAhq1lMIcseR6nxl0ugArIQUDtaCkuBmx30/Ncr63j3UUSpAlTj//g1d+g?=
 =?us-ascii?Q?kZj5Jra/87A46IJUCnmxenPrxQZK1ZNHumVIWvBXZ5OIH8AGPMP2yAcj6hGv?=
 =?us-ascii?Q?6wN+Lv9y5Zfh/mBeNykmrE+2gFpAhX8Ko35GCWSaus4ZUPgOfFMbY+quXGEa?=
 =?us-ascii?Q?m3dL9YiB1GMTNDLLnurI9uvdsFZMir4L0mndJSknyG+Seh4kKDNNKF2xSQPa?=
 =?us-ascii?Q?76OuMhaj9X5Iz3EPVrpqwBVHrjKS11wrPhzIgV+jmGfZCvAGuLYm/CnHmGmI?=
 =?us-ascii?Q?N/3FlNGQIW65/YVPURw1+VqECs0tbyi7q0SyXN0QLX+4QCu65aEqTBmhdFdK?=
 =?us-ascii?Q?9h7PrS8+zKyrKSpCMNW1WF+tj3nFhCoMkjiI/RXyIMaTlNYu58LVzEduUfHQ?=
 =?us-ascii?Q?54zAgzakTcVtfVbetcz4f8E0wxtVgLuHtVb9Yy18oWqMmtdIQ5fVrrHZn1Uj?=
 =?us-ascii?Q?nQBj9yOXiNpDQ0R0vqkMOO7eJXAb8Jbg6/Xd1EsDbf9Hou2GctpHDpekKnbO?=
 =?us-ascii?Q?VUgNM/uJ8y3gP2BUak5LBhnFeHXxTP8Q0RCqj3O9k1+53yNfLAJE8QsJhh/l?=
 =?us-ascii?Q?2XA0SVq7vCpgICXU3Q6ixNdjbh9HfGvka71Do5bxTZ8nYnhaiABYfLdpMQ9y?=
 =?us-ascii?Q?4eXpXEcw3sUmhylkRT2m5HBr0KLzxWpevbiQfpMazknjbkmz7kqPq+ZTa29m?=
 =?us-ascii?Q?8XxOzu2BWrB/oDI22Iw4v1Sjl+ud8p7aOQLGN8hfc5jyCbVFBwLQf5EzNeD8?=
 =?us-ascii?Q?eaBH8KbaI9CHUAj8TJ6KHuIZJ4yd7XVDFm02fkP3EEmKaqfxX8ohcnSVrtnK?=
 =?us-ascii?Q?Bs0+9L6+Y3wXLbrLHLu2aYkF8VAJHwpmYqt0WEoE9OHo2jkoqg0OQa/u+cGl?=
 =?us-ascii?Q?axKJeAMmzfShCSwd0CF2UTmesE6jfFIsCVqYr1F3DlyUeFEfAvtgW2JTepTB?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dba43c-8a60-4274-8b39-08dda2692846
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:37:48.8988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/pUL+jhXnHmjW9/qLnH1PTxxPuYLRSZ6b9OzKX+vAN41cr9gzNVw7ThELVj35CVitF9Hen/ImWCuKzc1kogsnTdfsLv4Z/CQ8H7fAMZtQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF208195D8D
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

On Tue, Jun 03, 2025 at 11:45:20AM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 6/2/2025 9:54 PM, Lucas De Marchi wrote:
>>No need to create the path again. Just make sure there's such attribute
>>relative to the fd passed.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  tests/intel/xe_configfs.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>>diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>>index e5701b7d1..074cd04d9 100644
>>--- a/tests/intel/xe_configfs.c
>>+++ b/tests/intel/xe_configfs.c
>>@@ -43,16 +43,13 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
>>   */
>>  static void test_survivability_mode(int configfs_device_fd)
>>  {
>>-	char path[PATH_MAX];
>>  	int fd;
>>  	/* Enable survivability mode */
>>  	set_survivability_mode(configfs_device_fd, true);
>>  	/* check presence of survivability mode sysfs */
>>-	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
>
>This is the file that indicates that the device entered survivability 
>mode. This is under /sys/bus/pci/devices/<bdf>/ not the one in 
>configfs

oh.. missed that. We can drop this patch

thanks
Lucas De Marchi
]
>
>Thanks
>Riana
>
>>-
>>-	fd = open(path, O_RDONLY);
>>+	fd = openat(configfs_device_fd, "survivability_mode", O_RDONLY);
>>  	igt_assert_f(fd >= 0, "Survivability mode not set\n");
>>  	close(fd);
>>  }
>>
>
