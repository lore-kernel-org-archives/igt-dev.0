Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18DDCE8D76
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 20:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A0710EB08;
	Fri, 14 Nov 2025 20:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtoLt2C+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE5C10EB08
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763151318; x=1794687318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ylYq1SEoex5Ypp2hw7ZJe/nboeZB10XOhzHFAwvRk5Q=;
 b=WtoLt2C+3Isxv++hK41+G+a1PYNQtfpI0jGKATSAgVvLbDMXWx+bKK7a
 TtvkXiBv7wc1KF4MWz41m5rw8tqWJxgSExArtgWegFSuP8O1fyHHk0N2C
 QZL6zi9rnMhGzQjSIBIFeuJiLVPMxw8KW/Fzv4NKzNeXurQnO2ER3ODlx
 B6tVKUgQu9Q7HSPniXwq6skbR5Au8MEITslC0lIMGYa0SAyxjh/6MgmAG
 OFjOLwR51254oghNh3GtIt3zetFr9fizI207ZMSLAziGs+q6W9Us+rPGd
 KbvsEGy7e6aMnV/kiBpdr2SaGCVpdb+mr0w7G2YKH/tK+YCcutwkQ86kP A==;
X-CSE-ConnectionGUID: wF40WNwIToixyrFedoo/Rw==
X-CSE-MsgGUID: K1zx3QU0QkSpnA1Mp043IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65156115"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65156115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 12:15:18 -0800
X-CSE-ConnectionGUID: 6KSXKxN+T4WJ+ocELNNimQ==
X-CSE-MsgGUID: lan68GY6QSSciUQvyAmXzw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 12:15:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 12:15:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 12:15:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 12:15:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXaj6+9wbv4PSYOwAwUQHf9CwsJv7YD0GjfTv8D1Dzkm9e2nQgy/WyEC1zLBhpfbelvfVYgjhoDBjZOGtH6FAKFtnBVYvdZH7CgWVF6/xSHhb6iZ0DHGH0EJzlOdVenAcv5zT7lQq99tiAvd7AueacX430VtBhBlVS0N9EaELqb+L+MA8u31edzvQ7aU3HEv5JxbV5xw5MaPHMbsPvKEglF1Z8cor6MPPkl/pVxoR4JhIFiqmVywn45eJ1hvH5kAJvI1zCUVl2swkJ6UY3LktxdZ5vdy4P0EljqAOZL/NOwI0wGPgo08/1L3yIbfRypG3itMIHGtKBW7Wrs7Bx7Mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsPszV32Tw/AaEDrIYKz//GzJ205GFhH7Q6Th9gzxCU=;
 b=qPADtBLg3Nmh7E/Hoai8nBM5X6eMaBwBCe7VZDFyMHMJbqHB1BimS/Om1VlAJgWxDWg+bBN3uPFn3uidGIeajhJT+uJtZ6OPZ08+LD4UWFZyMrw0hktcduB1eTvXicxF1/AiNodLcspZwi51SrwK8VAX/WonNA9+E85IshVxiNvCWwiGXFfQ+S8nUBiEFORX8s9nCEmMjk8CcV//XKMV412e0SFGEx304EsKm5zEzAWg6fIvyhKRjfr13O7o3LrTSTgMifroA3rzryR2E6TSnF3Mx1pFTBMo7hyE/WhNT1ItqBg0MfZ5N3g6O+1Ffp+RfVT3kpCG22EeIvrDpfbQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 20:15:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:15:15 +0000
