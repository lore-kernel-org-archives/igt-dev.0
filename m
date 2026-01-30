Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D42FD49C6F
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 08:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79F510E912;
	Fri, 30 Jan 2026 08:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPbJ+O0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154A10E912
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 08:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769760349; x=1801296349;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Fn6omo32MDw0b1PFGl7ax1pkOCgzWKqDXOm7FJaRwog=;
 b=jPbJ+O0J07wHX4v2KyuuV+3I3cDmUf2YMWHQOoRTRW6rG0ISfd0zfQoA
 Qz63W1r7SNSKhMAGsayCEi09DOidId3cBvSC/EHSWP1BnPPGpbx/zy5hs
 09AmZdIJCtPADh7nkBbJ7rnJnVJDbwu3ihhMtn7lThaa2gwA3CYOg5Cs9
 81sSrNzIOm8v4cVDHAlDZ433Y+yPsSoW4Q0746N1kCERZubdKhbxu/MDy
 kwp8L0pWwNut53MMXJwyoFhCtYSnzbRCri2QkJ1zqDu/PVacfMLW5WCVt
 tNIJ9C4kRZ23whTku7g9Xt40oXYePbDFqvIjDIQWPtlAwY+JFr/FDlPRR Q==;
X-CSE-ConnectionGUID: VeGZMFIITC2sq+dEHfpR4Q==
X-CSE-MsgGUID: bjilHRmhTI6LhA7TZ5Ok8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88425996"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88425996"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:05:48 -0800
X-CSE-ConnectionGUID: MomgkvBUSHm++M1EkCVXLQ==
X-CSE-MsgGUID: bOfDa3MSSLWFbSFs9Ti6ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208393899"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:05:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:05:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 00:05:47 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz/cLt6JOvnv+mAXTE5zBiSSUzfDcLZMvPQ5g42mULME8Pl3zCXDkkjNoKIVVfd43moDdmnlenpTxbXjHPZ0tw4jUw1HE6MuawzbCDMldkt9igVaTDZJQmRlkwUNXwAeDuJW5mtYN+j/3otbVoiOIoKbBK8qHUh9Le2FY8L0ksZK5Tgldu4jMQDlyqlWMq3vR3pTpDksbYm2rVqaSudWBub2F+0cIf3Kbk1ZrbU4K83vpYkxiPu4UAcXJgkZm8/8mz2IWkHSLrHX75LiQ9HPmGjNvWFafepv9TTKmxGe4aCbK2+W88nsJ7vPZWS5wRd38G7pAddcL1KNZwpaoPFvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb6OVKImB5PuiI6MOwveQlo+Oxpd8vqOiGSxcnlMYy4=;
 b=fbeuai4yugHKdbep2l3O7tFROhUEPbdmbrNoijihIj/9X+1Xmb51DWQz9EP2ftBAPZsopmzGqOHXqf4il9aoPHCxQ3lW+iI6sh791WqPZ1NpYC+U7S/rKYGiUsybWtDU+nZidRyRH5sDUMyBMru14kCIhl4jizdJET5m5sbb/kiac+zi056PcWUzy2bcBrgkw9ZIIQkBfytk1mxP/MNuBiCMQiAZBZdYqZ6VxiSX6DqLQ6XQOhJxvtmNnHyWfad8vXGm+WEg8SimUgk84Q76lT+Be/584JxKfrL3QskN6+QiOasdFdN5+ofaDCZ9rFYHBrvAyUgLP7ihR43EIc1cKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:05:44 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 08:05:44 +0000
