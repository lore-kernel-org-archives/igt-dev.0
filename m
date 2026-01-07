Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4EED0D141
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 17:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC37210E21C;
	Wed,  7 Jan 2026 17:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="einUEuLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DE210E21C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767806123; x=1799342123;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=XDfvuMOrohTL/bAfTUeSYkzn0gFv286Zgy5gTaITjyg=;
 b=einUEuLu4nb1briWxkuSu35jkAn8qn7NzvS1+Sx7dwRFwqQMcCzLUPnG
 3W5OA+4PfIn4RxSVp/SDCFjz6vuNA4Yxt9X0FQMjbYo1f9YQNHT2azROk
 oIgXTsPuXFsQ1EPYu6fBJAVJSuvjzWNydkQhJJZJMsrNzGVcnhWYv70Pj
 W2GyNTylcgSoAyENpCl8dnY660CPkl9Ha3MKA6qsSHansFK4Ij8K8kxwe
 9NtHSTA44vBQR/CUy2DaqFBdMkNQR117Qrc9kU5/wiFg7EJg5i1PTjzQy
 5tP0L2Urf3dWAWgPLw2AtACjseKk+wbETbjo2PhrhtIW3+ZFYkclTpeLi g==;
X-CSE-ConnectionGUID: fp1fsH3dT1Gef/BIwdhovw==
X-CSE-MsgGUID: DypSpR9bR9mnlizwM06KEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68187799"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="68187799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:15:23 -0800
X-CSE-ConnectionGUID: V5t7KyLmQJ6gQAbT4n/7Kw==
X-CSE-MsgGUID: ZRvL4O3xQlaYliIFUThTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202183983"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:15:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:15:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 09:15:22 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:15:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJZJn/Afy0a6vtCHrobqEJk3K9ezyrk7FjUtgu5F+dfnCBH07yZUQ5REUZI/pjRJf456QBUFTJMCJSo/UD3C4fl4th/YoQiylKc6VQ6CEJbQI+PB9eSMYoPbp3Yot44Yil0pBXJIklascRvmhFmbEwB4nvHxUO3x/rPjk0dWYz9dvpXqp6xOAiUDoP5H68P8+ujLq9rrt+zcdX3tR2EJVpBSpG3w6JohYaYOXYC6FEOo28sxvmodeIQILz7ArCtN5lzgBfkHa8aODSCbqLEi4P5OCUk89onMz1gJN5bIorgLaQ7LZf78yNrB6AZVY+6v6d/mzupUmmMCwWdkLT8tGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k5SnDqlljH/o2aHz3f8kolzzJD8ZaU01ln1UIpDl1Y=;
 b=a2TYItPLIaQry2Cxz3pyUfj8rAlkAieBozRBsfmqg6m5xorDu7fcMLaWOG0jCCrrfjt6Z6fEozQ2QnqasxbJwO74cI/KD1y24mVMG6XCI6u3FDy4o0oCczncwZJ1BX5WRhxCuutW1UIElmuSvIzhViArf9L5dz+9hb8ytO/V5nyboaftHBrCk3N6zKJK0h8buRqxAwS+uk3fDbcilldTg81Be16PjxWojA7miD/DUlymdCegFpoIO7SSbMlswN/Xll7SiYKHuREnwS8DATY7dorQrMd/5Troyvw6vlSb0ugEbbo+bz2Sjnyq7zrt0FsmOnh1juGp5qJHLe0nHTDFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:15:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:15:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
 <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
