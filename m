Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810EBC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 17:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1589F10E089;
	Mon, 16 Jun 2025 17:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faLgo2QZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA4610E089
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750096077; x=1781632077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BMXdyy1J8xaLXYQQi6Xl7pUIWRGe/Me+tNkLwniOzuQ=;
 b=faLgo2QZfdyNXc1auMGSBEu/6bccvOOOthPUc7YSaI8bt56otQLnN9nE
 A65eoXDlNjHrKyd3w2o5ICMpfltcRC3nN90jHeh1c32J3c5oWw2hAtLvU
 btlqhNIJ9DSMkWLcc9LzHLLAevL0oUYNOaDP6eCCmwmcgYAbyK3jv79Io
 Ab7HgvR0J8vC9edwjHRgvlNeef4l1IksYlcQhQisjO7GQzq2j1SxqqlLU
 +G/dZGY9Cc3NGqJkUtA5G4ZSuxGq4lWHBf14T/3s+Tc8bdVpNpzTihOhX
 H7HCQGN/q1amBNE/fci3X2q8oTVQjfHtP84Ns5WnM93qJP0+ULgeJvNel w==;
X-CSE-ConnectionGUID: RGLVDSlwRH29zLsyWPlqIw==
X-CSE-MsgGUID: dEOzLcC5SfOocJb0ichcZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52115405"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52115405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 10:47:50 -0700
X-CSE-ConnectionGUID: MTESyGZeQ4C696HaWERqNQ==
X-CSE-MsgGUID: 34rH+7cZQKOU4ldPD4Baxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148436553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 10:47:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 10:47:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 10:47:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 10:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMP5xUXVCz92DCQJWafuPEl150tCJVLfteMiIyfnqbkZ4cZT+dHbEuBgkRURCtIHkP5VZqXN3OGSzvukJjIs8EtCW7rWcSG8UPwgdvbR7UBPVwi/Ox0xV5+3KysoDj93x8Ik123B1iDNO6JVq81tW8OVvXttxt5ieM8FzDsQdQR6M3wujAd/2+h1t0LWKdF+w3gE2vqa6vz9oqTKr+U2KRfZnGMg0KZALiTOZv360of8q5LVxJAPgSXcEnYCWY5zdhjnNStGjh2E6qa5fzJdQ2hOxVJHCHYmNt7xOlgn0p9psm/KsfMkJWFbgP3MlN02mR4Fw4EkLGWp7EL+4W9duw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JYMCCkqjOE3jeVcgTaG2cFuVod3jZjk7Wey5pTAcNo=;
 b=NjquIVjp8tOTJgLyYSOAZqkJvV5edx4/D6Sjra/mYKoVrocV232ucIDaXa6z8E2Lo4T7neVvu5qu2Lf8TMLGkcZj9wfQFKemJlwN8eOhDjQUWkQu6pIBMuM56eSfJcg20MHHuF6G6aVaUKMQEuwiCxb51XqimScgnyBrxc+bdhgWd4ijjHddbciZCrtCVJlbRs6idJ1D5R0Ih+9A18CEU6ieqSNzMOk+nXjQUJRuE+pCIHlTM9JmesLk7CEJNOvIBgvWS5lOmUxnaSr93r6K+zS4g6SZWy8AkmpIF2too7K1NEtobWRPVKiJYo6OcCrcbub9kaZmRJBkbgaQOKR3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 17:47:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 17:47:18 +0000
Date: Mon, 16 Jun 2025 10:47:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tools/xe-perf: Change xe_perf_recorder command
 line to use OA unit id
