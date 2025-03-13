Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F63C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 03:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9246110E1AC;
	Thu, 13 Mar 2025 03:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpHfpFuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A941810E1AC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 03:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741835757; x=1773371757;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=90CKgJ5wq4OAOtOIaxcMxURYwpeZAUaNWezUR3zV+dg=;
 b=mpHfpFuXJHm9/wVQceLmlbiMtDuXylHKFlM9TB5mj9/7TbB8j7T20q9p
 ftXdIopvay4wt+tYjRJfN/NPClp3rZdA2YLav6cHqJnjx5LzsQfLeSfMM
 WGDv+Xc6kz9EbOMCwUx2Sf+8Pn8RVeFTuVPdjZc5si6Z/DblmDdmivIjM
 oWdCPsBrXJOBJ5DzTXPWJC6UFExdWG1mx4wuBws+Chveo1wIMZ8qXfgzH
 kuVTT7qjQ6yQkB3Cx579uSxSc2ToDfRO0BE09evJn+n7xmNuanVEF8uyn
 QFBTqDTn8iEfrVupJjo885XygpMjhpdQsLHvJ/Z4jd3cvvuI3lZPbRIRl A==;
X-CSE-ConnectionGUID: V5/xaQkjR0+LO4lPp/d+4A==
X-CSE-MsgGUID: m/itMpjpR3ClWqeKy7MDIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42802225"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42802225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 20:15:56 -0700
X-CSE-ConnectionGUID: 1mKtbDzmTByK8btib0FzkA==
X-CSE-MsgGUID: mLLRUuLeR1iKYHWN0ni87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="124983582"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 20:15:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 20:15:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 20:15:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 20:15:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxcsfnEB51OFWwMaRkphkvEjSclJh2vYAwUy8WGcjLdfzx/9ck16CwG7L9wl8aDHHJD0wEDHc3wgf37bbUDYhk81iAiY4MXM5L7ZWF6eeZlOSoK34rbLdK5duJWujFA07W80bOc8k7WTPiuQreZDkotu1WfAIdYNsIriUnncpEOu56UlUluDYigddQEOZLgf9NuRhxbfg9p3eTyPOLzm7/Qm+tu1sGHd/ihf1nc9klVIv6hZiUbotssmERN4wmSv8pYGeePL69LyKqrPEhVuNTV5mzHDGe4kGBVYGBbOoClBe0Js8uyJTmkqDPVsyPVn4c3UVbES7Pr9fVMLJYYGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p+o+JJBAnCPY4TiIXttbk2a8xyjBOg7HmVgH40fsmo=;
 b=yndyb+fui8eO8q9EyY+f+l87SiAlnGY06DBO3tAfGi0bH8CyCOHdVyiZ6m1bQ2gqrZDcTac6LlFO1cXTs9oJtKPxtNjpHzMcbYbCEWxOC0VQEZviUGIUBKtdcXGQhYHebItdT0eZpVGhVRamSMd6r9xJ5jDaVmuhzBPYUmNIZT5nRlrggxssUF/85btLXnin7BgfPGWLaO5E6TPlVpWTDnQUwUYeLXryb8sb2vtycPeK+eQs0CSRHZ0Rn4HGukHik9ieUjier4vknY4r/DnP2u46317m53zyrDladDzeaNIqDzzL36RZMB4Qy7457Kql+OppSLkLPG7YGZT4Ep+QPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 03:15:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 03:15:11 +0000
Date: Wed, 12 Mar 2025 22:15:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v3 3/6] tests/intel/xe_fault_injection: Add helper
 to start injecting fault after x iterations
