Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95B3CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 04:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE9310E061;
	Thu, 27 Nov 2025 04:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+qPb4/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6294210E061
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 04:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764216719; x=1795752719;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VuTPbAkcHWP5OrBAiAWHOMFaoRfIrZHbjh5yXtQaTFA=;
 b=K+qPb4/iWa+tbm1slaXnPuQZTbh+SDooRCDo/fXGynq0UqBRk9aedbU2
 piAhmFfKd+z/oKkTMccA39T+qMtttAxWbV3YNd3gXxX/NFU7bVnqED9Yh
 0Sbr8No3TsOHpYF/lbYTcAobd8CkKg3JzAJ2tgo12ia4LKZIiRWkZB4AO
 eolBCByMuelzAsvdlKFGUxemWYrTR+S9DFyh9J15PD6QVtHcQiJ/5e4YR
 vUF3cSfUcJpTnLdUB15SE9TQ9p9DulfwqOM/ePjwEEqVKRRXczUKUGvxM
 lwetlEW9MyBpcOxJFTt5FTJ88SOYWrTpKvScyc53DDdDy6h508a/oJsrg Q==;
X-CSE-ConnectionGUID: s7dfIWcgS4W4ByAXKfjlwA==
X-CSE-MsgGUID: O9rdYLwbREeC/41RXR3mpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77624070"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="77624070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 20:11:59 -0800
X-CSE-ConnectionGUID: jph2nJXmQymXNgPNl1E+mA==
X-CSE-MsgGUID: 8pap6Cm9SIGtSTdDMWZsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="192252590"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 20:11:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 20:11:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 20:11:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 20:11:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDtYrMnM2q0mU6GRfZ8+xNKx1b2keNpKcR39ICJqFg7ZBmAqvabYYeA6cWLkqKfh9cpQ0gVkaFKpE2V9eRnWKvLmTko/n1rGyvbnwya3e7C5N9KXcwzzto/EzRgt4JBtJayfJlysw8U9kO4xdmasFYgH/12eEM89dZj2ZAszHDF5mrJKaqAXkMgv7+Sd8gvhys0iFURRE9JHxmSrwu9X9nNAeDkcG6RSaDCkvJiwR0qsKkGoq0IakcGII2dTrTFstSaAwWFl8rIFENHqvDF15u1yNpLIJxOpouPWJ7WPe45YecJLSpVSuTGyYYqZMlqEoNjltR87Es6EAexpdaguaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR1+gLa07MFluuRlaJ9ZK3Vw01bmdqyDcE+VTAatxaQ=;
 b=KxN5A4KJESbtFfO9YaUbHA3uwjHR9qvm8TW0FLh+Du8misdhNJyxeugrGB9ujzPhmiK3r6pIkCgK445+mAPLjGtZwhqTHpkd128oXVmS5fKnQYOuvA40hbqN5LhrgVmGgyJV65RdcFu8kbwwrEecC1w+9lcwMM40Ms/3lG3Mb85ALP/ANVoWCCxPj/AVQBHybD1yXrPwGS65WM1lBr5syDDwpYsMA+HVvRInqYeQNvpPiQQBCa8HZNqCDzU6OZlwmylSkJgYS4lDV2GQdkWYbsVteG4AcZO2fn3h/UuBWzXWSocOf/w/3X8tXLOId+yl1asl2/psbbqjqsXyZkC+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 04:11:56 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 04:11:56 +0000
Message-ID: <9634fd72-c78f-4690-a097-f8faac5b050f@intel.com>
Date: Thu, 27 Nov 2025 09:41:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] lib/kms: Refactor get_num_scalers() using
 read_pipe_info()
