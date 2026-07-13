Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B5EC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 06:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150C110E556;
	Mon, 13 Jul 2026 06:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UA77FQqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7710E556
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783924188; x=1815460188;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hPTdNrckZXjUDXDX7wqLv3CtMe82MlcqAXGqGdIrLEY=;
 b=UA77FQqJzPOWTn34/b+8IcZz3BYAPFcKTRMvn34yEwJ7WZ90JW5aQUjL
 sHN59hDhK+Z/qu2KsceZe+TStcrIzOO3VWqoV+lVpu6+N+0YLWklJh/Fm
 e1lGseLhGHETNymRPqNAjkyLDyySSWsGoEhok+8FrlTvfFmyLQWY9Ston
 jFJu3re3I6QikHHNQ8NnVXAyebXhM7Y/ICZ8V6gPBzuHHieE0M1ghIyrd
 q6r6MIJJt/r5YLH97046D53TeRdjwoXESKvkUgCfPYmV88+2wuWUrGPsh
 nHZbeSGhVKQTBLHA5ShoO2nkK4vK9474s4X4J9hwqiMQK+UPiHaGxWIsT A==;
X-CSE-ConnectionGUID: kt0BkHZ3TkCssoDCCTe5vA==
X-CSE-MsgGUID: 5FsWSdHvQQWhwySPnyymZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84576303"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84576303"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 23:29:47 -0700
X-CSE-ConnectionGUID: iw68R5X2TqKhu5OsqdV1jA==
X-CSE-MsgGUID: xdSZZmEQRTy0HCLGiD40/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="257413877"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 23:29:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 23:29:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 23:29:46 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 23:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awb/ErgGshi+0+Ij2ClvKM3IkjmpXwqcDjWVReWmHs6/n/qzzI3RsXYpPPuuCr0wUScciCosxrLWxlotSJZ7o6pZmYLKNwDkzw1qcVns/BYBYkm4UJdXyQq90hqn07FRqff7yJawhmK+T8mIAMXATzEjqZDV7A5zkJ40V+4OY9urCYnbUnZhwBxHfj1tdQLb1an1f4YIxFkk2myWmW9Zj7qjE40NEy5BJ1Jofpl+dDKLmjfddaBJ/fjJNxV+K/gsDPw6B+eazyJpYPc5dt+RQpaYrrM746RtMdum4YpDqCumc70T8R7NpB/zSXqRVCoOGNt8cp6qbHShp/bbOHs4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BHAC7Th41qed35qbwVb+tgIt7d9zoCWoIht90qcWvg=;
 b=VAGSwJMrM4rYDIqJabwj964nVZ3pFuNiMbal348t7pyU3ROGqroU7Yu/LaIwx4RKbMqTuv5mMQKozDE9/IpQgX6BSHYipU1K77sflf6f0qjPTLglWHaIx1U3eGHT9lW8ew//EHOdbVbpIhTB335974Q6/aKos49GBBvcqJW+7kA5Jt4tqbfYz/WdZiFNl/RmwDo1vO4C8jHSuFvrGW7MOdn49fyorqXTxJ7/07pRYxPymwHHqut02fts3MK5lQ2/m6ygiS1EDNZNT3mKpfsmChFmABThg3uh3ZkBupKViKMq2jKAzdsxhR+lZAq8GO5sT9MkfcZqi1vmEddvIufxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 06:29:44 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 06:29:44 +0000