Message-ID: <aFBYmqaFwMqIqUBV@unerlige-desk.amr.corp.intel.com>
References: <20250614010827.3477175-1-ashutosh.dixit@intel.com>
 <20250614010827.3477175-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250614010827.3477175-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BL6PEPF00013DF6.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:a) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 66750829-f070-497e-4f0b-08ddacfdd69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODF3MFRSb1Z4d3ZOVVA3YTdpNzBZN09WOE1VYlZYdGgyTkRKRTA5MjUwaGN0?=
 =?utf-8?B?VW4vQ1QyNjZsOTZXdHBVMHd3WnZFOVJ0Q0xNVFNMdHE3OG1HcjJjZEQrT1du?=
 =?utf-8?B?ay9IRmJ4TVhoU3Q1QjRSYldxTmhTdVl4MGI2bmtWbjg5VkVRakZPSGt5MVZQ?=
 =?utf-8?B?SFV2UW1MV2Z0WUpIOE9HYUt0TEFGRW4ycVFRSVJnWXE1Q09IMm5nWXROcndx?=
 =?utf-8?B?M3BIcm9OZ1NFb2ozNm5JcWVBcHN2b2VtSE1CWVczVjhKUGh3NE5XdDZZZnky?=
 =?utf-8?B?czRYemNhT2g0TEVySUJkWndXUUlpczNHMXcxS3IreWpuajdQK1R6NFRIM2JJ?=
 =?utf-8?B?SkZZWjRwaFg1QmV4M0FuZlBDVVN1RzFxL2Q4ei80d2hqaDFPMEZjaDZGN01z?=
 =?utf-8?B?YU1NM0VwekYwTFpOYXQrRU1oa252ak02MEY2TGJYRCtDSHpxTjNoT0tQTm9p?=
 =?utf-8?B?VkpLamczVjhaZ0lyRHFaeFJxWW5tVmFXSWxEVjNXalFBMVMrSDg2d0ZFSG5N?=
 =?utf-8?B?aUdPUlc2T1k5blNJSlpocm5aUm01b0V0SzhBMW4rbFlHVjE1RTd4a01CVk95?=
 =?utf-8?B?dDRLNWNIWlpxMlRZd3NTaS9mUzlRbjhGWmRPa3ZGSUxZdFhUZ2FzYi9hTkxH?=
 =?utf-8?B?UmdTMWpheDhuczBiaExsZVBMSEs5WFNrWXZZd0R5YWNJQnpWV0VYSzdieUlM?=
 =?utf-8?B?NkVxZW16YmZDcUFkL2JIRWFZRk1YMXAvWGxRR050L1o4WW1TbmNTV1FsUFVn?=
 =?utf-8?B?MWp5V3hhYmxjQk1FNlZoa0JPV0JyTERXdlRDcVRQQlRZaTFPM1dKTHplcmVs?=
 =?utf-8?B?bG40RHJJK0dWUzIrL0Q3eVVvL2w4RWoxN0pBWk9lTE9jdjNVblhKdGhCZkFh?=
 =?utf-8?B?M3hlbGhZZlJjQURReG42TFUwYlVqek95Z1JEY0MyVkFia2V1YmE5U25USHBC?=
 =?utf-8?B?cXY0c2U1RVZScE16cVVlbWUrRjZ2R1QzRFc1eXRzZ2hpTUNLd2FFQU8wY043?=
 =?utf-8?B?UjR3bjgyeVc1SFVNZHN2cmM5azhCWE9sckxUdXZiMmgybGRoWnNudjM3cEJj?=
 =?utf-8?B?OHhrYUJwY3NFanZqdStPMGNUOTNrYTdCRmU4NEdxTmZRbHBWZjkraW1pUFUv?=
 =?utf-8?B?V21zckxNWHR3dEhYUHc5R0JZaFp6Qkh0SzNxV1l2MGhoR3NuNW1taCsxMk1E?=
 =?utf-8?B?R2VWVzVSNEpXZkJWT1MvcVlybGU2cXRUM1lOTm9aKzdIckp4VUZvMjZDemtu?=
 =?utf-8?B?Qzc5SE9WMDBRRFFTbDJjejgrQngvcTBiUTQyTHJnLy9IMjdrVnJHQ2pWTWEv?=
 =?utf-8?B?KzBJOWx3VEtsYTM1cnpqOXQyRWtVR1NMZUovMlg0Um5WaURzaGUwb1U0dUFD?=
 =?utf-8?B?bmgrejdlMGJyY1Z1TU9WdjVka25uRUlQb3F1UmVJV3dWSFFWa09Canpha0hv?=
 =?utf-8?B?bjV1RDZqeU1iRXFqenVZM1I1S1hpckE2eGlSbnFPWWpzME5TTGZnTVBYNE5N?=
 =?utf-8?B?d0JBSjJlY0ljb042VGZ5eDQ1RnU0RVpOZ1drbFM1VUlBakVRWVhQM0N3dVdP?=
 =?utf-8?B?aXRtT250R0haaXVocDVYZ29FOS8vVmd6bndWSjJ4dUVCMW41NTV6SCt2MVpx?=
 =?utf-8?B?b3NqZmE2MGdTa3JDVS9UQmg1Y0JTbytJWUVSOXpBcktQVGRhZ2R4Nkd6UG8y?=
 =?utf-8?B?THVBSXdxUlFVRnE5cFBTbzh0a3JUc3JXdUdKKzhuZlhIQlJoTGRnUVV2Tm5l?=
 =?utf-8?B?Y01IOTVoYmo3SFZjNHFwSzJFaE5CVFc0VFBLN0xTNlFiZkd5L1I5RVR1YjVB?=
 =?utf-8?B?LzBUaXNXd1BBR21JZmNKVWcwNDBDMkxETUVoZkxmd09COFJMNGl4NTNqYmlG?=
 =?utf-8?B?M2ZMZjJnT09PU1NYaEJTRTllTzFlbVJoaVpoMDJQby83SWU2U2p3ak5EenRC?=
 =?utf-8?Q?p2A2J8l2Wfc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVdFL29wTE1OaUJqQzlEVlVLcmZYK3BvZEVjZnh3WDZ0S2tUYjBNWW9rQi9H?=
 =?utf-8?B?Y1RJTnorR0NMc1BYWG83TnYzVTlreVJ6QjR0WWF2SENkVFEwY2lHZ2QvTE1C?=
 =?utf-8?B?bStCaFpETmMreUtwaHNLd0RaU3dscGxXWk51WjEvZWlUK2M2L09sMHN2dllm?=
 =?utf-8?B?aHF2SmFFZExJc2QydVdWR0F5cFpHVEo1NG95Qm9BS1pLMFg5UkhabldvUm91?=
 =?utf-8?B?MFpTTTk1OUxad01kaGQrTDhUcDhyT2lTM1ZmRjlrR1JhY0lZWUM1ZUpDSW5w?=
 =?utf-8?B?cVFWTVRleFVWTmRYc1NLQzQ2WjUzOEFlWkhRcGFXNnlaY1dFa1VQeVU0cG8w?=
 =?utf-8?B?bUtvN0VINDdRamhnaUpuamV1RjR2VHdRNENKbE1wWEN2MXVlVk5WTzNlMHB2?=
 =?utf-8?B?dTh1aFoySkdJcFFnbERqR0srd1UzOUdrTDdaUTdjNHplNmVmTlAyRVBHMXRE?=
 =?utf-8?B?RVp6S2lRVEhscWVrcFFHSXdmeG8zbjl1VVNCMXZvUFozcHZpbmZDMnBiZHE0?=
 =?utf-8?B?eFh6RUtHclgwWlB4dEMxdXpqblBIK1FNaDBkMlNZSzV0eHRqbnZKOVN6bkJX?=
 =?utf-8?B?V0JOajdDK05FSVRyY0NGU1E4dDZqeEx6YUgyMnh1ZjRlS3k5TXpoMENZN0hr?=
 =?utf-8?B?NWk3Sk9zYko0NnA4UTdCckFpYjAxSDBUWEkwNGZNb2xqZnI0S09PZ0xXbk96?=
 =?utf-8?B?ZythUmtmd0lRMWNCY2Jnd1RDN1AzRFVaeUgwMUgwNTFOMVJscjdXTW8yY3hw?=
 =?utf-8?B?THE2emN5Qmw2MkNwMG9IQ2cyMHVQa0ErM1cvU3FMMW5ONWxybHp3YkZia1hk?=
 =?utf-8?B?eUpQb0tqTkRuVGFZTUxzL0dJc1dmalp6UWdOWE5lSUdpcTFNYmJVUnB4NGdu?=
 =?utf-8?B?NFY3QWZyVW1uNWprM0EreTVSOCtLaHhQVkpZMDh3aEFBZ2J6K2R3VHVpVzlM?=
 =?utf-8?B?N0Y5UDRxNTVScExseUd2WHFSdnNGWmpOZ0xyOGZBanlrdEhlZlFSb09sMVQ2?=
 =?utf-8?B?UWphd3RTdVltekozbjRGU3o5dHQrYlU3eDJtcksvUGhWMWV5TWgzNXFCL1Jy?=
 =?utf-8?B?WWorMUkxN1FtVEhMWnhlZmFRN1NZdHNpUTBJZGFOMTlucytLUVV0ZnZCWGE5?=
 =?utf-8?B?aElac2lyQkIvcTNxVi8zZnRKSmp2L241NlpCSkZjMTdiR0xwSXZMK1dTdGR3?=
 =?utf-8?B?VXgwb0pvWG9sTFJwaUVQdHREWEphNnd6LzUySUJQc2ZZVHRlZitheHlvcVJo?=
 =?utf-8?B?Z2RSRTZsQnlIRHNDNTMxM255Rzh2d2hxSHUwaG5oWkt2MDFveVYwRUQ0UzJY?=
 =?utf-8?B?bU5kTG9RczQyRU51bFk0clcyb1J2Rk9ZWGRzZjJKMXp1Y1kycnJGbUxUck5H?=
 =?utf-8?B?Szl5Mmc4bTRTTzJKcHc2VmhDSVo1c3J6VHRYdncxV2R2ODJ2ZmlRUkc1RFRz?=
 =?utf-8?B?ckc4ZGlQYU9GRjgrVExRa2xzWGFGSnpUU2F0a1JWUmtDbityS0VEaERwRkFN?=
 =?utf-8?B?SkhSNXM1RERtOFpHdU1PR1JLR3l0YXo5RmpuRzlWYllCVm1LQXdOU05JMVQz?=
 =?utf-8?B?Nlh6UTZyNW45dE5GNURFRS9udHpCeHQ5TGl6bFRqbFg0ekF1V1hralVud2Fj?=
 =?utf-8?B?dUdFZEkwTFJCYWZMenVLdlJKVUJCSnNobWdrc2N1WTNwRmNkY3pzR01pWVZw?=
 =?utf-8?B?SVluNDVscFB5U3Y4VWpFRWFtUmRTdklZR1Y2dzlGdVQra1N3ZUI5YnV2R0hr?=
 =?utf-8?B?STBZQmZyWElIOUI4WHlPMWg1eXBGa3NhSzEvUkVwbEh6UDNRanFiM3kycWpH?=
 =?utf-8?B?d2szMUNWMWp3eVRSZ21XSjQ1SEs3a2sreURwVzZJdzlUTTVSMFpMeXdpQ3Bj?=
 =?utf-8?B?eWNJMjhaVG9lREV2U1l4YWtibU0xa0VjVGtsNnh6NlhhMkVSZm1LWGdwcEhy?=
 =?utf-8?B?d2hIaWw0QlA2WjhrY2MxMFlNMTR1cHhya3Vqa0NhcUJLdHlJYUZqUlUyYmRi?=
 =?utf-8?B?d1MwcnlpUjl1SHhMbWQ2TUlMc3N2RXBBQlhCV1V5ZU5BeEh5Y0Q3TWk3dWcw?=
 =?utf-8?B?LzdpNDFLM2JVTWNEL25XS3JOUW1PMlVNUTlaNkdZNGFiNWNJRWt4NEVHTWlh?=
 =?utf-8?B?SXR2alZqU3dhQlI4Q3MxK2R0NHhYakFMcEJ2VGNkTHhPUENRcUlhSlRSOFBw?=
 =?utf-8?Q?ddxj/wDWfOGskyplmmRAamE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66750829-f070-497e-4f0b-08ddacfdd69f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 17:47:18.5529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lZN+v8zF8bCJf2tPH7mFP8jJm/oWYeDplBQmfxPAQ2o8hqGONHlCT2P9ko5p2Bvp5CxJ5DDXbElf5QZWO6kUnjXRfWE89oUy+ptD0CzHUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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

