Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F372C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4648310E758;
	Wed, 15 May 2024 17:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODgxhgjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F7210E758
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793220; x=1747329220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Yxv+T27/l28KGfzRMHzzZuiQCsxSUj8Qy/zItA9Mbvs=;
 b=ODgxhgjxxZnx62g0/QGgIrY7TuNW3X3CZ5ycYlhL3UGzFruhCnOHkf6N
 hUUNJQA2OxRdjM5UaULJtDNXpEJvnmAVMgnv5RGVHavadxBEx/gW3Dfsw
 zxZf5g046To+VK/Bn+rlKYsJc1LxRuAu4s5w5m7nHqajglo7EVshgJFGi
 SC9wN7xlY9Hui+3ouu/x9SoAcnU5SAoJkGjTOQXhBNfwdXlLY8GivpDJY
 owoJvBEnbkcLC8hzdpbkU9TVI/44mgCkXmPu2xX1K2qihbbHwoPWDF4aK
 nN1px+Rzagw9BqiI/XIPmqsbijf77fy61LHAKT01Hf2loKTJGGJDQzEzi A==;
X-CSE-ConnectionGUID: 6SwZI+4NSWyj55xnTaAJcA==
X-CSE-MsgGUID: FwdQ4lI2SomE0iPNODZEOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23261737"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="23261737"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:13:38 -0700
X-CSE-ConnectionGUID: sRa87Ss5RruEeaUT2L1LVA==
X-CSE-MsgGUID: IYi6Lof2Qhyo0t+vkKYFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35677861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 10:13:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 10:13:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 10:13:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 10:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcbHdUN+49IMAzI6MxOrlC2mNZekHeikI1K/iGdsobwPI5e6tWcHu1EccB6UrJHdd3qptBK/DqprG15Ml7LpfoxLaF8uXUIBeqQOXERf0wpJ/ec2NKZqeuul/28sJeUBt+I/I0CIBiTi5Yt7Q39D+ssloATaSf8fU/FcuDZS/sTIDWnWqIZ37ZImxrFt1Lou/OJreyiexnYPOu+mR2Wf8yIYj4ze5OABVAsl8tMxXBFOqDWXkuFEvhhMgxbTlFZeK2OBG7E+0YXhca9Crfz7H9CxFmlj1BIL/vi15zLoAIvzCCriRqycjzAPFC37jcgTYJ8nZfdPeL5jwP5LsseNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KptEtULpOjKw+SwwdeLGf3DudkzBUs4etKj9B8aBBhs=;
 b=cv5pCZN7jFYqFRfdCRrDF+w3J4ZNwU/90nigceXtjMVo9VkEtwNpfgjciLIs4BQT536i4MKqE/o6xs3aSp9xs6AbX5wnkM6BRSSSPlYj/3y6iLIuFQuRYNBP3ijklQaVJPIVyfvOayJXX3NX7bA8F3v5CZw/2lVmc6bv75DpLmNNctpGd/Bn81AoGFHTcN6MmOVrshub3Z/lCBK/0CrbOZBJPUHo3s2dtNxlVfonCDgX8dPpc1xJr2MncurKsI0p/pAshw1zthbn7aQ/kIW55XK6AncB7HqOgBpcwTd0APtsxR3O5IkkA5o4xfmZ2d6Uukc9Tm5zN61lPXTQFxPw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 17:13:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 17:13:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Wed, 15 May 2024 13:13:15 -0400
