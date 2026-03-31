Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE2710F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 16:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B748310E26F;
	Tue, 31 Mar 2026 16:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUXsuqKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D010E238
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774975646; x=1806511646;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=3xQ9NF6eOefc50lbJgd8qNNuwC2DfuGpy9yoFBeMZkc=;
 b=fUXsuqKLQNqH0R3nIigU1yRSQjkw+C/crd1stpcZi4SBft/Qq3AW4ch3
 kf5vZF8C0OiS3vkD4s0arB64pCPCha9AOnFltXaiW68t5QhElADBG80BH
 +G+xGUWlp36MQqQmjH5jLKn0IfJyYuPygmQ+BhvKRTpsWVZdlH05X9oWU
 I9YEN/yCgEM8MJIb7FcdRwUShzbxMEjuaE1e8dG2Vlgo1XEb8MMmMXPgD
 3zENeNR3EK5lZ453eq50XXB6bXJT/H8JoOZhPfSZ+QGU/QgTDuiW3HJpQ
 21qQexiHMrjVvEx5ohUWpVedZ0vlhX9/z2b+/BmsYSu8Jd7FUKu/HeCwV g==;
X-CSE-ConnectionGUID: BirKiQ+uT7aZ3han1I9cpg==
X-CSE-MsgGUID: x/4Qg3m8TIuRDWsyzKBDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93387269"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="93387269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:47:25 -0700
X-CSE-ConnectionGUID: sbBjXksYQcyNqZBzK57AeQ==
X-CSE-MsgGUID: 4Unh4w/URWyP92vmglCKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230480218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:47:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:47:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 09:47:25 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYbc1PT6zgVLEUERaI383sZ+9x4LrfNZzApvmB0k2Lt8DQGTgICY2NInnwnF2igbpFgAzIdUGlOrEBv58r7dGrbl1FlYgPWrAKnGkElUHzYGy/s4hYNiBh8ZOgXz9NaQR/dDOFR1g6vKc2w7AsjaBL3/odT2RPSK1Uh+OtmYztfe89MvfFkeoGknNbt1NzifV64LQRqrV7li3CME/MbisGObVFDrJMKQkqikqj32/YB3aArbGj4DDg4zB2NCWRlUAhTs1xoOZ6qPLM8/n1jCZWKoYRB4jVzKThpDrhybb3zs+HIjgRV8/yLJ+JwhMUiq8pFfGr2LHi776ZZk3J5e8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXIQTce7XbHMfkD4oo48TzaFSUaTadB72FALtSdor/g=;
 b=UDnWenMDy8x/HN4lqO3qBlXAcY7jOtyvCwP2v8AOJU3i5KTfTwb6zWQXBrmxxOzoFwCbiBL6M4cXf4o6QApkpnI+Zk4awPyAc3mh+OmWAdyZ3r6EBzCfatSjX3tyWRM5U2aOATMhWFpk+RN8dam0Fgv4KiWnL+GEwj1+7ZpoRwsiHuTMZNp0zcRowG2gL76js8NwnHO829Qxef3NL6ZHLYxeg6kBOad8o5Ee9nBkFtB9zesfsdVzchMSANUomr0cjQD511rxgsgRUpRpGAigROMuvvNYD190oipJd42WxOI2AiSZ7cewYtx3oXZIIfSzv2TfoJkYxIBEqxzho6O8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Tue, 31 Mar
 2026 16:47:22 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.006; Tue, 31 Mar 2026
 16:47:22 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] runner: Create attachments directory to
 use by hooks
In-Reply-To: <vol4afvr2gi2axnhfw5bducei2uqquz32gdmqzimnl2qhobtme@pvzjij6yz3ob>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
 <87mrzpxutd.fsf@intel.com>
 <vol4afvr2gi2axnhfw5bducei2uqquz32gdmqzimnl2qhobtme@pvzjij6yz3ob>