Message-ID: <7ae62677-eb16-4e8f-b55a-8c1356697a3d@intel.com>
Date: Fri, 14 Nov 2025 21:15:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Add sched
 priority mask to string helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <lukasz.laguna@intel.com>
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
 <20251114190757.2295174-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251114190757.2295174-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: bde7cd5c-0018-4534-ca4b-08de23ba862b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2JrMHRKUjdUaEhSSWVFeU9FQnVtL3VwMEFpcXFpVzR1c0xRZVRoRzQySGRm?=
 =?utf-8?B?NkpVYWt2b1UxWmV0bEJpOUQvY0xGbWtIZ2NNUTY2RUozRUVGRENkZjZDTHVP?=
 =?utf-8?B?WDhGaGNWSWNLaFdOR1ZhTUpuKzB3VldPTWkyUTI3YzU2aTIweHhtZFBLc3JW?=
 =?utf-8?B?djZ1a3pHbmoxaHdDa0JZOU9hOHNabC9ydWx4ZVpEUWNsVllrWjMzZ3BaT1lG?=
 =?utf-8?B?NkNiT1Ywc2hsck9CcGVBZ0FuS3hjTUxvTldWdk1URFVEbjhRTGpzdjJoY0s1?=
 =?utf-8?B?cWdkZGxjdUtBQWdQWi9OSlp6S2Q0WFlGaFJxK0FKYTdGN2tVYVNrQ2lRdE0w?=
 =?utf-8?B?SGtybG1uN0VuM1QyTXZLYzZrT0VScmdERzJSL0FjRGh3ait5VWVhYWpWQ05I?=
 =?utf-8?B?NGczM0N5b0dJa09hODgwZUc5R0doQWZyMTdnY05YZ3ZmR1RXWE1YMHFYbkJS?=
 =?utf-8?B?bjF4bVdMNGpPU3ZucGdaSlN0OStGT2FKL2hXc3M3QVBYVjQ0d3FpZWNqcTl2?=
 =?utf-8?B?NGJTRFJJdHE1QzMwWVhIMzVnR3pjdVZTaVpPRmhwcUtaMDUyNm5GR2tiTHVN?=
 =?utf-8?B?eS9XYSs0U0NEZVQra3J5RWo2QTBEdlN2WE44QkJqTzJockcxSHdaN29ROVF1?=
 =?utf-8?B?bVB2REJEU1VoUyt0YWUxMGRvYXQ3d0lpaHJOQnBQd0tmQmNzRFE2Wk1DNXFa?=
 =?utf-8?B?UFpiS2M0a2QvYjB1S01vSWRVTHVxOFdlc1BzQS9YcllNR0ZKQU1pSEF6WkFs?=
 =?utf-8?B?eFV5bGZlNEdpVnJ6WG0veU12WVRqdldVNk9rbHhnd3RsOEZkcGFHY2xGeU1T?=
 =?utf-8?B?dk1Bb0FQZ05Ja1RyUzhrQzYxVElNdWwvUkVidXE4d3lHNkU0YVRGMm9yM0gw?=
 =?utf-8?B?NndoWmFkeEdMQngwQUJZUXg4SHFMSXQzbjREaUJEMGduUmdvZ3lyMlE4Um9W?=
 =?utf-8?B?MGNmZXhQcXpLK2hySlZEZUp4bWhOOW56L2o3c3JlV2JwaWxMRVp0c0VFaWVR?=
 =?utf-8?B?TUdGS0xSank1bzh6SU9GZ1RSN01VQnNJbUpPM2kzRnZKL2FrdW5nWTJGSm9N?=
 =?utf-8?B?MGJzWTNzMXJ5MEs1OXpTbVZMVGVtdi9IYmo5WVQ0K1RYM0JwUkJscGZnZlFt?=
 =?utf-8?B?MUtmQ2NMZk5PQngwS0trNWNINGtVU09OQmhiZFRVdE9iRFQzcG5rR1lucVZm?=
 =?utf-8?B?d0swcHFsZWNBVTJiS2xkMzZyZE9PQUwyc2puOHlIYWZ0OU5hcWxGVEtTRVYx?=
 =?utf-8?B?aTJSY3dkMDJ0U29ybWZXQnJBTVJsWW9oWnlxZjNNejFlbzZzR01CZTlRWmMx?=
 =?utf-8?B?YzVleWJwa21ONU0wcVc2UGJhRlJTQ284VlhRSVB0NGczS01pWDdnR2xOSzRN?=
 =?utf-8?B?SkozY3V5elkySGZiUzJ2WE9wWXc1S1U3bVloZkluQUJEWkg3cGVqazhqdjJk?=
 =?utf-8?B?NUMzeGFQM05HNmV2K1VSOE1uOVo4QjBxWmJzM2paMDRFdkxUUk4wT1VHWmhq?=
 =?utf-8?B?ODdwRGl6QUlma3V6dGxIUWlrUG83OG1IWHZ2RUE0eW5VY2tNdDljME41dmZl?=
 =?utf-8?B?SCtEYkZCZ3ZyUjRXNUNSUHVVbENHc0piQUNZNkVwY25XbkhhYWdwRVFWZXR4?=
 =?utf-8?B?bGJiYlNFR3N1amJwNXY1aHY0TGp4Sm9JRDhzQVFpdUdWUVVBc3BEREp6ckNK?=
 =?utf-8?B?c3h5bFhXSUlEQWhmeS90cnd0cHk3d21iOSt1L1M0elRPanBCeXVZd3R1Yk9P?=
 =?utf-8?B?Zm0yUWxCYWtvTTkybTVac3luRUZzbXVuUzZhVjBSL3Y0ckpWZ1RDWnhqZStQ?=
 =?utf-8?B?b3pOaWdqWHhKc29KdVVvY3RwRmJsYmI5V29Wa2dmTDJnclpSTFJrcXhKanUr?=
 =?utf-8?B?NkZKMGxEcW50NXZ6MVd3QzBFL3llTWxLVVdQUDBKdysxdm5NdG83YjV3M1NF?=
 =?utf-8?Q?87wY6fb2hHty20ygH7VEdMoDnBvf0fJq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTJkZ1FoQWdtbGpPNEkxY3orVjVZMFdUajFVZi9jZk1Xc2p4WTl4ckMzS1hF?=
 =?utf-8?B?bkpDT2plYVlJRmkraHV2UzErOWdMRCtaeUF4TGowV3AwN0dQWlBRemxoSDRK?=
 =?utf-8?B?cEkwZTZicU8rZjlkejgvL3VqWnJvUXdtVEx5QXF0V3pDS1E3WUNIWmtCRTQ0?=
 =?utf-8?B?MEoxaVJOMCt5WlM3TEI5MkZ3TWl2SUQ4aG9NalRaSG1XMmpscW84Y2tGVVVT?=
 =?utf-8?B?UmozTXhxVXFSV2RRcm55SmFvekVWY3h6bWxpMHhyVllMYTc4V1ZubDlZU0I0?=
 =?utf-8?B?eTZ2QmlqUkxXTzBpRXRwdUl6ZG9XUDdYanVXUGdPQkVHa296YU81SEZRL2U0?=
 =?utf-8?B?U2VTaWorc0hTTUJqOFVNM1JLd0tteFVpRTgwbUdHS1lDUm03RU9ua1FCeVcw?=
 =?utf-8?B?MnFzN2J3T3pUUmdRWTNHMEdkZG05MTZaR0Z0bDhwbm82bFdGTzFacm5kTEJ3?=
 =?utf-8?B?SnZoTlhOdTRCZUQ0dEdnSnNleldhNmNJRnFiK0RQczVaSlM3WllmaFUrSHpL?=
 =?utf-8?B?MUl1b1hmcmJ0MEFIQTE3S2l1anZEVWFwcEUxWlppaFk5cWFvajZKNXBaaVRV?=
 =?utf-8?B?MFFoSnZXcXFUR3QyMHBHUUVkdzBVS1B0a2FxSVNSSmdPeERKVDloVzVLMklu?=
 =?utf-8?B?RytodU5zeVZ5akZZZm9SZ0E5OWNrT093VlI2aHlrRzV6WFR0WHhXOHo1bTZM?=
 =?utf-8?B?K2tuWXdUQmxxZmloOUVhdFU3RUdkQWVKUGE0RHJzSDZiaEZJMU5sQUkrZ21l?=
 =?utf-8?B?ZW1xWXBYYmdpTVhzSDMvR2JhM3YrN1FsRVlydUZ5aXFRd1FqZUVBYy9DTTVa?=
 =?utf-8?B?MktHM2pmbDBiVFpXajB2TDJzWjRsZy8xd2xwcVpQYlBOZDdXSWQ5UXk0b29N?=
 =?utf-8?B?L25IUGJVRkxLaGsyLzF5bnlqTUl4U2pZRkEwV3NxWU8wSml2ZXdvNVd4aWhm?=
 =?utf-8?B?RVdjbXl2MDlFQ0g4ZWJBeWZ4MTMzYU1vNHgzY3p5R3lkR2xEc3Eza3dsQ25R?=
 =?utf-8?B?OTRjRlVKSDE4VWk4aTlQZ0U2aDlXTzgvSzRFMkY2RjIxZHFrR05HQSt0U1Ba?=
 =?utf-8?B?bFpJQjdXK3E3ZFhJMi8vMUIydVpCSlUwUVdNaTNkQ0lFTjJveUdiWnAyR1N2?=
 =?utf-8?B?MXJuY3pWKytHSGpBOVJMT1htbS91MVdtbngxZE5pOTRnSjArb2lXQ2VTSGdS?=
 =?utf-8?B?Y0V3eEoxMEN0anZiVzdmVmV3a2IvNHN0Mk5JVXpwVlZsZno2YVAxd0dadkha?=
 =?utf-8?B?U0JZTWZpeEZ0MXhlYlpESHNkVkxEemc5YjZuc3VHZEptQmN2SUUxb2pJSndq?=
 =?utf-8?B?Mm1XS1ZrVmJQbHZKcUJySUlQNDIyOVNkS3BmaVlad2o5OEJmSGc0K2EyRzdx?=
 =?utf-8?B?Vjc3WmVHUThpQ29aTE5ManYwTVY1bS9ZdFVNdEd5SDAzeklrWnFiRkpwY0cr?=
 =?utf-8?B?ZE9WSFJwQXJFbTZMS2c2UEFTQ1pRNnNEM2gvUGxIUTlrSFo1bEFUY3JoaDlS?=
 =?utf-8?B?a2FQRmRoNGlOTVB5bTVCdjlramJ6a1E5dUJQTTN0QzhRUkpvempWaFVqZTFW?=
 =?utf-8?B?OUIyNnFqNjZHcmRBM1NOZ3BvRXN0R1JxeXNEM2tiaW55Vmd2VVpFd1Jib3Mx?=
 =?utf-8?B?alI4U0ZpeEJWM0R4K0xrQkk4NlNwNUNhQ2dIaXVKWGJpVExwZ3pQMmdGVXNE?=
 =?utf-8?B?ejJlU3VxSlBkVnYyVDlYQndBREphVE9nS09EUXM3QmlyUElFVVkyMGFQdkQr?=
 =?utf-8?B?WnRtcjVIQTA4bVR6WTVaSkJ2MlhvbjhNYVpMMmJUOThQd3VRUkNwU1hHN3FY?=
 =?utf-8?B?bnZhczBHWUdTbEVielMra2J2NThwWlJZc1A3bkpZU1Z6SWFDL1FoTUVTZTRJ?=
 =?utf-8?B?Q3JBcEhZTVlGRERLQ1lrVVpURldYc2ZEQmxvVUVISzNZMUxlajljNVpXRjc3?=
 =?utf-8?B?bkpuSGJmdGRpcVpWU1VTejJhSU10RG05TUh2Qlp4bzZHWUhBQlNncmtCZWtW?=
 =?utf-8?B?WjdrS1prUDJMY0ZFU1hVMDhUdVl3ajc4WXBkUXRjZmNUOUY0SjhUN0RPeHJs?=
 =?utf-8?B?TDN6UkJXQXZJVDQxWm5uUkc5NS9tOEVNaHFnUytPTXdwd1RwR2RteWFOT3Bm?=
 =?utf-8?B?NUUwcTRJNFJjNkZZckZ2dzMrdTkvS0hsTTRSUGRlNHo3cVFmbVphUWY3WHVW?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde7cd5c-0018-4534-ca4b-08de23ba862b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:15:15.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4krKzJCnhak1Ab+aXjQTknbRC9NcexVOIofpYZBuLxvlcV7A8l4MkE3ZeSmoBIsFYHSBzHH/bFj9dqh6VAL6XXDSLRMCPZ2l28KM9D/3ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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