Date: Mon, 13 Jul 2026 06:29:34 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/6] lib: Add generic platform filtering framework
Message-ID: <bqnpq2vcskijlu42e4euivnp3qnjanzs2srzi6yxzuorbwfgfg@w5axsnhmv62o>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260709233940.160424-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709233940.160424-1-vitaly.prosyak@amd.com>
X-ClientProxiedBy: DU7P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::15) To SA3PR11MB7413.namprd11.prod.outlook.com
 (2603:10b6:806:31a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5570cb-dd93-4f13-3444-08dee0a82041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|3023799007|18002099003|22082099003|6133799003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: WyGKyfx5RtST4W+vEGuWNI7xc51WkqKzOjUZJ6wAKIDou8JIVIIY8tBqkgncLITUa2LNnjQc14a5uhBkgS0deNb3dbT5YleMOxvuGRNos3BeJ+Ypgosyb0J/92dbwbrKOr06VcO88l8MkcVRjOUmRHIkHda2cPXK4wBkLn5wFSiEB49SnPR6X405yznUIDA/k9lw5Dg98knRJW4RblsAaPRJCI7Ue2fRPzYaEhJl4etzIFD0TBUv9BjU3PKzS7tj9teVj8rUp7cpAUp3U3R2iWOCdczNiDlwsfecbDZ7VyEgi9GN4QM7hxulPyD/Or4Ctn17oTHfKnhZ8OCdH2a6RKJvE/0fd5YaCwPNUU0W/JKubKxfmxz3S7HuCtK+t4YYnXMvQKLzL8yYoxcnYtC1iWZ+ImKNLYAYWcWqSTvV93Vk1fdJFD2TAvWU+Qz5uyEzBwjdJMikieuyOL94uKjUNZNp9vs+MUVPbw7QdRgJL5hz0IF1Fr7PMWwt5HPju/kVxDlU8jF3Y2B9k4r89+InkYgEcFp0QF3QkazmUJuapVrg4ISaISWRtsqJu2RWu+hlLcyT+YdcXFN6EuwnBGplFNXDBbgna1XOK+dStgz9/eXseUtTByKiRyx9Gn6jD17GrVcG0zJyZnGIhf5MRE9T5XxtaHEC6o2zOOZRd6Qw/SY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(3023799007)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OStCREVKYTZMWVhQTGVtVm8rL1lTSFl1QVpoQkxsVWRhK3RRekFDdFNvN0l4?=
 =?utf-8?B?MmJlTlN4dVBoWU9tTlptc3grKyt3c1h5OVd6N3hZN3JhSHA2dEVqai81Y3E2?=
 =?utf-8?B?TU9xN0Fzd3RuRExmQW9sRVB3aVM1OHpQL0FJZjRNSS9tVFkxNzBydmpXSCtr?=
 =?utf-8?B?ZXJuRGlZZlpLakx3Qi9YYUNTdy9WaVhWVXRXVXNrM1gwTEpqd3hvMkRiR1h0?=
 =?utf-8?B?NWtZeDVwNExPL0lXeDBudHdxU0F4RG03QlpXUnJRbXhQNlZTZGkrY2RlMk9I?=
 =?utf-8?B?RkN0VnlZcUZzVFFsaC9HMExnWW1lY25VWFRwQUMyS1p4d2g0K0VwbWhDTHpo?=
 =?utf-8?B?YjdYVjRmY2JpZTBIVmNBaVd4L2xSYUlJSExKbEg5d0prdDRZWjhqU2dVNkVM?=
 =?utf-8?B?RDRhUFpxZVFWMXl1RGdoQmw1NlRITmFEcjRyc2Rra0tmNmNNUXRYZ2QvZVdP?=
 =?utf-8?B?UTBOemdiQ3NOeEl1TldaNGpwSGRoekViQk1hdlZyUXlrS3NaRGxGdVlpUHJx?=
 =?utf-8?B?V2xsbERucFRZbXA1R3pqelVFTFB0dVJOKzhEWEkydTZmZ0I5YW15MFdHTEpJ?=
 =?utf-8?B?ZW1Xd011STFtMUhORHE1Vy9LTll6RGo1OUNFWCtjRlBmcUg4VGt5bVNYd0k4?=
 =?utf-8?B?UmMvK3Y0T200ZGNMNERHN1dDOW1Fdm9MMHFxZzJlTFVmTzBXWjFrRGd4dndU?=
 =?utf-8?B?cXhxVjVhRXhTL1oyQmk1RlFKN0tNV3IvZ0tUMGgzRzVwNWN4MnJURVdsWUF1?=
 =?utf-8?B?QlhnTmxyY3lJcVp3NzN5UmNZaDJRN2dyYXp4aUV4THpsZWc1NG5mc3h3NUts?=
 =?utf-8?B?LzBWZXFUWnloWEcrUVJwd0NjZHk4aTJPZ2RFT2Zac1VtY3RDak1DNjFRVWVl?=
 =?utf-8?B?bWltalI5ejRXekx3Mm03dEhyQzBUeXdTQUcyTWEwUmN6R3E5TnFpVE1FeE5L?=
 =?utf-8?B?dzJnK0g1ZTZvaEVrdkFycHRDeHJGTTVvbEFtZ21LQ2tFZVl6YUVsRVBoRzJL?=
 =?utf-8?B?aGw4dEdCV2FGaFEydGY5eXVWaTk2THF5SW9ucUJTNXJWQWF1VUxqWTVNS0FK?=
 =?utf-8?B?K2Q4ZzZzOVExTU1iakpXSzN5MHFYUGc0L0M5SHAxcEMwWExWLzJTN09xUjEx?=
 =?utf-8?B?QTJwcEx2d2lYd21lb1lIN2ZvWUZWbGw2U0RwWllKVWtNdjcrUmlwZEJRemdu?=
 =?utf-8?B?VlJtVWd1YlFoYnNBMWNxOEk5Y240ei85UXRNclA5aWF6S29YQlE0ZERReVhx?=
 =?utf-8?B?RE5hcTYrYmxOZlpzcndFVVU4ckJ2RnJQK0N2NnVDRm1neTZ0S3NQOXpUTXh0?=
 =?utf-8?B?UHlwU05BamtFbnJnZzNjcTR0T1hUdTJPQmF4bkxKRlBuUUdJUDJ4djdoaTIr?=
 =?utf-8?B?V3BZaFlGTlozSStuU1JwMkFWZmxrWjdLK2p0WXErdm1HVEdNTkdjR3l2UkJN?=
 =?utf-8?B?UHUvd1hoeU1DcFN3dGdpY3V0SkZjSkRlSFkrb08vVDAwQjRrZXNDTW83Y2k1?=
 =?utf-8?B?Z09zSUpCSENvdnh5VjJUclY3NFpwNXNRRE1JWGdZcG1UbTdGV1BhYXBuOUgv?=
 =?utf-8?B?M2NYbjV1RFlTb3VRTzBxcmdEWktIZDEyNUtOcEtoVnVLY1pVR2VEL1pRNTZV?=
 =?utf-8?B?d1ppbkFqVjl6Q2t3MmlsRnZ6YkZiTUI1YzNWYUo2VlpWRmVyUGE4RDJqUVgw?=
 =?utf-8?B?YVUrSyswUVNEOEwzcTJvRVZhY2dIMzVTek8wUFBNL1lYK1BLU25ueThFN2pQ?=
 =?utf-8?B?NmJxaE9PM3krTDRsSUJDeWRRV0IxUzFrK0tBb0Q2aFdYcXllK2ExaGRMNFcy?=
 =?utf-8?B?Wk5uRzZlSzY0U3dSNWMrR3BxdmNTczE3UFVjbUwrZjkwTGtnZFJLL1h0Lzhu?=
 =?utf-8?B?clNnNnBHdU5HK2pYby9Vd0YxSW9pUHRVSU9Da1Baa1ZkYVJUNi9XV3ViRDVJ?=
 =?utf-8?B?Vmtsek9LemdoN3VxeUpYdzV3TDNuanQwMmZjbUo5NUtZc0tDUWlzV2laYW1C?=
 =?utf-8?B?b2EvcG5GVEhFUzg0eThwOXdFNUVWamlTbGp3VUo5NldFNHYrTGxWVnZkVDRX?=
 =?utf-8?B?R0hRSHdaRWJUVEFnV0lIVmlORWhZR0RheWZvbzBiYmJjZE1NSWFQclQySnk1?=
 =?utf-8?B?UFViWi9rOS96bVB6N2h1cWl2SGluM3gxMHRYRFpTSzIwTjVkVFNRcWlXK3VD?=
 =?utf-8?B?VFNwSjE3S0J5TWZCaXJCSmFMSERRdGFwWm5scGgxdkdTdUU0WG1LQjJraTMv?=
 =?utf-8?B?dW9XRk5wd0pEWVNaTlNXcFVqbUltUGFxS3RPU3dGMlVHRnA1QWJ0VTVoTnhl?=
 =?utf-8?B?MkNLVlJtY2drWlpEMm5lekVpT0dIb2FibHZZclZhTERuS0FrMmFkYTFoYkEv?=
 =?utf-8?Q?4fej9nG4DokAfSXU=3D?=
X-Exchange-RoutingPolicyChecked: qXJa6Up3siAcywVPjsYj3AbI4fFVC+HyBzcZrBY6nQvJ4jXpc6kKexplX70BRR+9q+PH4nUJqwVkfImFfquHiPq2qQ5iEZXJzydPkTTjFdmHyq5C2HsvPXI6lnoNxR/vo2KOb069m5V7rNesbY8B3S8yEmAHyy4igrnt0YcfwVTA+MA7x25dMUosTYtG0Obc2/oYngHe18ufY676iZlX+fukrhDzmzngCu4PUOydZsnQE4Lzgy30q6pXjbOEGEOAwE4iVdjH+efVjDGVsdUAZSZWXF6Ae2g8M03Xm9h8ncxnRKUc8/+fgfDHnCWC7rsRjxMNKpFPurjdSYeZIPiBBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5570cb-dd93-4f13-3444-08dee0a82041
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 06:29:44.3159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYlnIZZATMhC+dRsTPNnAZDIK3KO7YsRnLewNZ8aEaV49z27WwmORQnFSoHJZRTZect1IGErTNtpjv2yhTbT5RW+X2KKyEvwIXNdy67Ugso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

Hi Vitaly,

it is difficult for me to follow this series, because your
patches lack versioning in the subject. It would be great to
have this information in the subject:

[PATCH v3 1/6] lib: Add generic platform filtering framework

this can be done automatically if you use git format-patch.

Another note:
please do not rush to send another version. v2 and v3 were sent
the same day and you missed some (if not all) of my comments I
put under v2. My attention is now drawn to the same stuff I as
in v2, so I am probably going to miss some other potential
improvements to this series - please consider my comments under
v2 before sending another version of this series.

On 2026-07-09 at 19:39:09 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Implement vendor-agnostic platform filtering system that allows any
> vendor to plug in platform-specific test skipping logic via callbacks.
> 
> This combines both the interface (header) and implementation in a single
> commit as requested by Kamil Konieczny.
> 
> Key design elements:
> - struct platform_filter_ops: vendor callback interface
> - struct platform_skip_entry: vendor-neutral skip rule representation
> - enum skip_source: three-tier priority (built-in, config, env)
> - API functions: init, should_skip, require, dump
> 
> Platform filtering is automatic - tests only need to call
> platform_filter_init() once in igt_fixture. The IGT framework
> automatically checks each subtest before execution via __igt_run_subtest().
> 
> Example usage:
>   igt_fixture {
>       vendor_platform_filter_init(platform_info);
>   }
> 
>   igt_subtest("test") {
>       // Automatic filtering - no manual call needed!
>       test_code();
>   }
> 
> v3 changes (addressing Kamil Konieczny's review):
>  - Squashed header and implementation into single commit
>  - Removed unnecessary comment "Function prototypes..." from header
>  - Comprehensive documentation in separate commit (docs/platform_filtering.md)
>  - Automatic filtering via __igt_run_subtest() hook (no manual require calls)
>  - Fixed code style: include order, SPDX style, checkpatch clean
This commit is now generic, no longer containing AMD
implementation. Worth adding to the changelog.
> 
It now looks like there are two changelogs. I think you had the
section below since v1, so it does not pertain to the changes
requested for this patch series, but from somewhere else.
Since you mention feedback, which, I think, comes from other
patch series, you could reference that conversation, so other
reviewers can view the context for your changes in this series.

Section below could be swapped with "v3 changes" changelog for
more clarity.
> Addresses feedback from reviewers:
> 
> 1. Jani Nikula:
>    "I would have expected an attempt to make an IGT shared filtering
>    system generic enough to plug into any vendor's platforms."
> 
>    Resolution: Implemented vendor-agnostic callback-based design via
>    platform_filter_ops structure. Any vendor (Intel, AMD, Qualcomm, etc.)
>    can provide their own backend without modifying core framework.
> 
> 2. Kamil Konieczny:
>    a) "Add also example with config file as env vars are not convenient
>       for large tests lists"
> 
>       Resolution: Comprehensive documentation added in commit 5
>       (docs/platform_filtering.md) showing config file as RECOMMENDED
>       method with real-world examples, wildcards, and best practices.
> 
>    b) "imho you can get test name in require, no need to repeat it"
> 
>       Resolution: Went further - v3 removes igt_platform_require()
>       entirely. Filtering is now automatic via __igt_run_subtest() hook
>       in commit 4. Zero manual calls needed in subtests.
> 
>    c) Code style (include order, alignment, igt_debug vs igt_info)
> 
>       Resolution: Fixed in commits 2 and 3. Includes alphabetically
>       ordered, SPDX headers use // style, checkpatch clean.
> 
>    d) "No need for this comment" (function prototypes comment)
> 
>       Resolution: Removed unnecessary comment from header file.
> 
>    e) "Please squash this into second patch"
> 
>       Resolution: Header and implementation now in single commit.
> 
> 3. Multi-GPU support (integrated + discrete):
>    Current design queries platform once in igt_fixture. For multi-GPU
>    scenarios, tests can call platform_filter_init() per-device with
>    device-specific platform_info.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I370aa9f91b9d23e0fb79f3f04d8edb5cd4c57460
> ---
>  lib/igt_platform_filter.c | 579 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_platform_filter.h | 122 ++++++++
>  lib/meson.build           |   1 +
>  3 files changed, 702 insertions(+)
>  create mode 100644 lib/igt_platform_filter.c
>  create mode 100644 lib/igt_platform_filter.h
> 
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> new file mode 100644
> index 000000000..5e2e7c744
> --- /dev/null
> +++ b/lib/igt_platform_filter.c
> @@ -0,0 +1,579 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright 2026 Advanced Micro Devices, Inc.
> +/*
> + * Generic platform-based test filtering framework
> + *
> + * This is a vendor-agnostic filtering system. Vendor-specific logic
> + * is implemented via platform_filter_ops callbacks.
> + */
> +
> +#include <ctype.h>
> +#include <fnmatch.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_platform_filter.h"
> +
> +/* Maximum entries from config file and env variable */
> +#define MAX_CONFIG_ENTRIES 256
> +#define MAX_ENV_ENTRIES 128
> +#define MAX_LINE_LENGTH 512
> +
> +/* Filter context - holds all runtime state (no globals) */
> +struct platform_filter_context {
> +	const struct platform_filter_ops *ops;
> +	const void *platform_info;
> +
> +	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
> +	int config_entry_count;
> +
> +	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
> +	int env_entry_count;
> +
> +	bool initialized;
> +	char current_platform_name[64];
> +};
> +
> +/* Single static instance - initialized on first use */
> +static struct platform_filter_context *get_filter_context(void)
> +{
> +	static struct platform_filter_context ctx = {0};
> +
> +	return &ctx;
> +}
> +
> +/*
> + * ================================================================
> + * HELPER FUNCTIONS
> + * ================================================================ */
> +
> +/* Helper: Trim whitespace from string */
> +static char *trim(char *str)
> +{
> +	char *end;
> +
> +	while (isspace(*str))
> +		str++;
> +
> +	if (*str == 0)
You do not need these extra newlines if return is the only
instruction inside the block.

> +
> +		return str;
> +
> +	end = str + strlen(str) - 1;
> +	while (end > str && isspace(*end))
> +		end--;
> +
> +	*(end + 1) = 0;
> +
> +	return str;
> +}
> +
> +/* Helper: Match wildcard or exact string */
> +static bool match_string(const char *pattern, const char *str)
> +{
> +	if (!pattern || !str)
> +
> +		return false;
> +
> +	if (strcmp(pattern, "*") == 0)
> +
> +		return true;
> +
> +	return fnmatch(pattern, str, 0) == 0;
> +}
> +
> +/* Helper: Check if entry matches platform/test/subtest */
> +static bool entry_matches(const struct platform_filter_context *ctx,
> +                          const struct platform_skip_entry *entry,
> +                          const char *test_name,
> +                          const char *subtest_name)
> +{
> +	if (entry->platform_data && ctx->ops->match_platform) {
> +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> +
> +			return false;
> +	}
> +
> +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> +		if (!test_name || !match_string(entry->test_name, test_name))
> +
> +			return false;
> +	}
> +
> +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> +
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * ================================================================
> + * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
> + * ================================================================ */
> +
> +/* Parse one line from config file */
> +static bool parse_config_line(struct platform_filter_context *ctx,
> +                               char *line,
> +                               struct platform_skip_entry *entry)
> +{
> +	char *platform, *test, *subtest, *reason;
> +
> +	/* Skip comments and empty lines */
> +	line = trim(line);
> +	if (line[0] == '#' || line[0] == 0)
> +
> +		return false;
> +
> +	/* Format: platform:test:subtest:reason */
> +	platform = strtok(line, ":");
> +	test = strtok(NULL, ":");
> +	subtest = strtok(NULL, ":");
> +	reason = strtok(NULL, "\n");
> +
> +	if (!platform || !test || !subtest) {
> +		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
> +
> +		return false;
> +	}
> +
> +	/* Allocate and copy strings */
> +	entry->test_name = strdup(trim(test));
> +	entry->subtest_glob = strdup(trim(subtest));
> +	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
> +
> +	/* Parse platform using vendor callback */
> +	platform = trim(platform);
> +	if (ctx->ops->parse_platform_config && strcmp(platform, "*") != 0) {
> +		/* Vendor-specific platform string */
> +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> +			igt_warn("Failed to parse platform: %s\n", platform);
> +			free((void *)entry->test_name);
> +			free((void *)entry->subtest_glob);
> +			free((void *)entry->reason);
> +
> +			return false;
> +		}
> +	} else {
> +		/* Wildcard or no vendor-specific parsing available */
> +		entry->platform_data = NULL;
> +	}
> +	return true;
> +}
> +
> +/* Load config file */
> +static void load_config_file(struct platform_filter_context *ctx, const char *filename)
> +{
> +	FILE *f;
> +	char line[MAX_LINE_LENGTH];
> +
> +	f = fopen(filename, "r");
> +	if (!f) {
> +		igt_debug("Config file not found: %s\n", filename);
> +
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from: %s\n", filename);
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
> +			igt_warn("Config file has too many entries (max %d)\n",
> +			         MAX_CONFIG_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
> +			ctx->config_entry_count++;
> +		}
> +	}
> +
> +	fclose(f);
> +	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
> +}
> +
> +/*
> + * ================================================================
> + * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
> + * ================================================================ */
> +
> +/* Parse environment variable entries (semicolon-separated) */
> +static void load_env_variable(struct platform_filter_context *ctx)
> +{
> +	char *env, *env_copy, *entry_str, *saveptr;
> +	const char *env_value;
> +
> +	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
> +	if (!env_value || env_value[0] == 0) {
> +		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
> +
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
> +
> +	env_copy = strdup(env_value);
> +	env = env_copy;
> +
> +	/* Parse semicolon-separated entries */
> +	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
> +		env = NULL; /* For subsequent strtok_r calls */
> +
> +		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
> +			igt_warn("Too many env variable entries (max %d)\n",
> +			         MAX_ENV_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
> +			ctx->env_entry_count++;
> +		}
> +	}
> +
> +	free(env_copy);
> +	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
> +}
> +
> +/*
> + * ================================================================
> + * PUBLIC API IMPLEMENTATION
> + * ================================================================ */
> +
> +
> +/**
> + * igt_platform_filter_init:
> + * @ops: Platform-specific operation callbacks
> + * @platform_info: Vendor-specific platform identification data
> + *
> + * Initialize the platform filtering system with vendor-specific backend.
> + * This sets up the filter context and loads skip rules from three sources
> + * in priority order:
> + * 1. Built-in rules (highest priority, vendor-provided)
> + * 2. Config file /etc/igt/platform_skip.conf
> + * 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (lowest priority)
> + *
> + * The filtering system is vendor-agnostic. Platform matching logic is
> + * provided through the @ops callbacks, allowing each vendor to implement
> + * their own identification scheme (e.g., AMD uses family_id/chip_rev,
> + * Intel could use platform_id/stepping).
> + *
> + * Must be called once before using igt_platform_require().
> + */
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
> +	if (ctx->initialized)
> +
> +		return;
> +
> +	if (!ops) {
> +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
> +
> +		return;
> +	}
> +
> +	ctx->ops = ops;
> +	ctx->platform_info = platform_info;
> +
> +	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
> +	         ops->name ? ops->name : "unknown");
> +
> +	/* Get current platform name */
> +
> +/**
> + * igt_platform_should_skip:
> + * @test_name: Name of the test
> + * @subtest_name: Name of the subtest (or NULL for test-level check)
> + *
> + * Check if a test/subtest should be skipped based on platform filtering rules.
> + *
> + * Returns: true if the test should be skipped, false otherwise
> + */
I already pointed this out in the previous version:
documentation comments are misplaced in this patch and should be
moved before the functions they describe.