To: <igt-dev@lists.freedesktop.org>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
 <20251121123134.1099006-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251121123134.1099006-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 967b1c4f-49bb-44c1-2330-08de2d6b1a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWJXMjcxUVgrbVRHcWdDMXdKKzQ4WkJoZkVWWWpzS2RPSHVXYUk2WkJFdjQ5?=
 =?utf-8?B?ZlBzMDFHQ0cyeVZKOGZZU2MxVXU4QlV3aGs4eFczc2VOL2ZSdTFZbGJpVVYw?=
 =?utf-8?B?Um1LOGRjWmhMR2p0dG5HWlBNQVg1OXNjY3ZUZTB6Qjh0ZXdCNTFTUEZSaUxM?=
 =?utf-8?B?MTlhVktQTkRsSG0yK0pqNk95ek9qN0hDTndDYUZXREI2V1YzMnBoWTBmU0F1?=
 =?utf-8?B?aVNIUUpzMTNnOUl4R2dvYXBsNkFhTU03TzVXd0cwQ203dkp3dk9MakN2aS9G?=
 =?utf-8?B?WkszRHNyczMvTWhaMm9OaGVDdXpvcUkyZ3VSNmNLWXFTbUVVc1Zhc0d0cGNY?=
 =?utf-8?B?eGVDa2lqM2lVOEtGYlBuSGxSWXVYUGpWbGdLQ0VuRmh6SE5PbG1qYnBlVDQr?=
 =?utf-8?B?cEdTbENxVG9JTFRiVmsvWDlOeGNhZFlkMURMVFFLbmVaLzhqUDJ4RW0zaUJk?=
 =?utf-8?B?RFVybVJxNnZCS0pBd2lpL0xEWTRZV254TTlEY0diS01ONmMyMUJJb216VXBh?=
 =?utf-8?B?Ty9ULzRmOFJoQXo0YS9qci9VSzA2NVdoWGpBRkVPM084bWpSME45NHFvZzBn?=
 =?utf-8?B?TG5WY2xoWkJybGppWWp5U3RRc0VFNVhIT3gxS1ZFQlV6NE90cHBwRWxzUVlM?=
 =?utf-8?B?SVAva3FuRE95Wmp2dksydURaWXBxck1pTFNEdlgwUzNoSXhiZlZwWXhBZlBD?=
 =?utf-8?B?Vy8zeUNteFYweGxqTS9JNFBtUEYxUzk1WTZtL1A5UXVvWjFlV1I1Q3hIakFw?=
 =?utf-8?B?VjlYVHB6T0VETEluVGI0YVF5Nnk5L1ZYNzZOaUErWVNXcG5nUEt1VG5jRndF?=
 =?utf-8?B?ck5qbDlKTE95d1FWWVplRDdMWFdFWjdreDB2aXhLMzQ2VGN5Q09pL0lpUTU4?=
 =?utf-8?B?QS9FUlh2VGo3LzVGa0lMR1lSY2xQdmo3NjlXM2cvTWI2eTlZM0RmdWM1QVVn?=
 =?utf-8?B?OUJzNWhLdkx1TUZSZWoyV0d2RnZaS1VhUE52N1lGV0dQRGdTRW9QNE5rYm1t?=
 =?utf-8?B?ZzlmYWJ6bWRMMDhJZnhZbXBZMXc0TU1NVnBhbUM1TDR1SVhTZGk0RUFxUlY0?=
 =?utf-8?B?Rmw5KzVacjRZN0RraTdpRUJFV3FPbEtUME1ZKzRacEY4dTlEeFR2STZ3TnZO?=
 =?utf-8?B?K0J5cGdqVXY1UUtRVW1wVjVybnF3RUlWNWR4OXdaS3A5SjNpd09nR0o3QXZD?=
 =?utf-8?B?cUl2WHplcjZha1ovcE9ZelBOT2E3SHdRakUybnJLbDlLdHJMNkh6ZmcwbzI0?=
 =?utf-8?B?NmlYNldLOE1MWXc2VXN6UWd6eFl3MW9XQUgzb3FScUVWaS9QWXF1UTFNUmYz?=
 =?utf-8?B?c04rNTh1K2FGWU9ubThvdlhyVzNkTjVaUm5HY093dXB3ZUY3K2NaQ0FndTN2?=
 =?utf-8?B?TXYvWXlpQlliNkFnTzN0SE00QkJoRjFYZzh4ZVZ2UzBWYUdwSnhmMVorZ1dZ?=
 =?utf-8?B?MjhYWFFkczMyazM1Z080Vmt0WFZpWmFrZ1Q5ZXp3TVBRa0pKMXJQbWZqK0Rz?=
 =?utf-8?B?bGZvZEU3aFBaUjJTSzlkK3BLVWgrR0FaTWhldG1ZQmdlWVRUQzgySzV3KzhF?=
 =?utf-8?B?MEkxbnJQNzl0T05jRElTWnp3YWFjZEUybGRITkVIeTZyVzNzd2xBL1hpUGEz?=
 =?utf-8?B?MnpUelkzTy9DNVFBdERxczViSldlUWpUdVpZd1VLc1I3eEhQcEJ3V3lwMTdz?=
 =?utf-8?B?bFZGZFRzUHlQREFDSDllalp4Qm9NOHUybms5a2dMSnQwRTNML2sycDJHU3FR?=
 =?utf-8?B?RkJYREZHZ0FVTVB1MjJQWDV5eXhYOEdTZC9ndG1sb2ZPNFBuWGM1a0V0cUNz?=
 =?utf-8?B?MVNqUEdZVG56Z3l3VVJ1bXVESEJKaVJYQjFQVVpyRGZWdEZTcHI5Q2d3KzYr?=
 =?utf-8?B?TVpKemJTVGRONmxSd3A2d2EvT3o5OTZ0K0ZORng5SXRsTCtZSnVRaWd4dlkw?=
 =?utf-8?Q?IoPT10HvMBYIZbGo6LnKSps79LXhtHfG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpVczV3UUhvWFIrcHM3S1RTdW1xbVlvQ0N0VWlpT2dwN1Z4cXlkTUkzZVVJ?=
 =?utf-8?B?ZlIvcXpjMm9KN25ubGJrRzg4MmJiUlZXWno0c0FkQllVUVdZbEtaTG5FMks2?=
 =?utf-8?B?ZUxJTkduSzJYSm9ub3pKamZBUnVuQkRKUWtVbzd6bjNRa2NhUHZNSnlYSHpa?=
 =?utf-8?B?SXRWYzJiMW43dCs3QlM5eFFVazFHbm91OUxYUGc0OXpDSW1ldWpRa2JyK29V?=
 =?utf-8?B?bThvaDhQVmJKNy9hK0g4b01jMkp2MUVRZk43VWMvY3hsWW10MElyYUt2V0p2?=
 =?utf-8?B?V2hOT09LUk1JOEQ0WGtUaFJBU2tlTmMybEwxSmZyR21hNkxIM05jTldrMUhp?=
 =?utf-8?B?RUxHNnV0NUUrbFI2MUtJQlJpaXdmN1NJZjBTR3dnSzU3b3BBTXpjQUEwSkx5?=
 =?utf-8?B?RmJUVUFtYUNZdDgwL3lMM1lmOGM3VDZESE42ZElUa1hGZWRVWC9mTStKOWpV?=
 =?utf-8?B?emtXWUN0bTZFN3YxWE9JZDU3dUMyMCtFOGg1amUzc0Uyemlmbkp4TVkyeS9N?=
 =?utf-8?B?eWVQRG44MFY4ZmFOUU5mM2VuVTNaU0l0THdsclJzQzdqODZPZVdoUzRVTSs3?=
 =?utf-8?B?NnRjMVR4eHY4eUNGbDRWV20rVUkxMEpYTFZCTEJHb0N3bFpLWkxWSnY1NGZl?=
 =?utf-8?B?dFlvTHgyRHEvem82Q2wxU1VCeDBzM21zNGxmTEkrcHgxWURHTDg0SmhLRkxF?=
 =?utf-8?B?UElMRk9kNS9Db0tYc3pPTjh1d21WaEtiMFpqUnBHU1dBYmkwdExXcENlWXRh?=
 =?utf-8?B?bUFNdFgvRGVEV3drdmd2N1dCNkUwcDFFR2txZ2xwTFhZWDEyY0VEREQ4Rlhh?=
 =?utf-8?B?djBUamM1Y0NsYWpBRkp6dEMrbjVVS3dqYm9aNHJkSzkvZStBWnplaDVBTk8w?=
 =?utf-8?B?dWplTFIvVXB5dTVRWFJKUC9hWEVVS1pXdUs2R1JPUHlpaERyZ2NzWUdvTmJK?=
 =?utf-8?B?aExUNGswdjNTR3B6eExpQUdSMzh2RXVqRjRQNWo1MDB1dmwyS2JhR0cwWm03?=
 =?utf-8?B?WStETTc0SzdMUldrbTAwVTJWM2k5YXh4czZ0Y0xNZnhpZVM0ZTRsWU1CUVF1?=
 =?utf-8?B?ZGc5OUhTZDhoYytRUGx1ZVMrQTdvdmEwM0lVQW11d3RaWWJpOGNEbGs0NDJ4?=
 =?utf-8?B?UjY4VVZhb1U0RU81UTltclUrejhJNlpMYnRYK1lPZCtheS9BVUhWS1N4YTB2?=
 =?utf-8?B?ZnFGUWd2KzJFQUR5T1pHMFUwczRua0dDQVNhNlhxOE5OQWd6UzVYV1RIYkxl?=
 =?utf-8?B?NzEwWUU1L1AwbDN4NGlscGRzSnZGRXViV0NoWkZDQ0xTbk15U0F5SjVkVG5v?=
 =?utf-8?B?RmJXVnlRNklUTjJxcnVxdzBoQTBnbmJrbWZ5NEp0ajlUMUVUNkpQem1QUG1w?=
 =?utf-8?B?V1d5eThFVXplbGxlUUpBWncwcXpHUmpha3IyTlNza0EyZ0FrSEN4M2NmQzRm?=
 =?utf-8?B?YkZXYk5nbDFpSnFSeExuQkhROXA0M3B4UmlXOGU5VGkxU0JSWWNHVHBpa0lO?=
 =?utf-8?B?ZFZ1dm5odlJ4UVlZbzRCMENYZEpmYTVSN2V0WGJGU0IycVVSd2loT2NmTkRI?=
 =?utf-8?B?bm9vMjNkWDlYYVd1MW5OUTl2U0l5REk3V3hzQm5qN0U1bHo5NFFGejFUQnFI?=
 =?utf-8?B?QzJhMmEvdFRSMXZqalJQZzJDdG9nVVZwUHpqdW9nMWRsc3k4MWxXdnhEU2ox?=
 =?utf-8?B?SzVrYkZVM3BYZWg5c3NxWEVIczNZOHFXUW0yV0FPMUVNTEpVRWIrc3grYkNQ?=
 =?utf-8?B?Vkd3Y2Z5cmVuZVg2bENiZitacDVpcTZiOHJWL1UrRzZlanpnRUhia214VE40?=
 =?utf-8?B?NGxsdjRHWXpVaUlBY2dYM2NGZGU4bnV2NGRseUdnRDdDeGk4bEd0aG1HSFAz?=
 =?utf-8?B?V1dGR1RZa1RvaHZUVlZlLzlvMEdKSFVsKzYxcUxVQTNUQXZFQThCOWdVOVU1?=
 =?utf-8?B?NnhaN202eWtHcnVLazBnbFhTdU9RMnhsN0lYSXlYd3c2akFHK2NCZVdRZzVC?=
 =?utf-8?B?N1gzblRla0JvM1dhZDlPbjEvUTV0TFFJd2dOMHdnV21xZUN3eldTcmpWL0hG?=
 =?utf-8?B?OERsV3N3VzhUWFVFeEp0RXJBTE9DQTJWVVA4TTVucml6R0U3YTZJckpZYkFo?=
 =?utf-8?B?VHpTMVRmSUk1bzVNNmhEUUoydUNJbVJCS25yT3Q2NVNuSVlOdmpGQzhjRTho?=
 =?utf-8?Q?sEaggrdewVO2uENggOVn1d4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 967b1c4f-49bb-44c1-2330-08de2d6b1a27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 04:11:56.4415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMmGZYL/NdVyilL+6RgMBr7mWEvbYFw/EGTFTdbo6vbHz0yuQQtgxWkcMX/uZd6zS+eiB5pqoxmLTfZzJcXpKK1XBswNuJ8rPH286GhH26FIfDry5+2uMYtZifRfSb7k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