To: Juha-Pekka =?utf-8?q?Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 7 Jan 2026 14:15:11 -0300
Message-ID: <176780611171.14086.3048562681864575590@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b39bbde-b4b4-445e-5eae-08de4e10535c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWNvRUJtQ3pjVDRPYldBcU9qSGhoMVRYRUpwYTEra1FGQlh0TmIrOWFlTDdZ?=
 =?utf-8?B?T3ViVHFLZSsrbFlJend6UDZqV1VjL2ZSYTcwQjRUVHR2dVY4eUlrc3ZHbi83?=
 =?utf-8?B?RTZFVFhsbDVCSGhya0E1RXNnTkEyT2dDTVhmcGJYMDFmbnpNaGZaK1YzVDdy?=
 =?utf-8?B?ZHZHNyt5c0ErbnFIWlNDLzVDTnRIZ3lTN0dLVDBwQXRmaEM3TW92bjZnZVlk?=
 =?utf-8?B?NGxOQVhKQTBrUzhvVTF4ZWRsc3NseUdhbVRyTFRicUZrU3FSYVR0ZHFvODB0?=
 =?utf-8?B?OGtlTGE1YTJqUmRlcW1yTWEydk9hTVBzazFGNUZEc1dJTStEbHhZV20wRlJQ?=
 =?utf-8?B?Y3VWc0pNL2xaejRwcUVaVDliSGNEWnlLK3dnS1FoMDJ5WFBLK2Mya0diclcw?=
 =?utf-8?B?Z0dKbTZRYWg0ZFh3eU4wRVJoazBhUUg0dFQrNndoeHl5N1RiQW9XY1Vnb0F5?=
 =?utf-8?B?SWxiVlp6NGttMUU3bnJYVkg1dTdLam5CK2VTeFVVeEIwdmxSeUxFYThrWTd3?=
 =?utf-8?B?bXpGYng0U2tCeXJGMDU3M3N5RzdKcmdZOTFrcEZXaGVmMFkzeWMybEh6a1Bs?=
 =?utf-8?B?SU1aQkRYMzRYclBMUUlabFI3b2h1TzdzSDdDZUYrWFdnanIzc1BhMmQweWda?=
 =?utf-8?B?L09JRExEQ2V3Vk5Ha3Q5OVVQWDdXSm80SzBiSDkrUXJUb29iVzErQ1BaL0ZY?=
 =?utf-8?B?Wnlha1hCZzdQcTdwWmVTbG9sc2ZsUWcvbzV1V0xmWnFWbHp6OHpMbFdqRk1F?=
 =?utf-8?B?akNmZHBPMTMxNXMrMTFaOFVhRE14R2k4aGlxdDRGZ3pEV1VmQkFLcHZyL3Fy?=
 =?utf-8?B?eG43em5pRkovV0draFFMU1I4SDJSQmVIRTRjYmpaU2VXOVJaMGFqWVdFb2J2?=
 =?utf-8?B?WGp5OVhSY2ZZZnJzRGp3WUtFR1FKcjAyVVVLUWxTV052YUlrUEdjeC9Qb3lv?=
 =?utf-8?B?QkVEUU80M1pIK3drVlVnbEk0Szg5MmxyT2dtcVF4UXp6a3M2ZHpBZVNVTThN?=
 =?utf-8?B?Rko0ZXUvUkRtV2wyWnN4N3RBK2F4Z0NYYlEvSFZYdmxIRy9waVdJMndiblVw?=
 =?utf-8?B?RUxuRnNhSWZQU2w4STBXZE84N29hQ3NHWDJQWmd6U0RrTm1ESUk4eFhBZ2dl?=
 =?utf-8?B?K1JLNzMwOXZkQXAxMXN1dU10Z2sxL2NFWWlsZ3NpcVlTbHhvUjFCVStnWCtE?=
 =?utf-8?B?cklpZ3NJeVVVTlhTaXpJWXc2czg0dzYxazBOUFlwY0FOSEt3Q2tzSTQzKzdw?=
 =?utf-8?B?dHFselA4cStYaTRKOE1GMUFzNk5DbWg3K0FJa2FMVkVrV1pNUFRPdEtrVlBm?=
 =?utf-8?B?TGZlaWhMSFAvRk1pMjZLQ3liRFlHTlNkSTdvcnNEM0tMNmxKZmFVLzNKbzkz?=
 =?utf-8?B?VnlzWDZ4VGNsL1VkdFR2dCtPbktveGthNjFLZnhGYjBTQWw4VFRld294ZkFi?=
 =?utf-8?B?ckJtV3ZtcVp6ZmJXVVNUd1dXU2ZJV1dVKzFNMkxkcHhnTUJwcG10MTZ6NlVx?=
 =?utf-8?B?TWY4YXRRY1RidTZ3QzhndVZ0LzhpU3QvMk5aRUFBcmY5U2lCb3VVV2lTc1ZK?=
 =?utf-8?B?dVRra1cvOXFEUTh0VWFjWUxabEsrWXhQbHl5WS8rSjRuRER5QXBoRFZwcXZv?=
 =?utf-8?B?aVREWkZqeHVqaDhEQ0hkeEZva0kxRS9OelFPYUFlWnNoZ2ZSYWk0L0JQMWl1?=
 =?utf-8?B?djdrYVdrYnhpQ1NKWWJ2MmF5Mkp5Mjd1OEZmQTNTNUZGWXBMQkd5cGE0T0Vo?=
 =?utf-8?B?QkJqTjBac1NLalBnMmlWdW5vVVVYTFF3bkdnVHNJUDVXSElZcGR2WVN2U25a?=
 =?utf-8?B?QUxFckVoRDRFTnJkUm9DcW5tNlUvbFRKZ3RndGM2eWFFSTFTQlVwbGFyeE5W?=
 =?utf-8?B?MEJPN0tFNEhtLzJtOGRDdFJ4RVdpR2J6YVVRMFpIa2IyRTNoVlNoYjFSUVVF?=
 =?utf-8?B?NndNRWFydDdwenorYWhIbmNNT0pwWTVuOFpZc3Z0WnFjdS83dFVYTytUVUJW?=
 =?utf-8?B?aG9QUUJBNVZaRDlGL2toSjRHWE1FYjR4L2RFeHFWbFJoaFd0c1NBM0srM1Ay?=
 =?utf-8?Q?j4OPbI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFB5UGVTdmRZQmh2Nm9nc0FGNEVVQ2FxVUh2Q3d1cWVYQnUrVkhGZndNYTdz?=
 =?utf-8?B?cW1CNXJPb2NsWExXT3VuWXUvRHhIMDc5eXRJdHhhNVppUzNtSVdGbkJubDFn?=
 =?utf-8?B?TjFlWWJlR0FNU2lEM05ROFl6UllaZFpGL2F1eDVFS1hqSDZYdHo3bThaVlpY?=
 =?utf-8?B?YUtDWWphWEVBZWZjUWwwTWxCK3cyM1VGNzB0bmNILzRoQ0psQVBoRk4zalVk?=
 =?utf-8?B?TFpzMkVQRmQzK1FyT1F6ckNMT0tHZU1kYjIrNXZUOVBGN2hlNU9iWldkT001?=
 =?utf-8?B?eEtqT3JpODAxTE5uTDZZVGpFMHRzZGZobXlld3c5SDFtdTlXbHVnMUJoaXlI?=
 =?utf-8?B?cllYSmNIN05HWFBreEpLTkZIU0Z5VEJQZGxzUFlhb3ZEOUs3QnZ6WGY5a1hn?=
 =?utf-8?B?bTdIT1A1MkIwaXFESS9TYzJhOHFpZkJFVzU4MUxBQWgwNnZFT2krNDN1UFNz?=
 =?utf-8?B?YmJkRnBhdVpWREU0V0N4cHQ3cTQ5UlhYeEl4VEFKeXNWd1R4NXUrQ1ZGb0dh?=
 =?utf-8?B?RTFYczJTSW1nVGoyN1JoeE9QK09lOTFFSXRtNXFFeGNJeW1UNDlCMDhvVHQx?=
 =?utf-8?B?YnBOdk9UWWo0emc0YUs1MThoVFBWelE3aGV3RGFHOGJpT0NHRkt2TENBRzFm?=
 =?utf-8?B?c3MyV0R4MEZHa0RYck5rM29uVTdGWlJLRjhVcHpNWkNGenpPa0JTODBTQXF1?=
 =?utf-8?B?TVJncDNqck1jVEFwakRUd3BKMzN6UFRVZXM1WEh6VzcySWFyYmNwa2VwSmlw?=
 =?utf-8?B?WmR4bFpaQkI2bmEvUXFhZlpoeWhERlN1VnZGR25zb3RxbVFmQm9CcW95NWhK?=
 =?utf-8?B?ZkNMUi9NVllJMmhyR3I3T1B2QXNYZ1lvK1paeFYxY25QUERCWGxPazdhR1Yx?=
 =?utf-8?B?c0lpTW1FUDVQSm5MeGxJS2VXbWpKelNvY3lrd29PciszY01rQm12MW9KSUd2?=
 =?utf-8?B?dFplbXlSTDFja1NzQ04zQlQwUTJLc29zNXdndHA2UzhlQU1VYTU0RWZjS2Ev?=
 =?utf-8?B?WlQrQXI1RXZxcm91ei9zKzAwanZudFhabEZUbzlxY2QyRFB5eHczUXJ1c1po?=
 =?utf-8?B?ZVhqZXEwUzJ1VkphbklkSEdWaEhzd1FrN3N5TDEwdzRSbkZEcG83VG43Tnl6?=
 =?utf-8?B?VjgyekhnZncwcGNJMUxKRXc3QmtWRWh2Q3FES0xma0w4NXYyUW5KZHNjenBy?=
 =?utf-8?B?b0JhcTJJa0dIZkp0TGZmR3FEYnlGRmI1eW40VkR4WW4wWlBYdGt2WVNoUVJH?=
 =?utf-8?B?Y1ZIMlVkVlFZZVhPRnlYc0Q4OWNMalduOFdqbjFvaHBVYVN3eTlZQ0xETG0r?=
 =?utf-8?B?blY3S3lJZFVBdm52VUZ3Vi9iSWNGZWNzb1gwSWxvSStiODBqUWRqRTI3b1A2?=
 =?utf-8?B?ZUE0R201NGN6M1ZqdkVNZDluV2JUQXNpYm8vSXpqK0VIZG9taFdoQ29vbDdo?=
 =?utf-8?B?T1hybWgwbUNHQ241a1lxYlc2WXVFRFVCL2RLK2MxbmdYS05zUVJ3RFczVGVV?=
 =?utf-8?B?c1BaVnU1Syt1b0FzT0RjYmZWaG1LdHZITXV3WHVmenBnSGhja3ZIemNnV0dq?=
 =?utf-8?B?Ky9CMFZQeE9sd3BYamR2WlJFdEpPREJBdnpXbWtEaXBvcGR1STZ6OVFmSWgx?=
 =?utf-8?B?VWdjblN0MDBKdEpEZmJabzZSNGtKdTJRaHorbS9qM0xzL1F6aGUrZDE0dVht?=
 =?utf-8?B?QndJVU1MSXZodTdYcFEyWmxuOUdPUUh3SVRWa2hFWnl1dFFhUFUvU0s4NzFw?=
 =?utf-8?B?WTQxRTZ0QkRIcG1lNy9nV3YxdDdmOWFhY1JyTVRLc0Rpa2F5bS9nUEZxaWNn?=
 =?utf-8?B?Nmd4VnExT3UrSm8wRlZxemxaWWNvamtMSmJQNWM4aFNwS29aUzBUY0dLZ01o?=
 =?utf-8?B?Slp4V2Qvc1c1aUpPU3RwdjhLRnJ6NlFBdzN5eTNHNWNtSXVkUGdFNVdXRFVK?=
 =?utf-8?B?VHo1SnBPVHhEU0ozZ3N4UFFpSlZJMlJvQVF1MkJlS1NvQzZKR2l4a0MvbzFJ?=
 =?utf-8?B?YURhbi83K0thYS9qdHN4cmQ1YWRtU05vclhqaE1TeExKMk1LOVZQdm0rVUZY?=
 =?utf-8?B?ejNvSG4zT2QxQTNnZ3VHUEUrWGtET2FWUHN0L3NncVFudUd0TzZOSzV0cXMz?=
 =?utf-8?B?SS9GeFRGL3gwWUROM052Zi9mWExqdVR6RTR0TjlsWldyZTNOTkJDcTlnWmFD?=
 =?utf-8?B?ek45OEZCbmJhd2hzWXYvWVRWckJMMWhEU3FCYkFTWlpnWFUxNitrNXA2RDZQ?=
 =?utf-8?B?QTJWQzZZWlRTcW9JU1NDTndBcno5Q09wZ3pPR2Ezb1JyZkQ1U2NVZmFzd1FV?=
 =?utf-8?B?UWVnd0w0S240bnhVVUIzTnNyOVF6dWI4aVp6Mk0wSWwyOEM4U29kQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b39bbde-b4b4-445e-5eae-08de4e10535c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:15:16.1596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYZNhk0pw0n15J1bkhY9FWaep6Tp9hEDlVS+xgfk5L29QIoreGl3tylVspYmftMbw2h8mviE+heZYr19BBm9iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
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