Date: Tue, 31 Mar 2026 13:47:18 -0300
Message-ID: <87ldf854kp.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ede368-e1bc-4fd1-76d7-08de8f452e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 7lqDKQ470J2UZUUvhyY0WJLbKNX5fwmaojDfdndtrNb035raZOKEC6YBlgJLuuzGcZSlpNj81NkmKPSdTXq5KBnIkx5uPLVvcotTCEFKtYZ5+J/yyz4Bo17jzyHvk56TE6WtACPkzTByarfhGdYH2/xAavq8tKi9M4W/4H0kx886BDsxk41znDUSls78Pyqicaxrpnp+arhWk6o2c1MZUm9taoblOV+DLvYAoVVPXa9EVFaQn5vP0ri8pBC0hCw7MC344PD2tNaa121wi2DsJPsvmMPsRn2B7NoearOQtKLtHKc8aBSjDWIxJxOFeeF0RY1CC3cUbqZKCYi9LLbmH6tw3W44Gw1LDc+ABJ8gjXKUtvKBcl04zqSud9b7mgoQdwpKPt3Eb0AfTacvbyWdjdKWCT36MaFlgRfw+UBBmjIim6ebrjeRRlVrJYVHJiaIbaGG2QXg43f8oJtI8pjlWU/HJ24B/Px7GbFm1Mz6z01hAMDzGj1D+SlJLG6oAYn2W3euSU1e/VCicVaLA1kY9i5glIcAiRV96zgcJwHDUtLd7AIdbr2LU3+1AmIYLZ2vRE9KymzsOdYLkvhvBPfeqEXPN5YVfSvnZdmKMkHQh+fr+KTIKjxiUKc1lxFTsoF4e5K/xc6OFCVCzjdTH98DqQheOuiKQbSW+JoXQS4p8FL28pHIMVTVpkcykHs4ANGKbvXlhvQqVvgh95QdLlSeOoZctZipiZ7VR0KvJytPokw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2RzWlZ4ZEJuVDhBbGdkZUFuc2NnSVZzNTcrNS94Qk45NzdGNW9NVDlINE04?=
 =?utf-8?B?MXJVaEJlQUxWcitBb0xQb3Zzb3NJZWNwSXZYb3N6eEpJU2U0RDExVkN6T1JC?=
 =?utf-8?B?WFBTQTIxbEhGNUNXVzlxbU9EcnViOFFNNWJsck5EK1RDQ3V0K2w1TU5rUWU2?=
 =?utf-8?B?T3VEaDJlZ29mTS9BaWZCa2JBaXVHbUF6emZBME5NZUtmOHF5OWd1S2xueUtX?=
 =?utf-8?B?RjVSYW45R3B3a1VuQzhVYVArZDZNbGRVR055amlORUFHWnRtanMxcUp4MTRY?=
 =?utf-8?B?dEZ5dm5meXczY3M5Tis2azBEMlpOUUkveFZJblpNendNUzFlUGlkajBPcTc5?=
 =?utf-8?B?Q2psQ0tOZjdOUlF0SDkxOFZSekVHT1lZOW1KRUI4OGhVL2E1RkpZVXIwMHcy?=
 =?utf-8?B?TGtqOEU4cnhwSTB4WEN4eHZjUytSNzBmdlY3aWEySFByNHZUUkJ4dUNTUUNX?=
 =?utf-8?B?bFE1cEQ5dStNTDNraWhIK3pIR0dmOTVVK2J3bXR2cGJmU0lKbnU1S0JzNVoz?=
 =?utf-8?B?NUNmWEpHNkNRWC9QeWpXREllbU9mL2taOGdacFRLOW5LVzBjNHR0TDFkWFRr?=
 =?utf-8?B?Y0tHNGhTbGhvZDZTZkFqa2xwU1kvUlJPNUgvTnRqcmx6NUI4cVVxMTUrSy9v?=
 =?utf-8?B?Tnd0QzA5dUpXcjVOYjcyNHNzUDdXRkNKUTdOUjNLOXlqMWVlaTFORXdKZENx?=
 =?utf-8?B?ak1rR0ZEREE3Rko2cmdmQkNOcE1Tb2JEd1d0Z2oxOEdFbjkvbHVIcndsR1M1?=
 =?utf-8?B?R28wSWZhN2EzMFNYVXk0MTZQb3dWc1dNRFMyTk1JU1RWK1AvQm94ejR5dGk1?=
 =?utf-8?B?Rktha3oySm8zR1MvQWJIS2lvNlpHTnRHNVlSQ0t3enhzdm94WktmTnB1WUJC?=
 =?utf-8?B?Y2U2N2xnVWZVaHV0aGMwZGhqUDl0T3RQQllLQWRCWXd1NWw5djA2OTlOVjd4?=
 =?utf-8?B?emVFeHpOVGdmVkN3TjB0dkVkbEFpRUJoaFZQVXFiTmZibE1FeldkT3RUNFZU?=
 =?utf-8?B?R3Z0TjUwaldTYW05aVpXTFpxUTBCTXhpejJ2Z3VsS0xSM2t3S01FR2tYMjNl?=
 =?utf-8?B?QlVxUmV2azJpZ2pCRE4vSUlOUGtIMk56ZGdnazQ5UnZzbnMwOGdUbGZ6RUpZ?=
 =?utf-8?B?VUI3QnZ5RXFKK0FJNkZ1dmlkRCtCZ0cvWmJsTWdoMWFYalhzK1BjQkpIUFAw?=
 =?utf-8?B?Vyt2Y0psL3FRT0tlWnBvOXNCYXgzWWY5TVpSUzNiWEpXc0FJSk5xdlhIaE9v?=
 =?utf-8?B?YVRvODNkdzB0TnNlaWQwSU02bzdGR1BheHZRZ0FTY0VWbXM3RnVLR2V5dUFH?=
 =?utf-8?B?OC9HSDNoVDlJY3JFdlIyamdLWFk4YktZd016cnVucjB4ZG04UFB2bm9lMWpL?=
 =?utf-8?B?aU15QWM1K1QxSXZhbkt0azdUWVBpa1FCeFdDUnM5dEJkU09LcXgwM2F2NUxO?=
 =?utf-8?B?UE9aTk1naFV0RUtYc0x1aFNNbnlJcHljWm9JRVp6TmhMUHZSL0dGUUI2NlNu?=
 =?utf-8?B?K05LdGxYamo4KzdPbWQxMkFhanM2dHZ3dHRlbDRxSGpCb1FlUFlibEpwVVVZ?=
 =?utf-8?B?Q1djam9MclBFd245d04yeVI2MVVsQ2Jodm9KWHJkM3g3UEUyaHdDZUxubnhx?=
 =?utf-8?B?MXFSR09aNzJ3UmszdE1uVjNaaElkcUJXY3g0WWEwTGhxK0VqVEhjSUJudjNJ?=
 =?utf-8?B?ZUdkNW5SbVZyRmtqNmx5UjBXcEFuZTlRcGFkWjMzUWJJd0Y0MWZnaEpoK3VI?=
 =?utf-8?B?TDl1cXRrRzZxbWVWTnlwd1BrbVkwQkFKT25sTlVmb1NBZ3NKVVNFcnpHVFpI?=
 =?utf-8?B?ZTQzVVdKakt4OXRMWmZhNjZSbjgvLzE1WXZoY083amkrZVIvZjBRYWs2V1lR?=
 =?utf-8?B?bHREdytOc1NrRUR6UzdNZ1IwN2Jqb1dkaE5QYnEvY0UzRWlwZHIzMFlmY0Jp?=
 =?utf-8?B?Q0xNK0pWemwxNW1jK3dQQ2dJT2pXMEpXSnpsWVNic0U0N0NmMDRGN3BRaXdr?=
 =?utf-8?B?WnhnYTNMdVYyczNHbEk5ZzhTblhaNUFEVmVpem5jTHN0VTExWXo4aGs2aXY4?=
 =?utf-8?B?QlpLMk44dXliV1ovek5ZUHJ5WHdHeXlsVmhHTnQ0cWFLYVNOZFlMekFvYzlX?=
 =?utf-8?B?cVRUY1UvTGF6SVlyRUFUSG5SZkUvNmJBMzRvQVVJMWh2b1p5cm1ZMDVCd1hP?=
 =?utf-8?B?RGFqTzVUbUtiUzh4RHFtZ0dPUzRnbDNJZGViVDBENXhLb00rc3Eza0pRYmlP?=
 =?utf-8?B?d2dGd0RCZnJxOCt1Q1FMTWZaeXdRM29BWGwyZ0lIWGZyWnBXTEVTQ3VwbmpI?=
 =?utf-8?B?eEN6WCswblV5ZHdNQ0FIdkszeUNNZWhSeXVXUmlVdkcyY093M1JlZz09?=