Hi Swati,

On 21-11-2025 18:01, Swati Sharma wrote:
> Introduce a read_pipe_info() helper to extract per-pipe sections from
> i915_display_info. Update get_num_scalers() to use the new helper without
> changing functionality.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 46 ++++++++++++++++++++++++++++------------------
>   1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8973ffdb2..a75323645 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7026,6 +7026,28 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
>   	return connector_id;
>   }
>   
> +static char *read_pipe_info(int drm_fd, enum pipe pipe,
> +		            char *buf, size_t buf_size)

nit: consider renaming read_pipe_info as 
locate_pipe_section_from_i915_display()
> +{
> +	int dir, res;
> +	char *pipe_loc;
> +	char dest[20] = ":pipe ";

Please use macros for dest size.

validate inputs: buf and buf_size and return null.

> +
> +	strcat(dest, kmstest_pipe_name(pipe));

safe to use snprintf(dest, sizeof(dest), ":pipe %s", 
kmstest_pipe_name(pipe)); to prevent overflow as sometimes 
kmstest_pipe_name() might return "None" or "Missing pipe name" or "invalid"

> +
> +	dir = igt_debugfs_dir(drm_fd);
> +	igt_assert(dir >= 0);
> +
> +	res = igt_debugfs_simple_read(dir, "i915_display_info", buf, buf_size);
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	pipe_loc = strstr(buf, dest);
> +	igt_require(pipe_loc);
> +
> +	return pipe_loc;
> +}
> +
>   /**
>    * get_num_scalers:
>    * @display: the display
> @@ -7036,30 +7058,18 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
>   int get_num_scalers(igt_display_t *display, enum pipe pipe)
>   {
>   	char buf[8120];
> -	char *start_loc1, *start_loc2;
> -	int dir, res;
> -	int num_scalers = 0;
> +	char *pipe_loc, *scaler_info;
>   	int drm_fd = display->drm_fd;
> -	char dest[20] = ":pipe ";
> -
> -	strcat(dest, kmstest_pipe_name(pipe));
> +	int num_scalers = 0;
>   
>   	if (is_intel_device(drm_fd) &&
>   	    intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
>   
> -		dir = igt_debugfs_dir(drm_fd);
> -		igt_assert(dir >= 0);
> -
> -		res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
> -		close(dir);
> -		igt_require(res > 0);
> +		pipe_loc = read_pipe_info(drm_fd, pipe, buf, sizeof(buf));
> +		igt_assert(pipe_loc);
>   
> -		start_loc1 = strstr(buf, dest);
> -
> -		if ((start_loc1 = strstr(buf, dest))) {
> -			igt_assert(start_loc2 = strstr(start_loc1, "num_scalers="));
> -			igt_assert_eq(sscanf(start_loc2, "num_scalers=%d", &num_scalers), 1);
> -		}
> +		igt_assert(scaler_info = strstr(pipe_loc, "num_scalers="));
> +		igt_assert_eq(sscanf(scaler_info, "num_scalers=%d", &num_scalers), 1);
>   	} else if (is_msm_device(drm_fd)) {
>   		igt_plane_t *plane;
>   