Message-ID: <63ff14bc-2e92-4203-8339-7c8bea181d6a@intel.com>
Date: Fri, 30 Jan 2026 13:35:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/xe_gt: Handle unknown C-state
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260129105938.1114574-2-sk.anirban@intel.com>
 <20260129114752.nk3aqzrzhd6jvtof@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260129114752.nk3aqzrzhd6jvtof@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::9) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CYXPR11MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ae807c-6b2f-4664-ed6a-08de5fd65dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amQ0VWhKdWlXYkRocU0xQUJlVC8rRDByTEJlcnl0amtycnhhb2N0TWthY1ZX?=
 =?utf-8?B?bTQ3YWs0emlWcCsvemtRQ2dQQ2Zpby9RcWVuUDJMVHZkWnBuMnRMd0VrYWxR?=
 =?utf-8?B?SVprK3pkV3pWaE1Xby85V0R6dGt2b2ZlSERVcFJQY3lNQ3RnL0FBcWRQdmJ0?=
 =?utf-8?B?VVI4STFLci8zQnZWK1ZLd2JML1g0WGNmNVpDcTE2QWhoRHFUcVJMTjZPVEox?=
 =?utf-8?B?eUVpNDZDalBtSVZ0Ti82bm1xLzgzbDJYN2FJcXNISkhZNlJhWFlUU3ZOM3Z4?=
 =?utf-8?B?RFQ5NFFScnQ1RGh3TFgvdW9zUm1hT3MvUzdPSnZUYktONnpIM0xvN0lYdUNN?=
 =?utf-8?B?S0ZGRGJTNkJ4Qm9Nc0ZraXJXQTFuZDNySmxrMlcyZ3Q2akJQRVlRMVRkS2kw?=
 =?utf-8?B?UzVJTjArekhYd3ViMVFudW5IVVJUekpoeXdUVU43S2p2cmZEKzBsNCs2SER1?=
 =?utf-8?B?ekR2Vk9ydmN4NWJJU0dkV3BIODlUNG5TTUgxTzExMDBaS3NoT2oxaGpRZGxq?=
 =?utf-8?B?UVJ4Y0xhOTRLVHFTcmtoUURMa0gyTVJLcGVwZkkyMWhabGgvRTdCSnlvNlZX?=
 =?utf-8?B?cEpHMGx5NGFpdnNxYlduZWFMU0xOTGRxSVNOTjJxY0JVQko0MGhJcnhWNXdM?=
 =?utf-8?B?YXh6WWtONGwzM08raFc2NktoL2d2elRpeXkxZU9oNEhJdzdaMUVqNkVwZjRw?=
 =?utf-8?B?SlI3QWIyNkE0cHJaYTV4NXlnYTdOUENlTUZpSWc5RFhLWUdYRVc2R3BmeUww?=
 =?utf-8?B?aWIzdVMxc3NpWDlyR2oyeFNyaUFKZHhxS3ViK3NKdlE0eVE0U0pMWWdEc2pF?=
 =?utf-8?B?ZnY0WUd2b1BTZ3EwRUt1VE4zSlZCMGtQOW5BT0M5NVFyTzd4WlJaOVNocTNi?=
 =?utf-8?B?MnVHemY3SGt1SWYyTDlXeTlZcGE3d1F0c1Vmb0l5aG9Ddzc4cWlqT0oyVHpO?=
 =?utf-8?B?enZaUFBVTEs3ZUZtblN2QXNudCtOc3FzNWF2cDFZRkhLUGMwdlZtQldLbGc4?=
 =?utf-8?B?cU1hZkhWUHpib1o2UEt5UGdlZXJLcStJck00N0dkQUJWdmFUaExjTHpYa0Za?=
 =?utf-8?B?WklnTFZMM2F3ZURBZVN6K3dFNVk3T2Q3K3pWemM2bG5HVXVXTEllVUt5bHor?=
 =?utf-8?B?OWxiUDdQbW45Rml5U3Z6bElIYzk0ZGhuMjdEejlYZ3dtQXQrNVF6aksvaUIv?=
 =?utf-8?B?WllCTDd1UjZhNDdkYXhwUXhBSVZLUWFvZlZwT0czb3F3c3l4TXB2U2dHQVBM?=
 =?utf-8?B?dWttWU15ekQ3NDV4TGRPbDl4S0E5S3p3RjFVNG9jeUs5cjJ2bDErRjEra0dX?=
 =?utf-8?B?SG5vNitYanU5NGVORWlaWElYR3huYW02ZWQ1cWtydTJXVHdLUDRHQUkyL3Iy?=
 =?utf-8?B?cGRVNFJDaWZPb3h1Q0tJNlYzOUJaQURqNlpzaHVjTXRyNGVKMlNFZkJDWk03?=
 =?utf-8?B?QU9YWDBHMzRkME4zZUwwREExckE5ZUhlazhmQUNFcHhSQkpNTGxnTDREamcw?=
 =?utf-8?B?UFpqSlVZbnlSRGtmb2Z6WGlSN3p1TWl0RWVkL3JYcVhUNHVkT3pDbVR6WDJk?=
 =?utf-8?B?TXNWY013K2VmMHA0Wk5SR2R5Z0VVRGZnNDhWaVBuRVFENHJqY3ZNaFN0UWtL?=
 =?utf-8?B?VHBEbnpXejdOR0NWQVgrOEI1S3JEMGg2QzlMWlQxQ2N5QWhad0RHeTFtdFVp?=
 =?utf-8?B?N1F5VlhGVC9HQ1hCS0V2WXJLaWhReE9BaVkvMkIwQ09qa0RzeWJjTCtCRHFP?=
 =?utf-8?B?SmxZbXlMRlR3WXY3eHRhRE11czFINXZXVmgwZ0taM20velFpYjg4YXNzWDky?=
 =?utf-8?B?TTlvQ1VwRDFMRHNLUnBqQTBVVFhmaDVmNDZwNmpJMm5RVWo4ckNDNUY3aUZn?=
 =?utf-8?B?d1UxR2RLL1dmdWExbTl1SzVnRXVrYkVJWHFwcVg4TTB4UlpsV09rNGVFTUlY?=
 =?utf-8?B?dzRyTCs1MEQ2ODFHakhRSGQrWmxFTStJbTcrQ0JnTXhJdGY0UjBEdi9SOEZh?=
 =?utf-8?B?SVpjZWJRK3lEcjY0NUM5VUhJbWsvMHFtaHpzNkJ2RHRGSm9CamxLb3hZY0NO?=
 =?utf-8?B?ZndZdEI5MktXMzdhRm9RU3dyMjFxOWo5YTJTMlo2N2tsYkxKdk9OUVd1UzFE?=
 =?utf-8?Q?/FNA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFBK2tGbjliY2pIMFlGTk5Fa0tFN0J1clRKZjI1MWhIMENnL1d1MVYwbndu?=
 =?utf-8?B?UXJOVDFWQ1I5TUFQd3h6aWdPTzNsSzNOUG9YZUU3TTNnbWdoTDRLNlVuWk04?=
 =?utf-8?B?VWF3RWx1QkJ1R1FJUmNtWEZaMlJVNWNMWk1HR2l5alRCa2Vvc1laSi81WFcx?=
 =?utf-8?B?VE9QUWpOTkd4UFFJZnN4K25jQlIrOVhkTmNqQ1ZEcUU2bGlNOFlYbTBGMUhC?=
 =?utf-8?B?WTZYMm1hV20vUGFjQzNzbnplN1ZjOVNHdDgvQWFKc3Z2aDhKYXFFZC9wZFJu?=
 =?utf-8?B?eFdWcXZkOEZOY2RzbVN6TXhuOGhyVEVaVWIrZWRtU1hkNjk0WEVEdFRyeFpt?=
 =?utf-8?B?ZlR5ODkwaXcxSlpoSlo3Y2pJK1V6SUh1aHMwcXd2SUFCOXRoUWxaYVZieHhl?=
 =?utf-8?B?WFdIeWUrcTRuNVFwNGVReWhsVGU4dG00YjF4QlRJcVBoSTNPTkZrcSsvZFlS?=
 =?utf-8?B?U0h4KzZKTzJURzd3MlhRc042WC8zY1h2b2tDRjA4TDU5U04xVm5aNUpZR3hG?=
 =?utf-8?B?a2RyTS9BWXlLdjhIM3dxbkRTYk51eVVISU9pOUVCUEFXSWlKSlNTZDR5dERp?=
 =?utf-8?B?QWxXN05IL05jQ2NBUkQ5a1BJVjR3VnB4MGg2aUFqcWdsbXRxNVRZeGhBNmVK?=
 =?utf-8?B?SWpza0VhdWNNWlRySEs4NGhHbXYyaEZic04yODE3WS9LcHJFdTZlN1luOHZN?=
 =?utf-8?B?R0EwbkJoUlE5My9GSXh1SGM1SUw3WkhPZUxWR292a2JEdFREV2tNOFdJQlR4?=
 =?utf-8?B?SGtKNU5aWUx0cXBzTlpsR0lkWVk2OVMvajFLdFRlN0NrMjNvYmFObDNEdnly?=
 =?utf-8?B?SzBuaTNKczloQ2s2YW9sS3k3aWorZXJQSGFidWFPVjRyeURhd3ZnNDJYamM2?=
 =?utf-8?B?UlBpUWErSkpCaHA5NWw4b1NkTHd1THdlakNhUmZkYkV5bktpTnFKOUtYTXhy?=
 =?utf-8?B?RHBqeXBKZjVKVnNRekRlVldraHNXdXRDVUxIWjhiUzJ6MWIwTVRaenAyUmtK?=
 =?utf-8?B?c1NHWmkxaXNLQjNGWVNSalE3ZWVVYkRtRjdpbUdDWWQ0TE1rQXZjdGQvTjEx?=
 =?utf-8?B?S1B0N3ZHd0tJMFcxVmVnV0h3dFNFSE81cmhmRWJTTDRWMVBHMUR6cHpEeTVw?=
 =?utf-8?B?bHAxQTBJeUE5L1dpc1grQVJILzU2VTF6K2FkaVU2Q21Fd3ZZMFR1RDMvWEQw?=
 =?utf-8?B?c2JtVHhmczVuM0xCWHl0QmNHL0VMZlBsTzFRa2dXZzlLWVBZNm9ab2hZRUtj?=
 =?utf-8?B?MGFrbGhmUU9pazFvdGdlemk1cVc5eTZ1RHVTRUhDb3JZRW9pR1QxZjQ2QVdw?=
 =?utf-8?B?L01kNmgwWVVhVUV1RVB4OWZaZG02QWdKVzVXTjV3YkwydFNVYnJpWEwxSjU5?=
 =?utf-8?B?T0JPRGRJbzJyZHhFSS9rVHNveXN0Y1JPNlpCam82bFkyclBYUitXUDVZZkdj?=
 =?utf-8?B?Z1VrczhRczZPLy92b2NEVC9pYnNzaS9EREM3aGNSR2Nzd1YzNm9tZWc2TE44?=
 =?utf-8?B?MWsvaURzMWRxOGZ6RWxTTHdiL0dSeVV5T0ROckNlWmNuM0w5UEFiZk5Kdnkr?=
 =?utf-8?B?ekNrYnhMdSsyMVpkdEx2cFI5R1diWmNNMEF3NmxaYzRQR1RQRlRjNHNyNTMy?=
 =?utf-8?B?WERSU0lIa0gvRGpvYjRPZ1U3Um5QQ1hUNFBGL1FRVGJhNmhrYmNyVkZEMjFo?=
 =?utf-8?B?anJFMGlYYTQ2eklBcWJoREF1bFpSS0pNNi85U2RURDgxWVI1OHh6Y2dqdkJm?=
 =?utf-8?B?a0pVd0x0MnZiSElyWjRnVDhVMGdCNklCanErSlphWGpudlUwb1NTMWNSamN1?=
 =?utf-8?B?UVg2QzBDcEFhbERxd05qS21KdTJac0tlRkpzTHNkbHBGVFRPcVpvOGtCdndZ?=
 =?utf-8?B?RVZwR0JtNlBOYlV0RTEyNGZoZWNVZFJVWURXcHhqNzBKRVFnT2hXQ3l6RVl5?=
 =?utf-8?B?U2NEWW5UcXQ3aTIyMVk4ZzJiQStORVY1QkZkSnRNd2JDYkZCckNiMmVuTjJ2?=
 =?utf-8?B?SDB5Mk9Bb0htVUgwSERySjdOaFVvTk13SnpaTXJnUzE2UGpJQi9DUHV1Tkxi?=
 =?utf-8?B?aTQ3Q1ZpZXY1L3ZIK0t3blZhRWZlNDgvSDFhMVh3bE5JNDJ6a2lYbHY1ZEpo?=
 =?utf-8?B?VlVWb2pWdHpWOXlJNWN6MEZJb1NzZFVjaldMK2MrS1IrdG9WcEh4UXAxS2Zv?=
 =?utf-8?B?NFNpSitJdjhQUnA3aGJTMlNHTkM0RGcyZjlkRHgybUJ4b0d4SjREb2NLUFRQ?=
 =?utf-8?B?MUF1V3hyaUVJNTZNL0lDeFlKMEEyY1ZORmQ2TlZXNFpUMTc4cjRKbjdLTjIx?=
 =?utf-8?B?OHVXbGdUZUJjcUtnZUl4eG1wTGVXRk9TcE9MMHNjM1BLNzkxNTU1dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ae807c-6b2f-4664-ed6a-08de5fd65dcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:05:43.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h65HQnUunSN9NNqDAVnuTxym+rcQnicINkKAtT9vg5be0rQJ+JhdfnaDENX1zxjcbcQ/zPiQbdmkDBtglCO6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
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