On 11/14/2025 8:07 PM, Marcin Bernatowicz wrote:
> Introduce xe_sriov_sched_priority_mask_to_string() to format a
> scheduling priority bitmask as a space-separated list of priority names.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  lib/xe/xe_sriov_provisioning.c | 54 ++++++++++++++++++++++++++++++++++
>  lib/xe/xe_sriov_provisioning.h | 11 +++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 532335abe..da0df4d31 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -693,6 +693,60 @@ int xe_sriov_sched_priority_from_string(const char *s,
>  	return -EINVAL;
>  }
>  
> +_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_LOW) == XE_SRIOV_SCHED_PRIORITY_MASK_LOW,
> +	       "LOW mask bit must match enum order");
> +_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_NORMAL) == XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL,
> +	       "NORMAL mask bit must match enum order");
> +_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_HIGH) == XE_SRIOV_SCHED_PRIORITY_MASK_HIGH,
> +	       "HIGH mask bit must match enum order");

see below

> +
> +/**
> + * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
> + * @mask: Priority bitmask.
> + * @sel: Optional selected priority (NULL for none).
> + * @buf: Output buffer.
> + * @buf_sz: Size of @buf.
> + *
> + * Converts @mask to a space-separated string of priority names. If @sel is
> + * non-NULL and present in @mask, that priority is wrapped in brackets, e.g.
> + * "low [normal] high". Writes "none" if the mask is empty.
> + *
> + * Returns: @buf.
> + */
> +const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask,
> +						   const enum xe_sriov_sched_priority *sel,