X-Exchange-RoutingPolicyChecked: VIOVrxb1yy1Ghww/lcVHaYMCielrLDlVonZFlaO85vH9O+Pi5gpsHIS1/eCbuFerHikFfaxRNp3uhVZ28xYA8lNv9pfTVuwaJE+Yi0aVrYt7304ZsHxrsDQH6D2Fte+G0msDw+kqjiDfotvNLNpZS+aOyJjlawE4LzUsJiQGg8VFJ1CxOfrqvSoghrjf1kEv45aK6oJnyRXMnkpuwudcZdLJNah86b2pqTR6pPpJwoYgdCVTzrgSuq++nThyMj9Sqhk9EzdO3I+geAisBVL2+cDm3v1IaHM7hGLlKPdTlEwHLKhRGLELguVokrkE7foCG+myANuPRUsBccdAqxS+BQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ede368-e1bc-4fd1-76d7-08de8f452e3a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:47:22.5233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWCJvbWViaXhg1eqO+VpJA5I419gk210/dcqfsxNacEx4aBywh2oKnck+hoBMDME4MyxjgFVjOhoQjYzwRXVjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Mon, Mar 30, 2026 at 11:20:46AM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > Results parsing is currently limited to few predefined files.
>> >
>> > Create "attachments" directory and export full path of created directo=
ry
>> > to be used within hooks. From now on environment variable
>> > IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
>> > to execute tests. This env contains directory where subtests/dynsubtes=
ts
>> > may write auxiliary files which finally be included in results.json.
>> >
>> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.c=
om>
>> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> > ---
>> > v2: simplify attachment dirname concatenation (Kamil)
>> >     remove files in attachments dir when overwrite is set (Kamil)
>> > ---
>> >  lib/igt_hook.c    |  4 ++++
>> >  runner/executor.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>> >  runner/executor.h |  2 ++
>> >  3 files changed, 47 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>> > index f86ed56f72..57817bdc12 100644
>> > --- a/lib/igt_hook.c
>> > +++ b/lib/igt_hook.c
>> > @@ -518,5 +518,9 @@ available to the command:\n\
>> >  \n\
>> >  Note that %s can be passed multiple times. Each descriptor is evaluat=
ed in turn\n\
>> >  when matching events and running hook commands.\n\
>> > +\n\
>> > +When executed by the igt_runner environment IGT_RUNNER_ATTACHMENTS_DI=
R\n\
>>=20
>> Nitpick: s/igt_runner environment/igt_runner, environment/
>
> Ack.
>
>>=20
>> > +is passed additionally to the hook script. It contains directory wher=
e\n\
>> > +script may write additional attachments like guc logs, etc.\n\
>>=20
>> Looking at how this is implemented, the attachments directory is not a
>> hook-specific thing, so I believe documentation for it would be better
>> placed in igt_runner's help/docs.
>
> That's true, I placed it here because --help-hook is first place where
> I would look for environment vars I can use. What do you think to place
> information about this variable in both places?