Hi,

On 29-01-2026 05:17 pm, Kamil Konieczny wrote:
> Hi Sk,
> On 2026-01-29 at 16:29:39 +0530, Sk Anirban wrote:
>> When GT C-state reads as "unknown", return false with a debug
>> message instead of silently failing the "gt-c6" comparison.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   lib/xe/xe_gt.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
>> index ed19bec74..9164c4e3c 100644
>> --- a/lib/xe/xe_gt.c
>> +++ b/lib/xe/xe_gt.c
>> @@ -220,6 +220,11 @@ bool xe_gt_is_in_c6(int fd, int gt)
>>   	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
>>   	close(gt_fd);
>>   
>> +	if (!strcmp(gt_c_state, "unknown")) {
>> +		igt_debug("GT %d C-state is unknown\n", gt);
>> +		return false;
>> +	}
>> +
>>   	return strcmp(gt_c_state, "gt-c6") == 0;
> If you want a debug on failure, why not print it:
>
> 	if (!strcmp(gt_c_state, "gt-c6"))
>    		return true;
>
> 	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);
>
> 	return false;
>
> Regards,
> Kamil

Yeah we can do this but in this case debug prints will be there for both 
"c0" & "unknown" state.

My intention was just to print "unknown" state as anyway it will return 
false in case of C0.


Thanks,

Anirban

>
>>   }
>>   
>> -- 
>> 2.43.0
>>