> +	if (ops->get_platform_name) {
> +		const char *pname = ops->get_platform_name(platform_info);
> +		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
> +		         "%s", pname ? pname : "unknown");
> +	}
> +
> +	/* Priority 1: Built-in array (vendor-specific) */
> +	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
> +
> +	/* Priority 2: Config file */
> +	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
> +	load_config_file(ctx, "/etc/igt/platform_skip.conf");
> +
> +	/* Priority 3: Environment variable */
> +	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
> +	load_env_variable(ctx);
> +
> +	ctx->initialized = true;
> +	igt_info("Platform filter initialization complete\n");
> +}
> +
> +bool igt_platform_should_skip(const char *test_name,
> +                               const char *subtest_name,
> +                               enum skip_source *source,
> +                               const char **reason)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, count;
> +
> +	if (!ctx->initialized) {
> +		igt_warn("Platform filter not initialized\n");
> +		if (source)
> +			*source = SKIP_SOURCE_NONE;
> +		if (reason)
> +			*reason = NULL;
> +
> +		return false;
> +	}
> +
> +	/* Priority 1: Check built-in array FIRST */
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +				if (source)
> +					*source = SKIP_SOURCE_BUILTIN;
> +				if (reason)
> +					*reason = entry->reason;
> +				igt_debug("Skip (built-in): %s:%s - %s\n",
> +				          entry->test_name ? entry->test_name : "*",
> +				          entry->subtest_glob ? entry->subtest_glob : "*",
> +				          entry->reason ? entry->reason : "no reason");
> +
> +				return true;
> +			}
> +		}
> +	}
> +
> +	/* Priority 2: Check config file */
> +	for (i = 0; i < ctx->config_entry_count; i++) {
> +		entry = &ctx->config_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_CONFIG;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (config): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +
> +			return true;
> +		}
> +	}
> +
> +
> +/**
> + * igt_platform_require:
> + * @subtest_name: Name of the subtest to check
> + *
> + * Check if current subtest should be skipped and call igt_skip() if matched.
> + * This integrates platform filtering with IGT's standard skip mechanism.
> + *
> + * The function automatically determines the test name from igt_test_name().
> + * If a skip rule matches, calls igt_skip() with the configured reason.
> + */
> +	/* Priority 3: Check environment variable */
> +	for (i = 0; i < ctx->env_entry_count; i++) {
> +		entry = &ctx->env_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_ENV;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (env): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +
> +			return true;
> +		}
> +	}
> +
> +	if (source)
> +		*source = SKIP_SOURCE_NONE;
> +	if (reason)
> +		*reason = NULL;
> +
> +	return false;
> +}
> +
> +void igt_platform_require(const char *subtest_name)
> +{
> +	enum skip_source source;
> +	const char *test_name = igt_test_name();
> +	const char *reason;
> +
> +	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
> +
> +/**
> + * igt_platform_filter_dump:
> + *
> + * Dump the current platform filtering configuration to stdout.
> + * Shows all loaded skip rules from built-in, config file, and environment
> + * variable sources. Useful for debugging which rules are active.
> + */
> +		const char *source_str;
> +
> +		switch (source) {
> +		case SKIP_SOURCE_BUILTIN:
> +			source_str = "built-in array";
> +			break;
> +		case SKIP_SOURCE_CONFIG:
> +			source_str = "config file";
> +			break;
> +		case SKIP_SOURCE_ENV:
> +			source_str = "environment variable";
> +			break;
> +		default:
> +			source_str = "unknown";
> +		}
> +
> +		igt_skip("Skipped on this platform [%s]: %s\n",
> +		         source_str, reason ? reason : "no reason");
> +	}
> +}
> +
> +void igt_platform_filter_dump(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, total_count, count;
> +
> +	if (!ctx->initialized) {
> +		igt_info("Platform filter not initialized\n");
> +
> +		return;
> +	}
> +
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n");
> +	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +
> +	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
> +	if (ctx->current_platform_name[0]) {
> +		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
> +	}
> +
> +	/* Priority 1: Built-in array */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
> +	igt_info(" Source: Vendor implementation\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	total_count = 0;
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			total_count++;
> +			igt_info("  %2d. %s : %s\n",
> +			       total_count,
> +			       entry->test_name ? entry->test_name : "*",
> +			       entry->subtest_glob ? entry->subtest_glob : "*");
> +			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
> +
> +			/* Print platform data if vendor provides dump callback */
> +			if (entry->platform_data && ctx->ops->dump_platform_data) {
> +				igt_info("      Platform: ");
> +				ctx->ops->dump_platform_data(entry->platform_data);
> +				igt_info("\n");
> +			}
> +			igt_info("\n");
> +		}
> +	}
> +	if (total_count == 0) {
> +		igt_info("  (No built-in rules)\n\n");
> +	}
> +
> +	/* Priority 2: Config file */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
> +	igt_info(" Source: /etc/igt/platform_skip.conf\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->config_entry_count > 0) {
> +		for (i = 0; i < ctx->config_entry_count; i++) {
> +			entry = &ctx->config_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No config file rules loaded)\n\n");
> +	}
> +
> +	/* Priority 3: Environment variable */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
> +	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->env_entry_count > 0) {
> +		for (i = 0; i < ctx->env_entry_count; i++) {
> +			entry = &ctx->env_entries[i];
> +
> +/**
> + * igt_platform_filter_dump_to_file:
> + * @filename: Path to output file
> + *
> + * Dump platform filtering configuration to a file.
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No environment variable rules)\n\n");
> +	}
> +
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" SUMMARY\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info("  Built-in rules:     %d\n", total_count);
> +	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
> +	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
> +	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +}
> +
> +int igt_platform_filter_dump_to_file(const char *filename)
> +{
> +	FILE *old_stdout;
> +	FILE *f;
> +
> +	f = fopen(filename, "w");
> +	if (!f) {
> +		igt_warn("Failed to open %s for writing\n", filename);
> +
> +		return -1;
> +	}
> +
> +	/* Redirect stdout to file */
> +	old_stdout = stdout;
> +	stdout = f;
> +
> +	igt_platform_filter_dump();
> +
> +	/* Restore stdout */
> +	stdout = old_stdout;
> +	fclose(f);
> +
> +	igt_info("Platform filter configuration dumped to: %s\n", filename);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> new file mode 100644
> index 000000000..d64450489
> --- /dev/null
> +++ b/lib/igt_platform_filter.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef IGT_PLATFORM_FILTER_H
> +#define IGT_PLATFORM_FILTER_H
> +
> +#include <stdbool.h>
> +
> +/**
> + * SECTION: igt_platform_filter
> + * @short_description: Generic platform-based test filtering framework
> + * @title: Platform Filter
> + * @include: igt_platform_filter.h
> + *
> + * Generic test filtering system that allows skipping tests/subtests based
> + * on platform characteristics. Designed to be vendor-agnostic with
> + * vendor-specific backends.
> + *
> + * Three-tier priority system (checked in sequence, first match wins):
> + *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
> + *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
> + *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
> + *
> + * Vendor Implementation:
> + *   Each vendor implements platform_filter_ops callbacks to provide:
> + *   - Platform identification and matching logic
> + *   - Platform-specific data structures
> + *   - Built-in skip rules
> + *
> + * Usage in tests:
> + *   igt_fixture() {
> + *       igt_platform_filter_init(vendor_ops, platform_info);
> + *   }
> + *
> + *   igt_subtest("my-test") {
> + *       // Automatic filtering - no manual call needed!
> + *       test_code();
> + *   }
> + *
> + * Config file format (/etc/igt/platform_skip.conf):
> + *   # Lines starting with # are comments
> + *   # Format: platform:test:subtest:reason
> + *   # Use * as wildcard
> + *
> + *   navi48:*:*:All tests disabled on Navi48
> + *   alderlake:i915_pm:*:Power management tests broken
> + *
> + * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
> + *   Same as config file, semicolon-separated entries:
> + *   export IGT_PLATFORM_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*:Broken"
> + */
> +
> +/* Maximum platform ranges per skip entry */
> +#define MAX_PLATFORM_RANGES 4
> +
> +/**
> + * enum skip_source - Source of skip rule
> + */
> +enum skip_source {
> +	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
> +	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
> +	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
> +	SKIP_SOURCE_NONE,       /* Not skipped */
> +};
> +
> +/**
> + * struct platform_skip_entry - Generic skip rule entry
> + *
> + * Generic structure for skip rules. Vendor-specific data is stored
> + * in platform_data field and interpreted by vendor callbacks.
> + */
> +struct platform_skip_entry {
> +	const char *test_name;          /* Test binary name or "*" for all */
> +	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
> +	const char *reason;             /* Human-readable reason (required) */
> +	void *platform_data;            /* Vendor-specific platform matching data */
> +};
> +
> +/**
> + * struct platform_filter_ops - Vendor-specific operations
> + *
> + * Callback structure that vendors implement to provide platform-specific
> + * filtering logic. This allows the core filtering framework to remain
> + * vendor-agnostic.
> + */
> +struct platform_filter_ops {
> +	/** @name: Vendor name (e.g., "amd", "intel") */
> +
> +	const char *name;
> +
> +	/** @get_platform_name: Get current platform name */
> +	const char *(*get_platform_name)(const void *platform_info);
> +
> +	/** @match_platform: Check if skip entry matches current platform */
> +	bool (*match_platform)(const void *platform_info, const void *platform_data);
> +
> +	/** @parse_platform_config: Parse platform string from config file */
> +	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
> +
> +	/** @get_builtin_rules: Get vendor-specific built-in skip rules */
> +	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
> +
> +	/** @dump_platform_data: Dump platform_data for debugging (optional) */
> +	void (*dump_platform_data)(const void *platform_data);
> +};
> +
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +			       const void *platform_info);
> +
> +void igt_platform_require(const char *subtest_name);
> +
> +bool igt_platform_should_skip(const char *test_name,
> +			       const char *subtest_name,
> +			       enum skip_source *source,
> +			       const char **reason);
> +
> +void igt_platform_filter_dump(void);
> +
> +int igt_platform_filter_dump_to_file(const char *filename);
> +
> +#endif /* IGT_PLATFORM_FILTER_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index c45a96530..898d21cb4 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -38,6 +38,7 @@ lib_sources = [
>  	'igt_params.c',
>  	'igt_perf.c',
>  	'igt_pipe_crc.c',
> +	'igt_platform_filter.c',
>  	'igt_power.c',
>  	'igt_primes.c',
>  	'igt_pci.c',
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