On Fri, Jun 13, 2025 at 06:08:27PM -0700, Ashutosh Dixit wrote:
>Xe OA uapi identifies an OA unit by means of its OA unit id.
>xe_perf_recorder was instead using engine class/instance to identify the OA
>unit, in order to have a common command line with i915_perf_recorder.
>
>However, Xe KMD now supports new OA units, which don't have any associated
>engines. This means that it is not possible to use engine class/instance to
>identify these OA units and these OA units must instead be identified by
>means of the OA unit id, as originally intended in Xe OA uapi.
>
>Therefore, change xe_perf_recorder command line to use OA unit id instead
>of engine class/instance to identify the OA unit.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tools/xe-perf/xe_perf_recorder.c | 66 ++++++++++++++++++++++----------
> 1 file changed, 45 insertions(+), 21 deletions(-)
>
>diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>index 5bd91aeb19..f200fe9c9b 100644
>--- a/tools/xe-perf/xe_perf_recorder.c
>+++ b/tools/xe-perf/xe_perf_recorder.c
>@@ -351,10 +351,9 @@ struct recording_context {
> 	const char *command_fifo;
> 	int command_fifo_fd;
>
>-	int gt;
>-	struct drm_xe_engine_class_instance eci;
>-	struct drm_xe_engine_class_instance *hwe;
>+	int oa_unit_id;
> 	struct drm_xe_oa_unit *oa_unit;
>+	struct drm_xe_engine_class_instance *hwe;
> };
>
> static void set_fd_flags(int fd, int flags)
>@@ -829,8 +828,7 @@ usage(const char *name)
> 		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
> 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
> 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
>-		"     --engine-class        -e <value>  Engine class used for the OA capture.\n"
>-		"     --engine-instance     -i <value>  Engine instance used for the OA capture.\n",
>+		"     --oa-unit-id          -u <value>  OA unit id for 
>the capture.\n",
> 		name);
> }
>
>@@ -859,6 +857,40 @@ teardown_recording_context(struct recording_context *ctx)
> 		close(ctx->drm_fd);
> }
>
>+static int assign_hwe(int fd, struct recording_context *ctx)
>+{
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_oa_unit *oau;
>+	int oam_sag_gt_id = 1;
>+	uint8_t *poau;
>+
>+	if (ctx->oa_unit->num_engines) {
>+		/* Just use the first hwe attached to the oa_unit */
>+		ctx->hwe = &ctx->oa_unit->eci[0];
>+		return 0;
>+	}
>+
>+	assert(ctx->oa_unit->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG);
>+
>+	/* Use first hwe attached to a different oa_unit on the same gt */
>+	poau = (uint8_t *)&qoa->oa_units[0];
>+	for (int i = 0; i < qoa->num_oa_units; i++) {
>+		oau = (struct drm_xe_oa_unit *)poau;
>+
>+		if (!oau->num_engines)
>+			goto next;
>+
>+		if (oau->eci[0].gt_id == oam_sag_gt_id) {
>+			ctx->hwe = &oau->eci[0];
>+			return 0;
>+		}
>+next:
>+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>+	}
>+
>+	return -1;
>+}
>+
> static int assign_oa_unit(int fd, struct recording_context *ctx)
> {
> 	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>@@ -869,13 +901,9 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
> 	for (int i = 0; i < qoa->num_oa_units; i++) {
> 		oau = (struct drm_xe_oa_unit *)poau;
>
>-		for (int j = 0; j < oau->num_engines; j++) {
>-			if (oau->eci[j].engine_class == ctx->eci.engine_class &&
>-			    oau->eci[j].engine_instance == ctx->eci.engine_instance) {
>-				ctx->hwe = &oau->eci[j];
>-				ctx->oa_unit = oau;
>-				return 0;
>-			}
>+		if (oau->oa_unit_id == ctx->oa_unit_id) {
>+			ctx->oa_unit = oau;
>+			return assign_hwe(fd, ctx);
> 		}
>
> 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>@@ -898,8 +926,7 @@ main(int argc, char *argv[])
> 		{"size",		required_argument, 0, 's'},
> 		{"command-fifo",	required_argument, 0, 'f'},
> 		{"cpu-clock",		required_argument, 0, 'k'},
>-		{"engine-class",	required_argument, 0, 'e'},
>-		{"engine-instance",	required_argument, 0, 'i'},
>+		{"oa-unit-id",		required_argument, 0, 'u'},
> 		{0, 0, 0, 0}
> 	};
> 	const struct {
>@@ -927,10 +954,10 @@ main(int argc, char *argv[])
> 		.command_fifo = XE_PERF_RECORD_FIFO_PATH,
> 		.command_fifo_fd = -1,
>
>-		.eci = { DRM_XE_ENGINE_CLASS_RENDER, 0 },
>+		.oa_unit_id = 0,
> 	};
>
>-	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:e:i:", long_options, NULL)) != -1) {
>+	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:", long_options, NULL)) != -1) {
> 		switch (opt) {
> 		case 'h':
> 			usage(argv[0]);
>@@ -978,11 +1005,8 @@ main(int argc, char *argv[])
> 			}
> 			break;
> 		}
>-		case 'e':
>-			ctx.eci.engine_class = atoi(optarg);
>-			break;
>-		case 'i':
>-			ctx.eci.engine_instance = atoi(optarg);
>+		case 'u':
>+			ctx.oa_unit_id = atoi(optarg);
> 			break;
> 		default:
> 			fprintf(stderr, "Internal error: "
>-- 
>2.48.1
>
