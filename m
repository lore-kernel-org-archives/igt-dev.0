Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E5CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 11:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DC710E94E;
	Thu, 30 Oct 2025 11:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYKTkKS0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5690610E94E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761825383; x=1793361383;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=knUmgS+i7uk61jWv6H3xwWm4GQ1AUom6aldBrMGbkAE=;
 b=JYKTkKS0SvHsBDUNPbg0VSQ8W8eAzQZ1l9TTbnyE6BeqUvN5iRr/BZX1
 7K/TrxomC0Cy5UERbTCA2g7mocB80pE+0A04VIyCQJeNncS5zGWr05leb
 gmDh5/J0iHQTQwM16B1VNRQBpkhY4Kx2o362TIgTt1myIRyUX3aNr54vc
 Zix4kZq7/URO+EDdq8xIMGOhOsjVTSLUayA8phhdqbHUa1FKl12B5u8YH
 XfJHURdlyO6hZTHv4ToKoYQzXtePICqIWbmcszqklGYnTnP0pbVBR0F4O
 xydBZY70kSMK0KqFxE3TA3yqzGLkOr4ADUCoIV1X/4TVfpUaAV6dj6GqV A==;
X-CSE-ConnectionGUID: zEMeuxTyQ4uggl2yWwL7vQ==
X-CSE-MsgGUID: s5gZruadRViyZl3RDJPqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67824340"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="67824340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 04:56:23 -0700
X-CSE-ConnectionGUID: yXgOw2mmS9e9J7uIxfXd7A==
X-CSE-MsgGUID: lcCidsTBRGGeP2ywOAF+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190271899"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 04:56:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 04:56:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 04:56:19 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 04:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOqZya0xp3pYX0pi3D6V32mkm79ER4nyx3nckfRcCPqqcKEuMDSEC8IX7tZqFcSEuaWkm/V97HPX2QRzqOu0K2UxcfWR0m1Bfp0CNPVyKZc/N0bPGX3a+uNb6ZxpWifgN3gk697lpnjO8dKVHZNdX9ew44Q95syY/ODvwEy779MZPcqykmFf3NuRswrBVwqTHlI79Amahcps1HSqFVCEvdRYrmx3TqwPgFfE+NF1X0/samQPkLgRBpepCYaUdRW418fn55PuewL8UYTvyxJEeLIqFdaNW6DcROoWbkKpjWJz50xA+tiPBm8n/dmzRRnq5tkAQ+nSFC8hmctYXEdCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3b2G8j4bZqNoq/cfZQgGMx72imZOkICXiEgJLLWnkc=;
 b=puwcUxkOHbPs++bd+nhVYAopYc8DGlBrBI7Ol56KoSp44ofIsl2jCexmf1D2fSkGFXZvSB1KqT364e1QkIHhfy8H7lARsO1XLmjpT4oehCebhJBt1gR4MXSFV4pvOzmWGnzCCuat/6KeItGtvvtv8TpX68j7vaX6+jBL8pGBCzPliLC61GAP4lUfa00Gu7IaW8a4tr9QdS9BXZzWnvGCCpJ8STRhliXd9qVGk4XXcd8Mn8W7Oijl5NXgdyc9N+364Mvkpu7v84s9bUGEfiDtaed9cUU38ldtfEMJxFqzO9w9hxjWQygrkllQzVEtoAwdZD5mL+t3tW+ROeO/VLv72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by BL1PR11MB6050.namprd11.prod.outlook.com
 (2603:10b6:208:392::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 11:56:16 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 11:56:16 +0000
Message-ID: <24b2f766-cf85-4a1d-a267-259697ba8cb7@intel.com>
Date: Thu, 30 Oct 2025 12:56:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v13 6/6] gitlab-ci: Add MkDocs documentation support
To: Pawel Sikora <pawel.sikora@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20251029141946.1165010-1-pawel.sikora@intel.com>
 <20251029141946.1165010-7-pawel.sikora@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251029141946.1165010-7-pawel.sikora@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0042.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::31) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: d3dc27a2-30e9-45f1-a26d-08de17ab547a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q05WbVdQMGsyWHQ0UTZrVCs2blJHZ3NIY3RYbWZtT3EwVG1Nb2wzSCtMWmd4?=
 =?utf-8?B?MjhlTnhHZEZMYXB6dUd5dExHeWI5OXlhQzY5Zm8xR3VjbzErT0VTdmVMOFAv?=
 =?utf-8?B?K0RlM1ZiZSt2UWRReWEwemVhWVhLM2RlMXhDV04xYmxQSHIycDhUdVJrcG5h?=
 =?utf-8?B?bjJ6MHY2REhoQ05RckJGS211d2FJanBBb1dWWUZSaTVnUnVNcmM1WGxBWExa?=
 =?utf-8?B?bVRobmUvYVdqYit0VGRXblVsdUJDeVRqK0YyemQyc0NqUGdqc3lQaGhubFRR?=
 =?utf-8?B?WnVlaTVSY3hTRzQ2c2lDU1MzYWRremtxanUrRWtFQ0lwZUdERXBBOHdRTFRG?=
 =?utf-8?B?cTlPTGtQTmU2azRnUXBpaU5qcGZDSEdDT045bSt4MzIySUltWGZyOXVPWmlG?=
 =?utf-8?B?UkZwaHZSQkdDeExUQm9rMTFSQklUc2FIRWVXMWw4ZCtSWE5Yd2JpSzg1K2c5?=
 =?utf-8?B?ZmRBaUJkRy9LRVdveUdFRmg2UVFmUTBtUjM2M3VxSzVJNWFNaDZSZE9JMGxQ?=
 =?utf-8?B?ZnducnJzbWFSUnFNQ2tESFhJR08rVnM4b1JCU0F5UWQ3bi9uWUhxTHd5elhz?=
 =?utf-8?B?M0daS3RBZTVLNENJeGN0bXQ5RWRlMWVnWDlHNDFwcS85ckNBN1k1MEI3ZlJM?=
 =?utf-8?B?NGFGUjB4N0JZSzRJT3pIc01mUGl1bmowZUxKb0grRm1JM1pZRXlXanpJdmFx?=
 =?utf-8?B?YUpvNVZqUmJ3ZzV2aHNuRVUyUnhZaHIvNklaLzFQdlNXL0FDa1RhZjd6WHVv?=
 =?utf-8?B?UXNsTWFSYnByVkhrOUMzc3pZVk14MmNLL1lka1NDWWl5T2hYbDFIQU45bHI2?=
 =?utf-8?B?TkZ0UjVScGtMclVYem1VRG5wRkVqVGxwM3NMTkovbkFJdEdFYm4wcUdJbTI0?=
 =?utf-8?B?V2p0dDBDQ2VYTG5SU3NZaEt1NUlzVkhpVVBURUJwc1RiS1lScGM3YnRXeFBQ?=
 =?utf-8?B?SXVLTEdXZUhCdEFVQWhIRTByUHZNK1pUQldmamR3TkdoWlpzN01SVUtESGM3?=
 =?utf-8?B?d0lRcFdYZEt1aTJtUk5yYTFQNVA2aXRDZXViZlFTNlRqQllpMFo4QWNkd3gr?=
 =?utf-8?B?YzVZS0doSTcvZU9BZ2F4S1EzUlY5ejVrRzBabnhBa0VEcE1QR0xpMEszSDg1?=
 =?utf-8?B?enpFMkJaNGFtbXp0UGRaUHpKaDNzdDRlSE9KVmdPa1pxaUh3UVZtdkFRckJE?=
 =?utf-8?B?azRuQ2N1czdNUEpXSTBzZlZyUkpzVHpKT0VoeUFBSWpBWGJRWkxLMDhnajI0?=
 =?utf-8?B?Kzl5RVVQR1pkWHdLd1dqUXZBNURFcWFMZHZPTWU3S1JwSlpXSnp5TlNIUmZ5?=
 =?utf-8?B?U3hpTEZzTldoNWRvY2xLTm9rdHF0M283VUFNNDZ5MWJSV1dNSjRyWUJPZmJJ?=
 =?utf-8?B?dlBEQlNGbnJSWENCeUVEQ0ttNEc1WVlWQ3h5cjJuWC9STG54UmJ0b3dCR0Zl?=
 =?utf-8?B?ZmUxcG8xOGVKUDN0MCtES0NHbWdCVG4wM0pXcWp5eXpGYzA0LzRlRUoxc1NP?=
 =?utf-8?B?T1BsWlllVFRKWUxHamZpclVoRUF1bzBNRnRIbmhIMlBjZ3dhK2doM2V2WVRD?=
 =?utf-8?B?N0E0NzI0VXpiZ3B5ZEVLNnhiUHluM3lkVGdsYnhsSUFSQTJkWVk4ZzJoQk9w?=
 =?utf-8?B?eTd2azQxUUsrYXdQbVVHZWtvTmIvWXFQQ1ozMjBHblBUNENhV0o0bThNQ1p4?=
 =?utf-8?B?Q05Cb0tJdjV4Yi83ckRncnVPdXkwWGdHNjVqWm1DMUdXV1Z2bUlzMm5YK3M3?=
 =?utf-8?B?bDdlZm1URWJqbHpHcnhVYWtTaWE0L2UwNW12ZVlYZTZCMGl0RFhLMlp4bWNz?=
 =?utf-8?B?Unp5VUNBK1VGSFVHcktVeUdtSTM5WDZFUmFVSkhuaUJNb010QXBhZ1ZBUnF1?=
 =?utf-8?B?VjVRY3RmaXJaaitEM1kxZU51em1lZ1VqbGhESW9kUmdOaDVDZ1hPTWlaUy9P?=
 =?utf-8?Q?Ywg7e95ceW3IIe4wKlG35TpwLCTSDToX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRFYjhPVFJxUVBMUjMzdzJ2cS9oUGFjaHYxT1lpeEVWY1ZHVHpVMElLUURj?=
 =?utf-8?B?amRkbm9vQjhSU2hLLzRLS0VOK21obFVVN0NwR0ZnWkFvdzlhcVV0Z0g4WE5I?=
 =?utf-8?B?OU1Jamtjc0tUSTlRV0daWHltYk1aNlZJcXZRWHE1SjFoSnJWWEJxWWI5TVMz?=
 =?utf-8?B?Ny9vcjB6bHc0YXp6TGtzbjBMaDdXdytJSnBwYTRDWjlaMHpLSnNwWG5yZmNY?=
 =?utf-8?B?NEFadVVBV01xRnJlU1lOYzBHL3k0WGZLbUQ5SDVxZk1DZjRPY0h0WHU4Qnpp?=
 =?utf-8?B?cVNxL0VWMEw4VjRIUVJHQjlsczI0ZlVRYmEra3FQL3prd00yRVdEa3ZDTDUr?=
 =?utf-8?B?QlV4anBGRncrTlEyUElQbmo0L2dwMVZ0eUFUVW9CMkZZZVJWTHBCUGJ1bW1H?=
 =?utf-8?B?QytTSW41dCtVU08wMjRsVlJLbnNaVmhjN3U4dlI0c0daL1I5Z29BNit1Ulpz?=
 =?utf-8?B?ZHlCWmk3a0RUSStLYkEySmQxd0tUV3ljbXpEdzY4c3NFWlJOTktKT3RoSnB2?=
 =?utf-8?B?NWhQcG13TXNrYzREMUtIYmtrdXpBTS9SRFBFTkJCaGU1cTF2Y0tDcDQ5K2Nn?=
 =?utf-8?B?UnJ1MitlOHVXMmI2R2NoU3BtRWs5YnBVdnJEbDdOQVpHVDF3YUk4Kzd1QkJs?=
 =?utf-8?B?bUFGcWNERjJFaU14NEEzSlpJOFdKUjZxQXBSdmlyblBKc3NxQXlPM2xJdlRY?=
 =?utf-8?B?VU8ybVk4NU56SU1NbEs0bXNrN0w2V2hUZDFUS1VjZko1VzZKMTVQT0ZoY01u?=
 =?utf-8?B?c1g0MmtLSE9OL3JaUDJwRllNOTk0K0N6bTd0SG5mbll0eHkvRWwzQW05OEZy?=
 =?utf-8?B?NEFqcjgxcXhaK1RWYnVKLzNzRFVZdTFDVFBxbXBEM2lqUEZDc21scnFQZDNE?=
 =?utf-8?B?TTVFekNJL0pyN0s2MFFObmtjVHloRzllcWJDZDlFQzZiV0tWQVdPRE9CQ2Zu?=
 =?utf-8?B?WFpIVVN3QmFoNmxja0c2ZXJDcjBjeitabEVCWWZoV2tZSS9xTzVBYk1FeE0r?=
 =?utf-8?B?MExKRGJkc090TjdkY2pudlBBSlRpb1lhZktTVTgxdVJmZ3hqTUtuWUxzTExj?=
 =?utf-8?B?UmxqM0VGcFlRYTN3TEpBLzF6RHE3WGxVaGxIYUFSWFZrREJNbTlPL0RRZVhx?=
 =?utf-8?B?MWR2UDJEZDFoeFFHcGQzSTE5VUw4LzZNditjWEx3a0M0TG5nZUttQlJnNG5M?=
 =?utf-8?B?L1N5YlV6d3pRMlJNd0M3dGk1RnZ2Y1ZQbnh0R05XejhVdGh3MzBEQk1XK2hx?=
 =?utf-8?B?a3NxNDBEb09uM0g1TlRmbzNhSklubSttZzFSTFpLRTZuUytZandUR1IySm8w?=
 =?utf-8?B?T3ZpK0E3My9NazEzR0paL3I3RnNRSGdwdGxrTkUrOUh2SC9md1R5UWtaQU0r?=
 =?utf-8?B?aXVlempIOUR6Y0dTWk9TY2pwb3loRUY2bURCdjB2djVwMDlwTUQ3dWhZS2wr?=
 =?utf-8?B?RUw0ZkRubTBqR211OTRtUXNVZG41andsMmhwSjhHS0JNUmMwY3FuZTJXQkxK?=
 =?utf-8?B?UjY4OHFzL0l4V3NXdm5XOVY3elRCMFhMektqZ1l5eUhGekc1aGF5bG1MQ1Z0?=
 =?utf-8?B?MXhsWm5SQzdIQldaMkJNWVVvYVJRak5kUUZzN2l5SDlwYldSeXN6NW9pR0Zk?=
 =?utf-8?B?WmlhTm1xVlFwMU9GZUtoajlUR1UyMmM5OWhEcUJROXdldzZVelYvNTR6NDNt?=
 =?utf-8?B?MFQ4S0R0V2pGQnV5bjMvV25KbElvS0kyT0J6Mm1ZRlNRMm41dHA2TUpXcjIz?=
 =?utf-8?B?bEo5VUdXelkxUXRzdGd0RWp0TEVxaHlGUkRLNzFlQ0lTOWFiaEJKejF4VzQw?=
 =?utf-8?B?Nkc5OWxvdXdmbjl1dWtzNzltU1RFZXpEaXMrMGhtK0dLSURiVWszZUliL01O?=
 =?utf-8?B?dlFwQmFseCt6eEgySG9ReDB6aW9vRmhiUEV0NEhhbTNvenBTN2dPVWY2SEds?=
 =?utf-8?B?YXNTcmgrdjR2TS9mMG9YcEF3d2ZPS3owOXBzQWVnYk5VbUJQUktzbis5d09Y?=
 =?utf-8?B?dU9yRXZOd2NQZGpFZ0lPU1RTK2dlcHZnZXlTdXhMNGRiZGhyOUZ3cEl5V3pN?=
 =?utf-8?B?VzhRN29xTlYzVHdydnNNU0FIdVVkOHdYZ1piQjN6bHVkYUdTQmo2bFR2ZGVt?=
 =?utf-8?Q?xg055kqwA0VbbNBbmTs9HeBXz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dc27a2-30e9-45f1-a26d-08de17ab547a
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:56:16.0141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVgmsIMZ7NN4g27LIuM4TJnS+wXmj22sEu62kpfomrU/wPKvKOmWSxUR0Qj9IYA/bre5PTzHK8ABqa4++NHfGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

W dniu 29.10.2025 o 15:19, Pawel Sikora pisze:
> This commit ensures two things:
> 
>   * The API reference manual is built and copied to
>     the MkDocs documentation directory.
> 
>   * The MkDocs documentation (from the docs directory)
>     is also built.
> 
> As a result, the existing API reference manual will still be
> available via an internal link in the MkDocs documentation.
> (Note: the API reference retains original theme for now)
> 
> A relative link to api_reference/index.html is included
> in the MkDocs navigation. This file will be generated
> by the deploy job after the API reference manual is built.
> 
> After both builds are complete, all content will be copied
> into the site directory and then manually moved into
> public, for hosting on freedesktop GitLab Pages.
> 
> Signed-off-by: Pawel Sikora<pawel.sikora@intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