Well, we could have a section listing environment variables associated
with igt_runner in its help output and refer to that section here.

>
>>=20
>> >  ", option_name);
>> >  }
>> > diff --git a/runner/executor.c b/runner/executor.c
>> > index 1485b59d1f..bc421f7dbb 100644
>> > --- a/runner/executor.c
>> > +++ b/runner/executor.c
>> > @@ -1779,17 +1779,22 @@ static int execute_next_entry(struct execute_s=
tate *state,
>> >  	int errpipe[2] =3D { -1, -1 };
>> >  	int socket[2] =3D { -1, -1 };
>> >  	int outfd, errfd, socketfd;
>> > -	char name[32];
>> > +	char name[32], attname[32];
>> > +	char attdirname[PATH_MAX];
>> >  	pid_t child;
>> >  	int result;
>> >  	size_t idx =3D state->next;
>> > =20
>> >  	snprintf(name, sizeof(name), "%zd", idx);
>> > +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
>> >  	mkdirat(resdirfd, name, 0777);
>> > +	mkdirat(resdirfd, attname, 0777);
>> >  	if ((idirfd =3D openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CL=
OEXEC)) < 0) {
>> >  		errf("Error accessing individual test result directory\n");
>> >  		return -1;
>> >  	}
>> > +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
>> > +		 settings->results_path, attname);
>> > =20
>> >  	if (!open_output_files(idirfd, outputs, true)) {
>> >  		errf("Error opening output files\n");
>> > @@ -1870,6 +1875,7 @@ static int execute_next_entry(struct execute_sta=
te *state,
>> >  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>> >  		}
>> >  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
>> > +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
>> > =20
>> >  		execute_test_process(outfd, errfd, socketfd, settings, entry);
>> >  		/* unreachable */
>> > @@ -1950,7 +1956,10 @@ static int remove_file(int dirfd, const char *n=
ame)
>> > =20
>> >  static bool clear_test_result_directory(int dirfd)
>> >  {
>> > -	int i;
>> > +	DIR *dir;
>> > +	struct dirent *entry;
>> > +	int i, adirfd;
>> > +	int ret =3D false;
>> > =20
>> >  	for (i =3D 0; i < _F_LAST; i++) {
>> >  		if (remove_file(dirfd, filenames[i])) {
>> > @@ -1960,7 +1969,33 @@ static bool clear_test_result_directory(int dir=
fd)
>> >  		}
>> >  	}
>> > =20
>> > -	return true;
>> > +	if ((adirfd =3D openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONL=
Y | O_CLOEXEC)) < 0) {
>> > +		errf("Cannot open attachments directory\n");
>> > +		return false;
>> > +	}
>> > +
>> > +	if ((dir =3D fdopendir(adirfd)) =3D=3D NULL) {
>> > +		errf("Cannot fdopen attachments directory\n");
>> > +		goto out1;
>> > +	}
>> > +
>> > +	while ((entry =3D readdir(dir)) !=3D NULL) {
>> > +		if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
>> > +			continue;
>> > +
>> > +		if (unlinkat(adirfd, entry->d_name, 0))  {
>> > +			errf("Error removing %s\n", entry->d_name);
>> > +			goto out2;
>> > +		}
>> > +	}
>>=20
>> Since we can't predict that the attachments directory will remain flat,
>> I think it would be safer to do a recursive cleanup here.  I guess we
>> could use nftw() in a post-order fashion here?
>
> I wondered about recursive removal, what prevented me from doing this
> was if there'll bug here I can remove too much. At the moment I guess
> guc logs will be only user so I would try to stay in flatten structure.

I don't think we should assume that's going to be the only user.  The
end user can basically run "anything" as a hook and could as well create
subdirectories.

The alternative is to consider the attachments dir something not to be
messed by the user and consider only "official" hook scripts (i.e. those
in IGT's source tree) as "authorized" to handle it.  But I believe
that's not the original intent, right?

--
Gustavo Sousa

>
> --
> Zbigniew
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> > +
>> > +	ret =3D true;
>> > +out2:
>> > +	closedir(dir);
>> > +out1:
>> > +	close(adirfd);
>> > +
>> > +	return ret;
>> >  }
>> > =20
>> >  static bool clear_old_results(char *path)
>> > @@ -2002,6 +2037,9 @@ static bool clear_old_results(char *path)
>> >  			close(dirfd);
>> >  			return false;
>> >  		}
>> > +		if (unlinkat(resdirfd, DIR_ATTACHMENTS, AT_REMOVEDIR))
>> > +			errf("Warning: Cannot remove attachments directory\n");
>> > +
>> >  		close(resdirfd);
>> >  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
>> >  			errf("Warning: Result directory %s contains extra files\n",
>> > diff --git a/runner/executor.h b/runner/executor.h
>> > index 3b1cabcf55..bc6ac80dc4 100644
>> > --- a/runner/executor.h
>> > +++ b/runner/executor.h
>> > @@ -25,6 +25,8 @@ enum {
>> >  	_F_LAST,
>> >  };
>> > =20
>> > +#define DIR_ATTACHMENTS "attachments"
>> > +
>> >  bool open_output_files(int dirfd, int *fds, bool write);
>> >  bool open_output_files_rdonly(int dirfd, int *fds);
>> >  void close_outputs(int *fds);
>> > --=20
>> > 2.43.0