Message-ID: <46njk3ldedncbdcypr2yvgm4lp6gmhzznsre73g6y7jbv2wgaz@dvyr62ya43um>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
 <20250306101041.26827-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306101041.26827-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:303:8c::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b215d8c-d2e6-42c6-df65-08dd61dd43b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHlnVUlCYk0zaGVUZTU1ZVgxYmt3MnZLVXI2dUlvdFBUWmNqVmJLdWtlRU04?=
 =?utf-8?B?TjN3SXVEOXQ1c1poY0ZBQjhlbDArMi9RSEpnWGRON1p6N1JOSG84cGx3cEJR?=
 =?utf-8?B?c1NFU21acUI3WEFuTk1mZkI4cGN0c3pHaHpWWFlvUk0zcHBQbEJ0bTRKeFlN?=
 =?utf-8?B?V2NzK0duZnpscVBQcCtWeXdFKzdmZ0s5RTNhM1VoWm9zVndPcHNzN25iZ2Q4?=
 =?utf-8?B?c1paN1lZRndlM3Y4WXYza081bzE0WGk3REQ1OHdHb3NiT0RJajk1RlRhd3BF?=
 =?utf-8?B?bjM5QWZmTytuZW9tcTk3blVSY1cyQUdkdWpxWUM4L0JOUlNXUXliUGFuVWFl?=
 =?utf-8?B?SVVLMkMwa1g5V2dWS0JKYjMyamI0dzlpc3JreUkzMDM3ODFpZEhVNVRsbjZI?=
 =?utf-8?B?TGd1c2NLaDBwVE5NaC80L2lvUVk4TTR2eVdmbUttOTJXTzR6djZobkwyT000?=
 =?utf-8?B?TU84MWpOa2Z5bTdob2ZzaE9TYTQydCttRFFDZEpia1ltV0h1d2hDRkU4ZmVo?=
 =?utf-8?B?NjZnaDJIc09YaTdTWXhtaVdrKy8yL2c5N29hOUV0OTJKTURRTXRrWVIvc3Aw?=
 =?utf-8?B?dEQ0TDFQRE9EU1VyREcrTjNKSDhUdXVBZXdzd0Z2WmZiTjRTRE1kL0tCdTBH?=
 =?utf-8?B?cGJzbzc1YWxraWRhWTIxNkI2UCs3WWVSMHRyUGp0VnpFOFZ4VTM4bklFbmhS?=
 =?utf-8?B?YW9paEhyK2RoNHJyTVBUd1ZjbC9jcytuaHFuVURWaFp2THFtdEx2YXcyTUJh?=
 =?utf-8?B?K1doWk13M0lsTXliUm95dlptL3VZb3oxWWlTTzVKbTF2ZUxpWDFqMVJETlBk?=
 =?utf-8?B?RUkvZlI0OGp0dUt4TU9hRkpyQVl3dXQ3eCtpQUxTR0VzOG5SdnJGR3pDcHhk?=
 =?utf-8?B?NlVnM09CNHdHV0hqM0pSRmhyLy9yQUxxbFZkU0xjdUMzd1QyKy9QWWhiUHE1?=
 =?utf-8?B?RVI1NTlxSzZITTRzOHVlRVBLRitZQXEyQ2FrZHFYU0c4eWFWL2FQVHlsZEhM?=
 =?utf-8?B?SElKNmpnZDYrZFBhNzI4YlZDM3kwMmRPbWNhZ1g1VDFhSUR3UElLOHRkck5P?=
 =?utf-8?B?LzRSb3kyQkJhVHdQbVpsNW5lOTVaM0VIOHZtQS81b0J4eTlYNDB6RFM4OFNq?=
 =?utf-8?B?MjArNGx5WFVqNk1jWFZ4TlpBU0Z2SWVZYkxBbytydDk4N2FURW5QRiswM1dw?=
 =?utf-8?B?dnErejRtWGJLRG5SVDd6QTh5SWhjbkg2M25LZE5uQVpjQjB4OUtkTG9LNU1D?=
 =?utf-8?B?ZE5XTm42VzE4MzRZckk2eUVsbExYZDJyUjZOVFc4aU1wSHJON2h2K3JtaE0y?=
 =?utf-8?B?TnovaVlqYk9NU2ljSkZ5SUlPRmlQNGNCcXBTL2lncXdQeVl3M1pmT2hNbGJq?=
 =?utf-8?B?b2Q5V3NXbUtYdW5CRHFJYmUyZ09LOXVERFFlQUVKOTNlS0FGWUVra1ZXQmI3?=
 =?utf-8?B?OVljRUFPMGliR29CNUZ5L3I3d0RQOWtMSTFMUUFWalkwQVJiaXJCNVNPT1No?=
 =?utf-8?B?NmtSQzJQNkQ5QmsxZitLeWZmWlhKbVJOaVRkQXVyZHRmZU43blBmbGZMeTFH?=
 =?utf-8?B?Y283WDgwRFdrMlJIOG92OTQyeUhaYVVTUGZaRkcrVUxsc0hqNFlJUVdXM09I?=
 =?utf-8?B?RnBGd0Y0OEpXcytNcElQTjJ3ZjdnVlJ1R3F6Sk42Z0RXRXdEY2FPcnVrR2Jn?=
 =?utf-8?B?THZiVmFLSzBFNEwxUmVHeWEvUWN2NUVCVVNxUnU5bXQ0RTN1WWY0UEMxZ1R1?=
 =?utf-8?B?WTJob3FMc0s0eWMySWZpZW5wdjQyTTJoaTE5VlVxQkE0SWFiWlRQZHpGeU53?=
 =?utf-8?B?SnA3cFY0aCtHV0ZoK1JFQnNoZ0hzMFllOGFJNUNDbUdrVk1SV3kxOERVTVkv?=
 =?utf-8?Q?X7ZBoDmOGHOfw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHdyRm9Xczc2Um9MckYrTFU5VXZkTGFObVV3MU9rT0xVbHdyUDJ4R1F1TUwr?=
 =?utf-8?B?aTZwV3U3eVNDY1I3alYwM1p3Zy9RQ2VvenpZSEtqbEtpbndiLzdZeUR1MXpm?=
 =?utf-8?B?UUZSN0M1OXE5YWJNWUtMTmU1TG9qeFdhNUZhVVYrb2dpQ0pNQlZXZ1dVTCtx?=
 =?utf-8?B?SyszUy9uL3VJV0tnREI2THNkc2hxUTNSTTVLWEtrdVM4Zk9IUUg2VTBiUTJO?=
 =?utf-8?B?bk9XWFVRL1NEYnlabjJhbEl5WURCbnJmK1ErUGpyaWxUQnlFUE9HMENQeFlH?=
 =?utf-8?B?MVIvcXVSYWI3WnNQZjB6czB1RldtTmtCR20yb0tvS3VnMXRKbGwrR002Wm1u?=
 =?utf-8?B?RURrVTJkT0hYZlN0THlNQkg3SThCck8zMml2ZXA2NEpIUDJBc2psbDIvMXVJ?=
 =?utf-8?B?U2N1WVVpZ2pxV2daNVpicnRORHZreGE5bkxzbS9mMUZKbG11VlZtT0JXZXJH?=
 =?utf-8?B?RW1BdkJxVjV2THlLSFhmNVZsVlk3cG9FMkJMNGh6WnlabFFpcDJIcElFQWo1?=
 =?utf-8?B?cHIreDlQeERNRlZzWU5aZm85YmZkMDlSMUZEOHEyS3V5SzhiZEJPNE5mU3RF?=
 =?utf-8?B?Q04rQkZOMzRVUlQzNTJSeHZYZ3RjQkdQNW5MWnF2OEhEeXpZSldvcEIyOGx5?=
 =?utf-8?B?U3hhVnNrc0IrYXVLWWRLOXIrQzc5ZlJwMTZVVHFtOTBrN0xjSkMxeEpKcnpi?=
 =?utf-8?B?S0U5QzEzYVJFK3BqVHVFRXJybWhUNTBPbWVCck4yNVVQbnRNZ1RXZDhMVDFI?=
 =?utf-8?B?SUlDTkZLVW53TVIwenNCZGt3NTBIVmVZMzJQaEExeWwyb0sxVy9iOXQxMEho?=
 =?utf-8?B?SmdKdm1laE1kZ2ZueElVUExJTHBzWFhQUE1zNENkb2tmbWZ6K0QzV0RBWjQ4?=
 =?utf-8?B?emFtME5wWUFhVm5MeUNUWDMyYXlTMVBuOHd4TXIzSFg0UjZmb245QW1ZTHhs?=
 =?utf-8?B?NFlsMStKUUJETDFUWDBMclBNTmpZdm43T2sxUEFSNjk1dWE0eXVpaTdGM1JO?=
 =?utf-8?B?dEZzLzU1NDZQdzZ3ak9sbWxnWHBIVTRVWXVCaUdlTDE1K0ozWHZycUFxN05R?=
 =?utf-8?B?cjEyRzhjT2tFbTJuTGRHTVdhVGE2b1U5Wm5paFo2TVFsa0RxbkRxWlMzb0ti?=
 =?utf-8?B?Z3NFK3JQR2hXeHlVZHBkcFcxNzlXalBGSlNJUzRWQUtDUUpKazJXSDlHRlhl?=
 =?utf-8?B?Q2lVYmR0QVRpTnhYYVVvbVl2R3V1bjdrWXBjRmZjUVdyeEk2cG9DZVZxcWtq?=
 =?utf-8?B?WW9QbTFYWmdqQnk3amJKS05xMHN6Y0lvd09LUVhQNVd0RTlxaWFIWVJQRjRJ?=
 =?utf-8?B?WEVqcTE3MXpoYW5aMVlmVXkxSkFCdkhVVDN6VTIrcEpNR3NnN0Q2SnRKZDFh?=
 =?utf-8?B?NEdxVXlYYVhQSVBEUHdwVlZiTVJIcDkvY3pTMTk4U2E4Qy8xY3ZuNHRidllJ?=
 =?utf-8?B?UzJVNFFpVHVyR1lwcDRObTU5YnpSU21kMDJkK096RnJ0TTUza1NHSEZrWDIy?=
 =?utf-8?B?WnJtL1FvczZFVEw5YVZVNGxWSmZkek5nditLV1hTVGxwQ1BvYm9ZTDRPMmw5?=
 =?utf-8?B?bjlVVmpNMHhXZmkvMEFYTmpZRytkd1FKR3I4K3VnR0pqV216QXlmNkVLSUZ1?=
 =?utf-8?B?N0c0SFRvYjJ3bVFybEg0M1BRc1gweU41dXZDRFZibnlMMk5adEJCUnVNV0J6?=
 =?utf-8?B?aHpSdWJHRWdjYzVoL1pBSXEya0VVZTllVGVPSnJHOTNuMmlPMjUwVUhiQmhj?=
 =?utf-8?B?Z1ZaRnJOeHd2WHN1SzVra1lZdHBnN05iK0x1YjlKOFhPSTdpdkpPTjlTZGhq?=
 =?utf-8?B?cTh1L2RoMWlrTmJXbERZajJSNWVtOStqVk1JR1QvNmlTK3FDaDJHNHRHbk9G?=
 =?utf-8?B?elFhbktvM0xaL3hoR2lMQ3ZvOEI3SEpXclFYcU93NmNuc3RTZzhwZnpxc3pT?=
 =?utf-8?B?QWM5MnRLelc1dVlkMzlORjB3eURVL0hUaGx1Snd5Tlh6UUwrbmV5eTNYQTdK?=
 =?utf-8?B?VHB5SlBvWnpCRlo1V0RBa0h4OEJSbFFZTDZ3SDJJSktMd0ErYm9kWUtWdkJP?=
 =?utf-8?B?cE1aTUZ3OUs3M0NNNDdxR25BdXhsUTlVcGpFV2dtVUpuNUMzSm5ZejBiVUhD?=
 =?utf-8?B?OGdLN2xjQ083U1k5ejZYcVplK3JzT0VlbmR2cFRMMU5uN3lHQUEybzE2TkMz?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b215d8c-d2e6-42c6-df65-08dd61dd43b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 03:15:11.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFrt3E0Hp8i4Fboz1QUVa1GoXeXvSz0B6rm+AwGXrxMuakgnzL7BJFoS0/CD3EnW81XO7uiaDCWBJ4uSCPspgMX0S4gpnIHi/ojKV+cTR6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
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

