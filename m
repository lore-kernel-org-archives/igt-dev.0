Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39588D44C4F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 14:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF3D10E06B;
	Thu, 15 Jan 2026 14:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jee1dbDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3337810E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768485742; x=1800021742;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5V34LjiRfVzt7x5JmApf5pJj3Vt7gpveKBdPD1XNw4M=;
 b=Jee1dbDN6N54/Hsh49JbVtRVS4ZNmLF4VZuWuze8NZfZlf3Vn0Du1UC+
 oOnL4Qo9P7W5uoZooYU+WiqSEdmisOFM1thSZAao6iLWPvfngyjaSuH0p
 NdFrYroTjK+qAEwtEyaCO/5jfQfk95b55HYxmnmYXPqkycscHrXjbojI1
 BWnfNMGT/ryXL0sBXY0egtr7DbV3NW+QEwh/ccAreZ/wpkQtK2Tz+iKI5
 R3RaeVq2sdV7pRbDjwFKVPdxJpCfCugUe6xEqIt85marTE07TC6mrUmDW
 l0ThrJLf117naXboru2yLszaw4EewRn1C8TiyWTaDLwJCjQ0IBE1OwBC2 Q==;
X-CSE-ConnectionGUID: wtUjT78wSHey4KAbHxDNvA==
X-CSE-MsgGUID: YTLUIBMTQq27O07dZRxUTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="72375943"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="72375943"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:02:21 -0800
X-CSE-ConnectionGUID: kbg6u3PBSgSvKLJGydWgdw==
X-CSE-MsgGUID: eEkSIx9aT6enKX31gnPtzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205453185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:02:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 06:02:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 06:02:21 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 06:02:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bdf2OoJ2quCO6x2YFfzGe32rhxdwW4NpFeQ9r2DZYlA0sqtXQ5ZNSZkALuyolUh04Ybqz8F6jfdWYPHYFQGxctemQEctXOycsey+t6Sf/qgHo1uSrGUo9TlRpY7nZMNfCh8pRNJ9AmXk95eJq7umdhZI3vnKdv1Bydv1GYsFPl/4BUuigWpSqdfUBS0UavvhzH6cojaGrhGFUEuYffIxn613NfQtr69Go44TMaVUv2fMKJ9viERKPP/dUHF3QNiZ0BA3sqmy8MMV8CaL9dehrlepzhaIQTPv8avswj9kbGqQxM9VhpNjAUfDZSaE3E6/DKOj97whRm7B8PNupb7Zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n14KT8cna8slpCz2DDTrgGICy1fdTd0HmwbfxS7k1Yo=;
 b=LiHaodNMyr0gAhlDLv7n24NBq13FpSXIblNwPZlampJVAwUGlWDmiRcI66H2K9C109DBHoAlhmdTIUjIbjwctvl58dr1U2tpMTfgLWfFJMNlJR1yKYOuC4giqoP/WoG85aqFsNRryq70D/PNBLhDudr6KGilCQWIW0dOhaXYxadR/n5T8FUPGrlU5h9QtOHqbHz9DfiRp5+BgZd7tA5LxH4Stc94tJN3Kqbnz0R6FBuDGqD/Blr3gX4d+87jvuLnNn+QctKM6dJssZbwu35H8duYA8rxu90h2Lfqps1GD5H45yDZm79V4vcrV3bJcCzTB7wpm36dPwPNg2BqDFnkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by IA4PR11MB9299.namprd11.prod.outlook.com (2603:10b6:208:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 14:02:18 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 14:02:18 +0000
Date: Thu, 15 Jan 2026 15:02:07 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/xe_render_copy: Skip if platform doesn't
 support flatccs
Message-ID: <aWjzX8338AzAu5t6@ART-DEV-395>
References: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
 <20260115092155.114781-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115092155.114781-5-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VI1PR0202CA0030.eurprd02.prod.outlook.com
 (2603:10a6:803:14::43) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|IA4PR11MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: c0abfc6c-b006-4f1a-f1f1-08de543eb1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjlEazBSaDIrMXQ2NzZIZ2VONEhRb2VhYXlJdjAvS3BaQktRNU9YNnozU0cz?=
 =?utf-8?B?bk5NT3dVV25HVlZxUHhxVldITzBKNGt4ZUtVWUMxTlMzMnAxT0FBSWNzQnoy?=
 =?utf-8?B?OXUvQXl3K2o2Tis2aG1IZWY3WWFtOUZYL3JZSm53bGk2NGVCU1I4Zjd5bHFM?=
 =?utf-8?B?a3dJK0FEMWlVRDBJMGJ5NlMxTXJLRE01T3pNT3BvZTNXWEtVUnNKUTFPcFBQ?=
 =?utf-8?B?cWlhckZobWt4NjBiM09ldU5PV0psckFhS0ZvMTF3cmtMWm01WUpNc081aTJ4?=
 =?utf-8?B?cDJpcmJIMUlxY1lmRzNXWWEyeWpNYmwrTS9KSGd5bDhJVUV2bWNhZjBvc0Ev?=
 =?utf-8?B?S1RZRTBEcFEwd3hxdSs4Rm00VGIweEU2SXhBcUpUUXlxeEtUdmwxdEZuRFQ5?=
 =?utf-8?B?c2w1S2RLeVN3eGVRS29qNW0wZGVQMEoyQm0xOTVPRGMvTXFUdFNXRG01UEhy?=
 =?utf-8?B?Z3ZpemlsaFJCYXYzclRWWWFSMWlKeG1jZFZ5MVZBbDlQc3FkTkc5UFFjak1H?=
 =?utf-8?B?SmE0dFJtbWNRTFh5UjhoSllVZUQvME1YVS9hOGZ2QWVaN3VtSU1aN3dncVph?=
 =?utf-8?B?UDV4WnNSQ29Canh3bDVxK3Y4SzZOTjl6ZERzR21TYVlQYWxrOFBHWXFUQmhS?=
 =?utf-8?B?cGRoVHY2WWg3cUpKZjBnYkRiVGc2YUdVbHExVHRzYXdwMmMvL3EzeEZYbmNk?=
 =?utf-8?B?MlVHVVkyWUQvUGJ1QjUzeExpQW4ydjFPUmkyT29EdU00blY3K1RPeTZYcmZa?=
 =?utf-8?B?ZFVSaU50eTQ1NEpHOFc2eGJ0V29OL20rS2k5R0JKWUw4Y2dXTlJoRjBNcU5K?=
 =?utf-8?B?YVl3eGpDTjBMT2RHSHNmOGhjOTZTMnRMRFVjMld6dTFzell6TEpGQ0g3ejN5?=
 =?utf-8?B?UytYNDdDeVQ3dkp2K25lOS9udXNyVWVMT01odzY4QU0vRkVHRzBKR3Q1dlU0?=
 =?utf-8?B?VGUwNnk0d0xxL0Znc2V0MGJSZ1Q5bVZuT1VoMGR0bE5HV29tQlgvSGJxQ2wx?=
 =?utf-8?B?RzVGNGVCNkFpak9aY0NuQWRlRi9YYnBvMG9CRVhMMFMxOXpGTmYxd241RUYw?=
 =?utf-8?B?bTRsZFluQnkybDF1MEMwOUNRUmtNcWNMekNKZmJxd2l0eS8rMUtySHU3UzRR?=
 =?utf-8?B?ZTI1N1VTNk1FRFRoZ1dIOGc0NS92YjVKd2NTZnNoOFVRaXpKYzYzTXh3VGRR?=
 =?utf-8?B?RVJtVFZsM3IyWGF4VnFvRnU3T0dNRjZGZTd2YkpuaFVZVHpTQnNQWjRXL3VE?=
 =?utf-8?B?eWJrdGJ5eWdlaUt2bE1PS2FETktQbi85c2gzTEp2NjBiZUpFWDVydC91SHJm?=
 =?utf-8?B?UmtGWmJTRjdjN0Jjbkc1UTFZVlNFQnFKTnZCd01wWG9lLysvaGJLajZKVk5u?=
 =?utf-8?B?bGppaGY2d29uNXhaTjI1YVdHUU1yWFFYUEUyRHkxaWovYkhReUl1ZjU4TVUz?=
 =?utf-8?B?cGR4R3dlWmhTWWtjT2pEU21Yd2dJZEVEWk8vQVV1Tjl2NnJVRzhWTk45UUtk?=
 =?utf-8?B?QjBLVUhQMjJrdE9VMXZWeWhrTjF5STFtbnJiK3QxRkRkR2xYUUtmaXdwc3Zh?=
 =?utf-8?B?K1RqeUJId3o3OE11L21LeWRVQnRjZkxneEZlSHRYSEg3aW9zSmZHQTIvZVlu?=
 =?utf-8?B?bSsyN3gxRlhvMk1EWlVtTmFHYlRQeVFXR0lOejFvdmhSaDNJZVZSZmJML0RC?=
 =?utf-8?B?QUd2dEFRcnRSbndiZytSMUt0VmY0QVJ2dmtuZU5BdEdYa2FMWTdaVUZEWDJm?=
 =?utf-8?B?ZVVkZ3RUS1VXbis4QUszOVdIMDBSWnVna2xib3g2VnFxTGw2cGtPQkwzTkhB?=
 =?utf-8?B?QlZDY2xtQUtLY3B3U1pSdng2ZEY3UDZxaTY3N2xFSzRBTEd2R1p6UyttUkFu?=
 =?utf-8?B?NWFQU3R6NlBRRmpDN3hxaFBHSkJ5WFMxQ1ZxN2kxbzdEUnhrZ2t6cUlMZWIv?=
 =?utf-8?B?bTRRR2hmUXI3eWI2UjA5bjduUDdObzNHQnMwcGV2eHNjK1hwdW42dmE4VmFj?=
 =?utf-8?B?Q0M1Yjg3aXhKemdoUEhQTWdOTENhOFdrQWpWUzhTSUFtekpaRkNjYmVLcm9z?=
 =?utf-8?B?U054U2dCWmpRTDAwVkFFaG5pRnk5K05rdHdNL3NzemhpUytlTWhZTWJjSWIv?=
 =?utf-8?Q?PvNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGt0RVlrK3MyeG1VQlhqd3ZObmdRT0Jia0JudEpoK2NxRW0wd0x2T2JhN2JI?=
 =?utf-8?B?YktiUnN1ZTJIdE5JcTgxVmo0RUhrM0dDMDBDQnYwcnlEdXlxL21paCsrT0F4?=
 =?utf-8?B?V1BPM3g0TXJOR1h6U3phMXU3TC92UUd2b2RmekJvSFhuWW1CbWQvbzJkNlIw?=
 =?utf-8?B?ZEdxUm4zVXdnRG55azA2T3pZN1cybm1MTDZiUGpISnAzdUhPNUtjVXJBcEZT?=
 =?utf-8?B?eFZoSGhSbzRxTXM4eHZ3SXdwTElSTTJWUm11Y3p6VzJLbUxUYlhld3g4MHpa?=
 =?utf-8?B?VkEvL3QyN0JQdTZlTHgzVWFLdytXK1IwT05VWVVlcU1IR2VGVVE4bHNZajRH?=
 =?utf-8?B?L2lUQTR2eUtQQy9iaU9DTTBQSHJjM1VISmtyaUVjb1l2K0ZxMElLUmYwempn?=
 =?utf-8?B?NlU5QVpObitJVk91TWRTR2NEaHR3d211TitkNUlKc212SUMwSWU5THZibnBX?=
 =?utf-8?B?SlFJVUtmTEVSdHdFMTQxUUpLQ3ZEaWhXT2lEZE0yenpMNVVEK0JvdFpjQng4?=
 =?utf-8?B?WjZUWGRXeFYvUmZuaDhIZi8rVStVa1R6UElDVE9xRjVvc2xtMEZTMUtDS1hB?=
 =?utf-8?B?RUJuaGJldFVNaG10UEhsdHBSdU5XRjNITnZOM21xeFdDVGhUZUxYdGxXQ3c1?=
 =?utf-8?B?blpJTm9aelBPT0tYWkZ0N0U0VGxYaTlPQUcyZ3NIekJSVFdLbkJycEpwK0R3?=
 =?utf-8?B?TUpPZERaSnJQWGZmRFIrRWRNY3JxRFdoQ0xDTlJHbDVzdGRNMzlkcDJnZEw2?=
 =?utf-8?B?bVd6MU1BOUU4M3B4WmhHWFhiQkpscFVzaS9icUJWRjd2SFBJY1pvYzFTSE9y?=
 =?utf-8?B?anVTQktiU2FyM2o5SzRPL3F1OTk5VUViSDZTZjlUN2ZxQjk0OXpGTHpTMDhi?=
 =?utf-8?B?RjljcndQbVFmOG43OW5wSTBsbnY4VXJ6RzNwZlZyTHVmY2xnMklEYllZYXMy?=
 =?utf-8?B?cUtsejJBeGdoTWNkNUhXd3lNSkpjdzJMMmhxRzlKODRuaW5RNlpjc0hFRXFU?=
 =?utf-8?B?Wm1jMW45ZkJCc3dmTG9DMjkra09FeWVKYjdEejVLNHFqWVl5Q1d5RVZVajR6?=
 =?utf-8?B?d0lLMU1lZ0xxMm95MjlUS0l4dU1xVmw5d3I1b295UTJqN3RrdWgxRTFvS0Zx?=
 =?utf-8?B?eWl1eU9VcE0yZExLQzFUWWdNVmpJSkJHZEZkM0tVNXhNaTloWnY5OUFjK2Nn?=
 =?utf-8?B?NjNkZDlHMTd0ZzJiQTh5Y2ZYcGF4dldBOTZzUmQ4dFZzQzIzTGpObTlsVU1F?=
 =?utf-8?B?WEt4b2NsVGFBM0Vnd1F0WVptREhOamlHaVRyTFpoUUtmR0RzZStWTFMwc0Rs?=
 =?utf-8?B?WUtOYVJlYThkKzFmZU1kSzZpL0tjcWJ5dHRKSW50dG5YeDBoVTNDVmNkU29L?=
 =?utf-8?B?d2gvSlloK09hd0UzazVWZ1VmUm5STlNEcjdyZzZybXkyWjZqMXFHN3ZJYi9H?=
 =?utf-8?B?YVU2Q3hEQWpGSkhVQTl3OW4vY3NmZTRtc2pXeFJPc0d6a1R0akVXTmVKVGJB?=
 =?utf-8?B?ZVUrc0wrNVBodVI3SVdVMFdUTzNwZWlpWXpzb3ZWbXdQdlpjWW1iQStGOEVF?=
 =?utf-8?B?YWRkVEgvek5TNnFIQmNvdDBhMmJQOVE4L05QMElrTkJvUDYzS3FFdURTOThn?=
 =?utf-8?B?d2FaRXFCTXQxRGV6S0ZVeGlpUC92NHpuL0puMVFBdVZpYXA4d1IydEl6Z3Fw?=
 =?utf-8?B?bVFrOS8zL2NzbWRzYXdSMTRPejJXTTBSU25Pbm01ZkRkZXRhbFNwcCtVd2FX?=
 =?utf-8?B?TDJ5eFFsWkpOWWpCT2VVMzBNQ1plM0QyU29hUnFoektINzg4TDYwQW5pQVhi?=
 =?utf-8?B?Rkd1RzIxeThqYzU0WW41cGEwR1dyY0xCeDQybUFRVExsUHVmUUVxLzFwSGRT?=
 =?utf-8?B?Sm02SVJGcUVZWmQwZzJqMTNOb0xpSmY4L213VWFoaEpjTEV5eTVTNHVNQ3Va?=
 =?utf-8?B?K1lMdHh0Zk1Ick1yMjJFT2ViaTdhczB3S2hqdVdJcmo2TGVrWnozTUowZTFq?=
 =?utf-8?B?dHlOYVBTU3VuZHBvZ2Jqak43Vjgwbk1aanY3Q1NLNmR0bUp6NHM5aElrVGlR?=
 =?utf-8?B?d3d2NWQzL29Qbk1uMTdEbkkzUGU4STlCK0wzZ0NOUDE3amVzcnRRSWlxV0h6?=
 =?utf-8?B?Qk1aUEhpQkxuM3hwbkpZYVY5R0tCMG8zZ0tqSFYzWjF3a2tLV0srN3pwK2NU?=
 =?utf-8?B?U3Y0VEE0M0oyY3IwYXl2RnpFTHV5UjhTaUxXaXJqMHJoQ2ROd3ZsT3ltemsz?=
 =?utf-8?B?V2krODMvNXJKYVlIQVJnejE3SnNYaE5VN1k1MmJTaVBMMnE5M1JoRkVHVFhQ?=
 =?utf-8?B?dmsrMlMra2xmTnY3dmRST3Z5aU9rZXdyM2tRL3ZJQ2J0cDA3VFR4QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0abfc6c-b006-4f1a-f1f1-08de543eb1a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:02:17.9928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLK7XKpom4IWgxbp1EyyYKM4a4R46mj0SpOhANRqqHvhc5Mj8vGe2UBAY5qvkvXvZTVJhBmh2sxWj3rgC0ccjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9299
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

LGTM,
Reviewed-by: Jan Maslak <jan.maslak@intel.com>

On Thu, Jan 15, 2026 at 10:21:57AM +0100, Zbigniew Kempczyński wrote:
> If device doesn't support flatccs skip the test, otherwise we fail
> during buffer creation which rely on this flag.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jan Maślak <jan.maslak@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index e2e752e28b..861daec971 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -710,6 +710,8 @@ int igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
>  		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
>  			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
> +			if (id == COPY_FULL_COMPRESSED)
> +				igt_require(HAS_FLATCCS(buf_ops_get_devid(bops)));
>  
>  			for_each_tiling(tiling) {
>  				if (!render_supports_tiling(xe, tiling,
> -- 
> 2.43.0
> 
