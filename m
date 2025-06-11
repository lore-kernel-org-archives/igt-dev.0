Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E77C71137
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 16:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F0710E6D9;
	Wed, 11 Jun 2025 16:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cdr/WGcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB81B10E6D7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749659852; x=1781195852;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/M8vdq4sM/Qo2RPOSc0oYABACHe52gi4Df3TPd5opR4=;
 b=Cdr/WGcU4be0+jgrFCeWUlDHRVck9/lae+OO1MyP8cq0uaZidORgFjck
 X9SLsDhoEeIaAXwidmU7Jk2vuLs4It/h5i8nL33bvN4CjZYTzFR+wPP1E
 fAq7H/zzZ3Ylht+efvaZsbgQGZtK8IjPvLbuzKjx2sDL32v9OoBDRX5IN
 +8IXnl8W5Db/+LPbvYcEYJeAkYPC7eXBPqpATKxWWGcT+pESKKlcxsidP
 Rx+IC6MCWq3etw74XeiouHDfrwzax00CvFXOpFvlDLmJ6/yaUPL0hUAdw
 0v0iUuUgjynky82Tp7li0xm4zIfaf1l8Dz3K6Gw92os8m6jaO4GjM1UUK Q==;
X-CSE-ConnectionGUID: vACYHWPSSMmK51zjP04ztA==
X-CSE-MsgGUID: U1Tjva6nR/OHiCbvSuU7WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55481140"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="55481140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:37:32 -0700
X-CSE-ConnectionGUID: DZ0b0G6eSLqHHMU3AG4RCQ==
X-CSE-MsgGUID: JK8b33N0T5O4FMy6crT6pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="178154228"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 09:37:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 09:37:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 09:37:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 09:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3BshAIZFb4M6VI+IM30w74uLHZgOZiETjOerlICUPiAn3v5BukBNlM83nZDLhnZmIvXRxi6zPFxYsmTs07j4oN93gKASyKruIb2NiDup6b+GrYtQfT2e2Hc/ws2Wn6hjwXTgZBhzgxhfn2py8DG598zBmIGmkNbm0dys9Qn/Ypl7XG9So0rAXgTTKA42tcP9j7SSQ5sm+lvNSTQVJXQk7GtaHnsJ9cr/DJaAFA5H3tsjXdCKRjIsl5ltjakf7w2iI93oBtf9u/KyCoCMNsZuBSIcZp7L0/rVyvQEbYoG8fcafwEVepJ2iL0O7mbKVoxhf/geT0PnMU2REpQXk4GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb4LlJ78H4s22XzwcqiOPh//I/mxADKO+rCDrONQmsE=;
 b=FDOJpeqlZCiJrmeEpnZcmVJVviUzsHEv+QDr18+Xgz7twjYkiDS0s3As3JDCyJP8h/Le/LW1PW0EkRP/+kdHjz6hHgYSEoTaePDB/7ZI5JWrLqTpzw3tTRXMPJ0/quL4GgGPxs8gwE7odpSmklLCvjKpV9YDFXOGb3JnljyfdKFH6v5+B1NSL0C7/ngu5ndSsYTDrozZVCkF28TB/fBkBD/33UBME2GvMF6tDiWXwNXGPSUaI0pj23ExxXxmz5Y7r4JvnXZNaM58s82xRBUlUXT6rSt5wMXsQerc4gIe1rN8CXh2KCYX1GjrI2epDLfq+l01rEKGUMqugaappohauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA4PR11MB9418.namprd11.prod.outlook.com (2603:10b6:208:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 11 Jun
 2025 16:37:14 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 16:37:14 +0000
Date: Wed, 11 Jun 2025 09:37:12 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>, 
 Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_eu_stall: Use query IOCTL to
 check for EU stall support
Message-ID: <aEmwuNhRbhPwR7X8@intel.com>
References: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
 <0e894b0ab963e0e5b03b200f919e9318fe02de20.1748994982.git.harish.chegondi@intel.com>
 <875xhbuoev.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <875xhbuoev.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::18) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA4PR11MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a326969-440f-4eef-40a1-08dda90638dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c01Ra3NVcFM4c2pQQ3ZOc3padHpXMklUakljRVRlR0JPNVc2dU8wL0lyK0Yv?=
 =?utf-8?B?Rzk2UUZwWEQrNGRpTmlWcnFtUnA2Vkw4akc3Q0x3eFkrNGpXTDVOZllHMUho?=
 =?utf-8?B?WnBPSklpTUd1cVhtRWJnMHB5RnpaQ2JHNnBZL2FLejIyM0ducFRzM3VRRDlB?=
 =?utf-8?B?QzlKQmNmYTFTVWJDRFZacEVpUmo4SFp5blZOeEJJVy9HZFljeWpoQzFOdjZo?=
 =?utf-8?B?SzJMZVNvdUZ4NHl6b1F5amxyZUVOZjc4Q1MrVlRzWWhWNVp5ZUFGbFluMkRJ?=
 =?utf-8?B?Qi9mVkN2OVc5OUY5WUd6ejBBeWFPeFZ3MUR1cmlMRTVWSTJrNlBhY0ZYdndM?=
 =?utf-8?B?NmxOWjNQVmVhRUI4Ly9FNU41OVYvcnRaYy9Md2VYWEtHY29oQ1lFOHFjbnR3?=
 =?utf-8?B?UmR4VVhKNk9GajBiWHBBUlRaVkg1MFhtSGt5ZHI1VHdFd0h2Qlk1V3RwRnMw?=
 =?utf-8?B?cmFQYlovbzQ2RzUzQzNFeWIrZmRhR2FwK3c3WHdXTXJGRUFWSmZuN05oNkFQ?=
 =?utf-8?B?WnR4ZWVCbmtJa3MvZXd4WDRwS3BQcnp0NEdZQkthMmlUdldpMjcxeTVYejRy?=
 =?utf-8?B?YlhPcnIwQTkxNWxkQTRSQzQzM01VbkZZZkh2TVdPa3VVV2lMUXVJcTJ4REhn?=
 =?utf-8?B?YkIyUDBiSVphc0ZTSE1OVVM0bWprNkxwZU11aVNzN09tOFh5Q2tIck9vWlRy?=
 =?utf-8?B?cnRneWdEQmYvRy9FS2N2U25UMURuVHMyQ3haY2ExSlJKenZPS1JQOU1TaHBO?=
 =?utf-8?B?dGErN09idFBsRnFWcE42MEJuS3FFelp0U2dNRkk1aUdHUzg4SG41MFhJOGIr?=
 =?utf-8?B?ODAwTEpiYlBxZ2RsUEx4VjNibEpQSzhsMlRuQzk5eC9GVTBBT1orZWhlanVP?=
 =?utf-8?B?ejBkNk04Z3dnMWZvNHZ0TTZ1aW4rTzhOa1BRSUhhdEpBeXFWd3hERGZKU290?=
 =?utf-8?B?bzhMT0g1aUdMYitDaGx5ZDZtYkw3V2hsVXdndzgzOFA3UmR3aXlucVRXelpD?=
 =?utf-8?B?RmsySlJQalU4c0hJZ0dxTzMyUmZDOHd3UmJNSmo1dmREbitldmNqM0hNRE9F?=
 =?utf-8?B?WmVWcVZ0eTQyS2FLTkUxSkJ5NjRJb01BWW5yR2FSVExHZEN3clVZWmVGNytU?=
 =?utf-8?B?UytJL1d1YXo2YmRIRDlrM0cyZ05CeU5uSDhLTnBrTWw0a2JTWWVMUklOa21R?=
 =?utf-8?B?eEgvL1gvcXFQaHJKa204U3libG12cW5ZYnQ2UlZSa0J1cmJVUEhYNDFvcStL?=
 =?utf-8?B?YWlvQ2ZMNFFPRHNoZGlzWmc2K3c2Z0tpdnNtT0cwWGZPc0NLODFLVEw2NGxx?=
 =?utf-8?B?Z1RKRFovT0NvaDlSdUJnelI2NVRIMVRjSkZyS05EN0ZlbldUamZqNi9DWWxy?=
 =?utf-8?B?WjlWd3ErR1Z6T216RXlXd05EdXU5RnFXUlkvRmQ5cUFDOGtPMXBFSHdYRlZT?=
 =?utf-8?B?b3R3eEZoSUNjdEliaE8rM3JLZHVIZG1EVFdia3B0dVZlSm9OaDBONEg0NHh0?=
 =?utf-8?B?T2dUNkc5TkNYdkZ4dFZSTEJ3dlVVNi9xZml4c0grRHdVN3JOR1lFdloremFk?=
 =?utf-8?B?UU9VZkV2QW1haFZwYVlZalJnbWdnQzYvVHdpQUgydjd6bzNjS2lpVlZ1dzZP?=
 =?utf-8?B?Wll3TllMQjhUS1VDdzZuc1VRV1BNM0RGeVN6VElsTmFpL2tjcktZdCtRT1ND?=
 =?utf-8?B?M3ZxOC9EQ2FJYVh5SnV5cXRKb2RCRlFreGdpK1FUb24zUE01TDVvNFZxT29K?=
 =?utf-8?B?ODdaTlhKckxwRWlIcjkraHFmK2hnRkxYRzNkcmdnT0ZnUm52bE5wcUkxZ2FO?=
 =?utf-8?Q?8yUvCvND99gTDJC0MIyDaU+EeKZW0y+kB5clA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm01aUt0MkxHYmpNbUhrYndDZjJUS3JWeTdiZFluNHVqNDhNblR6Z0cvWHBL?=
 =?utf-8?B?Ykl4bkxQZ0Q3eDFiUVg4M2F0bFNySk5qSkJ2bkJPZ1NYNExicGdVMVorQW44?=
 =?utf-8?B?NVpSMW9VL0xvLzlTRDROSEhpaXhnLzdRNDN1Zm53YXl1NDF1QjJMR2tveEhy?=
 =?utf-8?B?MFJBalBkalNTYkZmMzhyeXRSZ1RJSTVtdFk4dk0vMEptSkhySTZ0UWF3NU9q?=
 =?utf-8?B?VWZjQTg3L1hGZnZSdEU2UVh1bWJoVmFDV0FxOE9GeTUweUZqZFFmZGpxaUxG?=
 =?utf-8?B?bEZFVVdIRW1DQjRadVFNMXpMK1ZtM2tIdkJFVG9yU2thbFR3bXVRSEZ2a0Uw?=
 =?utf-8?B?ajFlVFh2L05LVmNwNW5lV2pHb21lMFhOK2xHWDVXRnhUK0U4ZFp6SFdreFI4?=
 =?utf-8?B?TXNsS1A5NUYzZDdwcmhVeHlsT2cxZVVEdCtBN0U4Z1NGUlowbk12T0Q3ME9D?=
 =?utf-8?B?YjdOZkdGRzMzN1JJSm1uR2I1NmljUFZ0RFYzdjNyRjBsRlhNQ21xdS9FdXFn?=
 =?utf-8?B?SlRLSDBXeGhxU3Q2ZzVVdnJGYXp6c1FJN0cxeVdkZW9jR3VVVGVtNnhFdFkz?=
 =?utf-8?B?VVFSeGxCZERNejA0cDM4R2t3WEphc1hkQThGUTJsb2NUcDNPeXJldkNLa0RG?=
 =?utf-8?B?VHErTzlqb0IwTTdDZTlLY2tNa0xxMXpLKzN1VDJrZklDWHp4Yzc0dkgveVUz?=
 =?utf-8?B?RDRLTExkcDBsSFVLamg0S0JNb1B5OUpCbGU5STBqUXloaFhwQzgrdlNTcDM5?=
 =?utf-8?B?dVgyQ28yUHk0L2h6clBSVlFYYXV5VTlTMGNFTlRwSUxWejkyeUZ5cmlxeTE2?=
 =?utf-8?B?QjNnVmdob0VENUZEa2oyYkZ6RFJkejcraXZZY05DR25sdmJMbDAyUWJyMDRJ?=
 =?utf-8?B?dzkzcUtIZW1keXhBRUplNmc3SW1BVVppbDVaMU5BT0JlaTB4aElXbExpSWV1?=
 =?utf-8?B?WSsvbEdvYjdrUnUzZkY0VVJhUGY4eVdZR3M1NCswaWYxYU9zeE9vb3ZqVzQy?=
 =?utf-8?B?TDFHYVQ4TXZ2bGJUTGdVVmRDQ01pdHVQOFYzK1ZFVFBRNlhCNDluKy9KMDNP?=
 =?utf-8?B?ZW5DUkdlc0I3MmdqZ2hERlFzaHhBanYxczZFVjFYMkFKMzZWSDlqMGJBU2FI?=
 =?utf-8?B?eFhxY3IwOEJQb2hzRWpzaWRFWXd6R1B3RlNlMjV6dk8zemoyZFQ2TDk3UWVN?=
 =?utf-8?B?VkRaRjQrNFI1cmFuZWJRb1pnUDZPdVhrcHAvMVMzb1F4Sm1TMTZIRDRRQVFh?=
 =?utf-8?B?Z0lVaDI0My9DWWhVelp5NGhsLytQZjg5SEpMU1BDcUttaWpLeitzVldwK2Y0?=
 =?utf-8?B?VzJsM21jWFdOeHBNZC8wNUdPbnRrV20yanNYa1F6MlBBYjc0RzNiZVRZZ0Y0?=
 =?utf-8?B?RWVsb0dWTGRMbzk3V1QzcGRBOUJLOTFYdDN5OEFUdWNhd1FFTFFPWmMyUW1z?=
 =?utf-8?B?STdVQytRRTZnelI4THlSbjVJQTh4djllQkhmekJtMVplU1F4VVA4NGNsMnFD?=
 =?utf-8?B?NE9teng2eWFzenl6VE5POUtQYVVLa3hOOGZ1VVVPTUtjTjRIRjZJNnlpVGlo?=
 =?utf-8?B?cVlraDdWSzBibjZiZmVBLzF5ZGpuSXVKNnBqL2Z6UTFGNUFhMGJSME5KZm94?=
 =?utf-8?B?Rk4rZGpUR3dxU1lsWVJFZXVCNnVJWUxjV1FzTDZHWmtXeVdGU1pGTWF1SHFw?=
 =?utf-8?B?L09xU0kxOENaQXh6eDhkcFB6ejVvWHBHZENzbEtrVnVhRXdjQk1GaU5IRUJk?=
 =?utf-8?B?YnpOWi9pWGxUZjRkSnBLQ0ljOUd5QzhROVlqaEhyQXpkazJ2V0hhOVYwNGVa?=
 =?utf-8?B?OVg1THpHbEVFT3RHc2RCdkJDbC9tZXkzbko0S2kzR0FLWGV1bTNaNmtsNnhy?=
 =?utf-8?B?U3FucERzTWpSRjRxR01XVS9hUnFTMmlnc3B4ejlXMTlkbG84UjFNTVM0NUVt?=
 =?utf-8?B?bTAwTWtOL0JvekxXbnc0LytwYkE4Y0M1SkkvZ1dxNUQ2UlgxN1ZiclpZVVlt?=
 =?utf-8?B?d3ZBMEJWOXpodGc1WTdRZ1pob2YxYmR2VnNPcGIxK0dvcmUxelM3MS9FZ3Q4?=
 =?utf-8?B?b3p0QzdqMm1Xc1FFalBvL2FzRzM4T01mMTNxZ2xiT01tVGs0NVNvMnZvU29F?=
 =?utf-8?B?Z1hVdWdJNmozdFhFdHpoREhWeG5OSEx0VTJXaEZ0WEppbFdrQWt5OTI1NEFh?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a326969-440f-4eef-40a1-08dda90638dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:37:14.7921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtZzxnsMSR6DgvJW94HaNlUNKGx2K6+PyGWwNlz7CXpsHbtdYO02p00C9B7ai3Pi/wXc/tnLi2SM2xihwLyXXtWrn24OTtl+Dns2OoUIuRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9418
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