Quoting Juha-Pekka Heikkil=C3=A4 (2026-01-07 13:49:52-03:00)
>On Wed, Jan 7, 2026 at 5:55=E2=80=AFPM Gustavo Sousa <gustavo.sousa@intel.=
com> wrote:
>>
>> Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
>> >Here added compress-js parameter for runner. What it does is at per tes=
t level
>>
>> Maybe rename it to --compress-json-dmesg to be more precise?
>
>Yea, that can be changed. I'm waiting to hear also from CI people, I
>could've gone and compressed those other fields too but I understood
>from CI people they want to keep things searchable, hence for now I
>did stick just with dmesg as those are always the biggest blobs.
>
>>
>> >for results.json in dmesg key is written text "compressed" to maintain
>> >compatibility and on the side of it is written new key dmesg-compressed=
 which
>> >contain dmesg ran through zlib and base64 encoded.
>>
>> Should this be only about compressing dmesg for results.json? Or should
>> we take a step back and make it compress the dmesg files in the results
>> directory and then that would also be reflected in results.json?
>
>That's a possibility; TBH I just didn't think about doing that at
>earlier stage. Idea on this anyway is to save space on CI storage.
>
>>
>> By the way, do you know if we have good compression rate on existing
>> data?
>
>On my super limited test with this change, with kms tests the overall
>size of json came down to around 1/6 of original size. I'll still need
>to experiment more with that.