Message-ID: <20240515171317.84811-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515171317.84811-1-rodrigo.vivi@intel.com>
References: <20240515171317.84811-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0026.prod.exchangelabs.com (2603:10b6:a02:80::39)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b6190e-0266-4a91-d848-08dc750259d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Fslk4jev20zMEahSgvDi118doRUQtSZYcnbEdYJMs8rgezwmsrif4HVDIeE?=
 =?us-ascii?Q?QQ/VtmqSDSsnerATeTI3TiyPXHPvFxmHOqFr+CckzsoYXpWtt1qSxF3kmeI5?=
 =?us-ascii?Q?sGeIhSSntmlh74oCOkigCieXhDLa8zzmvWDgc4VJ0VgqUYXWihyN2B5yTgg8?=
 =?us-ascii?Q?LMq7hfqaG8gFJIEpdeZKKK7oA0T7Pm2jwnO7vIZwNVEMRLo8Vbq9i3IJZDEW?=
 =?us-ascii?Q?l9ASPc8BEcETj4Qk7Blq7GXn155XhaGmdLWsLAezN1ljpFyQn/s6f0ih04gp?=
 =?us-ascii?Q?t8lPsr4RWEbkvoHZeKlWApjaDhYzWN2qmk5JfrBlVa5yJvgos8B1n2NG/LOd?=
 =?us-ascii?Q?/xtlkPIBLDfLJEww4kW72qbbXVU1bFra6BWB5SIePofy+AQohUV9HsWpwqhl?=
 =?us-ascii?Q?EYsjUipNyI99wl5hoiARp8CSExQjYgh6RAJu6/PZs1G+aBpbjqdCbPwaKh4w?=
 =?us-ascii?Q?VNwwGx1XKTw2MUY4fu3y/NPRmH+ppChe2IYwVUp9h+8OdK9MF7ApRLBhc2Is?=
 =?us-ascii?Q?miWXlL4B41OeqlK6lUc2c8hJOIBDP9eWePQRXQxbLOKpOSdFMRXibP5svn9X?=
 =?us-ascii?Q?2zh435MlZIBp3drQCUXoG3gQwXpNYXBSlP+3tGeZ38WbLy7qk6yZKxzwjKTy?=
 =?us-ascii?Q?+hP1xatECIq6UOY45J/bs+LaBYOMWUJkAgDHh7dtfRglye+V51C6phz8/3je?=
 =?us-ascii?Q?mcEcEJiUFs9PDUaWRaPO6C3QGNmpSawCK5EyRRQOaW/CgPG1sHwoUPGIIr/a?=
 =?us-ascii?Q?+ftw5JZ799hmpNkfaD+8pWtEd1HXdD3uv9SVLi/nF2/ib0AjI1haqiJNK5LH?=
 =?us-ascii?Q?5h5tgKJfTW+VF63NtDi2a0qIFf9I8GsmLZH3F4XOFj3922abS2kG3xrMHn6R?=
 =?us-ascii?Q?WjB3ReHLDLonzZZeen2PtqytA4aCVEYm9TUtiAdDY96pMpE2MIBLJ71Fa7Gb?=
 =?us-ascii?Q?p4QDPiJ8uFBow9P/v4LlObwReUVPBe+py/FoGK2A6I3H1o33GCpjNOJqg4/D?=
 =?us-ascii?Q?zoIosX2jjSWc9SAz6Zch8B+BLnrwwPWg48OH1q1LslbyeEzVyNY4op9HDj9D?=
 =?us-ascii?Q?6S0tznhHA/VgjX/JqoLTDIAjXWgF4cNS4mbpTROoTdj+548hjYR35KJSO9dc?=
 =?us-ascii?Q?mlJP1hMif9LPQtMZTU1sJoJQTBQs4XUMEFWX5Q+M1rcDvYmRBA4SlRMN6Kwb?=
 =?us-ascii?Q?wOFqo0Te5P38FvNcCU47OhOEN1EjJB/IoTza8O+oXXUJ3g/lWVlLI5sm9ju1?=
 =?us-ascii?Q?og1SBrWFLGFwzGs7eXmQOIQSmygJh8mbwVZSPVsr9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJUqoVez2JYmeLOTvDKa3C8acNDlVWu7wFX8yYBp6PLob7d+8mwDD2ANfPhJ?=
 =?us-ascii?Q?rxp9rSKecHRy9S43HWRbuPbGu4YU3uCc61paLWb1tw2MjNn2KiteTfNlZasy?=
 =?us-ascii?Q?UUqLmsNZoD6lVp1fothr6ySr3JiKl+48BNEwra222AEEHTtZjsQgE9f598Ev?=
 =?us-ascii?Q?3EBeW8mS3xulrwJyBoAuaAj5BW8dVswK63DBXPl5P2kcUxLJ3LHnOfbwALKr?=
 =?us-ascii?Q?dF8jslE51H4txK3s4GR6FNuYwy/cpGnj6toStcF5wsuHW8TXg/MDc5odwPrU?=
 =?us-ascii?Q?biabQcAIjn47XAkWyyCrExE6bmOvQiGYmXxtvUwZKrJ2zBZkpIelaLj/VkU+?=
 =?us-ascii?Q?kMmujDnPA5VWoHZATF/FfY0+83rDg3NJTEa6iblYrdAU3BVHM2Rf9pINfMhe?=
 =?us-ascii?Q?0EopE5T5eoW/dPIgSO46SOdKSrhADLlePDlq8lqfFBqL0zBhoy3BYqKCjRDa?=
 =?us-ascii?Q?vnwlB96Ib7J6CB7WLZ7MSRbB3LWwGQSj5GZuXxMqomnSfmo7fofKd2cPKgLT?=
 =?us-ascii?Q?oxZYuaM3ag8Rw2ti6OZeRthdS7UddHPCPKSVkRuAa+ES2Fra4WeoyoLvADd9?=
 =?us-ascii?Q?waZp+L03WEBgB4A+5IXJUrHNrc0J34EonI+f4yStZV1DHIfcv0v7InRdKaRN?=
 =?us-ascii?Q?ywM/9oKko1kPDvh4+bC+hZ02pl9hDFym5Y11A3px8lQwE0lbi8TfI7BpJFz5?=
 =?us-ascii?Q?yRqZSnoMrYCTAT3rgOG7rqEnTo2BrwgyU2uA/oqJ/zQUxXdEV3hXowsSaani?=
 =?us-ascii?Q?SxYghMZISg0LbYx0mTcT9J3+3oQXPbnAnRW9EqttEYj6/8C7UcxIwBU9qfMr?=
 =?us-ascii?Q?gl0Qdhu5gr8EUGrGEjFuB3IsJrogszXTOla9x3p6qeH+Tha1EeSKrmrR/QKA?=
 =?us-ascii?Q?vGj1/hHIEX7lj78XtnAHXSE7LUmNzgVvdAJkj8CvHyupbQQMX0JWJtIOV1k6?=
 =?us-ascii?Q?KobyIXv9AXCh1r8mr8C+I1cPjUgfmZ1JmYgdt5jW+FAAuuYa0pKldnROsNw8?=
 =?us-ascii?Q?WAziJ0BNsgP6jJAY6DAdcZgm2vQm3NVTEBo1QBvIYvKIjL2zdblVUpMY0Q2V?=
 =?us-ascii?Q?fF/OtOZlnmwPZ0HD/+RuF62sFt9a6YvgdGGsZ6hSfa+QwswLI+EPRN/XgJ3X?=
 =?us-ascii?Q?PyxGY3FxhYKPgs2+iEklR0lGWegBzNOmQCKCIlC2S8rPs+0WOgS3PgI3LqS1?=
 =?us-ascii?Q?CMcUnqVx28QVqf8e4ydxN1gvNmv4Rgnr82YximW61jylP842M9PF3oDi03u4?=
 =?us-ascii?Q?eqPgQN/takVfhChj7VG9k+Yo1xjeL/UiUWISfPvmHhsRnt4wlE8EMrjr8IWw?=
 =?us-ascii?Q?B5HZbg0Cz04gz7AhRMX4X6wTwDh+wE1nrY5I1l6mcON5ZBJyuHIHcxpPBOZV?=
 =?us-ascii?Q?QZk5cV78eK7U+KahyGi69yi4Z/xWHhuSf/uoplG3BV4Lt2Xv0d/7PgW8+iIg?=
 =?us-ascii?Q?NjUCcqPM+DnhtnbCdlI8MehNseV7QHF0sfy0xAVl6g5YtHx8xFxnyT2SUfHb?=
 =?us-ascii?Q?3cnHMSiMYqeb0CCkeFeMHOyJqhIIouSTcUpfcIf99eIVKTtg9ChcBWZNBLNI?=
 =?us-ascii?Q?/QsweQPHRZuu8qTTtxAC2Svg52kdI6HrI3FCQu+k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b6190e-0266-4a91-d848-08dc750259d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 17:13:33.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ2hFXoGydEUCNM0wSKDekia6tk/yD1peT/YR8k7T/VZzMON4v4g0KPWwoyKOpg+JwdHNyF3rhtHiiNVEr4AAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9e1f1723d..a80964d1f 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -791,7 +791,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