On Wed, Jun 04, 2025 at 03:34:16PM -0700, Dixit, Ashutosh wrote:
> On Tue, 03 Jun 2025 16:57:36 -0700, Harish Chegondi wrote:
> >
> > Use EU stall query IOCTL to check if EU stall monitoring feature is
> > available on the platform and if it is supported in the driver.
> > This would replace the checks in the test with those in the driver.
> >
> > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> > Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > Resolves: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5131
> > ---
> >  tests/intel/xe_eu_stall.c | 55 +++++++++++++++++++++------------------
> >  1 file changed, 30 insertions(+), 25 deletions(-)
> >
> > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > index b3a0ee742..4e76018b6 100644
> > --- a/tests/intel/xe_eu_stall.c
> > +++ b/tests/intel/xe_eu_stall.c
> > @@ -74,6 +74,8 @@ static int stream_fd = -1;
> >
> >  static volatile bool child_is_running = true;
> >
> > +static struct drm_xe_query_eu_stall *query_eu_stall_data;
> > +
> >  /*
> >   * EU stall data format for PVC
> >   */
> > @@ -506,33 +508,12 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
> >		.properties_ptr = to_user_pointer(properties),
> >	};
> >
> > -	struct drm_xe_query_eu_stall *query_eu_stall_data;
> > -	struct drm_xe_device_query query = {
> > -		.extensions = 0,
> > -		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
> > -		.size = 0,
> > -		.data = 0,
> > -	};
> > -
> >	igt_info("User buffer size: %u\n", p_user);
> >	if (p_args[0])
> >		igt_info("Workload: %s\n", p_args[0]);
> >	else
> >		igt_info("Workload: GPGPU fill\n");
> > -
> > -	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> > -	igt_assert_neq(query.size, 0);
> > -
> > -	query_eu_stall_data = malloc(query.size);
> > -	igt_assert(query_eu_stall_data);
> > -
> > -	query.data = to_user_pointer(query_eu_stall_data);
> > -	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> > -
> > -	igt_assert(query_eu_stall_data->num_sampling_rates > 0);
> > -	if (p_rate == 0)
> > -		properties[3] = query_eu_stall_data->sampling_rates[0];
> > -	igt_info("Sampling Rate: %lu\n", properties[3]);
> > +	igt_info("Sampling Rate: %lu\n", p_rate);
> >
> >	stream_fd = eu_stall_open(drm_fd, &props);
> >
> > @@ -660,18 +641,42 @@ static struct option long_options[] = {
> >
> >  igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> >  {
> > -	int drm_fd;
> > +	bool blocking_read = true;
> > +	int drm_fd, ret;
> >	uint32_t devid;
> >	struct stat sb;
> > -	bool blocking_read = true;
> > +	struct drm_xe_device_query query = {
> > +		.extensions = 0,
> > +		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
> > +		.size = 0,
> > +		.data = 0,
> > +	};
> >
> >	igt_fixture {
> >		drm_fd = drm_open_driver(DRIVER_XE);
> >		igt_require_fd(drm_fd);
> >		devid = intel_get_drm_devid(drm_fd);
> > -		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> > +
> >		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
> >		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
> > +
> > +		ret = igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> > +		igt_skip_on_f((ret == -1 && errno == ENODEV),
> > +			      "EU stall monitoring is not available on this platform\n");
> > +		igt_skip_on_f((ret == -1 && errno == EINVAL),
> 
> inner brackets not needed...
Will remove.
> 
> > +			      "EU stall monitoring is not supported in the driver\n");
> > +		igt_assert_neq(query.size, 0);
> > +
> > +		query_eu_stall_data = malloc(query.size);
> > +		igt_assert(query_eu_stall_data);
> > +
> > +		query.data = to_user_pointer(query_eu_stall_data);
> > +		igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> > +
> > +		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
> > +		if (p_rate == 0)
> > +			p_rate = query_eu_stall_data->sampling_rates[0];
> > +
> 
> Maybe cleaner to put all this query stuff into a function and calling the
> function from the fixture? Also, queries are generally cached in 'struct
> xe_device' so we could do the same here? See xe_device_get() and also
> xe_query_oa_units_new(). Since that's in the lib, make sure IGT still works
> even if the eu_stall query fails (see 851e62faf971).
I am moving the query IOCTL into the lib. Probably those changes should
go into a separate patch?
> 
> Also, another nit, use igt_require or igt_require_f instead of
> igt_skip_on_f? Though they are mostly NOT of each other so they are
> equivalent, so either is ok.
I initially used igt_require_f, but later changed it to igt_skip_on_f
as the condition logic is simpler with igt_skip_on_f.
> 
> >		if (output_file) {
> >			output = fopen(output_file, "w");
> >			igt_require(output);
> > --
> > 2.48.1
> >
Thank You
Harish.