That would be a nice reduction!

>
>>
>> >
>> >Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> >---
>> > runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
>> > runner/runner_tests.c |   2 +
>> > runner/settings.c     |   7 +++
>> > runner/settings.h     |   1 +
>> > 4 files changed, 112 insertions(+), 15 deletions(-)
>> >
>> >diff --git a/runner/resultgen.c b/runner/resultgen.c
>> >index 1f7e79f24..ef6385598 100644
>> >--- a/runner/resultgen.c
>> >+++ b/runner/resultgen.c
>> >@@ -8,6 +8,7 @@
>> > #include <sys/stat.h>
>> > #include <sys/types.h>
>> > #include <unistd.h>
>> >+#include <zlib.h>
>> >
>> > #include <json.h>
>> >
>> >@@ -961,12 +962,61 @@ static void generate_formatted_dmesg_line(char *m=
essage,
>> >         *f =3D '\0';
>> > }
>> >
>> >+static struct json_object *encode_compressed_base64(const char *data, =
size_t len)
>> >+{
>> >+        uLongf destLen;
>> >+        unsigned char *dest;
>> >+        gchar *b64_text;
>> >+        struct json_object *obj;
>> >+
>> >+        if (len =3D=3D 0)
>> >+                return NULL;
>> >+
>> >+        destLen =3D compressBound(len);
>> >+        dest =3D malloc(destLen);
>> >+
>> >+        if (!dest)
>> >+                return NULL;
>> >+
>> >+        if (compress(dest, &destLen, (const unsigned char*)data, len) =
!=3D Z_OK) {
>> >+                free(dest);
>> >+                return NULL;
>> >+        }
>> >+
>> >+        b64_text =3D g_base64_encode((const guchar *)dest, (gsize)dest=
Len);
>> >+        obj =3D json_object_new_string(b64_text);
>> >+
>> >+        g_free(b64_text);
>> >+        free(dest);
>> >+        return obj;
>> >+}
>> >+
>> > static void add_dmesg(struct json_object *obj,
>> >-                      const char *dmesg, size_t dmesglen,
>> >-                      const char *warnings, size_t warningslen)
>> >+                      struct settings *settings, const char *dmesg,
>> >+                      size_t dmesglen, const char *warnings, size_t wa=
rningslen)
>> > {
>> >-        json_object_object_add(obj, "dmesg",
>> >-                               new_escaped_json_string(dmesg, dmesglen=
));
>> >+        bool used_compression =3D false;
>> >+        struct json_object *compressed_obj;
>> >+
>> >+        if (settings && settings->compress_dmesg && dmesglen > 0) {
>> >+        compressed_obj =3D encode_compressed_base64(dmesg, dmesglen);
>> >+
>> >+                if (compressed_obj) {
>> >+                        json_object_object_add(obj, "dmesg",
>> >+                                               json_object_new_string(=
"compressed"));
>>
>> Yep, this is not very useful, but can help avoid potential crashes of
>> existing tools that consume results.json today.  Nitpick: I would go
>> with "<compressed>" or "(compressed)".
>>
>> >+                        json_object_object_add(obj, "dmesg-compressed"=
,
>> >+                                               compressed_obj);
>>
>> Maybe "dmesg-gz" or "dmesg.gz" to express the compression format?
>>
>> Another option is to have some key dedicated for that, e.g.:
>>
>>     "dmesg-compression": "gz",
>>     "dmesg-compressed": "...",
>>
>> This would allow other formats in the future.
>
>Those format magics are normally in the beginning of the data and also
>here once decode base64, compression format becomes visible.

Ah, interesting.  Yep, in that case, using only "dmesg-compressed" would
be fine.

--
Gustavo Sousa

>
>>
>> --
>> Gustavo Sousa
>>
>> >+                        used_compression =3D true;
>> >+                } else {
>> >+                        fprintf(stderr, "igt_resultgen: Compression fa=
iled, falling back to raw dmesg.\n");
>> >+                }
>> >+        }
>> >+
>> >+        /* If compression wasn't requested, or if it failed, write raw=
 dmesg */
>> >+        if (!used_compression) {
>> >+                json_object_object_add(obj, "dmesg",
>> >+                                       new_escaped_json_string(dmesg, =
dmesglen));
>> >+        }
>> >
>> >         if (warnings) {
>> >                 json_object_object_add(obj, "dmesg-warnings",
>> >@@ -974,7 +1024,8 @@ static void add_dmesg(struct json_object *obj,
>> >         }
>> > }
>> >
>> >-static void add_empty_dmesgs_where_missing(struct json_object *tests,
>> >+static void add_empty_dmesgs_where_missing(struct settings *settings,
>> >+                                           struct json_object *tests,
>> >                                            char *binary,
>> >                                            struct subtest_list *subtes=
ts)
>> > {
>> >@@ -987,7 +1038,7 @@ static void add_empty_dmesgs_where_missing(struct =
json_object *tests,
>> >                 generate_piglit_name(binary, subtests->subs[i].name, p=
iglit_name, sizeof(piglit_name));
>> >                 current_test =3D get_or_create_json_object(tests, pigl=
it_name);
>> >                 if (!json_object_object_get_ex(current_test, "dmesg", =
NULL)) {
>> >-                        add_dmesg(current_test, "", 0, NULL, 0);
>> >+                        add_dmesg(current_test, settings, "", 0, NULL,=
 0);
>> >                 }
>> >
>> >                 for (k =3D 0; k < subtests->subs[i].dynamic_size; k++)=
 {
>> >@@ -995,7 +1046,7 @@ static void add_empty_dmesgs_where_missing(struct =
json_object *tests,
>> >                                                          dynamic_pigli=
t_name, sizeof(dynamic_piglit_name));
>> >                         current_test =3D get_or_create_json_object(tes=
ts, dynamic_piglit_name);
>> >                         if (!json_object_object_get_ex(current_test, "=
dmesg", NULL)) {
>> >-                                add_dmesg(current_test, "", 0, NULL, 0=
);
>> >+                                add_dmesg(current_test, settings, "", =
0, NULL, 0);
>> >                         }
>> >                 }
>> >         }
>> >@@ -1048,7 +1099,12 @@ static bool fill_from_dmesg(int fd,
>> >                 if ((subtest =3D strstr(message, STARTING_SUBTEST_DMES=
G)) !=3D NULL) {
>> >                         if (current_test !=3D NULL) {
>> >                                 /* Done with the previous subtest, fil=
e up */
>> >-                                add_dmesg(current_test, dmesg, dmesgle=
n, warnings, warningslen);
>> >+                                add_dmesg(current_test,
>> >+                                          settings,
>> >+                                          dmesg,
>> >+                                          dmesglen,
>> >+                                          warnings,
>> >+                                          warningslen);
>> >
>> >                                 free(dmesg);
>> >                                 free(warnings);
>> >@@ -1056,7 +1112,12 @@ static bool fill_from_dmesg(int fd,
>> >                                 dmesglen =3D warningslen =3D 0;
>> >
>> >                                 if (current_dynamic_test !=3D NULL)
>> >-                                        add_dmesg(current_dynamic_test=
, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len)=
;
>> >+                                        add_dmesg(current_dynamic_test=
,
>> >+                                                  settings,
>> >+                                                  dynamic_dmesg,
>> >+                                                  dynamic_dmesg_len,
>> >+                                                  dynamic_warnings,
>> >+                                                  dynamic_warnings_len=
);
>> >
>> >                                 free(dynamic_dmesg);
>> >                                 free(dynamic_warnings);
>> >@@ -1075,7 +1136,12 @@ static bool fill_from_dmesg(int fd,
>> >                     (dynamic_subtest =3D strstr(message, STARTING_DYNA=
MIC_SUBTEST_DMESG)) !=3D NULL) {
>> >                         if (current_dynamic_test !=3D NULL) {
>> >                                 /* Done with the previous dynamic subt=
est, file up */
>> >-                                add_dmesg(current_dynamic_test, dynami=
c_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
>> >+                                add_dmesg(current_dynamic_test,
>> >+                                          settings,
>> >+                                          dynamic_dmesg,
>> >+                                          dynamic_dmesg_len,
>> >+                                          dynamic_warnings,
>> >+                                          dynamic_warnings_len);
>> >
>> >                                 free(dynamic_dmesg);
>> >                                 free(dynamic_warnings);
>> >@@ -1116,9 +1182,20 @@ static bool fill_from_dmesg(int fd,
>> >         free(line);
>> >
>> >         if (current_test !=3D NULL) {
>> >-                add_dmesg(current_test, dmesg, dmesglen, warnings, war=
ningslen);
>> >+                add_dmesg(current_test,
>> >+                          settings,
>> >+                          dmesg,
>> >+                          dmesglen,
>> >+                          warnings,
>> >+                          warningslen);
>> >+
>> >                 if (current_dynamic_test !=3D NULL) {
>> >-                        add_dmesg(current_dynamic_test, dynamic_dmesg,=
 dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
>> >+                        add_dmesg(current_dynamic_test,
>> >+                                  settings,
>> >+                                  dynamic_dmesg,
>> >+                                  dynamic_dmesg_len,
>> >+                                  dynamic_warnings,
>> >+                                  dynamic_warnings_len);
>> >                 }
>> >         } else {
>> >                 /*
>> >@@ -1134,17 +1211,27 @@ static bool fill_from_dmesg(int fd,
>> >                          * there are would have skip as their result
>> >                          * anyway.
>> >                          */
>> >-                        add_dmesg(current_test, dmesg, dmesglen, NULL,=
 0);
>> >+                        add_dmesg(current_test,
>> >+                                  settings,
>> >+                                  dmesg,
>> >+                                  dmesglen,
>> >+                                  NULL,
>> >+                                  0);
>> >                 }
>> >
>> >                 if (subtests->size =3D=3D 0) {
>> >                         generate_piglit_name(binary, NULL, piglit_name=
, sizeof(piglit_name));
>> >                         current_test =3D get_or_create_json_object(tes=
ts, piglit_name);
>> >-                        add_dmesg(current_test, dmesg, dmesglen, warni=
ngs, warningslen);
>> >+                        add_dmesg(current_test,
>> >+                                  settings,
>> >+                                  dmesg,
>> >+                                  dmesglen,
>> >+                                  warnings,
>> >+                                  warningslen);
>> >                 }
>> >         }
>> >
>> >-        add_empty_dmesgs_where_missing(tests, binary, subtests);
>> >+        add_empty_dmesgs_where_missing(settings, tests, binary, subtes=
ts);
>> >
>> >         free(dmesg);
>> >         free(dynamic_dmesg);
>> >diff --git a/runner/runner_tests.c b/runner/runner_tests.c
>> >index 908979982..3ea221ffa 100644
>> >--- a/runner/runner_tests.c
>> >+++ b/runner/runner_tests.c
>> >@@ -484,6 +484,7 @@ int igt_main()
>> >                                        "--collect-script", "/usr/bin/t=
rue",
>> >                                        "--hook", "echo hello",
>> >                                        "--hook", "echo world",
>> >+                                       "--compress-js",
>> >                                        "--prune-mode=3Dkeep-subtests",
>> >                                        "test-root-dir",
>> >                                        "path-to-results",
>> >@@ -1000,6 +1001,7 @@ int igt_main()
>> >                                                "--hook", "echo hello",
>> >                                                "--hook", "echo hello\n=
echo newline",
>> >                                                "--hook", "echo hello\n=
echo newline\\still the second line",
>> >+                                               "--compress-js",
>> >                                                testdatadir,
>> >                                                dirname,
>> >                         };
>> >diff --git a/runner/settings.c b/runner/settings.c
>> >index 3ccf71870..7d7320d62 100644
>> >--- a/runner/settings.c
>> >+++ b/runner/settings.c
>> >@@ -33,6 +33,7 @@ enum {
>> >         OPT_COV_RESULTS_PER_TEST,
>> >         OPT_HOOK,
>> >         OPT_HELP_HOOK,
>> >+        OPT_COMPRESS_JSON_DMESG,
>> >         OPT_VERSION,
>> >         OPT_PRUNE_MODE,
>> >         OPT_HELP =3D 'h',
>> >@@ -704,6 +705,7 @@ bool parse_options(int argc, char **argv,
>> >                 {"collect-script", required_argument, NULL, OPT_CODE_C=
OV_SCRIPT},
>> >                 {"hook", required_argument, NULL, OPT_HOOK},
>> >                 {"help-hook", no_argument, NULL, OPT_HELP_HOOK},
>> >+                {"compress-js", no_argument, NULL, OPT_COMPRESS_JSON_D=
MESG},
>> >                 {"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
>> >                 {"inactivity-timeout", required_argument, NULL, OPT_TI=
MEOUT},
>> >                 {"per-test-timeout", required_argument, NULL, OPT_PER_=
TEST_TIMEOUT},
>> >@@ -815,6 +817,9 @@ bool parse_options(int argc, char **argv,
>> >                 case OPT_HELP_HOOK:
>> >                         igt_hook_print_help(stdout, "--hook");
>> >                         goto error;
>> >+                case OPT_COMPRESS_JSON_DMESG:
>> >+                        settings->compress_dmesg =3D true;
>> >+                        break;
>> >                 case OPT_MULTIPLE:
>> >                         settings->multiple_mode =3D true;
>> >                         break;
>> >@@ -1253,6 +1258,7 @@ bool serialize_settings(struct settings *settings=
)
>> >         SERIALIZE_INT(f, settings, enable_code_coverage);
>> >         SERIALIZE_INT(f, settings, cov_results_per_test);
>> >         SERIALIZE_STR(f, settings, code_coverage_script);
>> >+        SERIALIZE_INT(f, settings, compress_dmesg);
>> >         SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
>> >
>> >         if (settings->sync) {
>> >@@ -1371,6 +1377,7 @@ bool read_settings_from_file(struct settings *set=
tings, FILE *f)
>> >                 PARSE_INT(settings, name, val, enable_code_coverage);
>> >                 PARSE_INT(settings, name, val, cov_results_per_test);
>> >                 PARSE_STR(settings, name, val, code_coverage_script);
>> >+                PARSE_STR(settings, name, val, compress_dmesg);
>> >                 PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmd=
line.argc);
>> >
>> >                 printf("Warning: Unknown field in settings file: %s =
=3D %s\n",
>> >diff --git a/runner/settings.h b/runner/settings.h
>> >index 6c58c3282..09711c052 100644
>> >--- a/runner/settings.h
>> >+++ b/runner/settings.h
>> >@@ -81,6 +81,7 @@ struct settings {
>> >         char *code_coverage_script;
>> >         bool enable_code_coverage;
>> >         bool cov_results_per_test;
>> >+        bool compress_dmesg;
>> >         struct {
>> >                 int argc;
>> >                 char **argv;
>> >--
>> >2.43.0
>> >