On Thu, Mar 06, 2025 at 03:40:38PM +0530, Satyanarayana K V P wrote:
>As per the current implementation, the fault is injected on the first call
>of the error injection function. Introduce an environment variable
>IGT_FAULT_INJECT_ITERATION using which, an error can be injected at
>specific function call.
>
>Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>---
> tests/intel/xe_fault_injection.c | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>index 019ddfb7f..1bf8ef1d8 100644
>--- a/tests/intel/xe_fault_injection.c
>+++ b/tests/intel/xe_fault_injection.c
>@@ -42,6 +42,18 @@ struct fault_injection_params {
> 	uint32_t space;
> };
>
>+/**
>+ *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION
>+ *  using which an error can be injected at specific function call.
>+ */
>+static int get_fault_inject_iter(void)

a static function that is not used? that would create build warnings.
Please squash it in the patch that actually uses it.


>+{
>+	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
>+
>+	/* Return 0 if not exported / -ve value */
>+	return env ? (atoi(env) > 0 ? atoi(env) : 0) : 0;

this is abusing the `?` operator. This is much more legible:

if (!env || atoi(env) <= 0)
	return 0;

return atoi(env);

or even save it in a ret variable.

what I really miss is xe_fault_injection as a tool rather than a test.
In that case a command line switch or env var would make perfect sense.
As a test it seems weird to read an env var.

Lucas De Marchi

>+}
>+
> static int fail_function_open(void)
> {
> 	int debugfs_fail_function_dir_fd;
>-- 
>2.35.3
>