this shouldn't be "SR-IOV priority" only function, as such pattern is planned
to be used also for other attributes

you may just pass array of strings and index to the one you want to highlight


> +						   char *buf, size_t buf_sz)
> +{
> +	size_t n = buf_sz;
> +	bool first = true;
> +	char *p = buf;
> +
> +	igt_assert(buf && buf_sz);
> +
> +	for (enum xe_sriov_sched_priority prio = XE_SRIOV_SCHED_PRIORITY_LOW;
> +	     prio <= XE_SRIOV_SCHED_PRIORITY_HIGH; prio++) {
> +		const char *name = xe_sriov_sched_priority_to_string(prio);
> +		unsigned int bit = BIT(prio);
> +
> +		if (mask & bit) {
> +			bool highlight = sel && (*sel == prio);
> +
> +			p += snprintf(p, n, "%s%s%s%s",
> +				      first ? "" : " ",
> +				      highlight ? "[" : "",
> +				      name ?: "?",
> +				      highlight ? "]" : "");
> +			n = buf_sz - (p - buf);
> +			first = false;
> +		}
> +	}
> +
> +	if (first)
> +		snprintf(buf, buf_sz, "none");

if there is nothing then why not just return an empty string ?

> +
> +	return buf;
> +}
> +
>  /**
>   * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
>   * @pf: PF device file descriptor
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index 65f0597fe..9305eceec 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -75,6 +75,14 @@ enum xe_sriov_sched_priority {
>  	XE_SRIOV_SCHED_PRIORITY_HIGH
>  };
>  
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_LOW    (1u << XE_SRIOV_SCHED_PRIORITY_LOW)
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL (1u << XE_SRIOV_SCHED_PRIORITY_NORMAL)
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_HIGH   (1u << XE_SRIOV_SCHED_PRIORITY_HIGH)

can't you use BIT() here?

then above _Static_assert() could be dropped
> +#define XE_SRIOV_SCHED_PRIORITY_MASK_ALL \
> +	(XE_SRIOV_SCHED_PRIORITY_MASK_LOW | \
> +	 XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL | \
> +	 XE_SRIOV_SCHED_PRIORITY_MASK_HIGH)
> +
>  /**
>   * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
>   * @vf_id: The ID of the VF
> @@ -143,6 +151,9 @@ int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_prior
>  int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>  				  unsigned int gt_num,
>  				  enum xe_sriov_sched_priority *value);
> +const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask,
> +						   const enum xe_sriov_sched_priority *sel,
> +						   char *buf, size_t buf_sz);
>  enum xe_sriov_sched_priority xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>  							 unsigned int gt_num);
>  int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,

